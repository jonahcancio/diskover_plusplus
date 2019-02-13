from django.urls import path, include
from . import views
from rest_framework.urlpatterns import format_suffix_patterns
from rest_framework import routers

"""
Automatic routing from REST framework
"""
router = routers.DefaultRouter()
router.register(r'categories', views.CategoryViewSet)
router.register(r'location', views.LocationViewSet)

urlpatterns = [
    path('', include(router.urls)),
]
