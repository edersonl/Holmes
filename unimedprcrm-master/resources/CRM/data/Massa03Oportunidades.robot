*** Settings ***
Resource      ../../../main.resource

*** Variables ***
@{OPOPOTENCIALPF22}         @{CLIENTEPOTENCIALPF10}     #cenario1
@{OPOCLIENTEPF23}           @{CLIENTEPF12}              #cenario2
@{OPOPOTENCIALPF24}         @{CLIENTEPF2}               #cenario3
@{OPOPOTENCIALPJ25}         @{CLIENTEPOTENCIALPJ14}     #cenario4
@{OPOCLIENTEPJ26}           @{CLIENTEPJ16}              #cenario5
@{OPOPOTENCIALPJ27}         @{CLIENTECNPJ4}             #cenario6
@{OPOPOTENCIALPJ28}         @{CLIENTEPOTENCIALPJ14}     #cenario7
@{OPOCLIENTEPJ29}           @{CLIENTEPJ16}              #cenario8
@{OPOPOTENCIALPJ30}         @{CLIENTECNPJ4}             #cenario9
@{OPOPOTENCIALPJ31}         @{CLIENTEPOTENCIALPJ14}     #cenario10
@{OPOCLIENTEPJ32}           @{CLIENTEPJ16}              #cenario11
@{OPOPOTENCIALPJ33}         @{CLIENTECNPJ4}             #cenario12
@{OPOPOTENCIALCAEPF34}      @{CLIENTEPOTENCIALCAEPF18}  #cenario13
@{OPOCLIENTECAEPF35}        @{CLIENTECAEPF20}           #cenario14
@{OPOPOTENCIALCAEPF36}      @{CLIENTECAEPF6}            #cenario15
@{OPOCLIENTEPF37}           @{CLIENTEPF12}              #cenario16
@{OPOCLIENTEPF38}           @{CLIENTEPF2}               #cenario17
@{OPOPOTENCIALPJ39}         @{CLIENTEPOTENCIALPJ14}     #cenario18
@{OPOPOTENCIALPJ40}         @{CLIENTECNPJ4}             #cenario19
@{OPOPOTENCIALCAEPF41}      @{CLIENTECAEPF20}           #cenario20
@{OPOPOTENCIALCAEPF42}      @{CLIENTECAEPF6}            #cenario21

#FAKES
#@{OPOPOTENCIALPF22}       Potencial Cliente (PF)  CONTA CAMILA SALES 3835  7  Novos Negócios  07/01/2023  WhatsApp
#@{OPOCLIENTEPF23}         Cliente (PF)  CONTA LUIGI DA ROCHA 3790  381.270.964-31  OPORTUNIDADE CONTA LUIGI DA ROCHA 3790  2  Novos Negócios  07/01/2023  WhatsApp
#@{OPOPOTENCIALPF24}       Pessoa Física  Maria Luiza da Conceição  CONTA MARIA LUIZA DA CONCEICAO 2573  714.863.509-84  9  eduardoda-mota@bol.com.br  81 3934-9826  +55 14 9 2811 4039  Novos Negócios  07/01/2023  WhatsApp
#@{OPOPOTENCIALPJ25}       Potencial Cliente (PJ)  CONTA NUNES E FILHOS 439  15  Novos Negócios  07/01/2023  WhatsApp
#@{OPOCLIENTEPJ26}         Cliente (PJ)  CONTA DA CRUZ 3329  DA CRUZ  06.721.453/0001-93  13  Novos Negócios  07/01/2023  WhatsApp
#@{OPOPOTENCIALPJ27}       Pessoa Jurídica (CNPJ)  Farias  CONTA FARIAS 2885  53.682.047/0001-49  4  kda-conceicao@barbosa.com  (051) 4894-1015  (084) 9114 8137  Monteiro e Filhos  ME  Matriz  1015  OPO POT CONTA FARIAS 2885  Novos Negócios  07/12/2022  WhatsApp
#@{OPOPOTENCIALPJ28}       Potencial Cliente (PJ)  CONTA NUNES E FILHOS 439  15  Novos Negócios  07/01/2023  WhatsApp
#@{OPOCLIENTEPJ29}         Cliente (PJ)  CONTA DA CRUZ 3329  DA CRUZ  06.721.453/0001-93  13  Novos Negócios  07/01/2023  WhatsApp
#@{OPOPOTENCIALPJ30}       Pessoa Jurídica (CNPJ)  Farias  CONTA FARIAS 2885  53.682.047/0001-49  4  kda-conceicao@barbosa.com  (051) 4894-1015  (084) 9114 8137  Monteiro e Filhos  ME  Matriz  1015  OPO POT CONTA FARIAS 2885  Novos Negócios  07/12/2022  WhatsApp
#@{OPOPOTENCIALPJ31}       Potencial Cliente (PJ)  CONTA NUNES E FILHOS 439  15  Novos Negócios  07/01/2023  WhatsApp
#@{OPOCLIENTEPJ32}         Cliente (PJ)  CONTA DA CRUZ 3329  DA CRUZ  06.721.453/0001-93  71  Novos Negócios  07/01/2023  WhatsApp
#@{OPOPOTENCIALPJ33}       Pessoa Jurídica (CNPJ)  Farias  CONTA FARIAS 2885  53.682.047/0001-49  4  kda-conceicao@barbosa.com  (051) 4894-1015  (084) 9114 8137  Monteiro e Filhos  ME  Matriz  1015  OPO POT CONTA FARIAS 2885  Novos Negócios  07/12/2022  WhatsApp
#@{OPOPOTENCIALCAEPF34}    Potencial Cliente (CAEPF)  CONTA FERREIRA 855  5  Novos Negócios  07/01/2023  WhatsApp
#@{OPOCLIENTECAEPF35}      Cliente (CAEPF)  CONTA LIMA SANTOS EI 3301  LIMA SANTOS EI  355.197.731/742-46  945.123.068-89  7  Novos Negócios  07/01/2023  WhatsApp
#@{OPOPOTENCIALCAEPF36}    Pessoa Jurídica (CAEPF)  Cavalcanti S.A.  CONTA CAVALCANTI SA 3955  785.720.725/687-37  32  daviporto@santos.com  11 6525 3367  11 0964 6310  Costa e Filhos  Novos Negócios  07/01/2023  WhatsApp
#@{OPOCLIENTEPF37}         Cliente (PF)  CONTA LUIGI DA ROCHA 3790  381.270.964-31  OPORTUNIDADE CONTA LUIGI DA ROCHA 3790  2  Novos Negócios  07/01/2023  WhatsApp
#@{OPOCLIENTEPF38}         Pessoa Física  Maria Luiza da Conceição  CONTA MARIA LUIZA DA CONCEICAO 2573  714.863.509-84  9  eduardoda-mota@bol.com.br  81 3934-9826  +55 14 9 2811 4039  Novos Negócios  07/01/2023  WhatsApp
#@{OPOPOTENCIALPJ39}       Potencial Cliente (PJ)  CONTA NUNES E FILHOS 439  15  Novos Negócios  07/01/2023  WhatsApp
#@{OPOPOTENCIALPJ40}       Pessoa Jurídica (CNPJ)  Farias  CONTA FARIAS 2885  53.682.047/0001-49  4  kda-conceicao@barbosa.com  (051) 4894-1015  (084) 9114 8137  Monteiro e Filhos  ME  Matriz  1015  OPO POT CONTA FARIAS 2885  Novos Negócios  07/12/2022  WhatsApp
#@{OPOPOTENCIALCAEPF41}    Cliente (CAEPF)  CONTA LIMA SANTOS EI 3301  LIMA SANTOS EI  355.197.731/742-46  945.123.068-89  7  Novos Negócios  07/01/2023  WhatsApp
#@{OPOPOTENCIALCAEPF42}    Pessoa Jurídica (CAEPF)  Cavalcanti S.A.  CONTA CAVALCANTI SA 3955  785.720.725/687-37  32  daviporto@santos.com  11 6525 3367  11 0964 6310  Costa e Filhos  Novos Negócios  07/01/2023  WhatsApp

*** Keywords ***
Instanciar Variaveis Oportunidades
  #Instanciar Variavel Potencial Cliente PF TR022
  #Argumentos: Arg0 Tipo, Arg1 Nome Conta
  #Adicionando: Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista, Arg5 Origem do Potencial
  ${temp}  FakerLibrary.Numerify	text=#
  Append To List  ${OPOPOTENCIALPF22}  ${temp}
  Append To List  ${OPOPOTENCIALPF22}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOPOTENCIALPF22}  ${date}
  Append To List  ${OPOPOTENCIALPF22}  WhatsApp
  Set Global Variable  @{OPOPOTENCIALPF22}
  Log Many  @{OPOPOTENCIALPF22}
  #Instanciar Variavel Cliente PF TR023
  #Argumentos: Arg0 Tipo, Arg1 Nome Conta, Arg2 CNPJ/CPF/CAEPF
  #Adicionando: Arg3 Nome Oportunidade, Arg4 Numero de Vida, Arg5 Tipo, Arg6 Data prevista, Arg7 Origem do Potencial
  ${temp}  Catenate  OPORTUNIDADE  ${OPOCLIENTEPF23[3]}
  Append To List  ${OPOCLIENTEPF23}  ${temp}
  ${temp}  FakerLibrary.Numerify	text=#
  Append To List  ${OPOCLIENTEPF23}  ${temp}
  Append To List  ${OPOCLIENTEPF23}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOCLIENTEPF23}  ${date}
  Append To List  ${OPOCLIENTEPF23}  WhatsApp
  Set Global Variable  @{OPOCLIENTEPF23}
  Log Many  @{OPOCLIENTEPF23}
  #Instanciar Variavel Potencial Cliente PF TR024
  #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome"  Arg2:"Nome Conta" Arg3:"CPF" 
  #Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Celular"
  #Adicionando: Arg8 Tipo, Arg9 Data Prevista, Arg 10 Origem do Potencial
  Append To List  ${OPOPOTENCIALPF24}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOPOTENCIALPF24}  ${date}
  Append To List  ${OPOPOTENCIALPF24}  WhatsApp
  Set Global Variable  @{OPOPOTENCIALPF24}
  Log Many  @{OPOPOTENCIALPF24}
  #Instanciar Variavel Potencial Cliente PJ TR025
  #Argumentos: Ar0 Tipo, Arg1 Nome Conta
  #Adicionando: Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
  ${temp}  Evaluate  random.randint(1, 30)
  Append To List  ${OPOPOTENCIALPJ25}  ${temp}
  Append To List  ${OPOPOTENCIALPJ25}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOPOTENCIALPJ25}  ${date}
  Append To List  ${OPOPOTENCIALPJ25}  WhatsApp
  Set Global Variable  @{OPOPOTENCIALPJ25}
  Log Many  @{OPOPOTENCIALPJ25}
  #Instanciar Variavel Cliente PJ TR026
  #Argumentos: Arg0 Tipo, Arg1 Nome Conta, Arg2 Razão Social, Arg3 CNPJ/CPF/CAEPF
  #Adicionando: Arg4 Numero de Vida, Arg5 Tipo, Arg6 Data Prevista, Arg7 Origem do Potencial
  ${temp}  Evaluate  random.randint(1, 30)
  Append To List  ${OPOCLIENTEPJ26}  ${temp}
  Append To List  ${OPOCLIENTEPJ26}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOCLIENTEPJ26}  ${date}
  Append To List  ${OPOCLIENTEPJ26}  WhatsApp
  Set Global Variable  @{OPOCLIENTEPJ26}
  Log Many  @{OPOCLIENTEPJ26}
  #Instanciar POTENCIAL Cliente PF TR027 Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
  # Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
  # Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
  #Adicionando: Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
  ${nome}  Convert To Uppercase  ${OPOPOTENCIALPJ27[2]}
  Set List Value  ${OPOPOTENCIALPJ27}  2  ${nome}
  ${temp}  Catenate  OPO POT  ${nome}
  Append To List  ${OPOPOTENCIALPJ27}  ${temp}
  Append To List  ${OPOPOTENCIALPJ27}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     149 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOPOTENCIALPJ27}  ${date}
  Append To List  ${OPOPOTENCIALPJ27}  WhatsApp
  Set Global Variable  @{OPOPOTENCIALPJ27}
  Log Many  @{OPOPOTENCIALPJ27}
  #Instanciar Variavel Potencial Cliente PJ TR028
  #Argumentos: Arg0 Tipo, Arg1 Nome Conta
  #Adicionando: Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
  Append To List  ${OPOPOTENCIALPJ28}  30
  Append To List  ${OPOPOTENCIALPJ28}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOPOTENCIALPJ28}  ${date}
  Append To List  ${OPOPOTENCIALPJ28}  WhatsApp
  Set Global Variable  @{OPOPOTENCIALPJ28}
  Log Many  @{OPOPOTENCIALPJ28}
  #Instanciar Variavel Cliente PJ TR029
  #Argumentos: Arg0 Tipo, Arg1 Nome Conta, Arg2 Razão Social, Arg3 CNPJ/CPF/CAEPF
  #Adicionando: Arg4 Numero de Vidas, Arg5 Tipo, Arg6 Data Prevista, Arg7 Origem do Potencial
  Append To List  ${OPOCLIENTEPJ29}  30
  Append To List  ${OPOCLIENTEPJ29}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOCLIENTEPJ29}  ${date}
  Append To List  ${OPOCLIENTEPJ29}  WhatsApp
  Set Global Variable  @{OPOCLIENTEPJ29}
  Log Many  @{OPOCLIENTEPJ29}
  #Instanciar POTENCIAL Cliente PF TR030 Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
  # Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
  # Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
  #Adicionando: Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
  Set List Value  ${OPOPOTENCIALPJ30}  2  ${nome}
  Set List Value  ${OPOPOTENCIALPJ30}  4  30
  ${nome}  Convert To Uppercase  ${OPOPOTENCIALPJ30[2]}
  ${temp}  Catenate  OPO POT  ${nome}
  Append To List  ${OPOPOTENCIALPJ30}  ${temp}
  Append To List  ${OPOPOTENCIALPJ30}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     149 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOPOTENCIALPJ30}  ${date}
  Append To List  ${OPOPOTENCIALPJ30}  WhatsApp
  Set Global Variable  @{OPOPOTENCIALPJ30}
  Log Many  @{OPOPOTENCIALPJ30}
  #Instanciar Variavel Potencial Cliente PJ TR031
  #Argumentos: Arg0 Tipo, Arg1 Nome Conta
  #Adicionando: Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
  ${temp}  Evaluate  random.randint(31, 100)
  Append To List  ${OPOPOTENCIALPJ31}  ${temp}
  Append To List  ${OPOPOTENCIALPJ31}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOPOTENCIALPJ31}  ${date}
  Append To List  ${OPOPOTENCIALPJ31}  WhatsApp
  Set Global Variable  @{OPOPOTENCIALPJ31}
  Log Many  @{OPOPOTENCIALPJ31}
  #Instanciar Variavel Cliente PJ TR032
  #Argumentos: Arg0 Tipo, Arg1 Nome Conta, Arg2 Razão Social, Arg3 CNPJ/CPF/CAEPF
  #Adicionando: Arg4 Numero de Vidas, Arg5 Tipo, Arg6 Data Prevista, Arg7 Origem do Potencial
  ${temp}  Evaluate  random.randint(31, 100)
  Append To List  ${OPOCLIENTEPJ32}  ${temp}
  Append To List  ${OPOCLIENTEPJ32}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOCLIENTEPJ32}  ${date}
  Append To List  ${OPOCLIENTEPJ32}  WhatsApp
  Set Global Variable  @{OPOCLIENTEPJ32}
  Log Many  @{OPOCLIENTEPJ32}
  #Instanciar POTENCIAL Cliente PF TR033 Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
  # Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
  # Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
  #Adicionando: Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
  ${temp}  Evaluate  random.randint(31, 100)
  Set List Value  ${OPOPOTENCIALPJ33}  4  ${temp}
  ${nome}  Convert To Uppercase  ${OPOPOTENCIALPJ33[2]}
  ${temp}  Catenate  OPO POT  ${nome}
  Append To List  ${OPOPOTENCIALPJ33}  ${temp}
  Append To List  ${OPOPOTENCIALPJ33}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     149 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOPOTENCIALPJ33}  ${date}
  Append To List  ${OPOPOTENCIALPJ33}  WhatsApp
  Set Global Variable  @{OPOPOTENCIALPJ33}
  Log Many  @{OPOPOTENCIALPJ33}
  #Instanciar Variavel Potencial Cliente CAEPF TR034
  #Argumentos: Arg0 Tipo, Arg1 Nome Conta
  #Adicionando: Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem de Potencial
  ${temp}  FakerLibrary.Numerify	text=#
  Append To List  ${OPOPOTENCIALCAEPF34}  ${temp}
  Append To List  ${OPOPOTENCIALCAEPF34}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOPOTENCIALCAEPF34}  ${date}
  Append To List  ${OPOPOTENCIALCAEPF34}  WhatsApp
  Set Global Variable  @{OPOPOTENCIALCAEPF34}
  Log Many  @{OPOPOTENCIALCAEPF34}
  #Instanciar Variavel Cliente CAEPF TR035
  #Argumentos: Arg0 Tipo, Arg1 Nome Conta, Arg2 Razao Social, Arg3 CNPJ/CPF/CAEPF, 
  #            Arg4 CPF Responsável (CAEPF)
  #Adicionando: Arg5 Numero de Vidas, Arg6 Tipo, Arg7 Data Prevista, Arg8 Origem do Potencial
  ${temp}  FakerLibrary.Numerify	text=#
  Append To List  ${OPOCLIENTECAEPF35}  ${temp}
  Append To List  ${OPOCLIENTECAEPF35}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOCLIENTECAEPF35}  ${date}
  Append To List  ${OPOCLIENTECAEPF35}  WhatsApp
  Set Global Variable  @{OPOCLIENTECAEPF35}
  Log Many  @{OPOCLIENTECAEPF35}
  #Instanciar Variavel Potencial Cliente CAEPF TR036
  #Argumento Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CAEPF"  
  # Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
  # Arg8:"Razao Social"
  #Adicionando: Arg9 Tipo, Arg10 Data Prevista, Arg11 Origem do Potencial
  ${temp}  Evaluate  random.randint(31, 100)
  Set List Value  ${OPOPOTENCIALCAEPF36}  4  ${temp}
  Append To List  ${OPOPOTENCIALCAEPF36}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOPOTENCIALCAEPF36}  ${date}
  Append To List  ${OPOPOTENCIALCAEPF36}  WhatsApp
  Set Global Variable  @{OPOPOTENCIALCAEPF36}
  Log Many  @{OPOPOTENCIALCAEPF36}
  #Instanciar Variavel Cliente PF TR037
  #Argumentos: Arg0 Tipo, Arg1 Nome Conta, Arg2 CNPJ/CPF/CAEPF
  #Adicionando: Arg3 Nome Oportunidade, Arg4 Numero de Vida, Arg5 Tipo, Arg6 Data prevista, Arg7 Origem de Potencial
  ${temp}  Catenate  OPORTUNIDADE  ${OPOCLIENTEPF37[1]}
  Append To List  ${OPOCLIENTEPF37}  ${temp}
  ${temp}  FakerLibrary.Numerify	text=#
  Append To List  ${OPOCLIENTEPF37}  ${temp}
  Append To List  ${OPOCLIENTEPF37}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOCLIENTEPF37}  ${date}
  Append To List  ${OPOCLIENTEPF37}  WhatsApp
  Set Global Variable  @{OPOCLIENTEPF37}
  Log Many  @{OPOCLIENTEPF37}
  #Instanciar Variavel Cliente PJ TR038
  #Argumentos: Arg0:"Tipo de Pessoa" Arg1:"Nome"  Arg2:"Nome Conta" Arg3:"CPF" 
  #Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Celular"
  #Adicionando: Arg8 Tipo, Arg9 Data Prevista, Arg10 Origem do Potencial
  Append To List  ${OPOCLIENTEPF38}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOCLIENTEPF38}  ${date}
  Append To List  ${OPOCLIENTEPF38}  WhatsApp
  Set Global Variable  @{OPOCLIENTEPF38}
  Log Many  @{OPOCLIENTEPF38}
  #Instanciar Variavel Potencial Cliente PJ TR039
  #Argumentos: Arg0 Tipo, Arg1 Nome Conta
  #Adicionando: Arg2 Numero de Vidas, Arg3 Tipo, Arg4 Data Prevista, Arg5 Origem do Potencial
  ${temp}  Evaluate  random.randint(31, 100)
  Append To List  ${OPOPOTENCIALPJ39}  ${temp}
  Append To List  ${OPOPOTENCIALPJ39}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOPOTENCIALPJ39}  ${date}
  Append To List  ${OPOPOTENCIALPJ39}  WhatsApp
  Set Global Variable  @{OPOPOTENCIALPJ39}
  Log Many  @{OPOPOTENCIALPJ39}
  #Instanciar POTENCIAL Cliente PF TR040 Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
  # Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
  # Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
  #Adicionando: Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista, Arg15 Origem do Potencial
  ${temp}  Evaluate  random.randint(31, 100)
  Set List Value  ${OPOPOTENCIALPJ40}  4  ${temp}
  ${nome}  Convert To Uppercase  ${OPOPOTENCIALPJ40[2]}
  ${temp}  Catenate  OPO POT  ${nome}
  Append To List  ${OPOPOTENCIALPJ40}  ${temp}
  Append To List  ${OPOPOTENCIALPJ40}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     149 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOPOTENCIALPJ40}  ${date}
  Append To List  ${OPOPOTENCIALPJ40}  WhatsApp
  Set Global Variable  @{OPOPOTENCIALPJ40}
  Log Many  @{OPOPOTENCIALPJ40}
  #Instanciar Variavel Potencial Cliente CAEPF TR041
  #Argumentos: Arg0 Tipo, Arg1 Nome Conta, Arg2 Razao Social, Arg3 CNPJ/CPF/CAEPF, 
  #            Arg4 CPF Responsável (CAEPF)
  #Adicionando: Arg5 Numero de Vidas, Arg6 Tipo, Arg7 Data Prevista, Arg8 Origem do Potencial
  ${temp}  FakerLibrary.Numerify	text=#
  Append To List  ${OPOPOTENCIALCAEPF41}  ${temp}
  Append To List  ${OPOPOTENCIALCAEPF41}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOPOTENCIALCAEPF41}  ${date}
  Append To List  ${OPOPOTENCIALCAEPF41}  WhatsApp
  Set Global Variable  @{OPOPOTENCIALCAEPF41}
  Log Many  @{OPOPOTENCIALCAEPF41}
  #Instanciar Variavel Potencial Cliente CAEPF TR042
  #Argumento Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CAEPF"  
  # Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
  # Arg8:"Razao Social"
  #Adicionando: Arg9 Tipo, Arg10 Data Prevista, Arg11 Origem do Potencial
  ${temp}  Evaluate  random.randint(31, 100)
  Set List Value  ${OPOPOTENCIALCAEPF42}  4  ${temp}
  Append To List  ${OPOPOTENCIALCAEPF42}  Novos Negócios
  ${date}  Get Current Date
  ${date}  Add Time To Date   ${date}     180 days
  ${date}  Convert Date       ${date}     exclude_millis=yes
  ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
  Append To List  ${OPOPOTENCIALCAEPF42}  ${date}
  Append To List  ${OPOPOTENCIALCAEPF42}  WhatsApp
  Set Global Variable  @{OPOPOTENCIALCAEPF42}
  Log Many  @{OPOPOTENCIALCAEPF42}
