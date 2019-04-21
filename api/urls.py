from django.urls import path, include
from . import views
from rest_framework.urlpatterns import format_suffix_patterns
from rest_framework import routers

"""
Automatic routing from REST framework
"""
router = routers.DefaultRouter()
router.register(r'tags', views.TagViewSet)
router.register(r'categorys', views.CategoryViewSet)
router.register(r'locations', views.LocationViewSet)
router.register(r'admin/locations/images', views.AdminLocationImageViewSet, basename='admin_location_images')
router.register(r'admin/locations', views.AdminLocationViewSet, basename='admin_locations')
router.register(r'admin/images', views.AdminImageViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
