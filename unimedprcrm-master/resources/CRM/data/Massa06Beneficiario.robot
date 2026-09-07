*** Settings ***

Resource        ../../../main.resource
*** Variables ***
@{BENEFPOTENCIALPF01}    #cenario01
@{BENEFPOTENCIALPF02}    #cenario02
@{BENEFPOTENCIALPF03}    #cenario03
@{BENEFPOTENCIALPF04}    #cenario04
@{BENEFPOTENCIALPF05}    #cenario05
@{BENEFCONTAPF06}        #cenario06
@{BENEFCONTAPF07}        #cenario07
@{BENEFCONTAPF08}        #cenario08
@{BENEFCONTAPF09}        #cenario09
@{BENEFCONTAPF10}        #cenario10
@{BENEFCOTACAOPF11}      #cenario11
@{BENEFCOTACAOPF12}      #cenario12
@{BENEFCOTACAOPF13}      #cenario13
@{BENEFCOTACAOPF14}      #cenario14
@{BENEFCOTACAOPF15}      #cenario15
@{BENEFPOTENCIALPJ16}    #cenario16
@{BENEFPOTENCIALPJ17}    #cenario17
@{BENEFPOTENCIALPJ18}    #cenario18
@{BENEFPOTENCIALPJ19}    #cenario19
@{BENEFPOTENCIALPJ20}    #cenario20
@{BENEFPOTENCIALPJ21}    #cenario21
@{BENEFPOTENCIALPJ22}    #cenario22
@{BENEFPOTENCIALPJ23}    #cenario23
@{BENEFPOTENCIALPJ24}    #cenario24
@{BENEFPOTENCIALPJ25}    #cenario25
@{BENEFPOTENCIALPJ26}    #cenario26
@{BENEFPOTENCIALPJ27}    #cenario27
@{BENEFPOTENCIALPJ28}    #cenario28
@{BENEFPOTENCIALPJ29}    #cenario29
@{BENEFPOTENCIALPJ30}    #cenario30
@{BENEFPOTENCIALPJ31}    #cenario31
@{BENEFPOTENCIALPJ32}    #cenario32
@{BENEFPOTENCIALPJ33}    #cenario33
@{BENEFCONTAPJ34}        #cenario34
@{BENEFCONTAPJ35}        #cenario35
@{BENEFCONTAPJ36}        #cenario36
@{BENEFCONTAPJ37}        #cenario37
@{BENEFCONTAPJ38}        #cenario38
@{BENEFCONTAPJ39}        #cenario39
@{BENEFCONTAPJ40}        #cenario40
@{BENEFCONTAPJ41}        #cenario41
@{BENEFCONTAPJ42}        #cenario42
@{BENEFCONTAPJ43}        #cenario43
@{BENEFCONTAPJ44}        #cenario44
@{BENEFCONTAPJ45}        #cenario45
@{BENEFCONTAPJ46}        #cenario46
@{BENEFCONTAPJ47}        #cenario47
@{BENEFCONTAPJ48}        #cenario48
@{BENEFCONTAPJ49}        #cenario49
@{BENEFCONTAPJ50}        #cenario50
@{BENEFCONTAPJ51}        #cenario51
@{BENEFPOTCAEPF70}       #cenario70
@{BENEFPOTCAEPF71}       #cenario71
@{BENEFPOTCAEPF72}       #cenario72
@{BENEFPOTCAEPF73}       #cenario73
@{BENEFPOTCAEPF74}       #cenario74
@{BENEFPOTCAEPF75}       #cenario75
@{BENEFPOTCAEPF76}       #cenario76
@{BENEFPOTCAEPF77}       #cenario77
@{BENEFCONTACAEPF78}       #cenario78
@{BENEFCONTACAEPF79}       #cenario79
@{BENEFCONTACAEPF80}       #cenario80
@{BENEFCONTACAEPF81}       #cenario81
@{BENEFCONTACAEPF82}       #cenario82
@{BENEFCONTACAEPF83}       #cenario83
@{BENEFCONTACAEPF84}       #cenario84
@{BENEFCONTACAEPF85}       #cenario85

*** Keywords ***
Instanciar Variaveis Beneficiário
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPF01}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPF01}  ${temp}
    Set Global Variable  @{BENEFPOTENCIALPF01}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPF01}  ${temp}
    Append To List  ${BENEFPOTENCIALPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPF01}  ${date}
    Log Many  @{BENEFPOTENCIALPF01}

    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${BENEFPOTENCIALPF01}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${BENEFPOTENCIALPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${BENEFPOTENCIALPF01}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPF01}  ${temp}
    Append To List  ${BENEFPOTENCIALPF01}  Boleto
    Set Global Variable  @{BENEFPOTENCIALPF01}


    #Instanciar Variavel Cliente PF TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPF02}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPF02}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPF02}  ${temp}
    Set Global Variable  @{BENEFPOTENCIALPF02}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPF02}  ${temp}
    Append To List  ${BENEFPOTENCIALPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPF02}  ${date}
    Log Many  @{BENEFPOTENCIALPF02}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${BENEFPOTENCIALPF02}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${BENEFPOTENCIALPF02}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${BENEFPOTENCIALPF02}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPF02}  ${temp}
    Append To List  ${BENEFPOTENCIALPF02}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPF02}  ${nasc}
    Append To List  ${BENEFPOTENCIALPF02}  Titular
    Append To List  ${BENEFPOTENCIALPF02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPF02}  ${temp}
    Append To List  ${BENEFPOTENCIALPF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPF02}  ${conta}
    Append To List  ${BENEFPOTENCIALPF02}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPF02}  CURITIBA
    Append To List  ${BENEFPOTENCIALPF02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${BENEFPOTENCIALPF02}  Residencial
    Append To List  ${BENEFPOTENCIALPF02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPF02}  ${temp}
    Append To List  ${BENEFPOTENCIALPF02}  Celular
    Append To List  ${BENEFPOTENCIALPF02}  69988654869
    Set Global Variable  @{BENEFPOTENCIALPF02}


    #Instanciar Variavel Cliente PF TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPF03}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPF03}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPF03}  ${temp}
    Set Global Variable  @{BENEFPOTENCIALPF03}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPF03}  ${temp}
    Append To List  ${BENEFPOTENCIALPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPF03}  ${date}
    Log Many  @{BENEFPOTENCIALPF03}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${BENEFPOTENCIALPF03}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${BENEFPOTENCIALPF03}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${BENEFPOTENCIALPF03}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPF03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPF03}  ${temp}
    Append To List  ${BENEFPOTENCIALPF03}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPF03}  ${nasc}
    Append To List  ${BENEFPOTENCIALPF03}  Titular
    Append To List  ${BENEFPOTENCIALPF03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPF03}  ${temp}
    Append To List  ${BENEFPOTENCIALPF03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPF03}  ${conta}
    Append To List  ${BENEFPOTENCIALPF03}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPF03}  CURITIBA
    Append To List  ${BENEFPOTENCIALPF03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${BENEFPOTENCIALPF03}  Residencial
    Append To List  ${BENEFPOTENCIALPF03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPF03}  ${temp}
    Append To List  ${BENEFPOTENCIALPF03}  Celular
    Append To List  ${BENEFPOTENCIALPF03}  69988654869
    Set Global Variable  @{BENEFPOTENCIALPF03}


    #Instanciar Variavel Cliente PF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPF04}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPF04}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPF04}  ${temp}
    Set Global Variable  @{BENEFPOTENCIALPF03}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPF04}  ${temp}
    Append To List  ${BENEFPOTENCIALPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPF04}  ${date}
    Log Many  @{BENEFPOTENCIALPF04}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${BENEFPOTENCIALPF04}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${BENEFPOTENCIALPF04}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${BENEFPOTENCIALPF04}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPF04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPF04}  ${temp}
    Append To List  ${BENEFPOTENCIALPF04}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPF04}  ${nasc}
    Append To List  ${BENEFPOTENCIALPF04}  Titular
    Append To List  ${BENEFPOTENCIALPF04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPF04}  ${temp}
    Append To List  ${BENEFPOTENCIALPF04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPF04}  ${conta}
    Append To List  ${BENEFPOTENCIALPF04}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPF04}  CURITIBA - PR
    Append To List  ${BENEFPOTENCIALPF04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${BENEFPOTENCIALPF04}  Residencial
    Append To List  ${BENEFPOTENCIALPF04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPF04}  ${temp}
    Append To List  ${BENEFPOTENCIALPF04}  Celular
    Append To List  ${BENEFPOTENCIALPF04}  69988654869
    #Adicionando para importação: Arg26: Endereco, Arg27: Bairro, Arg28: Cidade, Arg29: UF, Arg30: Pais, 
    #            Arg31: Produto Assitencial,  Arg32: sexo, Arg33: raça, Arg34: Grau de Dependencia, Arg35: tipoEndereco, Arg36: Telefone
    Append To List  ${BENEFPOTENCIALPF04}  rua alberto folloni
    Append To List  ${BENEFPOTENCIALPF04}  ahu
    Append To List  ${BENEFPOTENCIALPF04}  curitiba
    Append To List  ${BENEFPOTENCIALPF04}  PR
    Append To List  ${BENEFPOTENCIALPF04}  brasil
    Append To List  ${BENEFPOTENCIALPF04}  5033
    Append To List  ${BENEFPOTENCIALPF04}  f
    Append To List  ${BENEFPOTENCIALPF04}  1
    Append To List  ${BENEFPOTENCIALPF04}  00
    Append To List  ${BENEFPOTENCIALPF04}  residencial
    Append To List  ${BENEFPOTENCIALPF04}  solteiro
    Append To List  ${BENEFPOTENCIALPF04}  43923328738
    Append To List  ${BENEFPOTENCIALPF04}  Curitiba
    Append To List  ${BENEFPOTENCIALPF04}  PR
    Set Global Variable  @{BENEFPOTENCIALPF04}


    #Instanciar Variavel Cliente PF TR05
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPF05}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPF05}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPF05}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPF05}  ${temp}
    Append To List  ${BENEFPOTENCIALPF05}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPF05}  ${date}
    Log Many  @{BENEFPOTENCIALPF05}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${BENEFPOTENCIALPF05}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${BENEFPOTENCIALPF05}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${BENEFPOTENCIALPF05}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPF05}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPF05}  ${temp}
    Append To List  ${BENEFPOTENCIALPF05}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPF05}  ${nasc}
    Append To List  ${BENEFPOTENCIALPF05}  Titular
    Append To List  ${BENEFPOTENCIALPF05}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPF05}  ${temp}
    Append To List  ${BENEFPOTENCIALPF05}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPF05}  ${conta}
    Append To List  ${BENEFPOTENCIALPF05}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPF05}  CURITIBA
    Append To List  ${BENEFPOTENCIALPF05}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${BENEFPOTENCIALPF05}  Residencial
    Append To List  ${BENEFPOTENCIALPF05}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPF05}  ${temp}
    Append To List  ${BENEFPOTENCIALPF05}  Celular
    Append To List  ${BENEFPOTENCIALPF05}  69988654869
    #Adicionando - Pessoa: Arg26: Tipo
    Append To List  ${BENEFPOTENCIALPF05}  Titular
    Set Global Variable  @{BENEFPOTENCIALPF05}


    #Instanciar Variavel Cliente PF TR006
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPF06}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPF06}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPF06}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPF06}  ${temp}
    Append To List  ${BENEFCONTAPF06}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPF06}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${BENEFCONTAPF06}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${BENEFCONTAPF06}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${BENEFCONTAPF06}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPF06}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPF06}  ${temp}
    Append To List  ${BENEFCONTAPF06}  Boleto
    Set Global Variable  @{BENEFCONTAPF06}


    #Instanciar Variavel Cliente PF TR007
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPF07}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPF07}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPF07}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPF07}  ${temp}
    Append To List  ${BENEFCONTAPF07}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPF07}  ${date}
    Log Many  @{BENEFCONTAPF07}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${BENEFCONTAPF07}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${BENEFCONTAPF07}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${BENEFCONTAPF07}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPF07}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPF07}  ${temp}
    Append To List  ${BENEFCONTAPF07}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPF07}  ${nasc}
    Append To List  ${BENEFCONTAPF07}  Titular
    Append To List  ${BENEFCONTAPF07}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPF07}  ${temp}
    Append To List  ${BENEFCONTAPF07}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPF07}  ${conta}
    Append To List  ${BENEFCONTAPF07}  Solteiro(a)
    Append To List  ${BENEFCONTAPF07}  CURITIBA
    Append To List  ${BENEFCONTAPF07}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${BENEFCONTAPF07}  Residencial
    Append To List  ${BENEFCONTAPF07}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPF07}  ${temp}
    Append To List  ${BENEFCONTAPF07}  Celular
    Append To List  ${BENEFCONTAPF07}  69988654869
    #Adicionando - Pessoa: Arg26: Tipo
    Append To List  ${BENEFCONTAPF07}  Titular
    Set Global Variable  @{BENEFCONTAPF07}


    #Instanciar Variavel Cliente PF TR008
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPF08}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name Male
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPF08}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPF08}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPF08}  ${temp}
    Append To List  ${BENEFCONTAPF08}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPF08}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${BENEFCONTAPF08}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${BENEFCONTAPF08}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${BENEFCONTAPF08}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPF08}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPF08}  ${temp}
    Append To List  ${BENEFCONTAPF08}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPF08}  ${nasc}
    Append To List  ${BENEFCONTAPF08}  Titular
    Append To List  ${BENEFCONTAPF08}  02 - Companheiro(a)
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPF08}  ${temp}
    Append To List  ${BENEFCONTAPF08}  Feminino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPF08}  ${conta}
    Append To List  ${BENEFCONTAPF08}  Solteiro(a)
    Append To List  ${BENEFCONTAPF08}  CURITIBA
    Append To List  ${BENEFCONTAPF08}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${BENEFCONTAPF08}  Residencial
    Append To List  ${BENEFCONTAPF08}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPF08}  ${temp}
    Append To List  ${BENEFCONTAPF08}  Celular
    Append To List  ${BENEFCONTAPF08}  69988654869
    #Adicionando - Pessoa: Arg27: Tipo, Arg28: cpf, Arg29: Nome Beneficiario, Arg30: Estado Civil
    Append To List  ${BENEFCONTAPF08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPF08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPF08}  ${conta}
    Append To List  ${BENEFCONTAPF08}  União Estável
    Set Global Variable  @{BENEFCONTAPF08}


    #Instanciar Variavel Cliente PF TR009
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPF09}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPF09}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPF09}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPF09}  ${temp}
    Append To List  ${BENEFCONTAPF09}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPF09}  ${date}
    Log Many  @{BENEFCONTAPF09}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${BENEFCONTAPF09}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${BENEFCONTAPF09}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${BENEFCONTAPF09}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11 Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPF09}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPF09}  ${temp}
    Append To List  ${BENEFCONTAPF09}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPF09}  ${nasc}
    Append To List  ${BENEFCONTAPF09}  Titular
    Append To List  ${BENEFCONTAPF09}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPF09}  ${temp}
    Append To List  ${BENEFCONTAPF09}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPF09}  ${conta}
    Append To List  ${BENEFCONTAPF09}  Solteiro(a)
    Append To List  ${BENEFCONTAPF09}  CURITIBA - PR
    Append To List  ${BENEFCONTAPF09}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${BENEFCONTAPF09}  Residencial
    Append To List  ${BENEFCONTAPF09}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPF09}  ${temp}
    Append To List  ${BENEFCONTAPF09}  Celular
    Append To List  ${BENEFCONTAPF09}  69988654869
    #Adicionando para importação: Arg26: Endereco, Arg27: Bairro, Arg28: Cidade, Arg29: UF, Arg30: Pais, 
    #            Arg31: Produto Assitencial,  Arg32: sexo, Arg33: raça, Arg34: Grau de Dependencia, Arg35: tipoEndereco, Arg36: Telefone
    Append To List  ${BENEFCONTAPF09}  rua alberto folloni
    Append To List  ${BENEFCONTAPF09}  ahu
    Append To List  ${BENEFCONTAPF09}  curitiba
    Append To List  ${BENEFCONTAPF09}  PR
    Append To List  ${BENEFCONTAPF09}  brasil
    Append To List  ${BENEFCONTAPF09}  5033
    Append To List  ${BENEFCONTAPF09}  f
    Append To List  ${BENEFCONTAPF09}  1
    Append To List  ${BENEFCONTAPF09}  00
    Append To List  ${BENEFCONTAPF09}  residencial
    Append To List  ${BENEFCONTAPF09}  solteiro
    Append To List  ${BENEFCONTAPF09}  43923328738
    Append To List  ${BENEFCONTAPF09}  Curitiba
    Append To List  ${BENEFCONTAPF09}  PR
    Set Global Variable  @{BENEFCONTAPF09}


    #Instanciar Variavel Cliente PF TR010
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPF10}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPF10}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPF10}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPF10}  ${temp}
    Append To List  ${BENEFCONTAPF10}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPF10}  ${date}
    Log Many  @{BENEFCONTAPF10}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${BENEFCONTAPF10}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${BENEFCONTAPF10}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${BENEFCONTAPF10}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPF10}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPF10}  ${temp}
    Append To List  ${BENEFCONTAPF10}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPF10}  ${nasc}
    Append To List  ${BENEFCONTAPF10}  Titular
    Append To List  ${BENEFCONTAPF10}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPF10}  ${temp}
    Append To List  ${BENEFCONTAPF10}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPF10}  ${conta}
    Append To List  ${BENEFCONTAPF10}  Solteiro(a)
    Append To List  ${BENEFCONTAPF10}  CURITIBA
    Append To List  ${BENEFCONTAPF10}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${BENEFCONTAPF10}  Residencial
    Append To List  ${BENEFCONTAPF10}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPF10}  ${temp}
    Append To List  ${BENEFCONTAPF10}  Celular
    Append To List  ${BENEFCONTAPF10}  69988654869
    #Adicionando - Pessoa: Arg26: Tipo
    Append To List  ${BENEFCONTAPF10}  Titular
    Set Global Variable  @{BENEFCONTAPF10}


    #Instanciar Variavel Cliente PF TR011
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCOTACAOPF11}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCOTACAOPF11}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCOTACAOPF11}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCOTACAOPF11}  ${temp}
    Append To List  ${BENEFCOTACAOPF11}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCOTACAOPF11}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${BENEFCOTACAOPF11}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${BENEFCOTACAOPF11}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${BENEFCOTACAOPF11}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCOTACAOPF11}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCOTACAOPF11}  ${temp}
    Append To List  ${BENEFCOTACAOPF11}  Boleto


    #Instanciar Variavel Cliente PF TR012
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCOTACAOPF12}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCOTACAOPF12}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCOTACAOPF12}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCOTACAOPF12}  ${temp}
    Append To List  ${BENEFCOTACAOPF12}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCOTACAOPF12}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${BENEFCOTACAOPF12}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${BENEFCOTACAOPF12}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${BENEFCOTACAOPF12}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCOTACAOPF12}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCOTACAOPF12}  ${temp}
    Append To List  ${BENEFCOTACAOPF12}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCOTACAOPF12}  ${nasc}
    Append To List  ${BENEFCOTACAOPF12}  Titular
    Append To List  ${BENEFCOTACAOPF12}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCOTACAOPF12}  ${temp}
    Append To List  ${BENEFCOTACAOPF12}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCOTACAOPF12}  ${conta}
    Append To List  ${BENEFCOTACAOPF12}  Solteiro(a)
    Append To List  ${BENEFCOTACAOPF12}  CURITIBA
    Append To List  ${BENEFCOTACAOPF12}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${BENEFCOTACAOPF12}  Residencial
    Append To List  ${BENEFCOTACAOPF12}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCOTACAOPF12}  ${temp}
    Append To List  ${BENEFCOTACAOPF12}  Celular
    Append To List  ${BENEFCOTACAOPF12}  69988654869
    #Adicionando - Pessoa: Arg26: Tipo
    Append To List  ${BENEFCOTACAOPF12}  Titular
    Set Global Variable  @{BENEFCOTACAOPF12}

    
    #Instanciar Variavel Cliente PF TR013
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCOTACAOPF13}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name Male
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCOTACAOPF13}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCOTACAOPF13}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCOTACAOPF13}  ${temp}
    Append To List  ${BENEFCOTACAOPF13}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCOTACAOPF13}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${BENEFCOTACAOPF13}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${BENEFCOTACAOPF13}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${BENEFCOTACAOPF13}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCOTACAOPF13}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCOTACAOPF13}  ${temp}
    Append To List  ${BENEFCOTACAOPF13}  Boleto
    #Adicionando: Arg12 Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCOTACAOPF13}  ${nasc}
    Append To List  ${BENEFCOTACAOPF13}  Titular
    Append To List  ${BENEFCOTACAOPF13}  02 - Companheiro(a)
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCOTACAOPF13}  ${temp}
    Append To List  ${BENEFCOTACAOPF13}  Feminino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCOTACAOPF13}  ${conta}
    Append To List  ${BENEFCOTACAOPF13}  Solteiro(a)
    Append To List  ${BENEFCOTACAOPF13}  CURITIBA
    Append To List  ${BENEFCOTACAOPF13}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${BENEFCOTACAOPF13}  Residencial
    Append To List  ${BENEFCOTACAOPF13}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCOTACAOPF13}  ${temp}
    Append To List  ${BENEFCOTACAOPF13}  Celular
    Append To List  ${BENEFCOTACAOPF13}  69988654869
    #Adicionando - Pessoa: Arg26: Tipo, Arg27: cpf, Arg28: Nome Beneficiario, Arg29: Estado Civil
    Append To List  ${BENEFCOTACAOPF13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCOTACAOPF13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCOTACAOPF13}  ${conta}
    Append To List  ${BENEFCOTACAOPF13}  União Estável
    Set Global Variable  @{BENEFCOTACAOPF13}


    #Instanciar Variavel Cliente PF TR014
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCOTACAOPF14}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCOTACAOPF14}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCOTACAOPF14}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCOTACAOPF14}  ${temp}
    Append To List  ${BENEFCOTACAOPF14}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCOTACAOPF14}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${BENEFCOTACAOPF14}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${BENEFCOTACAOPF14}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${BENEFCOTACAOPF14}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCOTACAOPF14}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCOTACAOPF14}  ${temp}
    Append To List  ${BENEFCOTACAOPF14}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCOTACAOPF14}  ${nasc}
    Append To List  ${BENEFCOTACAOPF14}  Titular
    Append To List  ${BENEFCOTACAOPF14}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCOTACAOPF14}  ${temp}
    Append To List  ${BENEFCOTACAOPF14}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCOTACAOPF14}  ${conta}
    Append To List  ${BENEFCOTACAOPF14}  Solteiro(a)
    Append To List  ${BENEFCOTACAOPF14}  CURITIBA - PR
    Append To List  ${BENEFCOTACAOPF14}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${BENEFCOTACAOPF14}  Residencial
    Append To List  ${BENEFCOTACAOPF14}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCOTACAOPF14}  ${temp}
    Append To List  ${BENEFCOTACAOPF14}  Celular
    Append To List  ${BENEFCOTACAOPF14}  69988654869
    #Adicionando para importação: Arg26: Endereco, Arg27: Bairro, Arg28: Cidade, Arg29: UF, Arg30: Pais, 
    #            Arg31: Produto Assitencial,  Arg32: sexo, Arg33: raça, Arg34: Grau de Dependencia, Arg35: tipoEndereco, Arg36: Telefone
    Append To List  ${BENEFCOTACAOPF14}  rua alberto folloni
    Append To List  ${BENEFCOTACAOPF14}  ahu
    Append To List  ${BENEFCOTACAOPF14}  curitiba
    Append To List  ${BENEFCOTACAOPF14}  PR
    Append To List  ${BENEFCOTACAOPF14}  brasil
    Append To List  ${BENEFCOTACAOPF14}  5033
    Append To List  ${BENEFCOTACAOPF14}  f
    Append To List  ${BENEFCOTACAOPF14}  1
    Append To List  ${BENEFCOTACAOPF14}  00
    Append To List  ${BENEFCOTACAOPF14}  residencial
    Append To List  ${BENEFCOTACAOPF14}  solteiro
    Append To List  ${BENEFCOTACAOPF14}  43923328738
    Append To List  ${BENEFCOTACAOPF14}  Curitiba
    Append To List  ${BENEFCOTACAOPF14}  PR
    Set Global Variable  @{BENEFCOTACAOPF14}


    #Instanciar Variavel Cliente PF TR015
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCOTACAOPF15}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCOTACAOPF15}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCOTACAOPF15}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCOTACAOPF15}  ${temp}
    Append To List  ${BENEFCOTACAOPF15}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCOTACAOPF15}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${BENEFCOTACAOPF15}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${BENEFCOTACAOPF15}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${BENEFCOTACAOPF15}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCOTACAOPF15}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCOTACAOPF15}  ${temp}
    Append To List  ${BENEFCOTACAOPF15}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCOTACAOPF15}  ${nasc}
    Append To List  ${BENEFCOTACAOPF15}  Titular
    Append To List  ${BENEFCOTACAOPF15}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCOTACAOPF15}  ${temp}
    Append To List  ${BENEFCOTACAOPF15}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCOTACAOPF15}  ${conta}
    Append To List  ${BENEFCOTACAOPF15}  Solteiro(a)
    Append To List  ${BENEFCOTACAOPF15}  CURITIBA
    Append To List  ${BENEFCOTACAOPF15}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${BENEFCOTACAOPF15}  Residencial
    Append To List  ${BENEFCOTACAOPF15}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCOTACAOPF15}  ${temp}
    Append To List  ${BENEFCOTACAOPF15}  Celular
    Append To List  ${BENEFCOTACAOPF15}  69988654869
    #Adicionando - Pessoa: Arg26: Tipo
    Append To List  ${BENEFCOTACAOPF15}  Titular


    #Instanciar Variavel Cliente PJ TR016
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ16}  Pessoa Jurídica (CNPJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Remover Caracteres Especiais  ${temp}
    Append To List  ${BENEFPOTENCIALPJ16}  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ16}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ16}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPJ16}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ16}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ16}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ16}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ16}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ16}  Concluído e Aceito
    #Append To List  ${COTPOTENCIALPJ14}  Convênio LEW
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ16}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ16}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ16}  Boleto
    #Adicionando: Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ16}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ16}  Titular
    Append To List  ${BENEFPOTENCIALPJ16}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ16}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ16}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ16}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ16}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ16}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ16}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ16}  Residencial
    Append To List  ${BENEFPOTENCIALPJ16}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ16}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ16}  Celular
    Append To List  ${BENEFPOTENCIALPJ16}  69988654869
    #Adicionando - Pessoa: Arg27: Tipo, Arg28: Segundo Produto Assistencial
    Append To List  ${BENEFPOTENCIALPJ16}  Titular
    Append To List  ${BENEFPOTENCIALPJ16}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}


    #Instanciar Variavel Cliente PJ TR017
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ17}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    Append To List  ${BENEFPOTENCIALPJ17}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ17}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ17}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPJ17}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ17}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ17}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ17}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ17}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ17}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ17}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ17}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ17}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ17}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ17}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ17}  Titular
    Append To List  ${BENEFPOTENCIALPJ17}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ17}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ17}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ17}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ17}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ17}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ17}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ17}  Residencial
    Append To List  ${BENEFPOTENCIALPJ17}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ17}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ17}  Celular
    Append To List  ${BENEFPOTENCIALPJ17}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data admissao
    Append To List  ${BENEFPOTENCIALPJ17}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFPOTENCIALPJ17}  02/08/2015


    #Instanciar Variavel Cliente PJ TR018
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ18}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    Append To List  ${BENEFPOTENCIALPJ18}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ18}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ18}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPJ18}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ18}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ18}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ18}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ18}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ18}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ18}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ18}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ18}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ18}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ18}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ18}  Titular
    Append To List  ${BENEFPOTENCIALPJ18}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ18}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ18}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ18}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ18}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ18}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ18}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ18}  Residencial
    Append To List  ${BENEFPOTENCIALPJ18}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ18}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ18}  Celular
    Append To List  ${BENEFPOTENCIALPJ18}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFPOTENCIALPJ18}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFPOTENCIALPJ18}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTENCIALPJ18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ18}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ18}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ18}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ18}  ${nasc}


    #Instanciar Variavel Cliente PJ TR019
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ19}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ19}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ19}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ19}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPJ19}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ19}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ19}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ19}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ19}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ19}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ19}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ19}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ19}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ19}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ19}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ19}  Titular
    Append To List  ${BENEFPOTENCIALPJ19}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ19}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ19}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ19}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ19}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ19}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ19}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ19}  Residencial
    Append To List  ${BENEFPOTENCIALPJ19}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ19}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ19}  Celular
    Append To List  ${BENEFPOTENCIALPJ19}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFPOTENCIALPJ19}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFPOTENCIALPJ19}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTENCIALPJ19}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ19}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ19}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ19}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ19}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ19}  ${nasc}

    #Instanciar Variavel Cliente PJ TR020
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ20}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ20}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ20}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ20}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPJ20}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ20}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ20}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ20}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ20}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ20}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ20}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ20}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ20}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ20}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ20}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ20}  Titular
    Append To List  ${BENEFPOTENCIALPJ20}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ20}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ20}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ20}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ20}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ20}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ20}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ20}  Residencial
    Append To List  ${BENEFPOTENCIALPJ20}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ20}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ20}  Celular
    Append To List  ${BENEFPOTENCIALPJ20}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFPOTENCIALPJ20}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFPOTENCIALPJ20}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFPOTENCIALPJ20}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ20}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ20}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ20}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ20}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ20}  ${nasc}
    #Adicionando para importação: Arg35: Endereco, Arg36: Bairro, Arg37: Cidade, Arg38: UF, Arg39: Pais, 
    #            Arg40: Produto Assitencial,  Arg41: sexo, Arg42: raça, Arg43: Grau de Dependencia, Arg44: tipoEndereco, Arg45: Telefone
    Append To List  ${BENEFPOTENCIALPJ20}  rua alberto folloni
    Append To List  ${BENEFPOTENCIALPJ20}  ahu
    Append To List  ${BENEFPOTENCIALPJ20}  curitiba
    Append To List  ${BENEFPOTENCIALPJ20}  PR
    Append To List  ${BENEFPOTENCIALPJ20}  brasil
    Append To List  ${BENEFPOTENCIALPJ20}  5073
    Append To List  ${BENEFPOTENCIALPJ20}  f
    Append To List  ${BENEFPOTENCIALPJ20}  1
    Append To List  ${BENEFPOTENCIALPJ20}  00
    Append To List  ${BENEFPOTENCIALPJ20}  residencial
    Append To List  ${BENEFPOTENCIALPJ20}  solteiro
    Append To List  ${BENEFPOTENCIALPJ20}  43923328738
    Append To List  ${BENEFPOTENCIALPJ20}  Curitiba
    Append To List  ${BENEFPOTENCIALPJ20}  PR


    #Instanciar Variavel Cliente PJ TR021
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ21}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ21}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ21}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ21}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPJ21}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ21}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ21}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ21}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ21}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ21}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ21}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ21}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ21}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ21}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ21}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ21}  Titular
    Append To List  ${BENEFPOTENCIALPJ21}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ21}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ21}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ21}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ21}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ21}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ21}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ21}  Residencial
    Append To List  ${BENEFPOTENCIALPJ21}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ21}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ21}  Celular
    Append To List  ${BENEFPOTENCIALPJ21}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFPOTENCIALPJ21}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFPOTENCIALPJ21}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTENCIALPJ21}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ21}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ21}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ21}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ21}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ21}  ${nasc}


    #Instanciar Variavel Cliente PJ TR022
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ22}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ22}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ22}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ22}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${BENEFPOTENCIALPJ22}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ22}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ22}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ22}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ22}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ22}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ22}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ22}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ22}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ22}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ22}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ22}  Titular
    Append To List  ${BENEFPOTENCIALPJ22}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ22}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ22}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ22}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ22}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ22}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ22}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ22}  Residencial
    Append To List  ${BENEFPOTENCIALPJ22}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ22}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ22}  Celular
    Append To List  ${BENEFPOTENCIALPJ22}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa

    Append To List  ${BENEFPOTENCIALPJ22}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    #Append To List  ${BENEFPOTENCIALPJ22}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFPOTENCIALPJ22}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTENCIALPJ22}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ22}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ22}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ22}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ22}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ22}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ22}  desconto
    Append To List  ${BENEFPOTENCIALPJ22}  30
    Append To List  ${BENEFPOTENCIALPJ22}  acrescimo
    Append To List  ${BENEFPOTENCIALPJ22}  20


    #Instanciar Variavel Cliente PJ TR023
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ23}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ23}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ23}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ23}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${BENEFPOTENCIALPJ23}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ23}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ23}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ23}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ23}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ23}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ23}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ23}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ23}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ23}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ23}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ23}  Titular
    Append To List  ${BENEFPOTENCIALPJ23}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ23}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ23}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ23}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ23}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ23}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ23}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ23}  Residencial
    Append To List  ${BENEFPOTENCIALPJ23}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ23}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ23}  Celular
    Append To List  ${BENEFPOTENCIALPJ23}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFPOTENCIALPJ23}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFPOTENCIALPJ23}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTENCIALPJ23}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ23}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ23}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ23}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ23}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ23}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ23}  desconto
    Append To List  ${BENEFPOTENCIALPJ23}  50
    Append To List  ${BENEFPOTENCIALPJ23}  acrescimo
    Append To List  ${BENEFPOTENCIALPJ23}  20


    #Instanciar Variavel Cliente PJ TR024
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ24}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ24}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ24}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ24}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${BENEFPOTENCIALPJ24}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ24}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ24}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ24}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ24}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ24}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ24}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ24}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ24}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ24}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ24}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ24}  Titular
    Append To List  ${BENEFPOTENCIALPJ24}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ24}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ24}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ24}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ24}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ24}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ24}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ24}  Residencial
    Append To List  ${BENEFPOTENCIALPJ24}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ24}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ24}  Celular
    Append To List  ${BENEFPOTENCIALPJ24}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFPOTENCIALPJ24}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFPOTENCIALPJ24}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTENCIALPJ24}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ24}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ24}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ24}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ24}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ24}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${BENEFPOTENCIALPJ24}  desconto
    Append To List  ${BENEFPOTENCIALPJ24}  50
    Append To List  ${BENEFPOTENCIALPJ24}  acrescimo
    Append To List  ${BENEFPOTENCIALPJ24}  20


    #Instanciar Variavel Cliente PJ TR025
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ25}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ25}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ25}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ25}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${BENEFPOTENCIALPJ25}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ25}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ25}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ25}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ25}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ25}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ25}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ25}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ25}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ25}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ25}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ25}  Titular
    Append To List  ${BENEFPOTENCIALPJ25}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ25}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ25}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ25}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ25}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ25}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ25}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ25}  Residencial
    Append To List  ${BENEFPOTENCIALPJ25}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ25}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ25}  Celular
    Append To List  ${BENEFPOTENCIALPJ25}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFPOTENCIALPJ25}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFPOTENCIALPJ25}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTENCIALPJ25}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ25}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ25}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ25}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ25}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ25}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${BENEFPOTENCIALPJ25}  desconto
    Append To List  ${BENEFPOTENCIALPJ25}  50
    Append To List  ${BENEFPOTENCIALPJ25}  acrescimo
    Append To List  ${BENEFPOTENCIALPJ25}  20
    #Adicionando - Dependente: Arg40: Tipo, Arg41: cpf, Arg42: Nome Beneficiario, Arg43: Estado Civil, Arg44: Grau Dependencia, Arg45: Data Nascimento Dependente, Arg46: CNS
    Append To List  ${BENEFPOTENCIALPJ25}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ25}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ25}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ25}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ25}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ25}  ${nasc}
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ25}  ${temp}
    

    #Instanciar Variavel Cliente PJ TR026
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ26}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ26}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ26}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ26}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPJ26}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ26}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ26}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ26}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ26}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ26}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ26}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ26}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ26}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ26}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ26}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ26}  Titular
    Append To List  ${BENEFPOTENCIALPJ26}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ26}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ26}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ26}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ26}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ26}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ26}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ26}  Residencial
    Append To List  ${BENEFPOTENCIALPJ26}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ26}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ26}  Celular
    Append To List  ${BENEFPOTENCIALPJ26}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFPOTENCIALPJ26}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFPOTENCIALPJ26}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFPOTENCIALPJ26}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ26}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ26}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ26}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ26}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ26}  ${nasc}
    #Adicionando para importação: Arg35: Endereco, Arg36: Bairro, Arg37: Cidade, Arg38: UF, Arg39: Pais, 
    #            Arg40: Produto Assitencial,  Arg41: sexo, Arg42: raça, Arg43: Grau de Dependencia, Arg44: tipoEndereco, Arg45: Telefone
    Append To List  ${BENEFPOTENCIALPJ26}  rua alberto folloni
    Append To List  ${BENEFPOTENCIALPJ26}  ahu
    Append To List  ${BENEFPOTENCIALPJ26}  curitiba
    Append To List  ${BENEFPOTENCIALPJ26}  PR
    Append To List  ${BENEFPOTENCIALPJ26}  brasil
    Append To List  ${BENEFPOTENCIALPJ26}  5072
    Append To List  ${BENEFPOTENCIALPJ26}  f
    Append To List  ${BENEFPOTENCIALPJ26}  1
    Append To List  ${BENEFPOTENCIALPJ26}  00
    Append To List  ${BENEFPOTENCIALPJ26}  residencial
    Append To List  ${BENEFPOTENCIALPJ26}  solteiro
    Append To List  ${BENEFPOTENCIALPJ26}  43923328738
    Append To List  ${BENEFPOTENCIALPJ26}  Curitiba
    Append To List  ${BENEFPOTENCIALPJ26}  PR


    #Instanciar Variavel Cliente PJ TR027
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ27}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ27}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ27}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ27}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPJ27}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ27}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ27}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ27}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ27}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ27}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ27}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ27}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ27}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ27}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ27}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ27}  Titular
    Append To List  ${BENEFPOTENCIALPJ27}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ27}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ27}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ27}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ27}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ27}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ27}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ27}  Residencial
    Append To List  ${BENEFPOTENCIALPJ27}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ27}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ27}  Celular
    Append To List  ${BENEFPOTENCIALPJ27}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFPOTENCIALPJ27}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    #Append To List  ${BENEFPOTENCIALPJ27}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFPOTENCIALPJ27}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTENCIALPJ27}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ27}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ27}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ27}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ27}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ27}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${BENEFPOTENCIALPJ27}  desconto
    Append To List  ${BENEFPOTENCIALPJ27}  30
    Append To List  ${BENEFPOTENCIALPJ27}  acrescimo
    Append To List  ${BENEFPOTENCIALPJ27}  20


    #Instanciar Variavel Cliente PJ TR028
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ28}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ28}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ28}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ28}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPJ28}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ28}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ28}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ28}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ28}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ28}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ28}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ28}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ28}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ28}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ28}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ28}  Titular
    Append To List  ${BENEFPOTENCIALPJ28}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ28}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ28}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ28}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ28}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ28}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ28}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ28}  Residencial
    Append To List  ${BENEFPOTENCIALPJ28}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ28}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ28}  Celular
    Append To List  ${BENEFPOTENCIALPJ28}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFPOTENCIALPJ28}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFPOTENCIALPJ28}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFPOTENCIALPJ28}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTENCIALPJ28}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ28}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ28}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ28}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ28}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ28}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${BENEFPOTENCIALPJ28}  desconto
    Append To List  ${BENEFPOTENCIALPJ28}  30
    Append To List  ${BENEFPOTENCIALPJ28}  acrescimo
    Append To List  ${BENEFPOTENCIALPJ28}  20


    #Instanciar Variavel Cliente PJ TR029
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ29}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ29}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ29}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ29}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPJ29}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ29}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ29}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ29}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ29}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ29}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ29}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ29}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ29}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ29}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ29}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ29}  Titular
    Append To List  ${BENEFPOTENCIALPJ29}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ29}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ29}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ29}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ29}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ29}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ29}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ29}  Residencial
    Append To List  ${BENEFPOTENCIALPJ29}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ29}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ29}  Celular
    Append To List  ${BENEFPOTENCIALPJ29}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFPOTENCIALPJ29}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFPOTENCIALPJ29}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFPOTENCIALPJ29}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTENCIALPJ29}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ29}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ29}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ29}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ29}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ29}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${BENEFPOTENCIALPJ29}  desconto
    Append To List  ${BENEFPOTENCIALPJ29}  30
    Append To List  ${BENEFPOTENCIALPJ29}  acrescimo
    Append To List  ${BENEFPOTENCIALPJ29}  20


    #Instanciar Variavel Cliente PJ TR030
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ30}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ30}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ30}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ30}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPJ30}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ30}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ30}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ30}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ30}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ30}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ30}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ30}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ30}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ30}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ30}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ30}  Titular
    Append To List  ${BENEFPOTENCIALPJ30}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ30}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ30}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ30}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ30}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ30}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ30}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ30}  Residencial
    Append To List  ${BENEFPOTENCIALPJ30}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ30}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ30}  Celular
    Append To List  ${BENEFPOTENCIALPJ30}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFPOTENCIALPJ30}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFPOTENCIALPJ30}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFPOTENCIALPJ30}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTENCIALPJ30}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ30}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ30}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ30}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ30}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ30}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${BENEFPOTENCIALPJ30}  desconto
    Append To List  ${BENEFPOTENCIALPJ30}  30
    Append To List  ${BENEFPOTENCIALPJ30}  acrescimo
    Append To List  ${BENEFPOTENCIALPJ30}  20


    #Instanciar Variavel Cliente PJ TR031
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ31}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ31}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ31}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ31}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${BENEFPOTENCIALPJ31}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ31}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ31}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ31}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ31}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ31}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ31}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ31}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ31}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ31}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ31}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ31}  Titular
    Append To List  ${BENEFPOTENCIALPJ31}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ31}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ31}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ31}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ31}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ31}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ31}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ31}  Residencial
    Append To List  ${BENEFPOTENCIALPJ31}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ31}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ31}  Celular
    Append To List  ${BENEFPOTENCIALPJ31}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFPOTENCIALPJ31}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFPOTENCIALPJ31}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFPOTENCIALPJ31}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTENCIALPJ31}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ31}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ31}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ31}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ31}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ31}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${BENEFPOTENCIALPJ31}  desconto
    Append To List  ${BENEFPOTENCIALPJ31}  30
    Append To List  ${BENEFPOTENCIALPJ31}  acrescimo
    Append To List  ${BENEFPOTENCIALPJ31}  20
    #Adicionando - Dependente: Arg40: Tipo, Arg41: cpf, Arg42: Nome Beneficiario, Arg43: Estado Civil, Arg44: Grau Dependencia, Arg45: Data Nascimento Dependente, Arg46: CNS
    Append To List  ${BENEFPOTENCIALPJ31}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ31}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ31}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ31}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ31}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ31}  ${nasc}
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ31}  ${temp}


    #Instanciar Variavel Cliente PJ TR032
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ32}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ32}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ32}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ32}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${BENEFPOTENCIALPJ32}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ32}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ32}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ32}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ32}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ32}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ32}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ32}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ32}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ32}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ32}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ32}  Titular
    Append To List  ${BENEFPOTENCIALPJ32}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ32}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ32}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ32}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ32}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ32}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ32}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ32}  Residencial
    Append To List  ${BENEFPOTENCIALPJ32}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ32}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ32}  Celular
    Append To List  ${BENEFPOTENCIALPJ32}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFPOTENCIALPJ32}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFPOTENCIALPJ32}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFPOTENCIALPJ32}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTENCIALPJ32}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ32}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ32}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ32}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ32}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ32}  ${nasc}
    #Adicionando para importação: Arg36: Endereco, Arg37: Bairro, Arg38: Cidade, Arg39: UF, Arg40: Pais, 
    #            Arg41: Produto Assitencial,  Arg42: sexo, Arg43: raça, Arg44: Grau de Dependencia, Arg45: tipoEndereco,
    #            Arg46: estado Civil, Arg47: Telefone,  Arg48: naturalidadeCidade, Arg49:  naturalidadeEstado
    Append To List  ${BENEFPOTENCIALPJ32}  rua alberto folloni
    Append To List  ${BENEFPOTENCIALPJ32}  ahu
    Append To List  ${BENEFPOTENCIALPJ32}  curitiba
    Append To List  ${BENEFPOTENCIALPJ32}  PR
    Append To List  ${BENEFPOTENCIALPJ32}  brasil
    Append To List  ${BENEFPOTENCIALPJ32}  5072
    Append To List  ${BENEFPOTENCIALPJ32}  f
    Append To List  ${BENEFPOTENCIALPJ32}  1
    Append To List  ${BENEFPOTENCIALPJ32}  00
    Append To List  ${BENEFPOTENCIALPJ32}  residencial
    Append To List  ${BENEFPOTENCIALPJ32}  solteiro
    Append To List  ${BENEFPOTENCIALPJ32}  43923328738
    Append To List  ${BENEFPOTENCIALPJ32}  Curitiba
    Append To List  ${BENEFPOTENCIALPJ32}  PR
    #Adicionando - Desconto e Acrescimo: Arg50: Tipo negociação, Arg51: Valor, Arg52: Tipo negociação, Arg53: Valor
    Append To List  ${BENEFPOTENCIALPJ32}  desconto
    Append To List  ${BENEFPOTENCIALPJ32}  30
    Append To List  ${BENEFPOTENCIALPJ32}  acrescimo
    Append To List  ${BENEFPOTENCIALPJ32}  20


    #Instanciar Variavel Cliente PJ TR033
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTENCIALPJ33}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ33}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTENCIALPJ33}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFPOTENCIALPJ33}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTENCIALPJ33}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ33}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ33}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTENCIALPJ33}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTENCIALPJ33}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTENCIALPJ33}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTENCIALPJ33}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTENCIALPJ33}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ33}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ33}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ33}  ${nasc}
    Append To List  ${BENEFPOTENCIALPJ33}  Titular
    Append To List  ${BENEFPOTENCIALPJ33}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe,20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTENCIALPJ33}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ33}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ33}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ33}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ33}  CURITIBA
    Append To List  ${BENEFPOTENCIALPJ33}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTENCIALPJ33}  Residencial
    Append To List  ${BENEFPOTENCIALPJ33}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTENCIALPJ33}  ${temp}
    Append To List  ${BENEFPOTENCIALPJ33}  Celular
    Append To List  ${BENEFPOTENCIALPJ33}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFPOTENCIALPJ33}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFPOTENCIALPJ33}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFPOTENCIALPJ33}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTENCIALPJ33}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTENCIALPJ33}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTENCIALPJ33}  ${conta}
    Append To List  ${BENEFPOTENCIALPJ33}  Solteiro(a)
    Append To List  ${BENEFPOTENCIALPJ33}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTENCIALPJ33}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${BENEFPOTENCIALPJ33}  desconto
    Append To List  ${BENEFPOTENCIALPJ33}  30
    Append To List  ${BENEFPOTENCIALPJ33}  acrescimo
    Append To List  ${BENEFPOTENCIALPJ33}  20


    #Instanciar Variavel Cliente PJ TR034
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ34}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${num}            Evaluate  random.randint(1, 5000)
    ${company}        Catenate  ${company}  ${num}
    Append To List  ${BENEFCONTAPJ34}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ34}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ34}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ34}  ${temp}
    Append To List  ${BENEFCONTAPJ34}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ34}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ34}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ34}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ34}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ34}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ34}  ${temp}
    Append To List  ${BENEFCONTAPJ34}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ34}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ34}  ${nasc}
    Append To List  ${BENEFCONTAPJ34}  Titular
    Append To List  ${BENEFCONTAPJ34}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ34}  ${temp}
    Append To List  ${BENEFCONTAPJ34}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ34}  ${conta}
    Append To List  ${BENEFCONTAPJ34}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ34}  CURITIBA
    Append To List  ${BENEFCONTAPJ34}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTAPJ34}  Residencial
    Append To List  ${BENEFCONTAPJ34}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ34}  ${temp}
    Append To List  ${BENEFCONTAPJ34}  Celular
    Append To List  ${BENEFCONTAPJ34}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ34}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFCONTAPJ34}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ34}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ34}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ34}  ${conta}
    Append To List  ${BENEFCONTAPJ34}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ34}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ34}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTAPJ34}  desconto
    Append To List  ${BENEFCONTAPJ34}  30
    Append To List  ${BENEFCONTAPJ34}  acrescimo
    Append To List  ${BENEFCONTAPJ34}  20


    #Instanciar Variavel Cliente PJ TR035
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ35}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${num}            Evaluate  random.randint(1, 5000)
    ${company}        Catenate  ${company}  ${num}
    Append To List  ${BENEFCONTAPJ35}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ35}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ35}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ35}  ${temp}
    Append To List  ${BENEFCONTAPJ35}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ35}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ35}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ35}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ35}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ35}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ35}  ${temp}
    Append To List  ${BENEFCONTAPJ35}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ35}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ35}  ${nasc}
    Append To List  ${BENEFCONTAPJ35}  Titular
    Append To List  ${BENEFCONTAPJ35}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ35}  ${temp}
    Append To List  ${BENEFCONTAPJ35}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ35}  ${conta}
    Append To List  ${BENEFCONTAPJ35}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ35}  CURITIBA
    Append To List  ${BENEFCONTAPJ35}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTAPJ35}  Residencial
    Append To List  ${BENEFCONTAPJ35}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ35}  ${temp}
    Append To List  ${BENEFCONTAPJ35}  Celular
    Append To List  ${BENEFCONTAPJ35}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ35}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFCONTAPJ35}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ35}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ35}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ35}  ${conta}
    Append To List  ${BENEFCONTAPJ35}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ35}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ35}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTAPJ35}  desconto
    Append To List  ${BENEFCONTAPJ35}  30
    Append To List  ${BENEFCONTAPJ35}  acrescimo
    Append To List  ${BENEFCONTAPJ35}  20


    #Instanciar Variavel Cliente PJ TR036
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ36}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${num}            Evaluate  random.randint(1, 5000)
    ${company}        Catenate  ${company}  ${num}
    Append To List  ${BENEFCONTAPJ36}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ36}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ36}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ36}  ${temp}
    Append To List  ${BENEFCONTAPJ36}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ36}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ36}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ36}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ36}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ36}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ36}  ${temp}
    Append To List  ${BENEFCONTAPJ36}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ36}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ36}  ${nasc}
    Append To List  ${BENEFCONTAPJ36}  Titular
    Append To List  ${BENEFCONTAPJ36}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ36}  ${temp}
    Append To List  ${BENEFCONTAPJ36}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ36}  ${conta}
    Append To List  ${BENEFCONTAPJ36}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ36}  CURITIBA
    Append To List  ${BENEFCONTAPJ36}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTAPJ36}  Residencial
    Append To List  ${BENEFCONTAPJ36}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ36}  ${temp}
    Append To List  ${BENEFCONTAPJ36}  Celular
    Append To List  ${BENEFCONTAPJ36}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ36}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFCONTAPJ36}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ36}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ36}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ36}  ${conta}
    Append To List  ${BENEFCONTAPJ36}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ36}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ36}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTAPJ36}  desconto
    Append To List  ${BENEFCONTAPJ36}  30
    Append To List  ${BENEFCONTAPJ36}  acrescimo
    Append To List  ${BENEFCONTAPJ36}  20


    #Instanciar Variavel Cliente PJ TR037
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ37}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ37}  ${company}
    Append To List  ${BENEFCONTAPJ37}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ37}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ37}  ${temp}
    Append To List  ${BENEFCONTAPJ37}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ37}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ37}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ37}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ37}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ37}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ37}  ${temp}
    Append To List  ${BENEFCONTAPJ37}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ37}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ37}  ${nasc}
    Append To List  ${BENEFCONTAPJ37}  Titular
    Append To List  ${BENEFCONTAPJ37}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ37}  ${temp}
    Append To List  ${BENEFCONTAPJ37}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ37}  ${conta}
    Append To List  ${BENEFCONTAPJ37}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ37}  CURITIBA
    Append To List  ${BENEFCONTAPJ37}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFCONTAPJ37}  Residencial
    Append To List  ${BENEFCONTAPJ37}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ37}  ${temp}
    Append To List  ${BENEFCONTAPJ37}  Celular
    Append To List  ${BENEFCONTAPJ37}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ37}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFCONTAPJ37}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ37}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ37}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ37}  ${conta}
    Append To List  ${BENEFCONTAPJ37}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ37}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ37}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${BENEFCONTAPJ37}  desconto
    Append To List  ${BENEFCONTAPJ37}  30
    Append To List  ${BENEFCONTAPJ37}  acrescimo
    Append To List  ${BENEFCONTAPJ37}  20
    #Adicionando - Segundo Titular: Arg40: Tipo, Arg41: cpf, Arg42: Nome Beneficiario, Arg43: Estado Civil, Arg44: Grau Dependencia, Arg45: Data Nascimento Dependente, Arg46: CNS
    Append To List  ${BENEFCONTAPJ37}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ37}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ37}  ${conta}
    Append To List  ${BENEFCONTAPJ37}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ37}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ37}  ${nasc}
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ37}  ${temp}


    #Instanciar Variavel Cliente PJ TR038
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ38}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ38}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ38}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ38}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  Evaluate  random.randint(1, 9)
    Append To List  ${BENEFCONTAPJ38}  ${temp}
    Append To List  ${BENEFCONTAPJ38}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ38}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ38}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ38}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ38}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ38}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ38}  ${temp}
    Append To List  ${BENEFCONTAPJ38}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ38}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ38}  ${nasc}
    Append To List  ${BENEFCONTAPJ38}  Titular
    Append To List  ${BENEFCONTAPJ38}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ38}  ${temp}
    Append To List  ${BENEFCONTAPJ38}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ38}  ${conta}
    Append To List  ${BENEFCONTAPJ38}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ38}  CURITIBA
    Append To List  ${BENEFCONTAPJ38}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTAPJ38}  Residencial
    Append To List  ${BENEFCONTAPJ38}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ38}  ${temp}
    Append To List  ${BENEFCONTAPJ38}  Celular
    Append To List  ${BENEFCONTAPJ38}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ38}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFCONTAPJ38}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ38}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ38}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ38}  ${conta}
    Append To List  ${BENEFCONTAPJ38}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ38}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ38}  ${nasc}
    #Adicionando para importação: Arg35: Endereco, Arg36: Bairro, Arg37: Cidade, Arg38: UF, Arg39: Pais, 
    #            Arg40: Produto Assitencial,  Arg41: sexo, Arg42: raça, Arg43: Grau de Dependencia, Arg44: tipoEndereco,
    #            Arg45: estado Civil, Arg46: Telefone,  Arg47: naturalidadeCidade, Arg48:  naturalidadeEstado
    Append To List  ${BENEFCONTAPJ38}  rua alberto folloni
    Append To List  ${BENEFCONTAPJ38}  ahu
    Append To List  ${BENEFCONTAPJ38}  curitiba
    Append To List  ${BENEFCONTAPJ38}  PR
    Append To List  ${BENEFCONTAPJ38}  brasil
    Append To List  ${BENEFCONTAPJ38}  5072
    Append To List  ${BENEFCONTAPJ38}  f
    Append To List  ${BENEFCONTAPJ38}  1
    Append To List  ${BENEFCONTAPJ38}  00
    Append To List  ${BENEFCONTAPJ38}  residencial
    Append To List  ${BENEFCONTAPJ38}  solteiro
    Append To List  ${BENEFCONTAPJ38}  43923328738
    Append To List  ${BENEFCONTAPJ38}  Curitiba
    Append To List  ${BENEFCONTAPJ38}  PR
    #Adicionando - Desconto e Acrescimo: Arg49: Tipo negociação, Arg50: Valor, Arg51: Tipo negociação, Arg52: Valor
    Append To List  ${BENEFCONTAPJ38}  desconto
    Append To List  ${BENEFCONTAPJ38}  30
    Append To List  ${BENEFCONTAPJ38}  acrescimo
    Append To List  ${BENEFCONTAPJ38}  20


    #Instanciar Variavel Cliente PJ TR039
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ39}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ39}  ${company}
    Append To List  ${BENEFCONTAPJ39}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ39}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ39}  ${temp}
    Append To List  ${BENEFCONTAPJ39}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ39}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ39}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ39}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ39}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ39}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ39}  ${temp}
    Append To List  ${BENEFCONTAPJ39}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ39}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ39}  ${nasc}
    Append To List  ${BENEFCONTAPJ39}  Titular
    Append To List  ${BENEFCONTAPJ39}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ39}  ${temp}
    Append To List  ${BENEFCONTAPJ39}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ39}  ${conta}
    Append To List  ${BENEFCONTAPJ39}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ39}  CURITIBA
    Append To List  ${BENEFCONTAPJ39}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTAPJ39}  Residencial
    Append To List  ${BENEFCONTAPJ39}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ39}  ${temp}
    Append To List  ${BENEFCONTAPJ39}  Celular
    Append To List  ${BENEFCONTAPJ39}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ39}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFCONTAPJ39}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ39}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ39}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ39}  ${conta}
    Append To List  ${BENEFCONTAPJ39}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ39}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ39}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTAPJ39}  desconto
    Append To List  ${BENEFCONTAPJ39}  30
    Append To List  ${BENEFCONTAPJ39}  acrescimo
    Append To List  ${BENEFCONTAPJ39}  20


    #Instanciar Variavel Cliente PJ TR040
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ40}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ40}  ${company}
    Append To List  ${BENEFCONTAPJ40}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ40}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ40}  ${temp}
    Append To List  ${BENEFCONTAPJ40}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ40}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ40}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ40}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ40}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ40}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ40}  ${temp}
    Append To List  ${BENEFCONTAPJ40}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ40}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ40}  ${nasc}
    Append To List  ${BENEFCONTAPJ40}  Titular
    Append To List  ${BENEFCONTAPJ40}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ40}  ${temp}
    Append To List  ${BENEFCONTAPJ40}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ40}  ${conta}
    Append To List  ${BENEFCONTAPJ40}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ40}  CURITIBA
    Append To List  ${BENEFCONTAPJ40}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFCONTAPJ40}  Residencial
    Append To List  ${BENEFCONTAPJ40}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ40}  ${temp}
    Append To List  ${BENEFCONTAPJ40}  Celular
    Append To List  ${BENEFCONTAPJ40}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg39: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ40}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFCONTAPJ40}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ40}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ40}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ40}  ${conta}
    Append To List  ${BENEFCONTAPJ40}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ40}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ40}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${BENEFCONTAPJ40}  desconto
    Append To List  ${BENEFCONTAPJ40}  30
    Append To List  ${BENEFCONTAPJ40}  acrescimo
    Append To List  ${BENEFCONTAPJ40}  20


    #Instanciar Variavel Cliente PJ TR041
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ41}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ41}  ${company}
    Append To List  ${BENEFCONTAPJ41}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ41}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ41}  ${temp}
    Append To List  ${BENEFCONTAPJ41}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ41}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ41}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ41}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ41}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ41}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ41}  ${temp}
    Append To List  ${BENEFCONTAPJ41}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ41}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ41}  ${nasc}
    Append To List  ${BENEFCONTAPJ41}  Titular
    Append To List  ${BENEFCONTAPJ41}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ41}  ${temp}
    Append To List  ${BENEFCONTAPJ41}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ41}  ${conta}
    Append To List  ${BENEFCONTAPJ41}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ41}  CURITIBA
    Append To List  ${BENEFCONTAPJ41}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTAPJ41}  Residencial
    Append To List  ${BENEFCONTAPJ41}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ41}  ${temp}
    Append To List  ${BENEFCONTAPJ41}  Celular
    Append To List  ${BENEFCONTAPJ41}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ41}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFCONTAPJ41}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ41}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ41}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ41}  ${conta}
    Append To List  ${BENEFCONTAPJ41}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ41}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ41}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTAPJ41}  desconto
    Append To List  ${BENEFCONTAPJ41}  30
    Append To List  ${BENEFCONTAPJ41}  acrescimo
    Append To List  ${BENEFCONTAPJ41}  20


    #Instanciar Variavel Cliente PJ TR042
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ42}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ42}  ${company}
    Append To List  ${BENEFCONTAPJ42}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ42}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ42}  ${temp}
    Append To List  ${BENEFCONTAPJ42}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ42}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ42}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ42}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ42}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ42}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ42}  ${temp}
    Append To List  ${BENEFCONTAPJ42}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ42}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ42}  ${nasc}
    Append To List  ${BENEFCONTAPJ42}  Titular
    Append To List  ${BENEFCONTAPJ42}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ42}  ${temp}
    Append To List  ${BENEFCONTAPJ42}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ42}  ${conta}
    Append To List  ${BENEFCONTAPJ42}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ42}  CURITIBA
    Append To List  ${BENEFCONTAPJ42}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTAPJ42}  Residencial
    Append To List  ${BENEFCONTAPJ42}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ42}  ${temp}
    Append To List  ${BENEFCONTAPJ42}  Celular
    Append To List  ${BENEFCONTAPJ42}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ42}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFCONTAPJ42}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ42}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ42}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ42}  ${conta}
    Append To List  ${BENEFCONTAPJ42}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ42}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ42}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTAPJ42}  desconto
    Append To List  ${BENEFCONTAPJ42}  30
    Append To List  ${BENEFCONTAPJ42}  acrescimo
    Append To List  ${BENEFCONTAPJ42}  20


    #Instanciar Variavel Cliente PJ TR043
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ43}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ43}  ${company}
    Append To List  ${BENEFCONTAPJ43}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ43}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ43}  ${temp}
    Append To List  ${BENEFCONTAPJ43}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ43}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ43}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ43}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ43}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ43}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ43}  ${temp}
    Append To List  ${BENEFCONTAPJ43}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ43}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ43}  ${nasc}
    Append To List  ${BENEFCONTAPJ43}  Titular
    Append To List  ${BENEFCONTAPJ43}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ43}  ${temp}
    Append To List  ${BENEFCONTAPJ43}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ43}  ${conta}
    Append To List  ${BENEFCONTAPJ43}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ43}  CURITIBA
    Append To List  ${BENEFCONTAPJ43}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTAPJ43}  Residencial
    Append To List  ${BENEFCONTAPJ43}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ43}  ${temp}
    Append To List  ${BENEFCONTAPJ43}  Celular
    Append To List  ${BENEFCONTAPJ43}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ43}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFCONTAPJ43}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ43}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ43}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ43}  ${conta}
    Append To List  ${BENEFCONTAPJ43}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ43}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ43}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTAPJ43}  desconto
    Append To List  ${BENEFCONTAPJ43}  30
    Append To List  ${BENEFCONTAPJ43}  acrescimo
    Append To List  ${BENEFCONTAPJ43}  20
    #Adicionando - Segundo Titular: Arg39: Tipo, Arg40: cpf, Arg41: Nome Beneficiario, Arg42: Estado Civil, Arg43: Grau Dependencia, Arg44: Data Nascimento Dependente, Arg45: CNS
    Append To List  ${BENEFCONTAPJ43}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ43}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ43}  ${conta}
    Append To List  ${BENEFCONTAPJ43}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ43}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ43}  ${nasc}
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ43}  ${temp}


    #Instanciar Variavel Cliente PJ TR044
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ44}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ44}  ${company}
    Append To List  ${BENEFCONTAPJ44}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ44}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ44}  ${temp}
    Append To List  ${BENEFCONTAPJ44}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ44}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ44}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ44}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ44}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ44}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ44}  ${temp}
    Append To List  ${BENEFCONTAPJ44}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ44}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ44}  ${nasc}
    Append To List  ${BENEFCONTAPJ44}  Titular
    Append To List  ${BENEFCONTAPJ44}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ44}  ${temp}
    Append To List  ${BENEFCONTAPJ44}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ44}  ${conta}
    Append To List  ${BENEFCONTAPJ44}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ44}  CURITIBA
    Append To List  ${BENEFCONTAPJ44}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFCONTAPJ44}  Residencial
    Append To List  ${BENEFCONTAPJ44}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ44}  ${temp}
    Append To List  ${BENEFCONTAPJ44}  Celular
    Append To List  ${BENEFCONTAPJ44}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ44}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFCONTAPJ44}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ44}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ44}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ44}  ${conta}
    Append To List  ${BENEFCONTAPJ44}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ44}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ44}  ${nasc}
    #Adicionando para importação: Arg36: Endereco, Arg37: Bairro, Arg38: Cidade, Arg39: UF, Arg40: Pais, 
    #            Arg41: Produto Assitencial,  Arg42: sexo, Arg43: raça, Arg44: Grau de Dependencia, Arg45: tipoEndereco,
    #            Arg46: estado Civil, Arg47: Telefone,  Arg48: naturalidadeCidade, Arg49:  naturalidadeEstado
    Append To List  ${BENEFCONTAPJ44}  rua alberto folloni
    Append To List  ${BENEFCONTAPJ44}  ahu
    Append To List  ${BENEFCONTAPJ44}  curitiba
    Append To List  ${BENEFCONTAPJ44}  PR
    Append To List  ${BENEFCONTAPJ44}  brasil
    Append To List  ${BENEFCONTAPJ44}  5072
    Append To List  ${BENEFCONTAPJ44}  f
    Append To List  ${BENEFCONTAPJ44}  1
    Append To List  ${BENEFCONTAPJ44}  00
    Append To List  ${BENEFCONTAPJ44}  residencial
    Append To List  ${BENEFCONTAPJ44}  solteiro
    Append To List  ${BENEFCONTAPJ44}  43923328738
    Append To List  ${BENEFCONTAPJ44}  Curitiba
    Append To List  ${BENEFCONTAPJ44}  PR
    #Adicionando - Desconto e Acrescimo: Arg50: Tipo negociação, Arg51: Valor, Arg52: Tipo negociação, Arg53: Valor
    Append To List  ${BENEFCONTAPJ44}  desconto
    Append To List  ${BENEFCONTAPJ44}  30
    Append To List  ${BENEFCONTAPJ44}  acrescimo
    Append To List  ${BENEFCONTAPJ44}  20


    #Instanciar Variavel Cliente PJ TR045
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ45}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ45}  ${company}
    Append To List  ${BENEFCONTAPJ45}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ45}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ45}  ${temp}
    Append To List  ${BENEFCONTAPJ45}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ45}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ45}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ45}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ45}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ45}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ45}  ${temp}
    Append To List  ${BENEFCONTAPJ45}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ45}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ45}  ${nasc}
    Append To List  ${BENEFCONTAPJ45}  Titular
    Append To List  ${BENEFCONTAPJ45}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ45}  ${temp}
    Append To List  ${BENEFCONTAPJ45}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ45}  ${conta}
    Append To List  ${BENEFCONTAPJ45}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ45}  CURITIBA
    Append To List  ${BENEFCONTAPJ45}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTAPJ45}  Residencial
    Append To List  ${BENEFCONTAPJ45}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ45}  ${temp}
    Append To List  ${BENEFCONTAPJ45}  Celular
    Append To List  ${BENEFCONTAPJ45}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ45}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFCONTAPJ45}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFCONTAPJ45}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ45}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ45}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ45}  ${conta}
    Append To List  ${BENEFCONTAPJ45}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ45}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ45}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTAPJ45}  desconto
    Append To List  ${BENEFCONTAPJ45}  10
    Append To List  ${BENEFCONTAPJ45}  acrescimo
    Append To List  ${BENEFCONTAPJ45}  20


    #Instanciar Variavel Cliente PJ TR046
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ46}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ46}  ${company}
    Append To List  ${BENEFCONTAPJ46}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ46}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ46}  ${temp}
    Append To List  ${BENEFCONTAPJ46}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ46}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ46}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ46}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ46}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ46}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ46}  ${temp}
    Append To List  ${BENEFCONTAPJ46}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ46}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ46}  ${nasc}
    Append To List  ${BENEFCONTAPJ46}  Titular
    Append To List  ${BENEFCONTAPJ46}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ46}  ${temp}
    Append To List  ${BENEFCONTAPJ46}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ46}  ${conta}
    Append To List  ${BENEFCONTAPJ46}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ46}  CURITIBA
    Append To List  ${BENEFCONTAPJ46}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTAPJ46}  Residencial
    Append To List  ${BENEFCONTAPJ46}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ46}  ${temp}
    Append To List  ${BENEFCONTAPJ46}  Celular
    Append To List  ${BENEFCONTAPJ46}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ46}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFCONTAPJ46}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFCONTAPJ46}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ46}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ46}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ46}  ${conta}
    Append To List  ${BENEFCONTAPJ46}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ46}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ46}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTAPJ46}  desconto
    Append To List  ${BENEFCONTAPJ46}  15
    Append To List  ${BENEFCONTAPJ46}  acrescimo
    Append To List  ${BENEFCONTAPJ46}  10


    #Instanciar Variavel Cliente PJ TR047
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ47}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ47}  ${company}
    Append To List  ${BENEFCONTAPJ47}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ47}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ47}  ${temp}
    Append To List  ${BENEFCONTAPJ47}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ47}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ47}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ47}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ47}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ47}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ47}  ${temp}
    Append To List  ${BENEFCONTAPJ47}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ47}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ47}  ${nasc}
    Append To List  ${BENEFCONTAPJ47}  Titular
    Append To List  ${BENEFCONTAPJ47}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ47}  ${temp}
    Append To List  ${BENEFCONTAPJ47}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ47}  ${conta}
    Append To List  ${BENEFCONTAPJ47}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ47}  CURITIBA
    Append To List  ${BENEFCONTAPJ47}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTAPJ47}  Residencial
    Append To List  ${BENEFCONTAPJ47}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ47}  ${temp}
    Append To List  ${BENEFCONTAPJ47}  Celular
    Append To List  ${BENEFCONTAPJ47}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ47}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFCONTAPJ47}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFCONTAPJ47}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ47}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ47}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ47}  ${conta}
    Append To List  ${BENEFCONTAPJ47}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ47}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ47}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTAPJ47}  desconto
    Append To List  ${BENEFCONTAPJ47}  10
    Append To List  ${BENEFCONTAPJ47}  acrescimo
    Append To List  ${BENEFCONTAPJ47}  10


    #Instanciar Variavel Cliente PJ TR048
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ48}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ48}  ${company}
    Append To List  ${BENEFCONTAPJ48}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ48}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ48}  ${temp}
    Append To List  ${BENEFCONTAPJ48}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ48}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ48}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ48}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ48}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ48}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ48}  ${temp}
    Append To List  ${BENEFCONTAPJ48}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ48}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ48}  ${nasc}
    Append To List  ${BENEFCONTAPJ48}  Titular
    Append To List  ${BENEFCONTAPJ48}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ48}  ${temp}
    Append To List  ${BENEFCONTAPJ48}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ48}  ${conta}
    Append To List  ${BENEFCONTAPJ48}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ48}  CURITIBA
    Append To List  ${BENEFCONTAPJ48}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTAPJ48}  Residencial
    Append To List  ${BENEFCONTAPJ48}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ48}  ${temp}
    Append To List  ${BENEFCONTAPJ48}  Celular
    Append To List  ${BENEFCONTAPJ48}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ48}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFCONTAPJ48}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFCONTAPJ48}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ48}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ48}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ48}  ${conta}
    Append To List  ${BENEFCONTAPJ48}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ48}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ48}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTAPJ48}  desconto
    Append To List  ${BENEFCONTAPJ48}  10
    Append To List  ${BENEFCONTAPJ48}  acrescimo
    Append To List  ${BENEFCONTAPJ48}  10


    #Instanciar Variavel Cliente PJ TR049
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ49}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ49}  ${company}
    Append To List  ${BENEFCONTAPJ49}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ49}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ49}  ${temp}
    Append To List  ${BENEFCONTAPJ49}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ49}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ49}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ49}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ49}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ49}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ49}  ${temp}
    Append To List  ${BENEFCONTAPJ49}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ49}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ49}  ${nasc}
    Append To List  ${BENEFCONTAPJ49}  Titular
    Append To List  ${BENEFCONTAPJ49}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ49}  ${temp}
    Append To List  ${BENEFCONTAPJ49}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ49}  ${conta}
    Append To List  ${BENEFCONTAPJ49}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ49}  CURITIBA
    Append To List  ${BENEFCONTAPJ49}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTAPJ49}  Residencial
    Append To List  ${BENEFCONTAPJ49}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ49}  ${temp}
    Append To List  ${BENEFCONTAPJ49}  Celular
    Append To List  ${BENEFCONTAPJ49}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ49}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFCONTAPJ49}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFCONTAPJ49}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ49}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ49}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ49}  ${conta}
    Append To List  ${BENEFCONTAPJ49}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ49}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ49}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTAPJ49}  desconto
    Append To List  ${BENEFCONTAPJ49}  30
    Append To List  ${BENEFCONTAPJ49}  acrescimo
    Append To List  ${BENEFCONTAPJ49}  20
    #Adicionando - Segundo Titular: Arg39: Tipo, Arg40: cpf, Arg41: Nome Beneficiario, Arg42: Estado Civil, Arg43: Grau Dependencia, Arg44: Data Nascimento Dependente, Arg45: CNS
    Append To List  ${BENEFCONTAPJ49}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ49}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ49}  ${conta}
    Append To List  ${BENEFCONTAPJ49}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ49}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ49}  ${nasc}
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ49}  ${temp}


    #Instanciar Variavel Cliente PJ TR050
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ50}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ50}  ${company}
    Append To List  ${BENEFCONTAPJ50}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ50}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ50}  ${temp}
    Append To List  ${BENEFCONTAPJ50}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ50}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ50}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ50}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ50}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ50}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ50}  ${temp}
    Append To List  ${BENEFCONTAPJ50}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ50}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ50}  ${nasc}
    Append To List  ${BENEFCONTAPJ50}  Titular
    Append To List  ${BENEFCONTAPJ50}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ50}  ${temp}
    Append To List  ${BENEFCONTAPJ50}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ50}  ${conta}
    Append To List  ${BENEFCONTAPJ50}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ50}  CURITIBA
    Append To List  ${BENEFCONTAPJ50}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFCONTAPJ50}  Residencial
    Append To List  ${BENEFCONTAPJ50}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ50}  ${temp}
    Append To List  ${BENEFCONTAPJ50}  Celular
    Append To List  ${BENEFCONTAPJ50}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ50}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFCONTAPJ50}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFCONTAPJ50}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ50}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ50}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ50}  ${conta}
    Append To List  ${BENEFCONTAPJ50}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ50}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ50}  ${nasc}
    #Adicionando para importação: Arg36: Endereco, Arg37: Bairro, Arg38: Cidade, Arg39: UF, Arg40: Pais, 
    #            Arg41: Produto Assitencial,  Arg42: sexo, Arg43: raça, Arg44: Grau de Dependencia, Arg45: tipoEndereco,
    #            Arg46: estado Civil, Arg47: Telefone,  Arg48: naturalidadeCidade, Arg49:  naturalidadeEstado
    Append To List  ${BENEFCONTAPJ50}  rua alberto folloni
    Append To List  ${BENEFCONTAPJ50}  ahu
    Append To List  ${BENEFCONTAPJ50}  curitiba
    Append To List  ${BENEFCONTAPJ50}  PR
    Append To List  ${BENEFCONTAPJ50}  brasil
    Append To List  ${BENEFCONTAPJ50}  5072
    Append To List  ${BENEFCONTAPJ50}  f
    Append To List  ${BENEFCONTAPJ50}  1
    Append To List  ${BENEFCONTAPJ50}  00
    Append To List  ${BENEFCONTAPJ50}  residencial
    Append To List  ${BENEFCONTAPJ50}  solteiro
    Append To List  ${BENEFCONTAPJ50}  43923328738
    Append To List  ${BENEFCONTAPJ50}  Curitiba
    Append To List  ${BENEFCONTAPJ50}  PR
    #Adicionando - Desconto e Acrescimo: Arg50: Tipo negociação, Arg51: Valor, Arg52: Tipo negociação, Arg53: Valor
    Append To List  ${BENEFCONTAPJ50}  desconto
    Append To List  ${BENEFCONTAPJ50}  30
    Append To List  ${BENEFCONTAPJ50}  acrescimo
    Append To List  ${BENEFCONTAPJ50}  20


    #Instanciar Variavel Cliente PJ TR051
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTAPJ51}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTAPJ51}  ${company}
    Append To List  ${BENEFCONTAPJ51}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${BENEFCONTAPJ51}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTAPJ51}  ${temp}
    Append To List  ${BENEFCONTAPJ51}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ51}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTAPJ51}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTAPJ51}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTAPJ51}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTAPJ51}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTAPJ51}  ${temp}
    Append To List  ${BENEFCONTAPJ51}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ51}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ51}  ${nasc}
    Append To List  ${BENEFCONTAPJ51}  Titular
    Append To List  ${BENEFCONTAPJ51}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTAPJ51}  ${temp}
    Append To List  ${BENEFCONTAPJ51}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ51}  ${conta}
    Append To List  ${BENEFCONTAPJ51}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ51}  CURITIBA
    Append To List  ${BENEFCONTAPJ51}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFCONTAPJ51}  Residencial
    Append To List  ${BENEFCONTAPJ51}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTAPJ51}  ${temp}
    Append To List  ${BENEFCONTAPJ51}  Celular
    Append To List  ${BENEFCONTAPJ51}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFCONTAPJ51}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFCONTAPJ51}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFCONTAPJ51}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFCONTAPJ51}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTAPJ51}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTAPJ51}  ${conta}
    Append To List  ${BENEFCONTAPJ51}  Solteiro(a)
    Append To List  ${BENEFCONTAPJ51}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTAPJ51}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${BENEFCONTAPJ51}  desconto
    Append To List  ${BENEFCONTAPJ51}  30
    Append To List  ${BENEFCONTAPJ51}  acrescimo
    Append To List  ${BENEFCONTAPJ51}  20


    #Instanciar Variavel Cliente CAEPF TR070
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTCAEPF70}  Pessoa Jurídica (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTCAEPF70}  ${company}
    Append To List  ${BENEFPOTCAEPF70}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${BENEFPOTCAEPF70}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTCAEPF70}  ${temp}
    Append To List  ${BENEFPOTCAEPF70}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTCAEPF70}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTCAEPF70}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTCAEPF70}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTCAEPF70}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTCAEPF70}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTCAEPF70}  ${temp}
    Append To List  ${BENEFPOTCAEPF70}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF70}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF70}  ${nasc}
    Append To List  ${BENEFPOTCAEPF70}  Titular
    Append To List  ${BENEFPOTCAEPF70}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTCAEPF70}  ${temp}
    Append To List  ${BENEFPOTCAEPF70}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF70}  ${conta}
    Append To List  ${BENEFPOTCAEPF70}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF70}  CURITIBA
    Append To List  ${BENEFPOTCAEPF70}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFPOTCAEPF70}  Residencial
    Append To List  ${BENEFPOTCAEPF70}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTCAEPF70}  ${temp}
    Append To List  ${BENEFPOTCAEPF70}  Celular
    Append To List  ${BENEFPOTCAEPF70}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFPOTCAEPF70}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFPOTCAEPF70}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFPOTCAEPF70}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF70}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF70}  ${conta}
    Append To List  ${BENEFPOTCAEPF70}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF70}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF70}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFPOTCAEPF70}  desconto
    Append To List  ${BENEFPOTCAEPF70}  30
    Append To List  ${BENEFPOTCAEPF70}  acrescimo
    Append To List  ${BENEFPOTCAEPF70}  20


    #Instanciar Variavel Cliente CAEPF TR071
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTCAEPF71}  Pessoa Jurídica (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTCAEPF71}  ${company}
    Append To List  ${BENEFPOTCAEPF71}  ${company}
    ${temp}         Gerar CAEPF
    Append To List  ${BENEFPOTCAEPF71}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTCAEPF71}  ${temp}
    Append To List  ${BENEFPOTCAEPF71}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTCAEPF71}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTCAEPF71}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTCAEPF71}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTCAEPF71}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTCAEPF71}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTCAEPF71}  ${temp}
    Append To List  ${BENEFPOTCAEPF71}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF71}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF71}  ${nasc}
    Append To List  ${BENEFPOTCAEPF71}  Titular
    Append To List  ${BENEFPOTCAEPF71}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTCAEPF71}  ${temp}
    Append To List  ${BENEFPOTCAEPF71}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF71}  ${conta}
    Append To List  ${BENEFPOTCAEPF71}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF71}  CURITIBA
    Append To List  ${BENEFPOTCAEPF71}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTCAEPF71}  Residencial
    Append To List  ${BENEFPOTCAEPF71}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTCAEPF71}  ${temp}
    Append To List  ${BENEFPOTCAEPF71}  Celular
    Append To List  ${BENEFPOTCAEPF71}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFPOTCAEPF71}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFPOTCAEPF71}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTCAEPF71}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF71}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF71}  ${conta}
    Append To List  ${BENEFPOTCAEPF71}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF71}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF71}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${BENEFPOTCAEPF71}  desconto
    Append To List  ${BENEFPOTCAEPF71}  30
    Append To List  ${BENEFPOTCAEPF71}  acrescimo
    Append To List  ${BENEFPOTCAEPF71}  20
    #Adicionando - Segundo Titular: Arg40: Tipo, Arg41: cpf, Arg42: Nome Beneficiario, Arg43: Estado Civil, Arg44: Grau Dependencia, Arg45: Data Nascimento Dependente, Arg46: CNS
    Append To List  ${BENEFPOTCAEPF71}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF71}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF71}  ${conta}
    Append To List  ${BENEFPOTCAEPF71}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF71}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF71}  ${nasc}
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTCAEPF71}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR072
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTCAEPF72}  Pessoa Jurídica (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTCAEPF72}  ${company}
    Append To List  ${BENEFPOTCAEPF72}  ${company}
    ${temp}         Gerar CAEPF
    Append To List  ${BENEFPOTCAEPF72}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTCAEPF72}  ${temp}
    Append To List  ${BENEFPOTCAEPF72}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTCAEPF72}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTCAEPF72}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTCAEPF72}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTCAEPF72}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTCAEPF72}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTCAEPF72}  ${temp}
    Append To List  ${BENEFPOTCAEPF72}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF72}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF72}  ${nasc}
    Append To List  ${BENEFPOTCAEPF72}  Titular
    Append To List  ${BENEFPOTCAEPF72}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTCAEPF72}  ${temp}
    Append To List  ${BENEFPOTCAEPF72}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF72}  ${conta}
    Append To List  ${BENEFPOTCAEPF72}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF72}  CURITIBA
    Append To List  ${BENEFPOTCAEPF72}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTCAEPF72}  Residencial
    Append To List  ${BENEFPOTCAEPF72}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTCAEPF72}  ${temp}
    Append To List  ${BENEFPOTCAEPF72}  Celular
    Append To List  ${BENEFPOTCAEPF72}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFPOTCAEPF72}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFPOTCAEPF72}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTCAEPF72}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF72}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF72}  ${conta}
    Append To List  ${BENEFPOTCAEPF72}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF72}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF72}  ${nasc}
    #Adicionando para importação: Arg36: Endereco, Arg37: Bairro, Arg38: Cidade, Arg39: UF, Arg40: Pais, 
    #            Arg41: Produto Assitencial,  Arg42: sexo, Arg43: raça, Arg44: Grau de Dependencia, Arg45: tipoEndereco,
    #            Arg46: estado Civil, Arg47: Telefone,  Arg48: naturalidadeCidade, Arg49:  naturalidadeEstado
    Append To List  ${BENEFPOTCAEPF72}  rua alberto folloni
    Append To List  ${BENEFPOTCAEPF72}  ahu
    Append To List  ${BENEFPOTCAEPF72}  curitiba
    Append To List  ${BENEFPOTCAEPF72}  PR
    Append To List  ${BENEFPOTCAEPF72}  brasil
    Append To List  ${BENEFPOTCAEPF72}  5073
    Append To List  ${BENEFPOTCAEPF72}  f
    Append To List  ${BENEFPOTCAEPF72}  1
    Append To List  ${BENEFPOTCAEPF72}  00
    Append To List  ${BENEFPOTCAEPF72}  residencial
    Append To List  ${BENEFPOTCAEPF72}  solteiro
    Append To List  ${BENEFPOTCAEPF72}  43923328738
    Append To List  ${BENEFPOTCAEPF72}  Curitiba
    Append To List  ${BENEFPOTCAEPF72}  PR
    #Adicionando - Desconto e Acrescimo: Arg50: Tipo negociação, Arg51: Valor, Arg52: Tipo negociação, Arg53: Valor
    Append To List  ${BENEFPOTCAEPF72}  desconto
    Append To List  ${BENEFPOTCAEPF72}  30
    Append To List  ${BENEFPOTCAEPF72}  acrescimo
    Append To List  ${BENEFPOTCAEPF72}  20


    #Instanciar Variavel Cliente CAEPF TR073
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTCAEPF73}  Pessoa Jurídica (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTCAEPF73}  ${company}
    Append To List  ${BENEFPOTCAEPF73}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${BENEFPOTCAEPF73}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTCAEPF73}  ${temp}
    Append To List  ${BENEFPOTCAEPF73}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTCAEPF73}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTCAEPF73}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTCAEPF73}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTCAEPF73}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTCAEPF73}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTCAEPF73}  ${temp}
    Append To List  ${BENEFPOTCAEPF73}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF73}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF73}  ${nasc}
    Append To List  ${BENEFPOTCAEPF73}  Titular
    Append To List  ${BENEFPOTCAEPF73}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTCAEPF73}  ${temp}
    Append To List  ${BENEFPOTCAEPF73}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF73}  ${conta}
    Append To List  ${BENEFPOTCAEPF73}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF73}  CURITIBA
    Append To List  ${BENEFPOTCAEPF73}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFPOTCAEPF73}  Residencial
    Append To List  ${BENEFPOTCAEPF73}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTCAEPF73}  ${temp}
    Append To List  ${BENEFPOTCAEPF73}  Celular
    Append To List  ${BENEFPOTCAEPF73}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFPOTCAEPF73}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFPOTCAEPF73}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFPOTCAEPF73}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF73}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF73}  ${conta}
    Append To List  ${BENEFPOTCAEPF73}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF73}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF73}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFPOTCAEPF73}  desconto
    Append To List  ${BENEFPOTCAEPF73}  30
    Append To List  ${BENEFPOTCAEPF73}  acrescimo
    Append To List  ${BENEFPOTCAEPF73}  20


    #Instanciar Variavel Cliente CAEPF TR074
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTCAEPF74}  Pessoa Jurídica (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTCAEPF74}  ${company}
    Append To List  ${BENEFPOTCAEPF74}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${BENEFPOTCAEPF74}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTCAEPF74}  ${temp}
    Append To List  ${BENEFPOTCAEPF74}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTCAEPF74}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTCAEPF74}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTCAEPF74}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTCAEPF74}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTCAEPF74}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTCAEPF74}  ${temp}
    Append To List  ${BENEFPOTCAEPF74}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF74}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF74}  ${nasc}
    Append To List  ${BENEFPOTCAEPF74}  Titular
    Append To List  ${BENEFPOTCAEPF74}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTCAEPF74}  ${temp}
    Append To List  ${BENEFPOTCAEPF74}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF74}  ${conta}
    Append To List  ${BENEFPOTCAEPF74}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF74}  CURITIBA
    Append To List  ${BENEFPOTCAEPF74}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFPOTCAEPF74}  Residencial
    Append To List  ${BENEFPOTCAEPF74}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTCAEPF74}  ${temp}
    Append To List  ${BENEFPOTCAEPF74}  Celular
    Append To List  ${BENEFPOTCAEPF74}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFPOTCAEPF74}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFPOTCAEPF74}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFPOTCAEPF74}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFPOTCAEPF74}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF74}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF74}  ${conta}
    Append To List  ${BENEFPOTCAEPF74}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF74}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF74}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFPOTCAEPF74}  desconto
    Append To List  ${BENEFPOTCAEPF74}  30
    Append To List  ${BENEFPOTCAEPF74}  acrescimo
    Append To List  ${BENEFPOTCAEPF74}  20


    #Instanciar Variavel Cliente CAEPF TR075
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTCAEPF75}  Pessoa Jurídica (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTCAEPF75}  ${company}
    Append To List  ${BENEFPOTCAEPF75}  ${company}
    ${temp}         Gerar CAEPF
    Append To List  ${BENEFPOTCAEPF75}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTCAEPF75}  ${temp}
    Append To List  ${BENEFPOTCAEPF75}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTCAEPF75}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTCAEPF75}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTCAEPF75}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTCAEPF75}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTCAEPF75}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTCAEPF75}  ${temp}
    Append To List  ${BENEFPOTCAEPF75}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF75}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF75}  ${nasc}
    Append To List  ${BENEFPOTCAEPF75}  Titular
    Append To List  ${BENEFPOTCAEPF75}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTCAEPF75}  ${temp}
    Append To List  ${BENEFPOTCAEPF75}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF75}  ${conta}
    Append To List  ${BENEFPOTCAEPF75}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF75}  CURITIBA
    Append To List  ${BENEFPOTCAEPF75}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${BENEFPOTCAEPF75}  Residencial
    Append To List  ${BENEFPOTCAEPF75}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTCAEPF75}  ${temp}
    Append To List  ${BENEFPOTCAEPF75}  Celular
    Append To List  ${BENEFPOTCAEPF75}  69988654869
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${BENEFPOTCAEPF75}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFPOTCAEPF75}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFPOTCAEPF75}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${BENEFPOTCAEPF75}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF75}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF75}  ${conta}
    Append To List  ${BENEFPOTCAEPF75}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF75}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF75}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg36: Tipo negociação, Arg37: Valor, Arg38: Tipo negociação, Arg39: Valor
    Append To List  ${BENEFPOTCAEPF75}  desconto
    Append To List  ${BENEFPOTCAEPF75}  30
    Append To List  ${BENEFPOTCAEPF75}  acrescimo
    Append To List  ${BENEFPOTCAEPF75}  20
    #Adicionando - Segundo Titular: Arg40: Tipo, Arg41: cpf, Arg42: Nome Beneficiario, Arg43: Estado Civil, Arg44: Grau Dependencia, Arg45: Data Nascimento Dependente, Arg46: CNS
    Append To List  ${BENEFPOTCAEPF75}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF75}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF75}  ${conta}
    Append To List  ${BENEFPOTCAEPF75}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF75}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF75}  ${nasc}
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTCAEPF75}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR076
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTCAEPF76}  Pessoa Jurídica (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTCAEPF76}  ${company}
    Append To List  ${BENEFPOTCAEPF76}  ${company}
    ${temp}         Gerar CAEPF
    Append To List  ${BENEFPOTCAEPF76}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTCAEPF76}  ${temp}
    Append To List  ${BENEFPOTCAEPF76}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTCAEPF76}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTCAEPF76}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTCAEPF76}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTCAEPF76}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTCAEPF76}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTCAEPF76}  ${temp}
    Append To List  ${BENEFPOTCAEPF76}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF76}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF76}  ${nasc}
    Append To List  ${BENEFPOTCAEPF76}  Titular
    Append To List  ${BENEFPOTCAEPF76}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTCAEPF76}  ${temp}
    Append To List  ${BENEFPOTCAEPF76}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF76}  ${conta}
    Append To List  ${BENEFPOTCAEPF76}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF76}  CURITIBA
    Append To List  ${BENEFPOTCAEPF76}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFPOTCAEPF76}  Residencial
    Append To List  ${BENEFPOTCAEPF76}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTCAEPF76}  ${temp}
    Append To List  ${BENEFPOTCAEPF76}  Celular
    Append To List  ${BENEFPOTCAEPF76}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFPOTCAEPF76}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFPOTCAEPF76}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFPOTCAEPF76}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFPOTCAEPF76}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF76}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF76}  ${conta}
    Append To List  ${BENEFPOTCAEPF76}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF76}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF76}  ${nasc}
    #Adicionando para importação: Arg35: Endereco, Arg36: Bairro, Arg37: Cidade, Arg38: UF, Arg39: Pais, 
    #            Arg40: Produto Assitencial,  Arg41: sexo, Arg42: raça, Arg43: Grau de Dependencia, Arg44: tipoEndereco,
    #            Arg45: estado Civil, Arg46: Telefone,  Arg47: naturalidadeCidade, Arg48:  naturalidadeEstado
    Append To List  ${BENEFPOTCAEPF76}  rua alberto folloni
    Append To List  ${BENEFPOTCAEPF76}  ahu
    Append To List  ${BENEFPOTCAEPF76}  curitiba
    Append To List  ${BENEFPOTCAEPF76}  PR
    Append To List  ${BENEFPOTCAEPF76}  brasil
    Append To List  ${BENEFPOTCAEPF76}  5072
    Append To List  ${BENEFPOTCAEPF76}  f
    Append To List  ${BENEFPOTCAEPF76}  1
    Append To List  ${BENEFPOTCAEPF76}  00
    Append To List  ${BENEFPOTCAEPF76}  residencial
    Append To List  ${BENEFPOTCAEPF76}  solteiro
    Append To List  ${BENEFPOTCAEPF76}  43923328738
    Append To List  ${BENEFPOTCAEPF76}  Curitiba
    Append To List  ${BENEFPOTCAEPF76}  PR
    #Adicionando - Desconto e Acrescimo: Arg49: Tipo negociação, Arg50: Valor, Arg51: Tipo negociação, Arg52: Valor
    Append To List  ${BENEFPOTCAEPF76}  desconto
    Append To List  ${BENEFPOTCAEPF76}  30
    Append To List  ${BENEFPOTCAEPF76}  acrescimo
    Append To List  ${BENEFPOTCAEPF76}  20


    #Instanciar Variavel Cliente CAEPF TR077
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFPOTCAEPF77}  Pessoa Jurídica (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFPOTCAEPF77}  ${company}
    Append To List  ${BENEFPOTCAEPF77}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${BENEFPOTCAEPF77}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFPOTCAEPF77}  ${temp}
    Append To List  ${BENEFPOTCAEPF77}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTCAEPF77}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFPOTCAEPF77}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFPOTCAEPF77}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFPOTCAEPF77}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFPOTCAEPF77}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFPOTCAEPF77}  ${temp}
    Append To List  ${BENEFPOTCAEPF77}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF77}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF77}  ${nasc}
    Append To List  ${BENEFPOTCAEPF77}  Titular
    Append To List  ${BENEFPOTCAEPF77}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFPOTCAEPF77}  ${temp}
    Append To List  ${BENEFPOTCAEPF77}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF77}  ${conta}
    Append To List  ${BENEFPOTCAEPF77}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF77}  CURITIBA
    Append To List  ${BENEFPOTCAEPF77}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFPOTCAEPF77}  Residencial
    Append To List  ${BENEFPOTCAEPF77}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFPOTCAEPF77}  ${temp}
    Append To List  ${BENEFPOTCAEPF77}  Celular
    Append To List  ${BENEFPOTCAEPF77}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFPOTCAEPF77}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFPOTCAEPF77}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFPOTCAEPF77}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFPOTCAEPF77}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFPOTCAEPF77}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFPOTCAEPF77}  ${conta}
    Append To List  ${BENEFPOTCAEPF77}  Solteiro(a)
    Append To List  ${BENEFPOTCAEPF77}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFPOTCAEPF77}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFPOTCAEPF77}  desconto
    Append To List  ${BENEFPOTCAEPF77}  30
    Append To List  ${BENEFPOTCAEPF77}  acrescimo
    Append To List  ${BENEFPOTCAEPF77}  20


    #Instanciar Variavel Cliente CAEPF TR078
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTACAEPF78}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTACAEPF78}  ${company}
    Append To List  ${BENEFCONTACAEPF78}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${BENEFCONTACAEPF78}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTACAEPF78}  ${temp}
    Append To List  ${BENEFCONTACAEPF78}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTACAEPF78}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTACAEPF78}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTACAEPF78}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTACAEPF78}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTACAEPF78}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTACAEPF78}  ${temp}
    Append To List  ${BENEFCONTACAEPF78}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF78}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF78}  ${nasc}
    Append To List  ${BENEFCONTACAEPF78}  Titular
    Append To List  ${BENEFCONTACAEPF78}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTACAEPF78}  ${temp}
    Append To List  ${BENEFCONTACAEPF78}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF78}  ${conta}
    Append To List  ${BENEFCONTACAEPF78}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF78}  CURITIBA
    Append To List  ${BENEFCONTACAEPF78}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTACAEPF78}  Residencial
    Append To List  ${BENEFCONTACAEPF78}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTACAEPF78}  ${temp}
    Append To List  ${BENEFCONTACAEPF78}  Celular
    Append To List  ${BENEFCONTACAEPF78}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTACAEPF78}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFCONTACAEPF78}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTACAEPF78}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF78}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF78}  ${conta}
    Append To List  ${BENEFCONTACAEPF78}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF78}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF78}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTACAEPF78}  desconto
    Append To List  ${BENEFCONTACAEPF78}  30
    Append To List  ${BENEFCONTACAEPF78}  acrescimo
    Append To List  ${BENEFCONTACAEPF78}  20


    #Instanciar Variavel Cliente CAEPF TR079
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTACAEPF79}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTACAEPF79}  ${company}
    Append To List  ${BENEFCONTACAEPF79}  ${company}
    ${temp}         Gerar CAEPF
    Append To List  ${BENEFCONTACAEPF79}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTACAEPF79}  ${temp}
    Append To List  ${BENEFCONTACAEPF79}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTACAEPF79}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTACAEPF79}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTACAEPF79}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTACAEPF79}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTACAEPF79}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTACAEPF79}  ${temp}
    Append To List  ${BENEFCONTACAEPF79}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF79}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF79}  ${nasc}
    Append To List  ${BENEFCONTACAEPF79}  Titular
    Append To List  ${BENEFCONTACAEPF79}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTACAEPF79}  ${temp}
    Append To List  ${BENEFCONTACAEPF79}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF79}  ${conta}
    Append To List  ${BENEFCONTACAEPF79}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF79}  CURITIBA
    Append To List  ${BENEFCONTACAEPF79}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTACAEPF79}  Residencial
    Append To List  ${BENEFCONTACAEPF79}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTACAEPF79}  ${temp}
    Append To List  ${BENEFCONTACAEPF79}  Celular
    Append To List  ${BENEFCONTACAEPF79}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTACAEPF79}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFCONTACAEPF79}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTACAEPF79}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF79}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF79}  ${conta}
    Append To List  ${BENEFCONTACAEPF79}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF79}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF79}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTACAEPF79}  desconto
    Append To List  ${BENEFCONTACAEPF79}  30
    Append To List  ${BENEFCONTACAEPF79}  acrescimo
    Append To List  ${BENEFCONTACAEPF79}  20
    #Adicionando - Segundo Titular: Arg39: Tipo, Arg40: cpf, Arg41: Nome Beneficiario, Arg42: Estado Civil, Arg43: Grau Dependencia, Arg44: Data Nascimento Dependente, Arg45: CNS
    Append To List  ${BENEFCONTACAEPF79}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF79}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF79}  ${conta}
    Append To List  ${BENEFCONTACAEPF79}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF79}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF79}  ${nasc}
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTACAEPF79}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR080
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTACAEPF80}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTACAEPF80}  ${company}
    Append To List  ${BENEFCONTACAEPF80}  ${company}
    ${temp}         Gerar CAEPF
    Append To List  ${BENEFCONTACAEPF80}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTACAEPF80}  ${temp}
    Append To List  ${BENEFCONTACAEPF80}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTACAEPF80}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTACAEPF80}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTACAEPF80}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTACAEPF80}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTACAEPF80}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTACAEPF80}  ${temp}
    Append To List  ${BENEFCONTACAEPF80}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF80}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF80}  ${nasc}
    Append To List  ${BENEFCONTACAEPF80}  Titular
    Append To List  ${BENEFCONTACAEPF80}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTACAEPF80}  ${temp}
    Append To List  ${BENEFCONTACAEPF80}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF80}  ${conta}
    Append To List  ${BENEFCONTACAEPF80}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF80}  CURITIBA
    Append To List  ${BENEFCONTACAEPF80}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTACAEPF80}  Residencial
    Append To List  ${BENEFCONTACAEPF80}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTACAEPF80}  ${temp}
    Append To List  ${BENEFCONTACAEPF80}  Celular
    Append To List  ${BENEFCONTACAEPF80}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTACAEPF80}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFCONTACAEPF80}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTACAEPF80}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF80}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF80}  ${conta}
    Append To List  ${BENEFCONTACAEPF80}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF80}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF80}  ${nasc}
    #Adicionando para importação: Arg35: Endereco, Arg36: Bairro, Arg37: Cidade, Arg38: UF, Arg39: Pais, 
    #            Arg40: Produto Assitencial,  Arg41: sexo, Arg42: raça, Arg43: Grau de Dependencia, Arg44: tipoEndereco,
    #            Arg45: estado Civil, Arg46: Telefone,  Arg47: naturalidadeCidade, Arg48:  naturalidadeEstado
    Append To List  ${BENEFCONTACAEPF80}  rua alberto folloni
    Append To List  ${BENEFCONTACAEPF80}  ahu
    Append To List  ${BENEFCONTACAEPF80}  curitiba
    Append To List  ${BENEFCONTACAEPF80}  PR
    Append To List  ${BENEFCONTACAEPF80}  brasil
    Append To List  ${BENEFCONTACAEPF80}  5072
    Append To List  ${BENEFCONTACAEPF80}  f
    Append To List  ${BENEFCONTACAEPF80}  1
    Append To List  ${BENEFCONTACAEPF80}  00
    Append To List  ${BENEFCONTACAEPF80}  residencial
    Append To List  ${BENEFCONTACAEPF80}  solteiro
    Append To List  ${BENEFCONTACAEPF80}  43923328738
    Append To List  ${BENEFCONTACAEPF80}  Curitiba
    Append To List  ${BENEFCONTACAEPF80}  PR
    #Adicionando - Desconto e Acrescimo: Arg49: Tipo negociação, Arg50: Valor, Arg51: Tipo negociação, Arg52: Valor
    Append To List  ${BENEFCONTACAEPF80}  desconto
    Append To List  ${BENEFCONTACAEPF80}  30
    Append To List  ${BENEFCONTACAEPF80}  acrescimo
    Append To List  ${BENEFCONTACAEPF80}  20


    #Instanciar Variavel Cliente CAEPF TR081
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTACAEPF81}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTACAEPF81}  ${company}
    Append To List  ${BENEFCONTACAEPF81}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${BENEFCONTACAEPF81}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTACAEPF81}  ${temp}
    Append To List  ${BENEFCONTACAEPF81}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTACAEPF81}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTACAEPF81}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTACAEPF81}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTACAEPF81}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTACAEPF81}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTACAEPF81}  ${temp}
    Append To List  ${BENEFCONTACAEPF81}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF81}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF81}  ${nasc}
    Append To List  ${BENEFCONTACAEPF81}  Titular
    Append To List  ${BENEFCONTACAEPF81}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTACAEPF81}  ${temp}
    Append To List  ${BENEFCONTACAEPF81}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF81}  ${conta}
    Append To List  ${BENEFCONTACAEPF81}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF81}  CURITIBA
    Append To List  ${BENEFCONTACAEPF81}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTACAEPF81}  Residencial
    Append To List  ${BENEFCONTACAEPF81}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTACAEPF81}  ${temp}
    Append To List  ${BENEFCONTACAEPF81}  Celular
    Append To List  ${BENEFCONTACAEPF81}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTACAEPF81}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${BENEFCONTACAEPF81}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTACAEPF81}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF81}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF81}  ${conta}
    Append To List  ${BENEFCONTACAEPF81}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF81}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF81}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTACAEPF81}  desconto
    Append To List  ${BENEFCONTACAEPF81}  30
    Append To List  ${BENEFCONTACAEPF81}  acrescimo
    Append To List  ${BENEFCONTACAEPF81}  20


    #Instanciar Variavel Cliente CAEPF TR082
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTACAEPF82}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTACAEPF82}  ${company}
    Append To List  ${BENEFCONTACAEPF82}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${BENEFCONTACAEPF82}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTACAEPF82}  ${temp}
    Append To List  ${BENEFCONTACAEPF82}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTACAEPF82}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTACAEPF82}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTACAEPF82}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTACAEPF82}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTACAEPF82}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTACAEPF82}  ${temp}
    Append To List  ${BENEFCONTACAEPF82}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF82}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF82}  ${nasc}
    Append To List  ${BENEFCONTACAEPF82}  Titular
    Append To List  ${BENEFCONTACAEPF82}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTACAEPF82}  ${temp}
    Append To List  ${BENEFCONTACAEPF82}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF82}  ${conta}
    Append To List  ${BENEFCONTACAEPF82}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF82}  CURITIBA
    Append To List  ${BENEFCONTACAEPF82}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTACAEPF82}  Residencial
    Append To List  ${BENEFCONTACAEPF82}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTACAEPF82}  ${temp}
    Append To List  ${BENEFCONTACAEPF82}  Celular
    Append To List  ${BENEFCONTACAEPF82}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTACAEPF82}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFCONTACAEPF82}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFCONTACAEPF82}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTACAEPF82}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF82}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF82}  ${conta}
    Append To List  ${BENEFCONTACAEPF82}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF82}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF82}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTACAEPF82}  desconto
    Append To List  ${BENEFCONTACAEPF82}  30
    Append To List  ${BENEFCONTACAEPF82}  acrescimo
    Append To List  ${BENEFCONTACAEPF82}  20


    #Instanciar Variavel Cliente CAEPF TR083
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTACAEPF83}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTACAEPF83}  ${company}
    Append To List  ${BENEFCONTACAEPF83}  ${company}
    ${temp}         Gerar CAEPF
    Append To List  ${BENEFCONTACAEPF83}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTACAEPF83}  ${temp}
    Append To List  ${BENEFCONTACAEPF83}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTACAEPF83}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTACAEPF83}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTACAEPF83}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTACAEPF83}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTACAEPF83}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTACAEPF83}  ${temp}
    Append To List  ${BENEFCONTACAEPF83}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF83}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF83}  ${nasc}
    Append To List  ${BENEFCONTACAEPF83}  Titular
    Append To List  ${BENEFCONTACAEPF83}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTACAEPF83}  ${temp}
    Append To List  ${BENEFCONTACAEPF83}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF83}  ${conta}
    Append To List  ${BENEFCONTACAEPF83}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF83}  CURITIBA
    Append To List  ${BENEFCONTACAEPF83}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTACAEPF83}  Residencial
    Append To List  ${BENEFCONTACAEPF83}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTACAEPF83}  ${temp}
    Append To List  ${BENEFCONTACAEPF83}  Celular
    Append To List  ${BENEFCONTACAEPF83}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTACAEPF83}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFCONTACAEPF83}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFCONTACAEPF83}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTACAEPF83}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF83}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF83}  ${conta}
    Append To List  ${BENEFCONTACAEPF83}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF83}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF83}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTACAEPF83}  desconto
    Append To List  ${BENEFCONTACAEPF83}  30
    Append To List  ${BENEFCONTACAEPF83}  acrescimo
    Append To List  ${BENEFCONTACAEPF83}  20
    #Adicionando - Segundo Titular: Arg39: Tipo, Arg40: cpf, Arg41: Nome Beneficiario, Arg42: Estado Civil, Arg43: Grau Dependencia, Arg44: Data Nascimento Dependente, Arg45: CNS
    Append To List  ${BENEFCONTACAEPF83}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF83}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF83}  ${conta}
    Append To List  ${BENEFCONTACAEPF83}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF83}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF83}  ${nasc}
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTACAEPF83}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR084
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTACAEPF84}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTACAEPF84}  ${company}
    Append To List  ${BENEFCONTACAEPF84}  ${company}
    ${temp}         Gerar CAEPF
    Append To List  ${BENEFCONTACAEPF84}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTACAEPF84}  ${temp}
    Append To List  ${BENEFCONTACAEPF84}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTACAEPF84}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTACAEPF84}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTACAEPF84}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTACAEPF84}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTACAEPF84}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTACAEPF84}  ${temp}
    Append To List  ${BENEFCONTACAEPF84}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF84}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF84}  ${nasc}
    Append To List  ${BENEFCONTACAEPF84}  Titular
    Append To List  ${BENEFCONTACAEPF84}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTACAEPF84}  ${temp}
    Append To List  ${BENEFCONTACAEPF84}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF84}  ${conta}
    Append To List  ${BENEFCONTACAEPF84}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF84}  CURITIBA
    Append To List  ${BENEFCONTACAEPF84}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTACAEPF84}  Residencial
    Append To List  ${BENEFCONTACAEPF84}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTACAEPF84}  ${temp}
    Append To List  ${BENEFCONTACAEPF84}  Celular
    Append To List  ${BENEFCONTACAEPF84}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTACAEPF84}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFCONTACAEPF84}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFCONTACAEPF84}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTACAEPF84}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF84}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF84}  ${conta}
    Append To List  ${BENEFCONTACAEPF84}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF84}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF84}  ${nasc}
    #Adicionando para importação: Arg35: Endereco, Arg36: Bairro, Arg37: Cidade, Arg38: UF, Arg39: Pais, 
    #            Arg40: Produto Assitencial,  Arg41: sexo, Arg42: raça, Arg43: Grau de Dependencia, Arg44: tipoEndereco,
    #            Arg45: estado Civil, Arg46: Telefone,  Arg47: naturalidadeCidade, Arg48:  naturalidadeEstado
    Append To List  ${BENEFCONTACAEPF84}  rua alberto folloni
    Append To List  ${BENEFCONTACAEPF84}  ahu
    Append To List  ${BENEFCONTACAEPF84}  curitiba
    Append To List  ${BENEFCONTACAEPF84}  PR
    Append To List  ${BENEFCONTACAEPF84}  brasil
    Append To List  ${BENEFCONTACAEPF84}  5072
    Append To List  ${BENEFCONTACAEPF84}  f
    Append To List  ${BENEFCONTACAEPF84}  1
    Append To List  ${BENEFCONTACAEPF84}  00
    Append To List  ${BENEFCONTACAEPF84}  residencial
    Append To List  ${BENEFCONTACAEPF84}  solteiro
    Append To List  ${BENEFCONTACAEPF84}  43923328738
    Append To List  ${BENEFCONTACAEPF84}  Curitiba
    Append To List  ${BENEFCONTACAEPF84}  PR
    #Adicionando - Desconto e Acrescimo: Arg49: Tipo negociação, Arg50: Valor, Arg51: Tipo negociação, Arg52: Valor
    Append To List  ${BENEFCONTACAEPF84}  desconto
    Append To List  ${BENEFCONTACAEPF84}  30
    Append To List  ${BENEFCONTACAEPF84}  acrescimo
    Append To List  ${BENEFCONTACAEPF84}  20


    #Instanciar Variavel Cliente CAEPF TR085
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${BENEFCONTACAEPF85}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${BENEFCONTACAEPF85}  ${company}
    Append To List  ${BENEFCONTACAEPF85}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${BENEFCONTACAEPF85}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${BENEFCONTACAEPF85}  ${temp}
    Append To List  ${BENEFCONTACAEPF85}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTACAEPF85}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${BENEFCONTACAEPF85}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${BENEFCONTACAEPF85}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${BENEFCONTACAEPF85}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${BENEFCONTACAEPF85}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${BENEFCONTACAEPF85}  ${temp}
    Append To List  ${BENEFCONTACAEPF85}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF85}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF85}  ${nasc}
    Append To List  ${BENEFCONTACAEPF85}  Titular
    Append To List  ${BENEFCONTACAEPF85}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${BENEFCONTACAEPF85}  ${temp}
    Append To List  ${BENEFCONTACAEPF85}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF85}  ${conta}
    Append To List  ${BENEFCONTACAEPF85}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF85}  CURITIBA
    Append To List  ${BENEFCONTACAEPF85}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${BENEFCONTACAEPF85}  Residencial
    Append To List  ${BENEFCONTACAEPF85}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${BENEFCONTACAEPF85}  ${temp}
    Append To List  ${BENEFCONTACAEPF85}  Celular 
    Append To List  ${BENEFCONTACAEPF85}  69988654869
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${BENEFCONTACAEPF85}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${BENEFCONTACAEPF85}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${BENEFCONTACAEPF85}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${BENEFCONTACAEPF85}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${BENEFCONTACAEPF85}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${BENEFCONTACAEPF85}  ${conta}
    Append To List  ${BENEFCONTACAEPF85}  Solteiro(a)
    Append To List  ${BENEFCONTACAEPF85}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${BENEFCONTACAEPF85}  ${nasc}
    #Adicionando - Desconto e Acrescimo: Arg35: Tipo negociação, Arg36: Valor, Arg37: Tipo negociação, Arg38: Valor
    Append To List  ${BENEFCONTACAEPF85}  desconto
    Append To List  ${BENEFCONTACAEPF85}  30
    Append To List  ${BENEFCONTACAEPF85}  acrescimo
    Append To List  ${BENEFCONTACAEPF85}  20