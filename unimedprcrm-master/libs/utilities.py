import random
from random import randrange
from datetime import datetime
from datetime import timedelta
import keyboard
import clipboard
import time
import os, shutil
import os
import subprocess
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn


@keyword(name='Set Variables')
def set_variables(*args):
    """Compatibilidade com a convenção antiga do projeto.

    Suporta:
    - Set Variables    ${valor}                    -> retorna o valor informado
    - Set Variables    Get Time    return month    -> executa a keyword e retorna seu resultado
    """
    if not args:
        return ''
    if len(args) == 1:
        return args[0]
    first = str(args[0])
    if first and ' ' not in first and first.lower() in {'get', 'get time', 'convert date', 'evaluate', 'catenate', 'log', 'set variable', 'set test variable', 'run keyword'}:
        return BuiltIn().run_keyword(*args)
    try:
        return BuiltIn().run_keyword(*args)
    except Exception:
        if len(args) == 2 and not isinstance(args[1], (list, tuple, dict)):
            return f"{args[0]} {args[1]}".strip()
        return ' '.join(str(item) for item in args if item is not None)


@keyword(name='Clear Files In Path')
def clear_files_in_path(path:str, fileType: str, name:str = None):
  os.chdir(path)
  files = sorted(os.listdir(os.getcwd()), key=os.path.getctime)
  files = [f for f in files if fileType in f]
  if (name != None):
    files = [f for f in files if name in f]
  if (len(files) > 0):
    for f in files:
      file_path = os.path.join(path, f)
      try:
        if (os.path.isfile(file_path)):
          os.unlink(file_path)
      except Exception as e:
        print('Erro ao apagar arquivo %s, Motivo: %s' % (file_path, e))

# @keyword(name='Read CSV Tabela Preco')
# def input_dados_tabela_preco(qtdVidas:str, dtInicio:str, typeProdut:str, codPRD, faixaInit:int, faixaFim:int, valor:int, percent):

#   wb = Workbook() 
#   aba_active = wb.active
#   destiny = f"{os.path.expanduser('~')}\\unimedprcrm\\documents\\import_tabela_preco.xlsx"
#   aba_active["A1"] = 'dataInicioComercializacao'
#   aba_active["B1"] = 'codigoProduto'
#   aba_active["C1"] = 'tipoProduto'
#   aba_active["D1"] = 'quantidadeVidas'
#   aba_active["E1"] = 'faixaInicial'
#   aba_active["F1"] = 'faixaFinal'
#   aba_active["G1"] = 'valor'
#   aba_active["H1"] = 'pencentualVariacao'

#   #wb = load_workbook(path)
#   letras = ['A2','B2','C2','D2','E2','F2','G2','H2']
#   for col in letras:
#       if col == 'A2':
#           aba_active[col] = dtInicio
#       elif col == 'B2':
#           aba_active[col] = codPRD
#       elif col == 'C2':
#           aba_active[col] = typeProdut
#       elif col == 'D2':
#           aba_active[col] = qtdVidas
#       elif col == 'E2':
#           aba_active[col] = faixaInit
#       elif col == 'F2':
#           aba_active[col] = faixaFim
#       elif col == 'G2':
#           aba_active[col] = valor
#       else:
#           aba_active[col] = percent
#  # wb.save(filename='C:\\Users\\ga_ga\\unimedprcrm\\documents\\template_tabela_preco.xlsx')
#   wb.save(filename=destiny)
#   read_file = pd.read_excel(f"{os.path.expanduser('~')}\\unimedprcrm\\documents\\import_tabela_preco.xlsx")
#   read_file.to_csv(f"{os.path.expanduser('~')}\\unimedprcrm\\documents\\import2_tabela_preco.csv", index=None, header=True)

#   return destiny

@keyword(name='Remove File Tabela')
def remove_path_file(path_file:str):
    os.remove(path_file)  