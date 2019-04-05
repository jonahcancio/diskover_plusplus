from django.shortcuts import render
from .serializers import CategorySerializer, LocationListSerializer, LocationRetrieveSerializer
from .models import Category, Location
from rest_framework import viewsets, generics
from rest_framework.pagination import PageNumberPagination
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticatedOrReadOnly, IsAuthenticated
# Create your views here.

# Viewset for Category


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


class FullLocationViewSet(viewsets.ModelViewSet):
    queryset = Location.objects.all()
    permission_classes = [IsAuthenticated]

    def get_serializer_class(self):
        if self.action == 'retrieve':
            return LocationRetrieveSerializer
        else:
            return LocationListSerializer


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
                filtered_queryset |= queryset.filter(category__name__iexact=category)
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
