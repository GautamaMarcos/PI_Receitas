#  projeto_receitas_backend/aplicativo_receitas/models.py

from django.db import models
from django.contrib.auth.models import User
import uuid
from django.core.exceptions import ValidationError

class Categoria(models.Model):
    nome = models.CharField(max_length=100, unique=True)
    
    def save(self, *args, **kwargs):
        self.nome = self.nome.upper()  # Converte para maiúsculas
        super(Categoria, self).save(*args, **kwargs)

    def __str__(self):
        return self.nome

class Subcategoria(models.Model):
    nome = models.CharField(max_length=100)
    categoria = models.ForeignKey(Categoria, on_delete=models.CASCADE, related_name='subcategorias')

    class Meta: unique_together = ('nome', 'categoria')

    def save(self, *args, **kwargs):
        self.nome = self.nome.upper()  # Converte para maiúsculas antes de salvar
        super().save(*args, **kwargs)

    def __str__(self):
         return self.nome 

class Receita(models.Model):
    uuid = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    titulo = models.CharField(max_length=255)
    descricao = models.TextField()
    ingredientes = models.TextField()
    modo_de_preparo = models.TextField()
    categoria_id = models.ForeignKey(Categoria, on_delete=models.CASCADE, related_name='receitas')
    subcategoria_id = models.ForeignKey(Subcategoria, on_delete=models.CASCADE, related_name='receitas', null=True, blank=True)
    avaliacao = models.IntegerField(default=0)
    autor = models.ForeignKey(User, on_delete=models.CASCADE, related_name='receitas')
    data_criacao = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.titulo
    
class Avaliacao(models.Model):
    receita = models.ForeignKey(Receita, on_delete=models.CASCADE,related_name='avaliacoes')
    usuario = models.ForeignKey(User, on_delete=models.CASCADE,related_name='avaliacoes')
    nota = models.IntegerField()
    comentario = models.TextField()
    data_criacao = models.DateTimeField(auto_now_add=True) # Adicione este campo

    class Meta:
        verbose_name_plural = 'Avaliações'
        unique_together = ('receita', 'usuario')
    def __str__(self):
        return f"{self.usuario} avaliou {self.receita} com nota {self.nota}"


