from django import forms
from .models import Receita, Categoria, Subcategoria
from django.core.exceptions import ValidationError

class CategoriaForm(forms.ModelForm):
    class Meta:
        model = Categoria
        fields = ['nome']
    def clean_nome(self):
        nome = self.cleaned_data.get('nome')
        if Categoria.objects.filter(nome__iexact=nome).exists():
            raise ValidationError('Uma categoria com este nome já existe.')
        return nome.upper()

class SubcategoriaForm(forms.ModelForm):
    class Meta:
        model = Subcategoria
        fields = ['nome', 'categoria']
    def clean_nome(self):
        nome = self.cleaned_data.get('nome')
        categoria = self.cleaned_data.get('categoria')
        if Subcategoria.objects.filter(nome__iexact=nome, categoria=categoria).exists():
            raise ValidationError('Uma subcategoria com este nome já existe nesta categoria.')
        return nome.upper()

class ReceitaForm(forms.ModelForm):
    class Meta:
        model = Receita
        fields = ['titulo', 'descricao', 'ingredientes', 'modo_de_preparo', 'categoria_id', 'subcategoria_id','avaliacao', 'autor']

# class AvaliacaoForm(forms.ModelForm):
#     class Meta:
#         model = Avaliacao
#         fields = ['receita', 'nota', 'comentario']

#     def clean(self):
#         cleaned_data = super().clean()
#         receita_uuid = cleaned_data.get('receita')
#         usuario = self.data.get('usuario')  # Supondo que você esteja passando o usuário no contexto

#         # Verificar se a receita existe
#         if receita_uuid:
#             try:
#                 receita = Receita.objects.get(uuid=receita_uuid)
#             except Receita.DoesNotExist:
#                 raise ValidationError('Receita não encontrada.')

#             # Verificar se o usuário já avaliou esta receita
#             if Avaliacao.objects.filter(receita=receita, usuario=usuario).exists():
#                 raise ValidationError('Você já avaliou esta receita.')

#         return cleaned_data

#     def clean_nota(self):
#         nota = self.cleaned_data.get('nota')
#         if nota < 1 or nota > 5:
#             raise ValidationError('A nota deve estar entre 1 e 5.')
#         return nota

#     def clean_comentario(self):
#         comentario = self.cleaned_data.get('comentario')
#         if not comentario:
#             raise ValidationError('O comentário não pode estar em branco.')
#         return comentario