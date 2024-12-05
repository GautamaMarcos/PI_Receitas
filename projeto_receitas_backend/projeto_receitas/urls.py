"""
URL configuration for projeto_receitas project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.1/topics/http/urls/
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
# projeto_receitas_backend/projeto_receitas/urls.py
from django.contrib import admin
from django.urls import path, include
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
from aplicativo_receitas.views import UserViewSet


urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('aplicativo_receitas.urls')),  # URLs do aplicativo de receitas  
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
    path('api/users/', UserViewSet.as_view({'post': 'create'}), name='user-create'),
    path('api/users/login/', UserViewSet.as_view({'post': 'login'}), name='user-login'),
    path('api/', include('aplicativo_receitas.urls')),
    path ('aplicativo_receitas/', include('aplicativo_receitas.urls')),
]

    

# path('api-auth/', include('rest_framework.urls')),  # URLs do Django REST Framework