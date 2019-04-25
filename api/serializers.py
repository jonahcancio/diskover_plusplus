from .models import Category, Location, Image, Subarea, Tag
from django.db.models import Q
from rest_framework import serializers
import math


# Serializer for Category model
class CategorySerializer(serializers.ModelSerializer):
    """
    Serializer for Category model
    """
    class Meta:
        model = Category
        fields = ('id', 'name', 'image', 'url',
                  'marker', 'routeMarker', 'routeColor')


class TagSerializer(serializers.ModelSerializer):
    class Meta:
        model = Tag
        fields = ('id', 'name')


class LocationAdminCrudSerializer(serializers.ModelSerializer):
    subareas = serializers.SerializerMethodField()
    main_building = serializers.SerializerMethodField()
    tags = serializers.SerializerMethodField()

    def get_subareas(self, obj):
        queryset = Location.objects.filter(building__building=obj)
        serializer = LocationSimpleSerializer(instance=queryset, many=True)
        return [sub['id'] for sub in serializer.data] or None

    def get_main_building(self, obj):
        try:
            queryset = Location.objects.get(subareas__sub=obj)
            serializer = LocationSimpleSerializer(instance=queryset)
            return serializer.data['id']
        except:
            return None

    def get_tags(self, obj):
        queryset = obj.tags.all()
        serializer = TagSerializer(instance=queryset, many=True)
        return [tag['id'] for tag in serializer.data] or None

    class Meta:
        model = Location
        fields = ('id', 'name', 'category', 'tags', 'description', 'more_info',
                  'lat', 'lng', 'subareas', 'main_building')

class LocationAdminImageSerializer(serializers.ModelSerializer):
    images = serializers.SerializerMethodField()

    def get_images(self, obj):
        queryset = Image.objects.filter(location=obj)
        serializer = ImageSerializer(instance=queryset, many=True)
        return serializer.data


    class Meta:
        model = Location
        fields = ('id', 'name', 'images')
        depth = 1


class LocationRetrieveSerializer(serializers.ModelSerializer):
    category = serializers.SlugRelatedField(slug_field='name', read_only=True)
    tags = serializers.SlugRelatedField(slug_field='name', read_only=True, many=True)
    marker_icon = serializers.SerializerMethodField()
    subareas = serializers.SerializerMethodField()
    main_building = serializers.SerializerMethodField()
    DISTANCE_THRESHOLD = 150
    nearby_locations = serializers.SerializerMethodField()
    img_urls = serializers.SerializerMethodField()

    def get_marker_icon(self, obj):
        return obj.category and obj.category.marker

    def get_subareas(self, obj):
        subareaDict = {}
        for category in Category.objects.exclude(name="Buildings"):            
            queryset = Location.objects.filter(building__building=obj, category=category)
            serializer = LocationSimpleSerializer(instance=queryset, many=True)
            subareaDict[category.name] = serializer.data or None
        return subareaDict

    def get_main_building(self, obj):
        try:
            queryset = Location.objects.get(subareas__sub=obj)
            serializer = LocationSimpleSerializer(instance=queryset)
            return serializer.data
        except:
            return None


    # used to calculate distance in meters given 2 latlngs
    @staticmethod
    def distance_between(lat1, lng1, lat2, lng2):
        lat1, lng1, lat2, lng2 = [math.radians(latlng) for latlng in (
            lat1, lng1, lat2, lng2)]  # convert to radians
        R = 6371  # Radius of the earth in km
        dLat = abs(lat2-lat1)  # delta lat
        dLng = abs(lng2-lng1)  # delta lng
        a = math.pow(math.sin(dLat/2), 2) + math.cos(lat1) * \
            math.cos(lat2) * math.pow(math.sin(dLng/2), 2)
        c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a))
        d = R * c  # Distance in km
        return d*1000  # return in meters

    def get_nearby_locations(self, obj):
        queryset = Location.objects.filter(~Q(category__name="Rooms"))
        nearbyList = []
        for near in queryset:
            distance = self.distance_between(
                obj.lat, obj.lng, near.lat, near.lng)
            if obj.name != near.name and distance < self.DISTANCE_THRESHOLD:
                nearbyList.append({
                    'name': near.name,
                    'id': near.id
                })
        return nearbyList

    def get_img_urls(self, obj):
        queryset = Image.objects.filter(location=obj)
        serializer = ImageSerializer(instance=queryset, many=True)
        return [img['img_url'] for img in serializer.data]

    class Meta:
        model = Location
        fields = ('id', 'name', 'category', 'tags', 'marker_icon', 'description', 'more_info', 'lat', 'lng',
                  'subareas', 'main_building', 'nearby_locations', 'img_urls')


class LocationListSerializer(serializers.ModelSerializer):
    thumbnail_url = serializers.SerializerMethodField()
    marker_icon = serializers.SerializerMethodField()

    def get_thumbnail_url(self, obj):
        queryset = Image.objects.filter(location=obj).first()
        serializer = ImageSerializer(instance=queryset)
        return serializer.data["img_url"]

    def get_marker_icon(self, obj):
        return obj.category and obj.category.marker

    class Meta:
        model = Location
        fields = ('id', 'name', 'description', 'lat', 'lng', 'thumbnail_url', 'marker_icon')


class LocationSimpleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = ('id', 'name')


class ImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Image
        fields = ('img_url', 'id')
