from django.shortcuts import render
from .serializers import CategorySerializer, LocationListSerializer, LocationRetrieveSerializer, LocationCrudSerializer, TagSerializer
from .models import Category, Location, Tag, Subarea
from rest_framework import viewsets, generics
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticatedOrReadOnly, IsAuthenticated, AllowAny
from rest_framework.serializers import ValidationError
# Create your views here.

# Viewset for Category


class TagViewSet(viewsets.ModelViewSet):
    queryset = Tag.objects.all()
    serializer_class = TagSerializer
    permission_classes = [AllowAny]


class AdminLocationViewSet(viewsets.ModelViewSet):
    queryset = Location.objects.all()
    permission_classes = [AllowAny]
    serializer_class = LocationCrudSerializer

    def validate(self, requestDict):
        # assume it's valid first
        isValid = True
        # error dict starts empty because assumed valid
        errorDict = {}

        # validate main_building
        main_building = requestDict.get('main_building')
        if main_building and not isinstance(main_building, int):
            isValid = False
            errorDict['main_building'] = "should be an integer"

        # validate subareas
        subareas = requestDict.get('subareas')
        if subareas and not(isinstance(subareas, list) and all([isinstance(sub, int) for sub in subareas])):
            isValid = False
            errorDict['subareas'] = "should be an array of integers"

        # validate tags
        tags = requestDict.get('tags')
        if tags and not(isinstance(tags, list) and all([isinstance(tag, int) for tag in tags])):
            isValid = False
            errorDict['tab'] = "should be an array of integers"

        if not isValid:
            raise ValidationError(errorDict)

    # OVERRIDE CREATE HOOK FOR HANDLING POST REQUESTS
    def create(self, request):
        requestDict = request.data
        try:
            self.validate(requestDict)
        except ValidationError as e:
            return Response(e.detail)

        # Reset sequence id and use serializer to create with basic fields
        Location.reset_id_sequence()
        responseDict = super().create(request).data
        createdLocation = Location.objects.get(pk=responseDict['id'])

        # add tags if there are any
        if 'tags' in requestDict and requestDict['tags']:
            createdLocation.tags.add(*requestDict['tags'])
            responseDict['tags'] = requestDict['tags']

        # add building or subareas if there are any
        if 'main_building' in requestDict and requestDict['main_building']:
            Subarea.objects.update_or_create(sub=createdLocation, defaults={
                'building': Location.objects.get(pk=requestDict['main_building'])
            })
            responseDict['main_building'] = requestDict['main_building']
        elif 'subareas' in requestDict and requestDict['subareas']:
            subareaLocations = Location.objects.in_bulk(
                requestDict['subareas']).values()
            for subarea in subareaLocations:
                Subarea.objects.update_or_create(sub=subarea, defaults={
                    'building': createdLocation
                })
            responseDict['subareas'] = requestDict['subareas']

        return Response(responseDict)

    # OVERRIDE PARTIAL_UPDATE HOOK FOR HANDLING PATCH REQUESTS
    def partial_update(self, request, pk=None):
        requestDict = request.data
        try:
            self.validate(requestDict)
        except ValidationError as e:
            return Response(e.detail)

        responseDict = super().partial_update(request, pk).data
        updatedLocation = Location.objects.get(pk=pk)

        # handle inputs none null inputs
        # update tags if there are any
        if 'tags' in requestDict and requestDict['tags']:
            # delete its original tags first
            updatedLocation.tags.clear()
            # remake all tags from scratch
            updatedLocation.tags.add(*requestDict['tags'])
            responseDict['tags'] = requestDict['tags']
        # remake building or subareas if there are any
        if 'main_building' in requestDict and requestDict['main_building']:
            # it wants to become a subarea of a building so delete all its subareas (subareas cant have subareas)
            Subarea.objects.filter(building=updatedLocation).delete()
            responseDict['subareas'] = None
            # rebind it to a a new building
            Subarea.objects.update_or_create(sub=updatedLocation, defaults={
                'building': Location.objects.get(pk=requestDict['main_building'])
            })
            responseDict['main_building'] = requestDict['main_building']
        elif 'subareas' in requestDict and requestDict['subareas']:
            # delete its original subareas first
            Subarea.objects.filter(building=updatedLocation).delete()
            # it wants to become a building so delete its main_building (buildings cant have buildings)
            Subarea.objects.filter(sub=updatedLocation).delete()
            responseDict['main_building'] = None
            # rebind it to all its new subareas from scratch
            subareaLocations = Location.objects.in_bulk(
                requestDict['subareas']).values()
            print("subareaLocations => {}".format(subareaLocations))
            for subarea in subareaLocations:
                Subarea.objects.update_or_create(sub=subarea, defaults={
                    'building': updatedLocation
                })
            responseDict['subareas'] = requestDict['subareas']

        # handle null inputs
        if 'tags' in requestDict and not requestDict['tags']:
            # delete its original tag
            updatedLocation.tags.clear()
            responseDict['tags'] = None
        if 'main_building' in requestDict and not requestDict['main_building']:
            # delete its original main_building
            Subarea.objects.filter(sub=updatedLocation).delete()
            responseDict['main_building'] = None
        if 'subareas' in requestDict and not requestDict['subareas']:
            # delete its original subareas
            Subarea.objects.filter(building=updatedLocation).delete()
            responseDict['subareas'] = None

        return Response(responseDict)

    # OVERRIDE DESTROY HOOK FOR HANDLING DELETE REQUESTS
    def destroy(self, request, pk=None):
        try:
            deletedLocation = Location.objects.get(pk=pk)
        except:
            return Response({
                'info': "cannot find location with id {}".format(pk)
            })
        deleteData = LocationCrudSerializer(instance=deletedLocation).data
        deleteNum, deleteInfo = deletedLocation.delete()
        
        print("deleteData => {}".format(deleteData) )
        return Response({
            'data': deleteData,
            'info': deleteInfo
        })


class CategoryViewSet(viewsets.ModelViewSet):
    queryset = Category.objects.all().order_by('id')
    serializer_class = CategorySerializer
    permission_classes = [IsAuthenticatedOrReadOnly]


class LocationPagination(PageNumberPagination):
    page_size = 10

    def get_paginated_response(self, data):
        return Response({
            'next': self.get_next_link(),
            'previous': self.get_previous_link(),
            'count': self.page.paginator.count,
            'total_pages': self.page.paginator.num_pages,
            'results': data
        })


# Viewset for Location
class LocationViewSet(viewsets.ModelViewSet):
    queryset = Location.objects.all()
    pagination_class = LocationPagination
    permission_classes = [IsAuthenticatedOrReadOnly]

    def get_serializer_class(self):
        if self.action == 'retrieve':
            return LocationRetrieveSerializer
        else:
            return LocationListSerializer

    def get_queryset(self):
        queryset = Location.objects.all()

        search_query = self.request.query_params.get("q")
        queryset = self.filter_search(queryset, search_query)

        category_filters = self.request.query_params.getlist("category")
        queryset = self.filter_categories(queryset, category_filters)

        sort = self.request.query_params.get("_sort")
        order = self.request.query_params.get("_order")
        queryset = self.filter_sort(queryset, sort, order)

        return queryset

    def filter_categories(self, queryset, category_filters):
        if category_filters:
            filtered_queryset = Location.objects.none()
            for category in category_filters:
                filtered_queryset |= queryset.filter(
                    category__name__iexact=category)
            return filtered_queryset
        else:
            return queryset

    def filter_search(self, queryset, search_query):
        if search_query:
            filtered_queryset = queryset.filter(name__icontains=search_query)
            return filtered_queryset
        else:
            return queryset

    def filter_sort(self, queryset, sort, order):
        if sort:
            if order == "asc":
                sorted_queryset = queryset.order_by(sort)
            else:
                sorted_queryset = queryset.order_by("-" + sort)
            return sorted_queryset
        else:
            return queryset
