#  projeto_receitas_backend/aplicativo_receitas/serializers.py

from rest_framework import serializers
from django.contrib.auth.models import User
from .models import Categoria, Subcategoria, Receita, Avaliacao

class ReceitaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Receita
        fields = '__all__'
        extra_kwargs = {                    # permite que o campo autor seja somente leitura/ Não exige o autor quando cria a receita
            'autor': {'read_only': True}
        }

class AvaliacaoSerializer(serializers.ModelSerializer):
    usuario = serializers.ReadOnlyField(source='usuario.username')

    class Meta:
        model = Avaliacao
        fields = ['id', 'receita', 'usuario', 'nota', 'comentario', 'data_criacao']
        read_only_fields = ['usuario', 'data_criacao']

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'email','password')
        extra_kwargs = {
            'password': {'write_only': True},
        }

class CategoriaSerializer(serializers.ModelSerializer): 
    class Meta: 
        model = Categoria 
        fields = '__all__'

class SubcategoriaSerializer(serializers.ModelSerializer): 
    class Meta: 
        model = Subcategoria 
        fields = '__all__'

    # def create(self, validated_data):
    #     user = User.objects.create_user(**validated_data)
    #     return user
    
    def create(self, validated_data):
        # Cria uma nova subcategoria usando os dados validados
        subcategoria = Subcategoria.objects.create(**validated_data)
        return subcategoria
    








