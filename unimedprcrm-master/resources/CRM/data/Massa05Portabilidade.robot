*** Settings ***
Resource    ../../../main.resource

*** Variables ***
@{PORPOTENCIALPF01}         
@{PORPOTENCIALPF02}
@{PORPOTENCIALPF03}
@{PORPOTENCIALPF04}
@{PORPOTENCIALPF05}
@{PORPOTENCIALPF06}
@{PORPOTENCIALPF07}
@{PORPOTENCIALPF08}
@{PORPOTENCIALPF09}
@{PORPOTENCIALPF10}
@{PORPOTENCIALPF11}
@{PORPOTENCIALPF12}         
@{CLIENTEPF12}              #cenario5
@{COTPOTENCIALPF05}         #@{PORPOTENCIALPF02}    #cenario05
@{COTPOTENCIALPF06}         #@{PORPOTENCIALPF02}    #cenario06
@{COTPOTENCIALPF07}         #@{PORPOTENCIALPF02}    #cenario07
@{COTPOTENCIALPF08}         #@{PORPOTENCIALPF02}    #cenario08
@{COTPOTENCIALPF09}         #@{PORPOTENCIALPF02}    #cenario09
@{COTPOTENCIALPF10}         #@{PORPOTENCIALPF02}    #cenario10
@{COTPOTENCIALPF11}         #@{PORPOTENCIALPF02}    #cenario11
@{COTPOTENCIALPF12}         #cenario12
@{COTPOTENCIALPJ13}         #cenario13
@{COTPOTENCIALPJ14}         #@{PORPOTENCIALPF02}    #cenario14
@{COTPOTENCIALPJ15}         #@{PORPOTENCIALPF02}    #cenario15
@{COTPOTENCIALPJ16}         #@{PORPOTENCIALPF02}    #cenario16
@{COTPOTENCIALPJ17}         #@{PORPOTENCIALPF02}    #CENARIO17
@{COTPOTENCIALPJ18}         #@{PORPOTENCIALPF02}    #CENARIO18
@{COTPOTENCIALPJ19}         #@{PORPOTENCIALPF02}    #CENARIO19
@{COTPOTENCIALPJ20}         #@{PORPOTENCIALPF02}    #CENARIO20
@{PORTABILIDADECOTPJ21}     #@{PORPOTENCIALPF02}    #CENARIO21
@{PORTABILIDADECOTPJ22}     #@{PORPOTENCIALPF02}    #CENARIO22
@{PORTABILIDADECOTPJ23}     #@{PORPOTENCIALPF02}    #CENARIO23
@{PORTABILIDADECOTPJ24}     #@{PORPOTENCIALPF02}    #CENARIO24
@{PORTPOTCLCAEPF25}         #CENARIO25
@{PORTPOTCLCAEPF26}         #CENARIO26
@{PORTPOTCLCAEPF27}         #CENARIO27
@{PORTPOTCLCAEPF28}         #CENARIO28
@{PORTCONTACAEPF29}         #CENARIO29
@{PORTCONTACAEPF30}         #@{PORPOTENCIALPF02}    #CENARIO30
@{PORTCONTACAEPF31}         #@{PORPOTENCIALPF02}    #CENARIO31
@{PORTCONTACAEPF32}         #@{PORPOTENCIALPF02}    #CENARIO32
@{PORTABCOTCAEPF33}         #@{PORPOTENCIALPF02}    #CENARIO33
@{PORTABCOTCAEPF34}         #@{PORPOTENCIALPF02}    #CENARIO34
@{PORTABCOTCAEPF35}         #@{PORPOTENCIALPF02}    #CENARIO35
@{PORTABCOTCAEPF36}         #@{PORPOTENCIALPF02}    #CENARIO36

*** Keywords ***
Instanciar Variaveis Portabilidade
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${PORPOTENCIALPF01}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORPOTENCIALPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORPOTENCIALPF01}  ${temp}
    Set Global Variable  @{PORPOTENCIALPF01}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${PORPOTENCIALPF01}  ${temp}
    Append To List  ${PORPOTENCIALPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORPOTENCIALPF01}  ${date}
    Log Many  @{PORPOTENCIALPF01}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${PORPOTENCIALPF01}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${PORPOTENCIALPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${PORPOTENCIALPF01}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORPOTENCIALPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORPOTENCIALPF01}  ${temp}
    Append To List  ${PORPOTENCIALPF01}  Boleto
    Set Global Variable  @{PORPOTENCIALPF01}

    
    #Instanciar POTENCIAL Cliente PF TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${PORPOTENCIALPF02}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORPOTENCIALPF02}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORPOTENCIALPF02}  ${temp}
    Set Global Variable  @{PORPOTENCIALPF02}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${PORPOTENCIALPF02}  ${temp}
    Append To List  ${PORPOTENCIALPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORPOTENCIALPF02}  ${date}
    Log Many  @{PORPOTENCIALPF02}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${PORPOTENCIALPF02}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${PORPOTENCIALPF02}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${PORPOTENCIALPF02}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORPOTENCIALPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORPOTENCIALPF02}  ${temp}
    Append To List  ${PORPOTENCIALPF02}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORPOTENCIALPF02}  ${nasc}
    Append To List  ${PORPOTENCIALPF02}  Titular
    Append To List  ${PORPOTENCIALPF02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORPOTENCIALPF02}  ${temp}
    Append To List  ${PORPOTENCIALPF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORPOTENCIALPF02}  ${conta}
    Append To List  ${PORPOTENCIALPF02}  Solteiro(a)
    Append To List  ${PORPOTENCIALPF02}  CURITIBA
    Append To List  ${PORPOTENCIALPF02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${PORPOTENCIALPF02}  Residencial
    Append To List  ${PORPOTENCIALPF02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORPOTENCIALPF02}  ${temp}
    Append To List  ${PORPOTENCIALPF02}  Celular
    Append To List  ${PORPOTENCIALPF02}  69988654869
    Set Global Variable  @{PORPOTENCIALPF02}


#Instanciar Variavel Cliente PF TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${PORPOTENCIALPF03}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORPOTENCIALPF03}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORPOTENCIALPF03}  ${temp}
    Set Global Variable  @{PORPOTENCIALPF03}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${PORPOTENCIALPF03}  ${temp}
    Append To List  ${PORPOTENCIALPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORPOTENCIALPF03}  ${date}
    Log Many  @{PORPOTENCIALPF03}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${PORPOTENCIALPF03}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${PORPOTENCIALPF03}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${PORPOTENCIALPF03}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORPOTENCIALPF03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORPOTENCIALPF03}  ${temp}
    Append To List  ${PORPOTENCIALPF03}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORPOTENCIALPF03}  ${nasc}
    Append To List  ${PORPOTENCIALPF03}  Titular
    Append To List  ${PORPOTENCIALPF03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORPOTENCIALPF03}  ${temp}
    Append To List  ${PORPOTENCIALPF03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORPOTENCIALPF03}  ${conta}
    Append To List  ${PORPOTENCIALPF03}  Solteiro(a)
    Append To List  ${PORPOTENCIALPF03}  CURITIBA
    Append To List  ${PORPOTENCIALPF03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${PORPOTENCIALPF03}  Residencial
    Append To List  ${PORPOTENCIALPF03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORPOTENCIALPF03}  ${temp}
    Append To List  ${PORPOTENCIALPF03}  Celular
    Append To List  ${PORPOTENCIALPF03}  69988654869
    Set Global Variable  @{PORPOTENCIALPF03}


    #Instanciar Variavel Cliente PF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${PORPOTENCIALPF04}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORPOTENCIALPF04}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORPOTENCIALPF04}  ${temp}
    Set Global Variable  @{PORPOTENCIALPF04}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${PORPOTENCIALPF04}  ${temp}
    Append To List  ${PORPOTENCIALPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORPOTENCIALPF04}  ${date}
    Log Many  @{PORPOTENCIALPF04}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${PORPOTENCIALPF04}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${PORPOTENCIALPF04}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${PORPOTENCIALPF04}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORPOTENCIALPF04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORPOTENCIALPF04}  ${temp}
    Append To List  ${PORPOTENCIALPF04}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORPOTENCIALPF04}  ${nasc}
    Append To List  ${PORPOTENCIALPF04}  Titular
    Append To List  ${PORPOTENCIALPF04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORPOTENCIALPF04}  ${temp}
    Append To List  ${PORPOTENCIALPF04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORPOTENCIALPF04}  ${conta}
    Append To List  ${PORPOTENCIALPF04}  Solteiro(a)
    Append To List  ${PORPOTENCIALPF04}  CURITIBA
    Append To List  ${PORPOTENCIALPF04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${PORPOTENCIALPF04}  Residencial
    Append To List  ${PORPOTENCIALPF04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORPOTENCIALPF04}  ${temp}
    Append To List  ${PORPOTENCIALPF04}  Celular
    Append To List  ${PORPOTENCIALPF04}  69988654869
    Set Global Variable  @{PORPOTENCIALPF04}


    #Instanciar Variavel Cliente PF TR012
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${CLIENTEPF12}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name Male
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Catenate  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CLIENTEPF12}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CLIENTEPF12}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CLIENTEPF12}  ${temp}
    Append To List  ${CLIENTEPF12}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CLIENTEPF12}  ${date}
    Log Many  @{CLIENTEPF12}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${PORPOTENCIALPF01}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${CLIENTEPF12}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${CLIENTEPF12}  Concluído e Aceito


    #Instanciar Variavel Cliente PF TR005
        #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${COTPOTENCIALPF05}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPF05}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPF05}  ${temp}
    Set Global Variable  @{COTPOTENCIALPF05}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${COTPOTENCIALPF05}  ${temp}
    Append To List  ${COTPOTENCIALPF05}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF05}  ${date}
    Log Many  @{COTPOTENCIALPF05}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${COTPOTENCIALPF05}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${COTPOTENCIALPF05}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF05}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF05}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${COTPOTENCIALPF05}  ${temp}
    Append To List  ${COTPOTENCIALPF05}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPF05}  ${nasc}
    Append To List  ${COTPOTENCIALPF05}  Titular
    Append To List  ${COTPOTENCIALPF05}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${COTPOTENCIALPF05}  ${temp}
    Append To List  ${COTPOTENCIALPF05}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPF05}  ${conta}
    Append To List  ${COTPOTENCIALPF05}  Solteiro(a)
    Append To List  ${COTPOTENCIALPF05}  CURITIBA
    Append To List  ${COTPOTENCIALPF05}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${COTPOTENCIALPF05}  Residencial
    Append To List  ${COTPOTENCIALPF05}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${COTPOTENCIALPF05}  ${temp}
    Append To List  ${COTPOTENCIALPF05}  Celular
    Append To List  ${COTPOTENCIALPF05}  69988654869
    Set Global Variable  @{COTPOTENCIALPF05}


    #Instanciar Variavel Cliente PF TR006
        #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${COTPOTENCIALPF06}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPF06}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPF06}  ${temp}
    Set Global Variable  @{COTPOTENCIALPF06}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${COTPOTENCIALPF06}  ${temp}
    Append To List  ${COTPOTENCIALPF06}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF06}  ${date}
    Log Many  @{COTPOTENCIALPF06}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${COTPOTENCIALPF06}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${COTPOTENCIALPF06}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF06}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF06}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${COTPOTENCIALPF06}  ${temp}
    Append To List  ${COTPOTENCIALPF06}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPF06}  ${nasc}
    Append To List  ${COTPOTENCIALPF06}  Titular
    Append To List  ${COTPOTENCIALPF06}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${COTPOTENCIALPF06}  ${temp}
    Append To List  ${COTPOTENCIALPF06}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPF06}  ${conta}
    Append To List  ${COTPOTENCIALPF06}  Solteiro(a)
    Append To List  ${COTPOTENCIALPF06}  CURITIBA
    Append To List  ${COTPOTENCIALPF06}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${COTPOTENCIALPF06}  Residencial
    Append To List  ${COTPOTENCIALPF06}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${COTPOTENCIALPF06}  ${temp}
    Append To List  ${COTPOTENCIALPF06}  Celular
    Append To List  ${COTPOTENCIALPF06}  69988654869
    Set Global Variable  @{COTPOTENCIALPF06}


    #Instanciar Variavel Cliente PF TR007
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${COTPOTENCIALPF07}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPF07}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPF07}  ${temp}
    Set Global Variable  @{COTPOTENCIALPF07}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${COTPOTENCIALPF07}  ${temp}
    Append To List  ${COTPOTENCIALPF07}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF07}  ${date}
    Log Many  @{COTPOTENCIALPF07}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${COTPOTENCIALPF07}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${COTPOTENCIALPF07}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF07}  Concluído e Aceito

    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF07}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${COTPOTENCIALPF07}  ${temp}
    Append To List  ${COTPOTENCIALPF07}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPF07}  ${nasc}
    Append To List  ${COTPOTENCIALPF07}  Titular
    Append To List  ${COTPOTENCIALPF07}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${COTPOTENCIALPF07}  ${temp}
    Append To List  ${COTPOTENCIALPF07}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPF07}  ${conta}
    Append To List  ${COTPOTENCIALPF07}  Solteiro(a)
    Append To List  ${COTPOTENCIALPF07}  CURITIBA - PR
    Append To List  ${COTPOTENCIALPF07}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${COTPOTENCIALPF07}  Residencial
    Append To List  ${COTPOTENCIALPF07}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${COTPOTENCIALPF07}  ${temp}
    Append To List  ${COTPOTENCIALPF07}  Celular
    Append To List  ${COTPOTENCIALPF07}  69988654869
    #Adicionando para importação: Arg26: Endereco, Arg27: Bairro, Arg28: Cidade, Arg29: UF, Arg30: Pais, 
    #            Arg31 Produto Assitencial,  Arg32: sexo, Arg33: raça, Arg34: Grau de Dependencia, Arg35: tipoEndereco, Arg36: Telefone
    Append To List  ${COTPOTENCIALPF07}  rua alberto folloni
    Append To List  ${COTPOTENCIALPF07}  ahu
    Append To List  ${COTPOTENCIALPF07}  curitiba
    Append To List  ${COTPOTENCIALPF07}  PR
    Append To List  ${COTPOTENCIALPF07}  brasil
    Append To List  ${COTPOTENCIALPF07}  5033
    Append To List  ${COTPOTENCIALPF07}  f
    Append To List  ${COTPOTENCIALPF07}  1
    Append To List  ${COTPOTENCIALPF07}  00
    Append To List  ${COTPOTENCIALPF07}  residencial
    Append To List  ${COTPOTENCIALPF07}  solteiro
    Append To List  ${COTPOTENCIALPF07}  43923328738
    Append To List  ${COTPOTENCIALPF07}  Curitiba
    Append To List  ${COTPOTENCIALPF07}  PR
    Set Global Variable  @{COTPOTENCIALPF07}


    #Instanciar Variavel Cliente PF TR008
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${COTPOTENCIALPF08}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPF08}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPF08}  ${temp}
    Set Global Variable  @{COTPOTENCIALPF08}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${COTPOTENCIALPF08}  ${temp}
    Append To List  ${COTPOTENCIALPF08}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF08}  ${date}
    Log Many  @{COTPOTENCIALPF08}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${COTPOTENCIALPF08}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${COTPOTENCIALPF08}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF08}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF08}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${COTPOTENCIALPF08}  ${temp}
    Append To List  ${COTPOTENCIALPF08}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPF08}  ${nasc}
    Append To List  ${COTPOTENCIALPF08}  Titular
    Append To List  ${COTPOTENCIALPF08}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${COTPOTENCIALPF08}  ${temp}
    Append To List  ${COTPOTENCIALPF08}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPF08}  ${conta}
    Append To List  ${COTPOTENCIALPF08}  Solteiro(a)
    Append To List  ${COTPOTENCIALPF08}  CURITIBA - PR
    Append To List  ${COTPOTENCIALPF08}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${COTPOTENCIALPF08}  Residencial
    Append To List  ${COTPOTENCIALPF08}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${COTPOTENCIALPF08}  ${temp}
    Append To List  ${COTPOTENCIALPF08}  Celular
    Append To List  ${COTPOTENCIALPF08}  69988654869
    #Adicionando para importação: Arg26: Endereco, Arg27: Bairro, Arg28: Cidade, Arg29: UF, Arg30: Pais, 
    #            Arg31: Produto Assitencial,  Arg32: sexo, Arg33: raça, Arg34: Grau de Dependencia, Arg35: tipoEndereco, Arg36: Telefone
    Append To List  ${COTPOTENCIALPF08}  rua alberto folloni
    Append To List  ${COTPOTENCIALPF08}  ahu
    Append To List  ${COTPOTENCIALPF08}  curitiba
    Append To List  ${COTPOTENCIALPF08}  PR
    Append To List  ${COTPOTENCIALPF08}  brasil
    Append To List  ${COTPOTENCIALPF08}  5033
    Append To List  ${COTPOTENCIALPF08}  f
    Append To List  ${COTPOTENCIALPF08}  1
    Append To List  ${COTPOTENCIALPF08}  00
    Append To List  ${COTPOTENCIALPF08}  residencial
    Append To List  ${COTPOTENCIALPF08}  solteiro
    Append To List  ${COTPOTENCIALPF08}  43923328738
    Append To List  ${COTPOTENCIALPF08}  Curitiba
    Append To List  ${COTPOTENCIALPF08}  PR
    Set Global Variable  @{COTPOTENCIALPF08}


    #Instanciar POTENCIAL Cliente PF TR009
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${COTPOTENCIALPF09}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPF09}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPF09}  ${temp}
    Set Global Variable  @{COTPOTENCIALPF09}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${COTPOTENCIALPF09}  ${temp}
    Append To List  ${COTPOTENCIALPF09}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF09}  ${date}
    Log Many  @{COTPOTENCIALPF09}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${COTPOTENCIALPF09}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${COTPOTENCIALPF09}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF09}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF09}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${COTPOTENCIALPF09}  ${temp}
    Append To List  ${COTPOTENCIALPF09}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPF09}  ${nasc}
    Append To List  ${COTPOTENCIALPF09}  Titular
    Append To List  ${COTPOTENCIALPF09}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${COTPOTENCIALPF09}  ${temp}
    Append To List  ${COTPOTENCIALPF09}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPF09}  ${conta}
    Append To List  ${COTPOTENCIALPF09}  Solteiro(a)
    Append To List  ${COTPOTENCIALPF09}  CURITIBA - PR
    Append To List  ${COTPOTENCIALPF09}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${COTPOTENCIALPF09}  Residencial
    Append To List  ${COTPOTENCIALPF09}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${COTPOTENCIALPF09}  ${temp}
    Append To List  ${COTPOTENCIALPF09}  Celular
    Append To List  ${COTPOTENCIALPF09}  69988654869
    #Adicionando para importação: Arg26: Endereco, Arg27: Bairro, Arg28: Cidade, Arg29: UF, Arg30: Pais, 
    #            Arg31: Produto Assitencial,  Arg32: sexo, Arg33: raça, Arg34: Grau de Dependencia, Arg35: tipoEndereco, Arg36: Telefone
    Append To List  ${COTPOTENCIALPF09}  rua alberto folloni
    Append To List  ${COTPOTENCIALPF09}  ahu
    Append To List  ${COTPOTENCIALPF09}  curitiba
    Append To List  ${COTPOTENCIALPF09}  PR
    Append To List  ${COTPOTENCIALPF09}  brasil
    Append To List  ${COTPOTENCIALPF09}  5033
    Append To List  ${COTPOTENCIALPF09}  f
    Append To List  ${COTPOTENCIALPF09}  1
    Append To List  ${COTPOTENCIALPF09}  00
    Append To List  ${COTPOTENCIALPF09}  residencial
    Append To List  ${COTPOTENCIALPF09}  solteiro
    Append To List  ${COTPOTENCIALPF09}  43923328738
    Append To List  ${COTPOTENCIALPF09}  Curitiba
    Append To List  ${COTPOTENCIALPF09}  PR
    Set Global Variable  @{COTPOTENCIALPF09}
    
    #Instanciar POTENCIAL Cliente PF TR010
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${COTPOTENCIALPF10}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPF10}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPF10}  ${temp}
    Set Global Variable  @{COTPOTENCIALPF10}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${COTPOTENCIALPF10}  ${temp}
    Append To List  ${COTPOTENCIALPF10}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF10}  ${date}
    Log Many  @{COTPOTENCIALPF10}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${COTPOTENCIALPF10}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${COTPOTENCIALPF10}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF10}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF10}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${COTPOTENCIALPF10}  ${temp}
    Append To List  ${COTPOTENCIALPF10}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPF10}  ${nasc}
    Append To List  ${COTPOTENCIALPF10}  Titular
    Append To List  ${COTPOTENCIALPF10}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${COTPOTENCIALPF10}  ${temp}
    Append To List  ${COTPOTENCIALPF10}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPF10}  ${conta}
    Append To List  ${COTPOTENCIALPF10}  Solteiro(a)
    Append To List  ${COTPOTENCIALPF10}  CURITIBA - PR
    Append To List  ${COTPOTENCIALPF10}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${COTPOTENCIALPF10}  Residencial
    Append To List  ${COTPOTENCIALPF10}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${COTPOTENCIALPF10}  ${temp}
    Append To List  ${COTPOTENCIALPF10}  Celular
    Append To List  ${COTPOTENCIALPF10}  69988654869
    #Adicionando para importação: Arg26: Endereco, Arg27: Bairro, Arg28: Cidade, Arg29: UF, Arg30: Pais, 
    #            Arg31: Produto Assitencial,  Arg32: sexo, Arg33: raça, Arg34: Grau de Dependencia, Arg35: tipoEndereco, Arg36: Telefone
    Append To List  ${COTPOTENCIALPF10}  rua alberto folloni
    Append To List  ${COTPOTENCIALPF10}  ahu
    Append To List  ${COTPOTENCIALPF10}  curitiba
    Append To List  ${COTPOTENCIALPF10}  PR
    Append To List  ${COTPOTENCIALPF10}  brasil
    Append To List  ${COTPOTENCIALPF10}  5033
    Append To List  ${COTPOTENCIALPF10}  f
    Append To List  ${COTPOTENCIALPF10}  1
    Append To List  ${COTPOTENCIALPF10}  00
    Append To List  ${COTPOTENCIALPF10}  residencial
    Append To List  ${COTPOTENCIALPF10}  solteiro
    Append To List  ${COTPOTENCIALPF10}  43923328738
    Append To List  ${COTPOTENCIALPF10}  Curitiba
    Append To List  ${COTPOTENCIALPF10}  PR
    Set Global Variable  @{COTPOTENCIALPF10}

    #Instanciar POTENCIAL Cliente PF TR011
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${COTPOTENCIALPF11}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPF11}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPF11}  ${temp}
    Set Global Variable  @{COTPOTENCIALPF11}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${COTPOTENCIALPF11}  ${temp}
    Append To List  ${COTPOTENCIALPF11}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF11}  ${date}
    Log Many  @{COTPOTENCIALPF11}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${COTPOTENCIALPF11}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${COTPOTENCIALPF11}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF11}  Concluído e Aceito

    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF11}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${COTPOTENCIALPF11}  ${temp}
    Append To List  ${COTPOTENCIALPF11}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPF11}  ${nasc}
    Append To List  ${COTPOTENCIALPF11}  Titular
    Append To List  ${COTPOTENCIALPF11}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${COTPOTENCIALPF11}  ${temp}
    Append To List  ${COTPOTENCIALPF11}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPF11}  ${conta}
    Append To List  ${COTPOTENCIALPF11}  Solteiro(a)
    Append To List  ${COTPOTENCIALPF11}  CURITIBA - PR
    Append To List  ${COTPOTENCIALPF11}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${COTPOTENCIALPF11}  Residencial
    Append To List  ${COTPOTENCIALPF11}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${COTPOTENCIALPF11}  ${temp}
    Append To List  ${COTPOTENCIALPF11}  Celular
    Append To List  ${COTPOTENCIALPF11}  69988654869
    #Adicionando para importação: Arg26: Endereco, Arg27: Bairro, Arg28: Cidade, Arg29: UF, Arg30: Pais, 
    #            Arg31: Produto Assitencial,  Arg32: sexo, Arg33: raça, Arg34: Grau de Dependencia, Arg35: tipoEndereco, Arg36: Telefone
    Append To List  ${COTPOTENCIALPF11}  rua alberto folloni
    Append To List  ${COTPOTENCIALPF11}  ahu
    Append To List  ${COTPOTENCIALPF11}  curitiba
    Append To List  ${COTPOTENCIALPF11}  PR
    Append To List  ${COTPOTENCIALPF11}  brasil
    Append To List  ${COTPOTENCIALPF11}  5033
    Append To List  ${COTPOTENCIALPF11}  f
    Append To List  ${COTPOTENCIALPF11}  1
    Append To List  ${COTPOTENCIALPF11}  00
    Append To List  ${COTPOTENCIALPF11}  residencial
    Append To List  ${COTPOTENCIALPF11}  solteiro
    Append To List  ${COTPOTENCIALPF11}  43923328738
    Append To List  ${COTPOTENCIALPF11}  Curitiba
    Append To List  ${COTPOTENCIALPF11}  PR
    Set Global Variable  @{COTPOTENCIALPF11}


    #Instanciar POTENCIAL Cliente PF TR012
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${COTPOTENCIALPF12}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPF12}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPF12}  ${temp}
    Set Global Variable  @{COTPOTENCIALPF12}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${COTPOTENCIALPF12}  ${temp}
    Append To List  ${COTPOTENCIALPF12}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF12}  ${date}
    Log Many  @{COTPOTENCIALPF12}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${COTPOTENCIALPF12}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${COTPOTENCIALPF12}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${COTPOTENCIALPF12}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPF12}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${COTPOTENCIALPF12}  ${temp}
    Append To List  ${COTPOTENCIALPF12}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPF12}  ${nasc}
    Append To List  ${COTPOTENCIALPF12}  Titular
    Append To List  ${COTPOTENCIALPF12}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${COTPOTENCIALPF12}  ${temp}
    Append To List  ${COTPOTENCIALPF12}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPF12}  ${conta}
    Append To List  ${COTPOTENCIALPF12}  Solteiro(a)
    Append To List  ${COTPOTENCIALPF12}  CURITIBA - PR
    Append To List  ${COTPOTENCIALPF12}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${COTPOTENCIALPF12}  Residencial
    Append To List  ${COTPOTENCIALPF12}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${COTPOTENCIALPF12}  ${temp}
    Append To List  ${COTPOTENCIALPF12}  Celular
    Append To List  ${COTPOTENCIALPF12}  69988654869
    #Adicionando para importação: Arg26: Endereco, Arg27: Bairro, Arg28: Cidade, Arg29: UF, Arg30: Pais, 
    #            Arg31: Produto Assitencial,  Arg32: sexo, Arg33: raça, Arg34: Grau de Dependencia, Arg35: tipoEndereco, Arg36: Telefone
    Append To List  ${COTPOTENCIALPF12}  rua alberto folloni
    Append To List  ${COTPOTENCIALPF12}  ahu
    Append To List  ${COTPOTENCIALPF12}  curitiba
    Append To List  ${COTPOTENCIALPF12}  PR
    Append To List  ${COTPOTENCIALPF12}  brasil
    Append To List  ${COTPOTENCIALPF12}  5033
    Append To List  ${COTPOTENCIALPF12}  f
    Append To List  ${COTPOTENCIALPF12}  1
    Append To List  ${COTPOTENCIALPF12}  00
    Append To List  ${COTPOTENCIALPF12}  residencial
    Append To List  ${COTPOTENCIALPF12}  solteiro
    Append To List  ${COTPOTENCIALPF12}  43923328738
    Append To List  ${COTPOTENCIALPF12}  Curitiba
    Append To List  ${COTPOTENCIALPF12}  PR
    Set Global Variable  @{COTPOTENCIALPF12}


    #Instanciar Cliente PF TR013 
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${COTPOTENCIALPJ13}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    Append To List  ${COTPOTENCIALPJ13}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${COTPOTENCIALPJ13}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${COTPOTENCIALPJ13}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${COTPOTENCIALPJ13}  ${temp}
    Append To List  ${COTPOTENCIALPJ13}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ13}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${COTPOTENCIALPJ13}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${COTPOTENCIALPJ13}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ13}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ13}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${COTPOTENCIALPJ13}  ${temp}
    Append To List  ${COTPOTENCIALPJ13}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPJ13}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPJ13}  ${nasc}
    Append To List  ${COTPOTENCIALPJ13}  Titular
    Append To List  ${COTPOTENCIALPJ13}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${COTPOTENCIALPJ13}  ${temp}
    Append To List  ${COTPOTENCIALPJ13}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPJ13}  ${conta}
    Append To List  ${COTPOTENCIALPJ13}  Solteiro(a)
    Append To List  ${COTPOTENCIALPJ13}  CURITIBA
    Append To List  ${COTPOTENCIALPJ13}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${COTPOTENCIALPJ13}  Residencial
    Append To List  ${COTPOTENCIALPJ13}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${COTPOTENCIALPJ13}  ${temp}
    Append To List  ${COTPOTENCIALPJ13}  Celular
    Append To List  ${COTPOTENCIALPJ13}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Tipo
    Append To List  ${COTPOTENCIALPJ13}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${COTPOTENCIALPJ13}  02/08/2015

    #Instanciar Cliente PF TR014
    #Argumentos: Arg0: Tipo, Arg1: Nome Arg2: Conta, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${COTPOTENCIALPJ14}  Pessoa Jurídica (CNPJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Remover Caracteres Especiais  ${temp}
    Append To List  ${COTPOTENCIALPJ14}  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPJ14}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${COTPOTENCIALPJ14}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${COTPOTENCIALPJ14}  ${temp}
    Append To List  ${COTPOTENCIALPJ14}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ14}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${COTPOTENCIALPJ14}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${COTPOTENCIALPJ14}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ14}  Concluído e Aceito
    #Append To List  ${COTPOTENCIALPJ14}  Convênio LEW
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ14}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${COTPOTENCIALPJ14}  ${temp}
    Append To List  ${COTPOTENCIALPJ14}  Boleto
    #Adicionando: Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPJ14}  ${nasc}
    Append To List  ${COTPOTENCIALPJ14}  Titular
    Append To List  ${COTPOTENCIALPJ14}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${COTPOTENCIALPJ14}  ${temp}
    Append To List  ${COTPOTENCIALPJ14}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPJ14}  ${conta}
    Append To List  ${COTPOTENCIALPJ14}  Solteiro(a)
    Append To List  ${COTPOTENCIALPJ14}  CURITIBA
    Append To List  ${COTPOTENCIALPJ14}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${COTPOTENCIALPJ14}  Residencial
    Append To List  ${COTPOTENCIALPJ14}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${COTPOTENCIALPJ14}  ${temp}
    Append To List  ${COTPOTENCIALPJ14}  Celular
    Append To List  ${COTPOTENCIALPJ14}  69988654869
    #Adicionando - Pessoa: Arg27: Tipo, Arg28: Segundo Produto Assistencial
    Append To List  ${COTPOTENCIALPJ14}  Titular
    Append To List  ${COTPOTENCIALPJ14}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO

    
    #Instanciar Cliente PF TR015
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${COTPOTENCIALPJ15}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    Append To List  ${COTPOTENCIALPJ15}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${COTPOTENCIALPJ15}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${COTPOTENCIALPJ15}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${COTPOTENCIALPJ15}  ${temp}
    Append To List  ${COTPOTENCIALPJ15}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ15}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${COTPOTENCIALPJ15}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${COTPOTENCIALPJ15}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ15}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ15}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${COTPOTENCIALPJ15}  ${temp}
    Append To List  ${COTPOTENCIALPJ15}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPJ15}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPJ15}  ${nasc}
    Append To List  ${COTPOTENCIALPJ15}  Titular
    Append To List  ${COTPOTENCIALPJ15}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${COTPOTENCIALPJ15}  ${temp}
    Append To List  ${COTPOTENCIALPJ15}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPJ15}  ${conta}
    Append To List  ${COTPOTENCIALPJ15}  Solteiro(a)
    Append To List  ${COTPOTENCIALPJ15}  CURITIBA
    Append To List  ${COTPOTENCIALPJ15}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${COTPOTENCIALPJ15}  Residencial
    Append To List  ${COTPOTENCIALPJ15}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${COTPOTENCIALPJ15}  ${temp}
    Append To List  ${COTPOTENCIALPJ15}  Celular
    Append To List  ${COTPOTENCIALPJ15}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Tipo
    Append To List  ${COTPOTENCIALPJ15}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${COTPOTENCIALPJ15}  02/08/2015

    #Instanciar Cliente PF TR016
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${COTPOTENCIALPJ16}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    Append To List  ${COTPOTENCIALPJ16}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${COTPOTENCIALPJ16}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${COTPOTENCIALPJ16}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${COTPOTENCIALPJ16}  ${temp}
    Append To List  ${COTPOTENCIALPJ16}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ16}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${COTPOTENCIALPJ16}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${COTPOTENCIALPJ16}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ16}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ16}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${COTPOTENCIALPJ16}  ${temp}
    Append To List  ${COTPOTENCIALPJ16}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPJ16}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPJ16}  ${nasc}
    Append To List  ${COTPOTENCIALPJ16}  Titular
    Append To List  ${COTPOTENCIALPJ16}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${COTPOTENCIALPJ16}  ${temp}
    Append To List  ${COTPOTENCIALPJ16}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPJ16}  ${conta}
    Append To List  ${COTPOTENCIALPJ16}  Solteiro(a)
    Append To List  ${COTPOTENCIALPJ16}  CURITIBA
    Append To List  ${COTPOTENCIALPJ16}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${COTPOTENCIALPJ16}  Residencial
    Append To List  ${COTPOTENCIALPJ16}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${COTPOTENCIALPJ16}  ${temp}
    Append To List  ${COTPOTENCIALPJ16}  Celular
    Append To List  ${COTPOTENCIALPJ16}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${COTPOTENCIALPJ16}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${COTPOTENCIALPJ16}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${COTPOTENCIALPJ16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPJ16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPJ16}  ${conta}
    Append To List  ${COTPOTENCIALPJ16}  Solteiro(a)
    Append To List  ${COTPOTENCIALPJ16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPJ16}  ${nasc}


    #Instanciar Variavel Cliente PF TR017
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${COTPOTENCIALPJ17}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${COTPOTENCIALPJ17}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${COTPOTENCIALPJ17}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${COTPOTENCIALPJ17}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${COTPOTENCIALPJ17}  ${temp}
    Append To List  ${COTPOTENCIALPJ17}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ17}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${COTPOTENCIALPJ17}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${COTPOTENCIALPJ17}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ17}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ17}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${COTPOTENCIALPJ17}  ${temp}
    Append To List  ${COTPOTENCIALPJ17}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPJ17}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPJ17}  ${nasc}
    Append To List  ${COTPOTENCIALPJ17}  Titular
    Append To List  ${COTPOTENCIALPJ17}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${COTPOTENCIALPJ17}  ${temp}
    Append To List  ${COTPOTENCIALPJ17}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPJ17}  ${conta}
    Append To List  ${COTPOTENCIALPJ17}  Solteiro(a)
    Append To List  ${COTPOTENCIALPJ17}  CURITIBA
    Append To List  ${COTPOTENCIALPJ17}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${COTPOTENCIALPJ17}  Residencial
    Append To List  ${COTPOTENCIALPJ17}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${COTPOTENCIALPJ17}  ${temp}
    Append To List  ${COTPOTENCIALPJ17}  Celular
    Append To List  ${COTPOTENCIALPJ17}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${COTPOTENCIALPJ17}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${COTPOTENCIALPJ17}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${COTPOTENCIALPJ17}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPJ17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPJ17}  ${conta}
    Append To List  ${COTPOTENCIALPJ17}  Solteiro(a)
    Append To List  ${COTPOTENCIALPJ17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPJ17}  ${nasc}


    #Instanciar Variavel Cliente PF TR018
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${COTPOTENCIALPJ18}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${COTPOTENCIALPJ18}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${COTPOTENCIALPJ18}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${COTPOTENCIALPJ18}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${COTPOTENCIALPJ18}  ${temp}
    Append To List  ${COTPOTENCIALPJ18}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ18}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${COTPOTENCIALPJ18}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${COTPOTENCIALPJ18}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ18}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ18}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${COTPOTENCIALPJ18}  ${temp}
    Append To List  ${COTPOTENCIALPJ18}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPJ18}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPJ18}  ${nasc}
    Append To List  ${COTPOTENCIALPJ18}  Titular
    Append To List  ${COTPOTENCIALPJ18}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${COTPOTENCIALPJ18}  ${temp}
    Append To List  ${COTPOTENCIALPJ18}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPJ18}  ${conta}
    Append To List  ${COTPOTENCIALPJ18}  Solteiro(a)
    Append To List  ${COTPOTENCIALPJ18}  CURITIBA
    Append To List  ${COTPOTENCIALPJ18}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${COTPOTENCIALPJ18}  Residencial
    Append To List  ${COTPOTENCIALPJ18}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${COTPOTENCIALPJ18}  ${temp}
    Append To List  ${COTPOTENCIALPJ18}  Celular
    Append To List  ${COTPOTENCIALPJ18}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${COTPOTENCIALPJ18}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${COTPOTENCIALPJ18}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${COTPOTENCIALPJ18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPJ18}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPJ18}  ${conta}
    Append To List  ${COTPOTENCIALPJ18}  Solteiro(a)
    Append To List  ${COTPOTENCIALPJ18}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPJ18}  ${nasc}
    #Adicionando para importação: Arg36: Endereco, Arg37: Bairro, Arg38: Cidade, Arg39: UF, Arg40: Pais, 
    #            Arg41: Produto Assitencial,  Arg42: sexo, Arg43: raça, Arg44: Grau de Dependencia, Arg45: tipoEndereco, Arg46: Telefone
    Append To List  ${COTPOTENCIALPJ18}  rua alberto folloni
    Append To List  ${COTPOTENCIALPJ18}  ahu
    Append To List  ${COTPOTENCIALPJ18}  curitiba
    Append To List  ${COTPOTENCIALPJ18}  PR
    Append To List  ${COTPOTENCIALPJ18}  brasil
    Append To List  ${COTPOTENCIALPJ18}  5073
    Append To List  ${COTPOTENCIALPJ18}  f
    Append To List  ${COTPOTENCIALPJ18}  1
    Append To List  ${COTPOTENCIALPJ18}  00
    Append To List  ${COTPOTENCIALPJ18}  residencial
    Append To List  ${COTPOTENCIALPJ18}  solteiro
    Append To List  ${COTPOTENCIALPJ18}  43923328738
    Append To List  ${COTPOTENCIALPJ18}  Curitiba
    Append To List  ${COTPOTENCIALPJ18}  PR


    #Instanciar Variavel Cliente PF TR019
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${COTPOTENCIALPJ19}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${COTPOTENCIALPJ19}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${COTPOTENCIALPJ19}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${COTPOTENCIALPJ19}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${COTPOTENCIALPJ19}  ${temp}
    Append To List  ${COTPOTENCIALPJ19}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ19}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${COTPOTENCIALPJ18}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${COTPOTENCIALPJ19}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ19}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ19}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${COTPOTENCIALPJ19}  ${temp}
    Append To List  ${COTPOTENCIALPJ19}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPJ19}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPJ19}  ${nasc}
    Append To List  ${COTPOTENCIALPJ19}  Titular
    Append To List  ${COTPOTENCIALPJ19}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${COTPOTENCIALPJ19}  ${temp}
    Append To List  ${COTPOTENCIALPJ19}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPJ19}  ${conta}
    Append To List  ${COTPOTENCIALPJ19}  Solteiro(a)
    Append To List  ${COTPOTENCIALPJ19}  CURITIBA
    Append To List  ${COTPOTENCIALPJ19}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${COTPOTENCIALPJ19}  Residencial
    Append To List  ${COTPOTENCIALPJ19}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${COTPOTENCIALPJ19}  ${temp}
    Append To List  ${COTPOTENCIALPJ19}  Celular
    Append To List  ${COTPOTENCIALPJ19}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${COTPOTENCIALPJ19}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${COTPOTENCIALPJ19}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${COTPOTENCIALPJ19}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPJ19}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPJ19}  ${conta}
    Append To List  ${COTPOTENCIALPJ19}  Solteiro(a)
    Append To List  ${COTPOTENCIALPJ19}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPJ19}  ${nasc}


    #Instanciar Variavel Cliente PF TR020
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${COTPOTENCIALPJ20}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${COTPOTENCIALPJ20}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${COTPOTENCIALPJ20}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${COTPOTENCIALPJ20}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${COTPOTENCIALPJ20}  ${temp}
    Append To List  ${COTPOTENCIALPJ20}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ20}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${COTPOTENCIALPJ20}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${COTPOTENCIALPJ20}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${COTPOTENCIALPJ20}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${COTPOTENCIALPJ20}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${COTPOTENCIALPJ20}  ${temp}
    Append To List  ${COTPOTENCIALPJ20}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPJ20}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPJ20}  ${nasc}
    Append To List  ${COTPOTENCIALPJ20}  Titular
    Append To List  ${COTPOTENCIALPJ20}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${COTPOTENCIALPJ20}  ${temp}
    Append To List  ${COTPOTENCIALPJ20}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPJ20}  ${conta}
    Append To List  ${COTPOTENCIALPJ20}  Solteiro(a)
    Append To List  ${COTPOTENCIALPJ20}  CURITIBA
    Append To List  ${COTPOTENCIALPJ20}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${COTPOTENCIALPJ20}  Residencial
    Append To List  ${COTPOTENCIALPJ20}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${COTPOTENCIALPJ20}  ${temp}
    Append To List  ${COTPOTENCIALPJ20}  Celular
    Append To List  ${COTPOTENCIALPJ20}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${COTPOTENCIALPJ20}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${COTPOTENCIALPJ20}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${COTPOTENCIALPJ20}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${COTPOTENCIALPJ20}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${COTPOTENCIALPJ20}  ${conta}
    Append To List  ${COTPOTENCIALPJ20}  Solteiro(a)
    Append To List  ${COTPOTENCIALPJ20}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${COTPOTENCIALPJ20}  ${nasc}
    Append To List  ${COTPOTENCIALPJ20}  desconto
    Append To List  ${COTPOTENCIALPJ20}  30
    Append To List  ${COTPOTENCIALPJ20}  acrescimo
    Append To List  ${COTPOTENCIALPJ20}  20


    #Instanciar Variavel Cliente PF TR021
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${PORTABILIDADECOTPJ21}  Potencial Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Remover Caracteres Especiais  ${temp}
    Append To List  ${PORTABILIDADECOTPJ21}  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECOTPJ21}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${PORTABILIDADECOTPJ21}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${PORTABILIDADECOTPJ21}  ${temp}
    Append To List  ${PORTABILIDADECOTPJ21}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECOTPJ21}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${PORTABILIDADECOTPJ21}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTABILIDADECOTPJ21}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${PORTABILIDADECOTPJ21}  Concluído e Aceito
    #Append To List  ${PORTABILIDADECOTPJ21}  Convênio LEW
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECOTPJ21}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTABILIDADECOTPJ21}  ${temp}
    Append To List  ${PORTABILIDADECOTPJ21}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECOTPJ21}  ${nasc}
    Append To List  ${PORTABILIDADECOTPJ21}  Titular
    Append To List  ${PORTABILIDADECOTPJ21}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECOTPJ21}  ${temp}
    Append To List  ${PORTABILIDADECOTPJ21}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECOTPJ21}  ${conta}
    Append To List  ${PORTABILIDADECOTPJ21}  Solteiro(a)
    Append To List  ${PORTABILIDADECOTPJ21}  CURITIBA
    Append To List  ${PORTABILIDADECOTPJ21}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${PORTABILIDADECOTPJ21}  Residencial
    Append To List  ${PORTABILIDADECOTPJ21}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTABILIDADECOTPJ21}  ${temp}
    Append To List  ${PORTABILIDADECOTPJ21}  Celular
    Append To List  ${PORTABILIDADECOTPJ21}  69988654869
    #Adicionando - Pessoa: Arg26: Tipo, Arg27: Segundo Produto Assistencial
    Append To List  ${PORTABILIDADECOTPJ21}  Titular
    Append To List  ${PORTABILIDADECOTPJ21}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO


    #Instanciar Variavel Cliente PF TR022
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${PORTABILIDADECOTPJ22}  Potencial Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Remover Caracteres Especiais  ${temp}
    Append To List  ${PORTABILIDADECOTPJ22}  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECOTPJ22}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${PORTABILIDADECOTPJ22}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${PORTABILIDADECOTPJ22}  ${temp}
    Append To List  ${PORTABILIDADECOTPJ22}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECOTPJ22}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${PORTABILIDADECOTPJ22}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTABILIDADECOTPJ22}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${PORTABILIDADECOTPJ22}  Concluído e Aceito
    #Append To List  ${PORTABILIDADECOTPJ22}  Convênio LEW
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECOTPJ22}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTABILIDADECOTPJ22}  ${temp}
    Append To List  ${PORTABILIDADECOTPJ22}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECOTPJ22}  ${nasc}
    Append To List  ${PORTABILIDADECOTPJ22}  Titular
    Append To List  ${PORTABILIDADECOTPJ22}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECOTPJ22}  ${temp}
    Append To List  ${PORTABILIDADECOTPJ22}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECOTPJ22}  ${conta}
    Append To List  ${PORTABILIDADECOTPJ22}  Solteiro(a)
    Append To List  ${PORTABILIDADECOTPJ22}  CURITIBA
    Append To List  ${PORTABILIDADECOTPJ22}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${PORTABILIDADECOTPJ22}  Residencial
    Append To List  ${PORTABILIDADECOTPJ22}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTABILIDADECOTPJ22}  ${temp}
    Append To List  ${PORTABILIDADECOTPJ22}  Celular
    Append To List  ${PORTABILIDADECOTPJ22}  69988654869
    #Adicionando - Pessoa: Arg26: Tipo, Arg27: Segundo Produto Assistencial
    Append To List  ${PORTABILIDADECOTPJ22}  Titular
    Append To List  ${PORTABILIDADECOTPJ22}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO


    #Instanciar Variavel Cliente PF TR023
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${PORTABILIDADECOTPJ23}  Potencial Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Remover Caracteres Especiais  ${temp}
    Append To List  ${PORTABILIDADECOTPJ23}  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECOTPJ23}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${PORTABILIDADECOTPJ23}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${PORTABILIDADECOTPJ23}  ${temp}
    Append To List  ${PORTABILIDADECOTPJ23}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECOTPJ23}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${PORTABILIDADECOTPJ23}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTABILIDADECOTPJ23}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${PORTABILIDADECOTPJ23}  Concluído e Aceito
    #Append To List  ${PORTABILIDADECOTPJ23}  Convênio LEW
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECOTPJ23}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTABILIDADECOTPJ23}  ${temp}
    Append To List  ${PORTABILIDADECOTPJ23}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECOTPJ23}  ${nasc}
    Append To List  ${PORTABILIDADECOTPJ23}  Titular
    Append To List  ${PORTABILIDADECOTPJ23}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECOTPJ23}  ${temp}
    Append To List  ${PORTABILIDADECOTPJ23}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECOTPJ23}  ${conta}
    Append To List  ${PORTABILIDADECOTPJ23}  Solteiro(a)
    Append To List  ${PORTABILIDADECOTPJ23}  CURITIBA
    Append To List  ${PORTABILIDADECOTPJ23}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${PORTABILIDADECOTPJ23}  Residencial
    Append To List  ${PORTABILIDADECOTPJ23}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTABILIDADECOTPJ23}  ${temp}
    Append To List  ${PORTABILIDADECOTPJ23}  Celular
    Append To List  ${PORTABILIDADECOTPJ23}  69988654869
    #Adicionando - Pessoa: Arg26: Tipo, Arg27: Segundo Produto Assistencial
    Append To List  ${PORTABILIDADECOTPJ23}  Titular
    Append To List  ${PORTABILIDADECOTPJ23}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO

    #Instanciar Variavel Cliente PF TR024
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${PORTABILIDADECOTPJ24}  Potencial Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Remover Caracteres Especiais  ${temp}
    Append To List  ${PORTABILIDADECOTPJ24}  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECOTPJ24}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${PORTABILIDADECOTPJ24}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${PORTABILIDADECOTPJ24}  ${temp}
    Append To List  ${PORTABILIDADECOTPJ24}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECOTPJ24}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${PORTABILIDADECOTPJ24}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTABILIDADECOTPJ24}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${PORTABILIDADECOTPJ24}  Concluído e Aceito
    #Append To List  ${PORTABILIDADECOTPJ24}  Convênio LEW
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECOTPJ24}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTABILIDADECOTPJ24}  ${temp}
    Append To List  ${PORTABILIDADECOTPJ24}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECOTPJ24}  ${nasc}
    Append To List  ${PORTABILIDADECOTPJ24}  Titular
    Append To List  ${PORTABILIDADECOTPJ24}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECOTPJ24}  ${temp}
    Append To List  ${PORTABILIDADECOTPJ24}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECOTPJ24}  ${conta}
    Append To List  ${PORTABILIDADECOTPJ24}  Solteiro(a)
    Append To List  ${PORTABILIDADECOTPJ24}  CURITIBA
    Append To List  ${PORTABILIDADECOTPJ24}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${PORTABILIDADECOTPJ24}  Residencial
    Append To List  ${PORTABILIDADECOTPJ24}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTABILIDADECOTPJ24}  ${temp}
    Append To List  ${PORTABILIDADECOTPJ24}  Celular
    Append To List  ${PORTABILIDADECOTPJ24}  69988654869
    #Adicionando - Pessoa: Arg26: Tipo, Arg27: Segundo Produto Assistencial
    Append To List  ${PORTABILIDADECOTPJ24}  Titular
    Append To List  ${PORTABILIDADECOTPJ24}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO


    #Instanciar Cliente PF TR025 
    #Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" Arg4:"Numero de vidas" arg5: Data vigncia
    Append To List  ${PORTPOTCLCAEPF25}  Pessoa Jurídica (CAEPF)
    ${temp}  FakerLibrary.Company
    ${conta}  Remover Caracteres Especiais  ${temp}
    ${conta}  Convert To Uppercase  ${conta}
    Append To List  ${PORTPOTCLCAEPF25}  ${temp}
    ${conta}  Remover Caracteres Especiais  ${conta}  
    ${conta}  Convert To Uppercase  ${conta}
    Append To List  ${PORTPOTCLCAEPF25}  ${conta}
    ${temp}  Gerar CAEPF
    Append To List  ${PORTPOTCLCAEPF25}  ${temp}
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${PORTPOTCLCAEPF25}  ${temp}
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTPOTCLCAEPF25}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação arg9: Novo parametro
    Append To List  ${PORTPOTCLCAEPF25}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTPOTCLCAEPF25}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${PORTPOTCLCAEPF25}  Concluído e Aceito
    Append To List  ${PORTPOTCLCAEPF25}  Convênio LEW


    #Instanciar Cliente PF TR026 
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${PORTPOTCLCAEPF26}  Pessoa Jurídica (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${PORTPOTCLCAEPF26}  ${company}
    Append To List  ${PORTPOTCLCAEPF26}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${PORTPOTCLCAEPF26}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${PORTPOTCLCAEPF26}  ${temp}
    Append To List  ${PORTPOTCLCAEPF26}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTPOTCLCAEPF26}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${PORTPOTCLCAEPF26}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTPOTCLCAEPF26}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${PORTPOTCLCAEPF26}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTPOTCLCAEPF26}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTPOTCLCAEPF26}  ${temp}
    Append To List  ${PORTPOTCLCAEPF26}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTPOTCLCAEPF26}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTPOTCLCAEPF26}  ${nasc}
    Append To List  ${PORTPOTCLCAEPF26}  Titular
    Append To List  ${PORTPOTCLCAEPF26}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTPOTCLCAEPF26}  ${temp}
    Append To List  ${PORTPOTCLCAEPF26}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTPOTCLCAEPF26}  ${conta}
    Append To List  ${PORTPOTCLCAEPF26}  Solteiro(a)
    Append To List  ${PORTPOTCLCAEPF26}  CURITIBA
    Append To List  ${PORTPOTCLCAEPF26}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${PORTPOTCLCAEPF26}  Residencial
    Append To List  ${PORTPOTCLCAEPF26}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTPOTCLCAEPF26}  ${temp}
    Append To List  ${PORTPOTCLCAEPF26}  Celular
    Append To List  ${PORTPOTCLCAEPF26}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${PORTPOTCLCAEPF26}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${PORTPOTCLCAEPF26}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${PORTPOTCLCAEPF26}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTPOTCLCAEPF26}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTPOTCLCAEPF26}  ${conta}
    Append To List  ${PORTPOTCLCAEPF26}  Solteiro(a)
    Append To List  ${PORTPOTCLCAEPF26}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTPOTCLCAEPF26}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${PORTPOTCLCAEPF26}  desconto
    Append To List  ${PORTPOTCLCAEPF26}  30
    Append To List  ${PORTPOTCLCAEPF26}  acrescimo
    Append To List  ${PORTPOTCLCAEPF26}  20

    
    #Instanciar Cliente PF TR027 
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${PORTPOTCLCAEPF27}  Pessoa Jurídica (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${PORTPOTCLCAEPF27}  ${company}
    Append To List  ${PORTPOTCLCAEPF27}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${PORTPOTCLCAEPF27}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${PORTPOTCLCAEPF27}  ${temp}
    Append To List  ${PORTPOTCLCAEPF27}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTPOTCLCAEPF27}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${PORTPOTCLCAEPF27}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTPOTCLCAEPF27}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${PORTPOTCLCAEPF27}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTPOTCLCAEPF27}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTPOTCLCAEPF27}  ${temp}
    Append To List  ${PORTPOTCLCAEPF27}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTPOTCLCAEPF27}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTPOTCLCAEPF27}  ${nasc}
    Append To List  ${PORTPOTCLCAEPF27}  Titular
    Append To List  ${PORTPOTCLCAEPF27}  00 - Titular
    #Adicionando: Arg17: CNS, Arg178 Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTPOTCLCAEPF27}  ${temp}
    Append To List  ${PORTPOTCLCAEPF27}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTPOTCLCAEPF27}  ${conta}
    Append To List  ${PORTPOTCLCAEPF27}  Solteiro(a)
    Append To List  ${PORTPOTCLCAEPF27}  CURITIBA
    Append To List  ${PORTPOTCLCAEPF27}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${PORTPOTCLCAEPF27}  Residencial
    Append To List  ${PORTPOTCLCAEPF27}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTPOTCLCAEPF27}  ${temp}
    Append To List  ${PORTPOTCLCAEPF27}  Celular
    Append To List  ${PORTPOTCLCAEPF27}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${PORTPOTCLCAEPF27}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${PORTPOTCLCAEPF27}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${PORTPOTCLCAEPF27}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTPOTCLCAEPF27}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTPOTCLCAEPF27}  ${conta}
    Append To List  ${PORTPOTCLCAEPF27}  Solteiro(a)
    Append To List  ${PORTPOTCLCAEPF27}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTPOTCLCAEPF27}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${PORTPOTCLCAEPF27}  desconto
    Append To List  ${PORTPOTCLCAEPF27}  30
    Append To List  ${PORTPOTCLCAEPF27}  acrescimo
    Append To List  ${PORTPOTCLCAEPF27}  20


    #Instanciar Cliente PF TR028 
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${PORTPOTCLCAEPF28}  Pessoa Jurídica (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${PORTPOTCLCAEPF28}  ${company}
    Append To List  ${PORTPOTCLCAEPF28}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${PORTPOTCLCAEPF28}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${PORTPOTCLCAEPF28}  ${temp}
    Append To List  ${PORTPOTCLCAEPF28}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTPOTCLCAEPF28}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${PORTPOTCLCAEPF28}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTPOTCLCAEPF28}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${PORTPOTCLCAEPF28}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTPOTCLCAEPF28}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTPOTCLCAEPF28}  ${temp}
    Append To List  ${PORTPOTCLCAEPF28}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTPOTCLCAEPF28}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTPOTCLCAEPF28}  ${nasc}
    Append To List  ${PORTPOTCLCAEPF28}  Titular
    Append To List  ${PORTPOTCLCAEPF28}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTPOTCLCAEPF28}  ${temp}
    Append To List  ${PORTPOTCLCAEPF28}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTPOTCLCAEPF28}  ${conta}
    Append To List  ${PORTPOTCLCAEPF28}  Solteiro(a)
    Append To List  ${PORTPOTCLCAEPF28}  CURITIBA
    Append To List  ${PORTPOTCLCAEPF28}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${PORTPOTCLCAEPF28}  Residencial
    Append To List  ${PORTPOTCLCAEPF28}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTPOTCLCAEPF28}  ${temp}
    Append To List  ${PORTPOTCLCAEPF28}  Celular
    Append To List  ${PORTPOTCLCAEPF28}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${PORTPOTCLCAEPF28}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${PORTPOTCLCAEPF28}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${PORTPOTCLCAEPF28}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTPOTCLCAEPF28}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTPOTCLCAEPF28}  ${conta}
    Append To List  ${PORTPOTCLCAEPF28}  Solteiro(a)
    Append To List  ${PORTPOTCLCAEPF28}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTPOTCLCAEPF28}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${PORTPOTCLCAEPF28}  desconto
    Append To List  ${PORTPOTCLCAEPF28}  30
    Append To List  ${PORTPOTCLCAEPF28}  acrescimo
    Append To List  ${PORTPOTCLCAEPF28}  20

    
    #Instanciar Variavel Cliente CAEPF TR029
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${PORTCONTACAEPF29}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${PORTCONTACAEPF29}  ${company}
    Append To List  ${PORTCONTACAEPF29}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${PORTCONTACAEPF29}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${PORTCONTACAEPF29}  ${temp}
    Append To List  ${PORTCONTACAEPF29}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTCONTACAEPF29}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${PORTCONTACAEPF29}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTCONTACAEPF29}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${PORTCONTACAEPF29}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTCONTACAEPF29}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTCONTACAEPF29}  ${temp}
    Append To List  ${PORTCONTACAEPF29}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTCONTACAEPF29}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTCONTACAEPF29}  ${nasc}
    Append To List  ${PORTCONTACAEPF29}  Titular
    Append To List  ${PORTCONTACAEPF29}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTCONTACAEPF29}  ${temp}
    Append To List  ${PORTCONTACAEPF29}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTCONTACAEPF29}  ${conta}
    Append To List  ${PORTCONTACAEPF29}  Solteiro(a)
    Append To List  ${PORTCONTACAEPF29}  CURITIBA
    Append To List  ${PORTCONTACAEPF29}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${PORTCONTACAEPF29}  Residencial
    Append To List  ${PORTCONTACAEPF29}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTCONTACAEPF29}  ${temp}
    Append To List  ${PORTCONTACAEPF29}  Celular
    Append To List  ${PORTCONTACAEPF29}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${PORTCONTACAEPF29}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${PORTCONTACAEPF29}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${PORTCONTACAEPF29}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTCONTACAEPF29}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTCONTACAEPF29}  ${conta}
    Append To List  ${PORTCONTACAEPF29}  Solteiro(a)
    Append To List  ${PORTCONTACAEPF29}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTCONTACAEPF29}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${PORTCONTACAEPF29}  desconto
    Append To List  ${PORTCONTACAEPF29}  30
    Append To List  ${PORTCONTACAEPF29}  acrescimo
    Append To List  ${PORTCONTACAEPF29}  20

    
    #Instanciar Variavel Cliente CAEPF TR030
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${PORTCONTACAEPF30}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${PORTCONTACAEPF30}  ${company}
    Append To List  ${PORTCONTACAEPF30}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${PORTCONTACAEPF30}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${PORTCONTACAEPF30}  ${temp}
    Append To List  ${PORTCONTACAEPF30}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTCONTACAEPF30}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${PORTCONTACAEPF30}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTCONTACAEPF30}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${PORTCONTACAEPF30}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTCONTACAEPF30}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTCONTACAEPF30}  ${temp}
    Append To List  ${PORTCONTACAEPF30}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTCONTACAEPF30}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTCONTACAEPF30}  ${nasc}
    Append To List  ${PORTCONTACAEPF30}  Titular
    Append To List  ${PORTCONTACAEPF30}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTCONTACAEPF30}  ${temp}
    Append To List  ${PORTCONTACAEPF30}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTCONTACAEPF30}  ${conta}
    Append To List  ${PORTCONTACAEPF30}  Solteiro(a)
    Append To List  ${PORTCONTACAEPF30}  CURITIBA
    Append To List  ${PORTCONTACAEPF30}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${PORTCONTACAEPF30}  Residencial
    Append To List  ${PORTCONTACAEPF30}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTCONTACAEPF30}  ${temp}
    Append To List  ${PORTCONTACAEPF30}  Celular
    Append To List  ${PORTCONTACAEPF30}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${PORTCONTACAEPF30}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${PORTCONTACAEPF30}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${PORTCONTACAEPF30}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTCONTACAEPF30}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTCONTACAEPF30}  ${conta}
    Append To List  ${PORTCONTACAEPF30}  Solteiro(a)
    Append To List  ${PORTCONTACAEPF30}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTCONTACAEPF30}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${PORTCONTACAEPF30}  desconto
    Append To List  ${PORTCONTACAEPF30}  30
    Append To List  ${PORTCONTACAEPF30}  acrescimo
    Append To List  ${PORTCONTACAEPF30}  20


    #Instanciar Variavel Cliente CAEPF TR031
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${PORTCONTACAEPF31}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${PORTCONTACAEPF31}  ${company}
    Append To List  ${PORTCONTACAEPF31}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${PORTCONTACAEPF31}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${PORTCONTACAEPF31}  ${temp}
    Append To List  ${PORTCONTACAEPF31}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTCONTACAEPF31}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${PORTCONTACAEPF31}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTCONTACAEPF31}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${PORTCONTACAEPF31}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTCONTACAEPF31}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTCONTACAEPF31}  ${temp}
    Append To List  ${PORTCONTACAEPF31}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTCONTACAEPF31}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTCONTACAEPF31}  ${nasc}
    Append To List  ${PORTCONTACAEPF31}  Titular
    Append To List  ${PORTCONTACAEPF31}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTCONTACAEPF31}  ${temp}
    Append To List  ${PORTCONTACAEPF31}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTCONTACAEPF31}  ${conta}
    Append To List  ${PORTCONTACAEPF31}  Solteiro(a)
    Append To List  ${PORTCONTACAEPF31}  CURITIBA
    Append To List  ${PORTCONTACAEPF31}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${PORTCONTACAEPF31}  Residencial
    Append To List  ${PORTCONTACAEPF31}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTCONTACAEPF31}  ${temp}
    Append To List  ${PORTCONTACAEPF31}  Celular
    Append To List  ${PORTCONTACAEPF31}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${PORTCONTACAEPF31}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${PORTCONTACAEPF31}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${PORTCONTACAEPF31}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTCONTACAEPF31}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTCONTACAEPF31}  ${conta}
    Append To List  ${PORTCONTACAEPF31}  Solteiro(a)
    Append To List  ${PORTCONTACAEPF31}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTCONTACAEPF31}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${PORTCONTACAEPF31}  desconto
    Append To List  ${PORTCONTACAEPF31}  30
    Append To List  ${PORTCONTACAEPF31}  acrescimo
    Append To List  ${PORTCONTACAEPF31}  20


    #Instanciar Variavel Cliente CAEPF TR032
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${PORTCONTACAEPF32}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${PORTCONTACAEPF32}  ${company}
    Append To List  ${PORTCONTACAEPF32}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${PORTCONTACAEPF32}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${PORTCONTACAEPF32}  ${temp}
    Append To List  ${PORTCONTACAEPF32}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTCONTACAEPF32}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${PORTCONTACAEPF32}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTCONTACAEPF32}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${PORTCONTACAEPF32}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTCONTACAEPF32}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTCONTACAEPF32}  ${temp}
    Append To List  ${PORTCONTACAEPF32}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTCONTACAEPF32}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTCONTACAEPF32}  ${nasc}
    Append To List  ${PORTCONTACAEPF32}  Titular
    Append To List  ${PORTCONTACAEPF32}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTCONTACAEPF32}  ${temp}
    Append To List  ${PORTCONTACAEPF32}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTCONTACAEPF32}  ${conta}
    Append To List  ${PORTCONTACAEPF32}  Solteiro(a)
    Append To List  ${PORTCONTACAEPF32}  CURITIBA
    Append To List  ${PORTCONTACAEPF32}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${PORTCONTACAEPF32}  Residencial
    Append To List  ${PORTCONTACAEPF32}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTCONTACAEPF32}  ${temp}
    Append To List  ${PORTCONTACAEPF32}  Celular
    Append To List  ${PORTCONTACAEPF32}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${PORTCONTACAEPF32}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${PORTCONTACAEPF32}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${PORTCONTACAEPF32}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTCONTACAEPF32}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTCONTACAEPF32}  ${conta}
    Append To List  ${PORTCONTACAEPF32}  Solteiro(a)
    Append To List  ${PORTCONTACAEPF32}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTCONTACAEPF32}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${PORTCONTACAEPF32}  desconto
    Append To List  ${PORTCONTACAEPF32}  30
    Append To List  ${PORTCONTACAEPF32}  acrescimo
    Append To List  ${PORTCONTACAEPF32}  20

    #Instanciar Variavel Cliente CAEPF TR033
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista
    Append To List  ${PORTABCOTCAEPF33}  Potencial Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Convert To Uppercase  ${conta}
    ${conta}        Catenate  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}  
    Append To List  ${PORTABCOTCAEPF33}  ${conta}
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${PORTABCOTCAEPF33}  ${temp}
    Append To List  ${PORTABCOTCAEPF33}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABCOTCAEPF33}  ${date}
    # Adicionando: Arg5: Produto Assitencial Massa Teste, Arg6: Produto Assitencial já existente  Arg7: Fase cotação arg8: Nome do convênio
    Append To List  ${PORTABCOTCAEPF33}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTABCOTCAEPF33}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${PORTABCOTCAEPF33}  Concluído e Aceito
    Append To List  ${PORTABCOTCAEPF33}  Convênio LEW
    Set Global Variable  @{PORTABCOTCAEPF33}


    #Instanciar Variavel Cliente CAEPF TR034
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista
    Append To List  ${PORTABCOTCAEPF34}  Potencial Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Convert To Uppercase  ${conta}
    ${conta}        Catenate  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}  
    Append To List  ${PORTABCOTCAEPF34}  ${conta}
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${PORTABCOTCAEPF34}  ${temp}
    Append To List  ${PORTABCOTCAEPF34}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABCOTCAEPF34}  ${date}
    # Adicionando: Arg5: Produto Assitencial Massa Teste, Arg6: Produto Assitencial já existente  Arg7: Fase cotação arg8: Nome do convênio
    Append To List  ${PORTABCOTCAEPF34}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTABCOTCAEPF34}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${PORTABCOTCAEPF34}  Concluído e Aceito
    Append To List  ${PORTABCOTCAEPF34}  Convênio LEW
    Set Global Variable  @{PORTABCOTCAEPF34}


    #Instanciar Variavel Cliente CAEPF TR035
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista
    Append To List  ${PORTABCOTCAEPF35}  Potencial Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Convert To Uppercase  ${conta}
    ${conta}        Catenate  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}  
    Append To List  ${PORTABCOTCAEPF35}  ${conta}
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${PORTABCOTCAEPF35}  ${temp}
    Append To List  ${PORTABCOTCAEPF35}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABCOTCAEPF35}  ${date}
    # Adicionando: Arg5: Produto Assitencial Massa Teste, Arg6: Produto Assitencial já existente  Arg7: Fase cotação arg8: Nome do convênio
    Append To List  ${PORTABCOTCAEPF35}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTABCOTCAEPF35}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${PORTABCOTCAEPF35}  Concluído e Aceito
    Append To List  ${PORTABCOTCAEPF35}  Convênio LEW
    Set Global Variable  @{PORTABCOTCAEPF35}


    #Instanciar Variavel Cliente CAEPF TR036
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista
    Append To List  ${PORTABCOTCAEPF36}  Potencial Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Convert To Uppercase  ${conta}
    ${conta}        Catenate  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}  
    Append To List  ${PORTABCOTCAEPF36}  ${conta}
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${PORTABCOTCAEPF36}  ${temp}
    Append To List  ${PORTABCOTCAEPF36}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABCOTCAEPF36}  ${date}
    # Adicionando: Arg5: Produto Assitencial Massa Teste, Arg6: Produto Assitencial já existente  Arg7: Fase cotação arg8: Nome do convênio
    Append To List  ${PORTABCOTCAEPF36}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTABCOTCAEPF36}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${PORTABCOTCAEPF36}  Concluído e Aceito
    Append To List  ${PORTABCOTCAEPF36}  Convênio LEW
    Set Global Variable  @{PORTABCOTCAEPF36}