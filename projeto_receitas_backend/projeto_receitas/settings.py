import os
from pathlib import Path
from datetime import datetime, timedelta 
from django.conf import settings

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-vw$+ke%v$1y2bwlwxdkhqm07y4$c0gxqnjgj7%0!l^yc^aq9t!'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = ['localhost', '127.0.0.1']



# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework', 
    'rest_framework_simplejwt',
    'corsheaders',
    'aplicativo_receitas',
    
]

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'projeto_receitas.urls'

# settings.py

CSRF_TRUSTED_ORIGINS = ['http://localhost:3000'] # URL do frontend adicionado recentemente


CORS_ALLOWED_ORIGINS = [
    "http://localhost:3000",  # URL do frontend
]
CORS_ORIGINAL_ALLOW_ALL = True  # Permite todos os origens



TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [os.path.join(BASE_DIR, 'aplicativo_receitas', 'templates')],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'projeto_receitas.wsgi.application'


# Database
# https://docs.djangoproject.com/en/5.1/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql',
        'NAME': 'pi_receitas', 
        'USER': 'postgres',     
        'PASSWORD': 'postgres',
        'HOST': 'localhost',
        'PORT': '5432',
    }
}

# Configure o JWT no 'settings.py'

SIMPLE_JWT = { 
    'ACCESS_TOKEN_LIFETIME': timedelta(hours=4), # *recem adicionado timedelta(hours=4), 
    'REFRESH_TOKEN_LIFETIME': timedelta(days=7), 
    'ROTATE_REFRESH_TOKENS': False, 
    'BLACKLIST_AFTER_ROTATION': True, 
    'UPDATE_LAST_LOGIN': False,
    'ALGORITHM': 'HS256', 
    'SIGNING_KEY': 'django-insecure-vw$+ke%v$1y2bwlwxdkhqm07y4$c0gxqnjgj7%0!l^yc^aq9t!', 
    'VERIFYING_KEY': None, 
    'AUDIENCE': None, 
    'ISSUER': None, 
    'JWK_URL': None,
    'LEEWAY': 0,
    'AUTH_HEADER_TYPES': ('Bearer',),
    'AUTH_HEADER_NAME': 'HTTP_AUTHORIZATION', # *recem adicionado
    'USER_ID_FIELD': 'id', 
    'USER_ID_CLAIM': 'user_id', 
    'USER_AUTHENTICATION_RULE': 'rest_framework_simplejwt.authentication.default_user_authentication_rule', # *recem adionado
    'AUTH_TOKEN_CLASSES': ('rest_framework_simplejwt.tokens.AccessToken',), 
    'TOKEN_TYPE_CLAIM': 'token_type', 
    'JTI_CLAIM': 'jti',
    'TOKEN_USER_CLASS': 'rest_framework_simplejwt.models.TokenUser',
    'TOKEN_OBTAIN_SERIALIZER': 'rest_framework_simplejwt.serializers.TokenObtainPairSerializer',
    'TOKEN_REFRESH_SERIALIZER': 'rest_framework_simplejwt.serializers.TokenRefreshSerializer',
    'TOKEN_VERIFY_SERIALIZER': 'rest_framework_simplejwt.serializers.TokenVerifySerializer',
    'TOKEN_BLACKLIST_SERIALIZER': 'rest_framework_simplejwt.serializers.TokenBlacklistSerializer',
    'SLIDING_TOKEN_REFRESH_EXP_CLAIM': 'refresh_exp', 
    'SLIDING_TOKEN_LIFETIME': timedelta(hours=4), 
    'SLIDING_TOKEN_REFRESH_LIFETIME': timedelta(days=7), }


REST_FRAMEWORK = { 
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework_simplejwt.authentication.JWTAuthentication', ),
    'DEFAULT_PERMISSION_CLASSES': (
'rest_framework.permissions.IsAuthenticated', ),
}
# Password validation
# https://docs.djangoproject.com/en/5.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.1/topics/i18n/

LANGUAGE_CODE = 'pt-br'

TIME_ZONE = 'America/Sao_Paulo'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.1/howto/static-files/

STATIC_URL = 'static/'

# Default primary key field type
# https://docs.djangoproject.com/en/5.1/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'