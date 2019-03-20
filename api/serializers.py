from .models import Category, Location, Image
from rest_framework import serializers

#Serializer for Category model
class CategorySerializer(serializers.ModelSerializer):
    """
    Serializer for Category model
    """
    class Meta:
        model = Category
        fields = ('name', 'image', 'position', 'url', 'marker', 'routeMarker', 'routeColor')


# Serializer for location model
class LocationRetrieveSerializer(serializers.ModelSerializer):
    img_urls = serializers.SerializerMethodField()

    def get_img_urls(self, obj):
        queryset = Image.objects.filter(location=obj.name)
        serializer = ImageSerializer(queryset, many=True)
        return [img["img_url"] for img in serializer.data]

    class Meta:
        model = Location
        fields = ('id', 'name','category','description','moreInfo', 'lat','lng', 'img_urls')

class LocationListSerializer(serializers.ModelSerializer):
    thumbnail_url = serializers.SerializerMethodField()

    def get_thumbnail_url(self, obj):
        queryset = Image.objects.filter(location=obj.name).first()
        serializer = ImageSerializer(queryset)
        return serializer.data["img_url"]

    class Meta:
        model = Location
        fields = ('id', 'name', 'description', 'lat','lng', 'thumbnail_url')

class ImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Image
        fields = ('img_url',)

