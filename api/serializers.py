from .models import Category, Location, Image, Inside
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
    img_urls = serializers.SerializerMethodField()
    inside_rooms = serializers.SerializerMethodField()
    nearby_locations = serializers.SerializerMethodField()
    outer_building = serializers.SerializerMethodField()

    #used to calculate distance in meters given 2 latlngs
    DISTANCE_THRESHOLD = 150
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

    def get_img_urls(self, obj):
        queryset = Image.objects.filter(location=obj.name)
        serializer = ImageSerializer(instance=queryset, many=True)
        return [img['img_url'] for img in serializer.data]

    def get_inside_rooms(self, obj):
        queryset = Inside.objects.filter(building=obj.name)
        serializer = InsideRoomSerializer(instance=queryset, many=True)
        return serializer.data

    def get_nearby_locations(self, obj):
        queryset = Location.objects.filter(~Q(category__name="Rooms"))
        serializer = LocationNearbySerializer(instance=queryset, many=True)
        nearbyList = []
        for near in serializer.data:
            distance = self.distance_between(obj.lat, obj.lng, near['lat'], near['lng'])
            if obj.name != near['name'] and distance < self.DISTANCE_THRESHOLD:
                nearbyList.append({
                    'name': near['name'],
                    'id': near['id']
                })
        return nearbyList

    def get_outer_building(self, obj):
        try:
            queryset = Inside.objects.get(room=obj.name)
            serializer = InsideBuildingSerializer(instance=queryset)
            return serializer.data
        except:            
            return ""

    class Meta:
        model = Location
        fields = ('id', 'name','category_id','description','moreInfo', 'lat','lng',
         'inside_rooms', 'nearby_locations', 'outer_building', 'img_urls', )

class LocationListSerializer(serializers.ModelSerializer):
    thumbnail_url = serializers.SerializerMethodField()

    def get_thumbnail_url(self, obj):
        queryset = Image.objects.filter(location=obj.name).first()
        serializer = ImageSerializer(instance=queryset)
        return serializer.data["img_url"]

    class Meta:
        model = Location
        fields = ('id', 'name', 'description', 'lat','lng', 'thumbnail_url')

class LocationNearbySerializer(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = ('id','name', 'lat', 'lng')

class InsideRoomSerializer(serializers.ModelSerializer):
    room_id = serializers.SerializerMethodField()

    def get_room_id(self, obj):
        queryitem = Location.objects.get(name=obj.room)
        return queryitem.id
    class Meta:
        model = Inside
        fields = ('room', 'room_id')


class InsideBuildingSerializer(serializers.ModelSerializer):
    building_id = serializers.SerializerMethodField()

    def get_building_id(self, obj):
        queryitem = Location.objects.get(name=obj.building)
        return queryitem.id
    class Meta:
        model = Inside
        fields = ('building', 'building_id')

class ImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Image
        fields = ('img_url',)

