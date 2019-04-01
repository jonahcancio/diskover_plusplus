from .models import Category, Location, Image, Subarea
from django.db.models import Q
from rest_framework import serializers
import math


#Serializer for Category model
class CategorySerializer(serializers.ModelSerializer):
    """
    Serializer for Category model
    """
    class Meta:
        model = Category
        fields = ('id', 'name', 'image', 'url', 'marker', 'routeMarker', 'routeColor')


class LocationRetrieveSerializer(serializers.ModelSerializer):
    category = serializers.SlugRelatedField(slug_field='name', read_only=True)
    main_building = serializers.SerializerMethodField()    
    inside_rooms = serializers.SerializerMethodField()
    comfort_rooms = serializers.SerializerMethodField()
    offices = serializers.SerializerMethodField()
    food_services = serializers.SerializerMethodField()
    entrances_exits = serializers.SerializerMethodField()
    jeepney_stops = serializers.SerializerMethodField()
    DISTANCE_THRESHOLD = 150
    nearby_locations = serializers.SerializerMethodField()
    img_urls = serializers.SerializerMethodField()    
    
    def get_main_building(self, obj):
        try:
            queryset = Location.objects.get(building__sub=obj, category__name="Buildings")
            serializer = LocationSimpleSerializer(instance=queryset)
            return serializer.data
        except:            
            return None
            
    def get_inside_rooms(self, obj):
        queryset = Location.objects.filter(subareas__building=obj, category__name="Rooms")
        serializer = LocationSimpleSerializer(instance=queryset, many=True)
        return serializer.data or None

    #used to calculate distance in meters given 2 latlngs
    @staticmethod
    def distance_between(lat1, lng1, lat2, lng2):
        lat1, lng1, lat2, lng2 = [math.radians(latlng) for latlng in (lat1, lng1, lat2, lng2)] #convert to radians
        R = 6371; # Radius of the earth in km        
        dLat = abs(lat2-lat1) #delta lat
        dLng = abs(lng2-lng1) #delta lng
        a = math.pow(math.sin(dLat/2), 2) + math.cos(lat1) * math.cos(lat2) * math.pow(math.sin(dLng/2), 2) 
        c = 2 * math.atan2(math.sqrt(a), math.sqrt(1-a)); 
        d = R * c; # Distance in km
        return d*1000; #return in meters

    def get_nearby_locations(self, obj):
        queryset = Location.objects.filter(~Q(category__name="Rooms"))
        nearbyList = []
        for near in queryset:
            distance = self.distance_between(obj.lat, obj.lng, near.lat, near.lng)
            if obj.name != near.name and distance < self.DISTANCE_THRESHOLD:
                nearbyList.append({
                    'name': near.name,
                    'id': near.id
                })
        return nearbyList

    def get_img_urls(self, obj):
        queryset = Image.objects.filter(location=obj.name)
        serializer = ImageSerializer(instance=queryset, many=True)
        return [img['img_url'] for img in serializer.data]

    def get_comfort_rooms(self, obj):
        queryset = Location.objects.filter(subareas__building=obj, category__name="Comfort Rooms")
        serializer = LocationSimpleSerializer(instance=queryset, many=True)
        return serializer.data or None

    def get_offices(self, obj):
        queryset = Location.objects.filter(subareas__building=obj, category__name="Offices")
        serializer = LocationSimpleSerializer(instance=queryset, many=True)
        return serializer.data or None

    def get_food_services(self, obj):
        queryset = Location.objects.filter(subareas__building=obj, category__name="Food Services")
        serializer = LocationSimpleSerializer(instance=queryset, many=True)
        return serializer.data or None

    def get_entrances_exits(self, obj):
        queryset = Location.objects.filter(subareas__building=obj, category__name="Entrances/Exits")
        serializer = LocationSimpleSerializer(instance=queryset, many=True)
        return serializer.data or None

    def get_jeepney_stops(self, obj):
        queryset = Location.objects.filter(subareas__building=obj, category__name="Jeepney Stops")
        serializer = LocationSimpleSerializer(instance=queryset, many=True)
        return serializer.data or None
    class Meta:
        model = Location
        fields = ('id', 'name','category','description','more_info', 'lat','lng',
            'main_building', 'inside_rooms', 'nearby_locations', 'img_urls',
            'comfort_rooms', 'offices', 'food_services', 'entrances_exits', 'jeepney_stops')
class LocationListSerializer(serializers.ModelSerializer):
    thumbnail_url = serializers.SerializerMethodField()

    def get_thumbnail_url(self, obj):
        queryset = Image.objects.filter(location=obj.name).first()
        serializer = ImageSerializer(instance=queryset)
        return serializer.data["img_url"]

    class Meta:
        model = Location
        fields = ('id', 'name', 'description', 'lat','lng', 'thumbnail_url')

class LocationSimpleSerializer(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = ('id','name')

class ImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Image
        fields = ('img_url',)
