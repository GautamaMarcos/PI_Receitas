from django.contrib import admin
from .models import Receita, Avaliacao, Categoria, Subcategoria
from .forms import CategoriaForm, SubcategoriaForm

@admin.register(Categoria)
class CategoriaAdmin(admin.ModelAdmin):
    form = CategoriaForm
    list_display = ('nome',)
    search_fields = ('nome',)

@admin.register(Subcategoria)
class SubcategoriaAdmin(admin.ModelAdmin):
    form = SubcategoriaForm
    list_display = ('nome', 'categoria')
    search_fields = ('nome', 'categoria__nome')

@admin.register(Receita)
class ReceitaAdmin(admin.ModelAdmin):
    list_display = ('titulo', 'categoria_id', 'subcategoria_id', 'autor', 'data_criacao')
    search_fields = ('titulo', 'categoria_id__nome', 'subcategoria_id__nome', 'autor__username')
    list_filter = ('categoria_id', 'subcategoria_id', 'data_criacao')

@admin.register(Avaliacao)
class AvaliacaoAdmin(admin.ModelAdmin):
    list_display = ('receita', 'usuario', 'nota', 'data_criacao')
    search_fields = ('receita__titulo', 'usuario__username', 'nota')
    list_filter = ('nota', 'data_criacao')











# from django.contrib import admin
# from .models import Receita, Avaliacao
# # Register your models here.


# @admin.register(Receita)
# class ReceitaAdmin(admin.ModelAdmin):
#     list_display = ('titulo', 'categoria', 'autor', 'data_criacao')
#     search_fields = ('titulo', 'categoria', 'autor__username')
#     list_filter = ('categoria', 'data_criacao')

# @admin.register(Avaliacao)
# class AvaliacaoAdmin(admin.ModelAdmin):
#     list_display = ('receita', 'usuario', 'nota', 'data_criacao')
#     search_fields = ('receita__titulo', 'usuario__username')
#     list_filter = ('nota', 'data_criacao')
