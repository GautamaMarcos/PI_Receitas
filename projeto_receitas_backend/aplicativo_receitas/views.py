# projeto_receitas_backend/aplicativo_receitas/views.py

from django.http import JsonResponse
from django.shortcuts import render, redirect
from rest_framework import viewsets, generics
from rest_framework.response import Response
from .models import Receita, Avaliacao, Categoria, Subcategoria
from .serializers import ReceitaSerializer, AvaliacaoSerializer, UserSerializer, CategoriaSerializer, SubcategoriaSerializer
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.permissions import IsAuthenticated
from django.contrib.auth.models import User
from django.contrib.auth import authenticate
from rest_framework.authtoken.models import Token
from .forms import CategoriaForm, SubcategoriaForm, ReceitaForm
from rest_framework.permissions import AllowAny


class ReceitaViewSet(viewsets.ModelViewSet):
    queryset = Receita.objects.all()
    serializer_class = ReceitaSerializer
    
    def perform_create(self, serializer):
        serializer.save(autor=self.request.user)

    def destroy(self, request, *args, **kwargs):
        receita = self.get_object()
        if receita.autor != request.user:
            return Response({"error": "Você não pode excluir essa receita."}, status=403)

        if 'confirm' in request.data and request.data['confirm'] == 'true':
            self.perform_destroy(receita)
            return JsonResponse({"message": "Receita excluída com sucesso."}, status=200)
        else:
            return JsonResponse({"message": "Deseja realmente deletar a receita?", "confirm": True}, status=200)

class AvaliacaoViewSet(viewsets.ModelViewSet):
    queryset = Avaliacao.objects.all()
    serializer_class = AvaliacaoSerializer
    permission_classes = [IsAuthenticated]
    authentication_classes = [JWTAuthentication]

    def create(self, request, *args, **kwargs):
        try:
            receita_uuid = request.data.get('receita')
            receita = Receita.objects.get(uuid=receita_uuid)
            usuario = request.user

            # Verificar se o usuário já avaliou esta receita
            if Avaliacao.objects.filter(receita=receita, usuario=usuario).exists():
                return Response({"error": "Você já avaliou essa receita."}, status=400)

            # Salvar a avaliação
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid(raise_exception=True)
            serializer.save(receita=receita, usuario=usuario)
            headers = self.get_success_headers(serializer.data)

            success_message = f"Avaliação adicionada com sucesso: {usuario.username} avaliou '{receita.titulo}' com nota {serializer.validated_data.get('nota')}."
            return Response({"message": success_message, "data": serializer.data}, status=201, headers=headers)

        except Receita.DoesNotExist:
            return Response({"error": "Receita não encontrada."}, status=404)
        except Exception as e:
            return Response({"error": str(e)}, status=500)
        #     return Response(serializer.data, status=201, headers=headers)
        # except Receita.DoesNotExist:
        #     return Response({"error": "Receita não encontrada."}, status=404)
        # except Exception as e:
        #     return Response({"error": str(e)}, status=500)
    
    
class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    
    def get_permissions(self): 
        if self.action in ['create', 'login']: 
            self.permission_classes = [AllowAny,] 
        else: 
            self.permission_classes = [IsAuthenticated,] 
        return super().get_permissions()

    def create(self, request):
        serializer = UserSerializer(data=request.data)
        if serializer.is_valid():
            user = serializer.save()
            token, created = Token.objects.get_or_create(user=user)
            return Response({
                "token": token.key,
                "user": UserSerializer(user).data,
            })
        return Response(serializer.errors, status=400)

    def login(self, request):
        username = request.data.get('username')
        password = request.data.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            token, created = Token.objects.get_or_create(user=user)
            return Response({
                "token": token.key,
                "user": UserSerializer(user).data,
            })
        return Response({"error": "Credenciais inválidas"}, status=400)

class CriarCategoriaView(generics.CreateAPIView): 
    queryset = Categoria.objects.all() 
    serializer_class = CategoriaSerializer 

    def perform_create(self, serializer): 
        categoria_nome = self.request.data.get('nome', '').upper()  # Converte para maiúsculas
        if Categoria.objects.filter(nome=categoria_nome).exists():
            return Response({"error": "Uma categoria com esse nome já existe."}, status=400)
        categoria = serializer.save(nome=categoria_nome)  # Salva a categoria em maiúsculas
        subcategoria_nome = self.request.data.get('subcategoria_nome', '').upper()  # Converte a subcategoria para maiúsculas
        if subcategoria_nome:
            Subcategoria.objects.create(nome=subcategoria_nome, categoria=categoria)

class CriarSubcategoriaView(generics.CreateAPIView): 
    queryset = Subcategoria.objects.all() 
    serializer_class = SubcategoriaSerializer

    def perform_create(self, serializer): 
        subcategoria_nome = self.request.data.get('nome', '').upper()  # Converte para maiúsculas
        categoria_id = self.request.data.get('categoria')  # Presumindo que a categoria é passada como ID
        try:
            categoria = Categoria.objects.get(id=categoria_id)
        except Categoria.DoesNotExist:
            return Response({"error": "Categoria não encontrada."}, status=404)
        
        if Subcategoria.objects.filter(nome=subcategoria_nome, categoria=categoria).exists():
            return Response({"error": "Uma subcategoria com esse nome já existe nesta categoria."}, status=400)
        
        serializer.save(nome=subcategoria_nome, categoria=categoria)  # Salva a subcategoria em maiúsculas
 
def criar_categoria(request):
    if request.method == 'POST':
        form = CategoriaForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('criar_categoria')
    else:
        form = CategoriaForm()
    return render(request, 'criar_categoria.html', {'form': form})

def criar_subcategoria(request):
    if request.method == 'POST':
        form = SubcategoriaForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('criar_subcategoria')
    else:
        form = SubcategoriaForm()
    return render(request, 'criar_subcategoria.html', {'form': form})

def criar_receita(request):
    if request.method == 'POST':
        form = ReceitaForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('criar_receita')
    else:
        form = ReceitaForm()
    return render(request, 'criar_receita.html', {'form': form})

class ListarCategoriasView(generics.ListAPIView): 
    queryset = Categoria.objects.all() 
    serializer_class = CategoriaSerializer

class ListarSubcategoriasView(generics.ListAPIView): 
    queryset = Subcategoria.objects.all() 
    serializer_class = SubcategoriaSerializer

class CriarReceitaView(generics.CreateAPIView): 
    queryset = Receita.objects.all() 
    serializer_class = ReceitaSerializer 
    
    def perform_create(self, serializer): 
        serializer.save(autor=self.request.user)


def verificar_categoria(request):
    nome_categoria = request.GET.get('nome')
    if Categoria.objects.filter(nome=nome_categoria).exists():
        return JsonResponse({"exists": True})
    return JsonResponse({"exists": False})

def verificar_subcategoria(request):
    nome_subcategoria = request.GET.get('nome')
    if Subcategoria.objects.filter(nome=nome_subcategoria).exists():
        return JsonResponse({"exists": True})
    return JsonResponse({"exists": False})





#  Backup 16/11/24 - 11:02
# def create(self, request, *args, **kwargs):
#         try:
#             receita_uuid = request.data.get('receita')
#             receita = Receita.objects.get(uuid=receita_uuid)
#             usuario = request.user

#             # Verificar se o usuário já avaliou esta receita
#             if Avaliacao.objects.filter(receita=receita, usuario=usuario).exists():
#                 return Response({"error": "Você já avaliou essa receita."}, status=400)

#             # Salvar a avaliação
#             serializer = self.get_serializer(data=request.data)
#             serializer.is_valid(raise_exception=True)
#             serializer.save(receita=receita, usuario=usuario)
#             headers = self.get_success_headers(serializer.data)
#             return Response(serializer.data, status=201, headers=headers)
#         except Receita.DoesNotExist:
#             return Response({"error": "Receita não encontrada."}, status=404)
#         except Exception as e:
#             return Response({"error": str(e)}, status=500)





































# Backup 2

# from django.http import JsonResponse
# from django.shortcuts import render, redirect
# from rest_framework import viewsets, generics
# from rest_framework.response import Response
# from .models import Receita, Avaliacao, Categoria, Subcategoria
# from .serializers import ReceitaSerializer, AvaliacaoSerializer, UserSerializer, CategoriaSerializer, SubcategoriaSerializer
# from rest_framework_simplejwt.authentication import JWTAuthentication
# from rest_framework.permissions import IsAuthenticated
# from django.contrib.auth.models import User
# from django.contrib.auth import authenticate
# from rest_framework.authtoken.models import Token
# from .forms import CategoriaForm, SubcategoriaForm, ReceitaForm
# from rest_framework.permissions import AllowAny

# class ReceitaViewSet(viewsets.ModelViewSet):
#     queryset = Receita.objects.all()
#     serializer_class = ReceitaSerializer

#     def perform_create(self, serializer):
#         serializer.save(autor=self.request.user)

#     def destroy(self, request, *args, **kwargs):
#         receita = self.get_object()
#         if receita.autor != request.user:
#             return Response({"error": "Você não pode excluir essa receita."}, status=403)

#         if 'confirm' in request.data and request.data['confirm'] == 'true':
#             self.perform_destroy(receita)
#             return JsonResponse({"message": "Receita excluída com sucesso."}, status=200)
#         else:
#             return JsonResponse({"message": "Deseja realmente deletar a receita?", "confirm": True}, status=200)

# class AvaliacaoViewSet(viewsets.ModelViewSet):
#     queryset = Avaliacao.objects.all()
#     serializer_class = AvaliacaoSerializer
#     permission_classes = [IsAuthenticated]
#     authentication_classes = [JWTAuthentication]

#     def perform_create(self, serializer):
#         try:
#             receita = Receita.objects.get(uuid=self.request.data['receita'])
#             if Avaliacao.objects.filter(receita=receita, usuario=self.request.user).exists():
#                 return Response({"error": "Você já avaliou essa receita."}, status=400)
#             serializer.save(receita=receita, usuario=self.request.user)
#         except Receita.DoesNotExist:
#             return Response({"error": "Receita não encontrada."}, status=404)

# class UserViewSet(viewsets.ModelViewSet):
#     queryset = User.objects.all()
#     serializer_class = UserSerializer
    
#     def get_permissions(self): 
#         if self.action in ['create', 'login']: 
#            self.permission_classes = [AllowAny,] 
#         else: self.permission_classes = [IsAuthenticated,] 
#         return super().get_permissions()

#     def create(self, request):
#         serializer = UserSerializer(data=request.data)
#         if serializer.is_valid():
#             user = serializer.save()
#             token, created = Token.objects.get_or_create(user=user)
#             return Response({
#                 "token": token.key,
#                 "user": UserSerializer(user).data,
#             })
#         return Response(serializer.errors, status=400)

#     def login(self, request):
#         username = request.data.get('username')
#         password = request.data.get('password')
#         user = authenticate(request, username=username, password=password)
#         if user is not None:
#             token, created = Token.objects.get_or_create(user=user)
#             return Response({
#                 "token": token.key,
#                 "user": UserSerializer(user).data,
#             })
#         return Response({"error": "Invalid credentials"}, status=400)

# class CriarCategoriaView(generics.CreateAPIView): 
#     queryset = Categoria.objects.all() 
#     serializer_class = CategoriaSerializer 

#     def perform_create(self, serializer): 
#         nome_categoria = self.request.data.get('nome')
#         nome_subcategoria = self.request.data.get('subcategoria_nome')

#         # Verificar se a categoria já existe
#         categoria_existente = Categoria.objects.filter(nome=nome_categoria).first()
#         if categoria_existente:
#             return Response({
#                 "error": "Categoria já existe.",
#                 "categoria_id": categoria_existente.id,
#                 "message": "Deseja adicionar a categoria existente ou digitar outro nome?"
#             }, status=400)

#         # Verificar se a subcategoria já existe
#         subcategoria_existente = Subcategoria.objects.filter(nome=nome_subcategoria).first()
#         if subcategoria_existente:
#             return Response({
#                 "error": "Subcategoria já existe.",
#                 "subcategoria_id": subcategoria_existente.id,
#                 "message": "Deseja adicionar a subcategoria existente ou digitar outro nome?"
#             }, status=400)

#         # Criar nova categoria e subcategoria
#         categoria = serializer.save() 
#         Subcategoria.objects.create(nome=nome_subcategoria, categoria=categoria)
#         return Response({"message": "Categoria e Subcategoria criadas com sucesso."}, status=201)

# class CriarSubcategoriaView(generics.CreateAPIView): 
#     queryset = Subcategoria.objects.all() 
#     serializer_class = SubcategoriaSerializer

#     def perform_create(self, serializer):
#         nome_subcategoria = self.request.data.get('nome')
#         categoria_id = self.request.data.get('categoria_id')

#         # Verificar se a subcategoria já existe
#         subcategoria_existente = Subcategoria.objects.filter(nome=nome_subcategoria).first()
#         if subcategoria_existente:
#             return Response({
#                 "error": "Subcategoria já existe.",
#                 "subcategoria_id": subcategoria_existente.id,
#                 "message": "Deseja adicionar a subcategoria existente ou digitar outro nome?"
#             }, status=400)

#         # Verificar se a categoria existe
#         try:
#             categoria = Categoria.objects.get(id=categoria_id)
#         except Categoria.DoesNotExist:
#             return Response({"error": "Categoria não encontrada."}, status=404)

#         # Criar nova subcategoria
#         serializer.save(categoria=categoria)
#         return Response({"message": "Subcategoria criada com sucesso."}, status=201)

# def criar_categoria(request):
#     if request.method == 'POST':
#         form = CategoriaForm(request.POST)
#         if form.is_valid():
#             form.save()
#             return redirect('criar_categoria')
#     else:
#         form = CategoriaForm()
#     return render(request, 'criar_categoria.html', {'form': form})

# def criar_subcategoria(request):
#     if request.method == 'POST':
#         form = SubcategoriaForm(request.POST)
#         if form.is_valid():
#             form.save()
#             return redirect('criar_subcategoria')
#     else:
#         form = SubcategoriaForm()
#     return render(request, 'criar_subcategoria.html', {'form': form})

# def criar_receita(request):
#     if request.method == 'POST':
#         form = ReceitaForm(request.POST)
#         if form.is_valid():
#             form.save()
#             return redirect('criar_receita')
#     else:
#         form = ReceitaForm()
#     return render(request, 'criar_receita.html', {'form': form})

# class ListarCategoriasView(generics.ListAPIView): 
#     queryset = Categoria.objects.all() 
#     serializer_class = CategoriaSerializer

# class ListarSubcategoriasView(generics.ListAPIView): 
#     queryset = Subcategoria.objects.all() 
#     serializer_class = SubcategoriaSerializer

# class CriarReceitaView(generics.CreateAPIView): 
#     queryset = Receita.objects.all() 
#     serializer_class = ReceitaSerializer 
    
#     def perform_create(self, serializer): 
#         serializer.save(autor=self.request.user)

# def verificar_categoria(request):
#     nome_categoria = request.GET.get('nome')
#     if Categoria.objects.filter(nome=nome_categoria).exists():
#         return JsonResponse({"exists": True})
#     return JsonResponse({"exists": False})

# def verificar_subcategoria(request):
#     nome_subcategoria = request.GET.get('nome')
#     if Subcategoria.objects.filter(nome=nome_subcategoria).exists():
#         return JsonResponse({"exists": True})
#     return JsonResponse({"exists": False})

###########################################

# Backup 1

# from django.http import JsonResponse
# from django.shortcuts import render, redirect
# from rest_framework import viewsets, generics
# from rest_framework.response import Response
# from .models import Receita, Avaliacao, Categoria, Subcategoria
# from .serializers import ReceitaSerializer, AvaliacaoSerializer, UserSerializer, CategoriaSerializer, SubcategoriaSerializer
# from rest_framework_simplejwt.authentication import JWTAuthentication
# from rest_framework.permissions import IsAuthenticated
# from django.contrib.auth.models import User
# from django.contrib.auth import authenticate
# from rest_framework.authtoken.models import Token
# from .forms import CategoriaForm, SubcategoriaForm, ReceitaForm
# from rest_framework.permissions import AllowAny


# class ReceitaViewSet(viewsets.ModelViewSet):
#     queryset = Receita.objects.all()
#     serializer_class = ReceitaSerializer
#     # permission_classes = [IsAuthenticated]
#     # authentication_classes = [JWTAuthentication]

#     def perform_create(self, serializer):
#         serializer.save(autor=self.request.user)

#     def destroy(self, request, *args, **kwargs):
#         receita = self.get_object()
#         if receita.autor != request.user:
#             return Response({"error": "Você não pode excluir essa receita."}, status=403)

#         if 'confirm' in request.data and request.data['confirm'] == 'true':
#             self.perform_destroy(receita)
#             return JsonResponse({"message": "Receita excluída com sucesso."}, status=200)
#         else:
#             return JsonResponse({"message": "Deseja realmente deletar a receita?", "confirm": True}, status=200)

# class AvaliacaoViewSet(viewsets.ModelViewSet):
#     queryset = Avaliacao.objects.all()
#     serializer_class = AvaliacaoSerializer
#     permission_classes = [IsAuthenticated]
#     authentication_classes = [JWTAuthentication]

#     def perform_create(self, serializer):
#         try:
#             receita = Receita.objects.get(uuid=self.request.data['receita'])
#             if Avaliacao.objects.filter(receita=receita, usuario=self.request.user).exists():
#                 return Response({"error": "Você já avaliou essa receita."}, status=400)
#             serializer.save(receita=receita, usuario=self.request.user)
#         except Receita.DoesNotExist:
#             return Response({"error": "Receita não encontrada."}, status=404)

# class UserViewSet(viewsets.ModelViewSet):
#     queryset = User.objects.all()
#     serializer_class = UserSerializer
#     # permission_classes = [IsAuthenticated]
#     # authentication_classes = [JWTAuthentication]
#     def get_permissions(self): 
#         if self.action in ['create', 'login']: 
#            self.permission_classes = [AllowAny,] 
#         else: self.permission_classes = [IsAuthenticated,] 
#         return super().get_permissions()

#     # def list(self, request):
#     #     if request.user.is_authenticated:
#     #         return Response({"user": UserSerializer(request.user).data})
#     #     return Response({"error": "Unauthorized"}, status=401)

#     def create(self, request):
#         serializer = UserSerializer(data=request.data)
#         if serializer.is_valid():
#             user = serializer.save()
#             token, created = Token.objects.get_or_create(user=user)
#             return Response({
#                 "token": token.key,
#                 "user": UserSerializer(user).data,
#             })
#         return Response(serializer.errors, status=400)

#     def login(self, request):
#         username = request.data.get('username')
#         password = request.data.get('password')
#         user = authenticate(request, username=username, password=password)
#         if user is not None:
#             token, created = Token.objects.get_or_create(user=user)
#             return Response({
#                 "token": token.key,
#                 "user": UserSerializer(user).data,
#             })
#         return Response({"error": "Invalid credentials"}, status=400)
    
# class CriarCategoriaView(generics.CreateAPIView): 
#     queryset = Categoria.objects.all() 
#     serializer_class = CategoriaSerializer 
#     def perform_create(self, serializer): 
#         categoria = serializer.save() 
#         Subcategoria.objects.create(nome=self.request.data.get('subcategoria_nome'), categoria=categoria)
    
# class CriarSubcategoriaView(generics.CreateAPIView): 
#     queryset = Subcategoria.objects.all() 
#     serializer_class = SubcategoriaSerializer

# def criar_categoria(request):
#     if request.method == 'POST':
#         form = CategoriaForm(request.POST)
#         if form.is_valid():
#             form.save()
#             return redirect('criar_categoria')
#     else:
#         form = CategoriaForm()
#     return render(request, 'criar_categoria.html', {'form': form})

# def criar_subcategoria(request):
#     if request.method == 'POST':
#         form = SubcategoriaForm(request.POST)
#         if form.is_valid():
#             form.save()
#             return redirect('criar_subcategoria')
#     else:
#         form = SubcategoriaForm()
#     return render(request, 'criar_subcategoria.html', {'form': form})

# def criar_receita(request):
#     if request.method == 'POST':
#         form = ReceitaForm(request.POST)
#         if form.is_valid():
#             form.save()
#             return redirect('criar_receita')
#     else:
#         form = ReceitaForm()
#     return render(request, 'criar_receita.html', {'form': form})

# class ListarCategoriasView(generics.ListAPIView): 
#     queryset = Categoria.objects.all() 
#     serializer_class = CategoriaSerializer

# class ListarSubcategoriasView(generics.ListAPIView): 
#     queryset = Subcategoria.objects.all() 
#     serializer_class = SubcategoriaSerializer

# class CriarReceitaView(generics.CreateAPIView): 
#     queryset = Receita.objects.all() 
#     serializer_class = ReceitaSerializer 
    
#     def perform_create(self, serializer): 
#         serializer.save(autor=self.request.user)














