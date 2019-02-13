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
class LocationSerializer(serializers.ModelSerializer):
    img_urls = serializers.SerializerMethodField()

    def get_img_urls(self, obj):
        queryset = Image.objects.filter(location=obj.name)
        return ImageSerializer(queryset, many=True).data

    class Meta:
        model = Location
        fields = ('id', 'name','category','description','moreInfo','lat','lng', 'img_urls')

class ImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = Image
        fields = ('img_url',)
	
