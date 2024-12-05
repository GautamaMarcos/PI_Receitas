import subprocess
import os

# Definir o caminho do arquivo de dump
dump_file = r"C:\Users\Acer\Desktop\Senac\Backend\Projeto_Integrador\projeto_receitas_backend\dump.json"

# Definir o caminho do diretório do projeto
project_dir = r"C:\Users\Acer\Desktop\Senac\Backend\Projeto_Integrador\projeto_receitas_backend"

# Mudar para o diretório do projeto
os.chdir(project_dir)

# Executar o comando dumpdata
subprocess.run(['python', 'manage.py', 'dumpdata', '--indent', '4'], check=True, shell=False, 
stdout=open(dump_file, 'w'))