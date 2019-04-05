"""diskover_plusplus URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include, re_path
from django.views.generic import TemplateView
from rest_framework_jwt.views import obtain_jwt_token, refresh_jwt_token, verify_jwt_token

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('api.urls')),
    path('', TemplateView.as_view(template_name='index.html')),
    re_path(r'^api/api-token-auth/', obtain_jwt_token),
    re_path(r'^api/api-token-refresh/', refresh_jwt_token),
    re_path(r'^api/api-token-verify/', verify_jwt_token),
    re_path(r'^(?P<path>.*)/$', TemplateView.as_view(template_name='index.html')),     
]

#uncomment the last urlpattern if running vue-router on history mode instead of hash mode
