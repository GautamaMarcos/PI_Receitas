#  projeto_receitas_backend/aplicativo_receitas/urls.py

from django.urls import path, include
from rest_framework import routers
from .views import ( ReceitaViewSet, AvaliacaoViewSet, UserViewSet, CriarSubcategoriaView,
CriarCategoriaView,  ListarCategoriasView, ListarSubcategoriasView, 
CriarReceitaView, verificar_categoria, verificar_subcategoria, 
criar_categoria, criar_subcategoria
)
router = routers.DefaultRouter()
router.register(r'receitas', ReceitaViewSet)
router.register(r'avaliacoes', AvaliacaoViewSet)
router.register(r'users', UserViewSet)

urlpatterns = [
    path('', include(router.urls)), 
    path('criar_categoria/', CriarCategoriaView.as_view(), name='criar_categoria'),
    path('criar_subcategoria/', CriarSubcategoriaView.as_view(), name='criar_subcategoria'),
    path('listar_categorias/', ListarCategoriasView.as_view(), name='listar_categorias'),
    path('listar_subcategorias/', ListarSubcategoriasView.as_view(), name='listar_subcategorias'),
    path('verificar_categoria/<str:nome>/', verificar_categoria, name='verificar_categoria'),
    path('verificar_subcategoria/<str:nome>/', verificar_subcategoria, name='verificar_subcategoria'),
    path('criar_categoria_form/', criar_categoria, name='criar_categoria_form'),
    path('criar_subcategoria_form/', criar_subcategoria, name='criar_subcategoria_form'),
    path('criar_receita/', CriarReceitaView.as_view(), name='criar_receita'),
    path('receitas/<uuid:receita_id>/delete/', ReceitaViewSet.as_view({'delete': 'destroy'}), name='delete_receita'),
]





# path('verificar_categoria/<str:nome>/', verificar_categoria, name='verificar_categoria'),
# path('verificar_subcategoria/<str:nome>/', verificar_subcategoria, name='verificar_subcategoria'),

#####################################################
# projeto_receitas_backend/aplicativo_receitas/urls.py
# from django.urls import path, include
# from rest_framework import routers
# from .views import ReceitaViewSet, AvaliacaoViewSet, UserViewSet
# from .views import criar_categoria, criar_subcategoria, criar_receita

# router = routers.DefaultRouter()
# router.register(r'receitas', ReceitaViewSet)
# router.register(r'avaliacoes', AvaliacaoViewSet)
# router.register(r'users', UserViewSet)

# urlpatterns = [
#     path('', include(router.urls)), 
#     path('criar_categoria/', criar_categoria, name='criar_categoria'),
#     path('criar_subcategoria/', criar_subcategoria, name='criar_subcategoria'),
#     path('criar_receita/', criar_receita, name='criar_receita'),

# ]

