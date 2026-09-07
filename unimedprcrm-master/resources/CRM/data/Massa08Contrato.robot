*** Settings ***
Resource    ../../../main.resource

*** Variables ***
@{CONTRATOPOTPF01}      #cenario01
@{CONTRATOPOTPF02}      #cenario02
@{CONTRATOPOTPF03}      #cenario03
@{CONTRATOCONTAPF04}    #cenario04
@{CONTRATOCONTAPF05}    #cenario05
@{CONTRATOCONTAPF06}    #cenario06
@{CONTRATOCOTPF07}      #cenario07
@{CONTRATOCOTPF08}      #cenario08
@{CONTRATOCOTPF09}      #cenario09
@{CONTPOTENCIALPJ10}    #cenario10
@{CONTPOTENCIALPJ11}    #cenario11
@{CONTPOTENCIALPJ12}    #cenario12
@{CONTCONTAPJ13}        #cenario13
@{CONTCONTAPJ14}        #cenario14
@{CONTCONTAPJ15}        #cenario15
@{CONTRATOCOTPJ16}      #cenario16
@{CONTRATOCOTPJ17}      #cenario17
@{CONTRATOCOTPJ18}      #cenario18
@{CONTPOTENCIALPJ19}    #cenario19
@{CONTPOTENCIALPJ20}    #cenario20
@{CONTCONTAPJ21}        #cenario21
@{CONTCONTAPJ22}        #cenario22
@{CONTCONTAPJ23}        #cenario23
@{CONTRATOCOTPJ24}      #cenario24
@{CONTRATOCOTPJ25}      #cenario25
@{CONTRATOCOTPJ26}      #cenario26
@{CONTPOTCAEPF27}       #cenario27
@{CONTPOTCAEPF28}       #cenario28
@{CONTPOTCAEPF29}       #cenario29
@{CONTCONTACAEPF30}     #cenario30
@{CONTCONTACAEPF31}     #cenario31
@{CONTCONTACAEPF32}     #cenario32
@{CONTRATOCONTCAEPF33}  #cenario33
@{CONTRATOCONTCAEPF34}  #cenario34
@{CONTRATOCONTCAEPF35}  #cenario35
@{CONTPOTCAEPF36}       #cenario36
@{CONTPOTCAEPF37}       #cenario37
@{CONTPOTCAEPF38}       #cenario38
@{CONTPOTCAEPF39}       #cenario39
@{CONTPOTCAEPF40}       #cenario40
@{CONTRATOCONTCAEPF41}  #cenario41
@{CONTRATOCONTCAEPF42}  #cenario42
@{CONTRATOCONTCAEPF43}  #cenario43
*** Keywords ***
Instanciar Variaveis Contrato
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOPOTPF01}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOPOTPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOPOTPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOPOTPF01}  ${temp}
    Append To List  ${CONTRATOPOTPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOPOTPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTRATOPOTPF01}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${CONTRATOPOTPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${CONTRATOPOTPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOPOTPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOPOTPF01}  ${temp}
    Append To List  ${CONTRATOPOTPF01}  Boleto


    #Instanciar Variavel Cliente PF TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOPOTPF02}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOPOTPF02}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOPOTPF02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOPOTPF02}  ${temp}
    Append To List  ${CONTRATOPOTPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOPOTPF02}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTRATOPOTPF02}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${CONTRATOPOTPF02}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${CONTRATOPOTPF02}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOPOTPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOPOTPF02}  ${temp}
    Append To List  ${CONTRATOPOTPF02}  Boleto


    #Instanciar Variavel Cliente PF TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOPOTPF03}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOPOTPF03}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOPOTPF03}  ${temp}
    Set Global Variable  @{CONTRATOPOTPF03}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOPOTPF03}  ${temp}
    Append To List  ${CONTRATOPOTPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOPOTPF03}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTRATOPOTPF03}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${CONTRATOPOTPF03}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${CONTRATOPOTPF03}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOPOTPF03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOPOTPF03}  ${temp}
    Append To List  ${CONTRATOPOTPF03}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=25  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOPOTPF03}  ${nasc}
    Append To List  ${CONTRATOPOTPF03}  Titular
    Append To List  ${CONTRATOPOTPF03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTRATOPOTPF03}  ${temp}
    Append To List  ${CONTRATOPOTPF03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOPOTPF03}  ${conta}
    Append To List  ${CONTRATOPOTPF03}  Solteiro(a)
    Append To List  ${CONTRATOPOTPF03}  CURITIBA
    Append To List  ${CONTRATOPOTPF03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${CONTRATOPOTPF03}  Residencial
    Append To List  ${CONTRATOPOTPF03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTRATOPOTPF03}  ${temp}
    Append To List  ${CONTRATOPOTPF03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTRATOPOTPF03}  ${temp}
    #Adicionando - Pessoa: Arg26: Tipo, Arg27: cpf, Arg28: Nome Beneficiario, Arg29: Estado Civil, Arg30: Grau Dependencia, Arg31: Data Nascimento Dependente
    Append To List  ${CONTRATOPOTPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOPOTPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOPOTPF03}  ${conta}
    Append To List  ${CONTRATOPOTPF03}  Solteiro(a)
    Append To List  ${CONTRATOPOTPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=16  maximum_age=20
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOPOTPF03}  ${nasc}


    #Instanciar Variavel Cliente PF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCONTAPF04}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTAPF04}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCONTAPF04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCONTAPF04}  ${temp}
    Append To List  ${CONTRATOCONTAPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTAPF04}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTRATOCONTAPF04}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${CONTRATOCONTAPF04}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${CONTRATOCONTAPF04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTAPF04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCONTAPF04}  ${temp}
    Append To List  ${CONTRATOCONTAPF04}  Boleto


    #Instanciar Variavel Cliente PF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCONTAPF05}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTAPF05}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCONTAPF05}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCONTAPF05}  ${temp}
    Append To List  ${CONTRATOCONTAPF05}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTAPF05}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTRATOCONTAPF05}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${CONTRATOCONTAPF05}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${CONTRATOCONTAPF05}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTAPF05}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCONTAPF05}  ${temp}
    Append To List  ${CONTRATOCONTAPF05}  Boleto


    #Instanciar Variavel Cliente PF TR006
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCONTAPF06}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTAPF06}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCONTAPF06}  ${temp}
    Set Global Variable  @{CONTRATOCONTAPF06}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCONTAPF06}  ${temp}
    Append To List  ${CONTRATOCONTAPF06}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTAPF06}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTRATOCONTAPF06}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${CONTRATOCONTAPF06}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${CONTRATOCONTAPF06}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTAPF06}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCONTAPF06}  ${temp}
    Append To List  ${CONTRATOCONTAPF06}  Boleto
    #Adicionando: Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=25  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCONTAPF06}  ${nasc}
    Append To List  ${CONTRATOCONTAPF06}  Titular
    Append To List  ${CONTRATOCONTAPF06}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTRATOCONTAPF06}  ${temp}
    Append To List  ${CONTRATOCONTAPF06}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTAPF06}  ${conta}
    Append To List  ${CONTRATOCONTAPF06}  Solteiro(a)
    Append To List  ${CONTRATOCONTAPF06}  CURITIBA
    Append To List  ${CONTRATOCONTAPF06}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone
    Append To List  ${CONTRATOCONTAPF06}  Residencial
    Append To List  ${CONTRATOCONTAPF06}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTRATOCONTAPF06}  ${temp}
    Append To List  ${CONTRATOCONTAPF06}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTRATOCONTAPF06}  ${temp}
    #Adicionando - Pessoa: Arg26: Tipo, Arg27: cpf, Arg28: Nome Beneficiario, Arg29: Estado Civil, Arg30: Grau Dependencia, Arg31: Data Nascimento Dependente
    Append To List  ${CONTRATOCONTAPF06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCONTAPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTAPF06}  ${conta}
    Append To List  ${CONTRATOCONTAPF06}  Solteiro(a)
    Append To List  ${CONTRATOCONTAPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=20
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCONTAPF06}  ${nasc}


    #Instanciar Variavel Cliente PF TR007
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCOTPF07}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPF07}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCOTPF07}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCOTPF07}  ${temp}
    Append To List  ${CONTRATOCOTPF07}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPF07}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTRATOCOTPF07}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${CONTRATOCOTPF07}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${CONTRATOCOTPF07}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPF07}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCOTPF07}  ${temp}
    Append To List  ${CONTRATOCOTPF07}  Boleto


    #Instanciar Variavel Cliente PF TR008
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCOTPF08}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPF08}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCOTPF08}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCOTPF08}  ${temp}
    Append To List  ${CONTRATOCOTPF08}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPF08}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTRATOCOTPF08}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${CONTRATOCOTPF08}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${CONTRATOCOTPF08}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPF08}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCOTPF08}  ${temp}
    Append To List  ${CONTRATOCOTPF08}  Boleto
    

    #Instanciar Variavel Cliente PF TR009
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCOTPF09}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPF09}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCOTPF09}  ${temp}
    Set Global Variable  @{CONTRATOCOTPF09}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCOTPF09}  ${temp}
    Append To List  ${CONTRATOCOTPF09}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPF09}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTRATOCOTPF09}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${CONTRATOCOTPF09}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${CONTRATOCOTPF09}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPF09}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCOTPF09}  ${temp}
    Append To List  ${CONTRATOCOTPF09}  Boleto
    #Adicionando: Arg11: Data de Nascimento, Arg12: Tipo, Arg13: Grau de Dependencia
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=25  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCOTPF09}  ${nasc}
    Append To List  ${CONTRATOCOTPF09}  Titular
    Append To List  ${CONTRATOCOTPF09}  00 - Titular
    #Adicionando: Arg14: CNS, Arg15: Sexo, Arg16: Nome da Mãe, Arg17: Estado Civil,  
    #             Arg18: Naturalidade, Arg19: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTRATOCOTPF09}  ${temp}
    Append To List  ${CONTRATOCOTPF09}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPF09}  ${conta}
    Append To List  ${CONTRATOCOTPF09}  Solteiro(a)
    Append To List  ${CONTRATOCOTPF09}  CURITIBA
    Append To List  ${CONTRATOCOTPF09}  Branca
    #Adicionando: Arg20: Tipo do Endereço, Arg21: CEP, Arg22: Número, Arg23: Tipo Telefone, Arg24: Numero Telefone
    Append To List  ${CONTRATOCOTPF09}  Residencial
    Append To List  ${CONTRATOCOTPF09}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTRATOCOTPF09}  ${temp}
    Append To List  ${CONTRATOCOTPF09}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTRATOCOTPF09}  ${temp}
    #Adicionando - Pessoa: Arg25: Tipo, Arg26: cpf, Arg27: Nome Beneficiario, Arg28: Estado Civil, Arg29: Grau Dependencia, Arg30: Data Nascimento Dependente
    Append To List  ${CONTRATOCOTPF09}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCOTPF09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPF09}  ${conta}
    Append To List  ${CONTRATOCOTPF09}  Solteiro(a)
    Append To List  ${CONTRATOCOTPF09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=20
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCOTPF09}  ${nasc}


    #Instanciar Variavel Cliente PJ TR010
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTPOTENCIALPJ10}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTPOTENCIALPJ10}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTPOTENCIALPJ10}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTPOTENCIALPJ10}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTPOTENCIALPJ10}  ${temp}
    Append To List  ${CONTPOTENCIALPJ10}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTENCIALPJ10}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTPOTENCIALPJ10}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTPOTENCIALPJ10}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTPOTENCIALPJ10}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTENCIALPJ10}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTPOTENCIALPJ10}  ${temp}
    Append To List  ${CONTPOTENCIALPJ10}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTENCIALPJ10}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTENCIALPJ10}  ${nasc}
    Append To List  ${CONTPOTENCIALPJ10}  Titular
    Append To List  ${CONTPOTENCIALPJ10}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTPOTENCIALPJ10}  ${temp}
    Append To List  ${CONTPOTENCIALPJ10}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTENCIALPJ10}  ${conta}
    Append To List  ${CONTPOTENCIALPJ10}  Solteiro(a)
    Append To List  ${CONTPOTENCIALPJ10}  CURITIBA
    Append To List  ${CONTPOTENCIALPJ10}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${CONTPOTENCIALPJ10}  Residencial
    Append To List  ${CONTPOTENCIALPJ10}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTPOTENCIALPJ10}  ${temp}
    Append To List  ${CONTPOTENCIALPJ10}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTPOTENCIALPJ10}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${CONTPOTENCIALPJ10}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTPOTENCIALPJ10}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${CONTPOTENCIALPJ10}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTENCIALPJ10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTENCIALPJ10}  ${conta}
    Append To List  ${CONTPOTENCIALPJ10}  Solteiro(a)
    Append To List  ${CONTPOTENCIALPJ10}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTENCIALPJ10}  ${nasc}


    #Instanciar Variavel Cliente PJ TR011
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTPOTENCIALPJ11}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTPOTENCIALPJ11}  ${company}
    Append To List  ${CONTPOTENCIALPJ11}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTPOTENCIALPJ11}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTPOTENCIALPJ11}  ${temp}
    Append To List  ${CONTPOTENCIALPJ11}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTENCIALPJ11}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTPOTENCIALPJ11}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTPOTENCIALPJ11}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTPOTENCIALPJ11}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTENCIALPJ11}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTPOTENCIALPJ11}  ${temp}
    Append To List  ${CONTPOTENCIALPJ11}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTENCIALPJ11}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTENCIALPJ11}  ${nasc}
    Append To List  ${CONTPOTENCIALPJ11}  Titular
    Append To List  ${CONTPOTENCIALPJ11}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTPOTENCIALPJ11}  ${temp}
    Append To List  ${CONTPOTENCIALPJ11}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTENCIALPJ11}  ${conta}
    Append To List  ${CONTPOTENCIALPJ11}  Solteiro(a)
    Append To List  ${CONTPOTENCIALPJ11}  CURITIBA
    Append To List  ${CONTPOTENCIALPJ11}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTPOTENCIALPJ11}  Residencial
    Append To List  ${CONTPOTENCIALPJ11}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTPOTENCIALPJ11}  ${temp}
    Append To List  ${CONTPOTENCIALPJ11}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTPOTENCIALPJ11}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTPOTENCIALPJ11}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTPOTENCIALPJ11}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTPOTENCIALPJ11}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTENCIALPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTENCIALPJ11}  ${conta}
    Append To List  ${CONTPOTENCIALPJ11}  Solteiro(a)
    Append To List  ${CONTPOTENCIALPJ11}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTENCIALPJ11}  ${nasc}


    #Instanciar Variavel Cliente PJ TR012
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTPOTENCIALPJ12}  Pessoa Jurídica (CNPJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTPOTENCIALPJ12}  ${company}
    Append To List  ${CONTPOTENCIALPJ12}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTPOTENCIALPJ12}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTPOTENCIALPJ12}  ${temp}
    Append To List  ${CONTPOTENCIALPJ12}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTENCIALPJ12}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTPOTENCIALPJ12}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTPOTENCIALPJ12}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTPOTENCIALPJ12}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTENCIALPJ12}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTPOTENCIALPJ12}  ${temp}
    Append To List  ${CONTPOTENCIALPJ12}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTENCIALPJ12}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTENCIALPJ12}  ${nasc}
    Append To List  ${CONTPOTENCIALPJ12}  Titular
    Append To List  ${CONTPOTENCIALPJ12}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTPOTENCIALPJ12}  ${temp}
    Append To List  ${CONTPOTENCIALPJ12}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTENCIALPJ12}  ${conta}
    Append To List  ${CONTPOTENCIALPJ12}  Solteiro(a)
    Append To List  ${CONTPOTENCIALPJ12}  CURITIBA
    Append To List  ${CONTPOTENCIALPJ12}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTPOTENCIALPJ12}  Residencial
    Append To List  ${CONTPOTENCIALPJ12}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTPOTENCIALPJ12}  ${temp}
    Append To List  ${CONTPOTENCIALPJ12}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTPOTENCIALPJ12}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTPOTENCIALPJ12}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTPOTENCIALPJ12}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTPOTENCIALPJ12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTENCIALPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTENCIALPJ12}  ${conta}
    Append To List  ${CONTPOTENCIALPJ12}  Solteiro(a)
    Append To List  ${CONTPOTENCIALPJ12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTENCIALPJ12}  ${nasc}


    #Instanciar Variavel Cliente PJ TR013
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTCONTAPJ13}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTCONTAPJ13}  ${company}
    Append To List  ${CONTCONTAPJ13}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTCONTAPJ13}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTCONTAPJ13}  ${temp}
    Append To List  ${CONTCONTAPJ13}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTAPJ13}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTCONTAPJ13}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTCONTAPJ13}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTCONTAPJ13}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTAPJ13}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTCONTAPJ13}  ${temp}
    Append To List  ${CONTCONTAPJ13}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTCONTAPJ13}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTCONTAPJ13}  ${nasc}
    Append To List  ${CONTCONTAPJ13}  Titular
    Append To List  ${CONTCONTAPJ13}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTCONTAPJ13}  ${temp}
    Append To List  ${CONTCONTAPJ13}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTCONTAPJ13}  ${conta}
    Append To List  ${CONTCONTAPJ13}  Solteiro(a)
    Append To List  ${CONTCONTAPJ13}  CURITIBA
    Append To List  ${CONTCONTAPJ13}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTCONTAPJ13}  Residencial
    Append To List  ${CONTCONTAPJ13}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTCONTAPJ13}  ${temp}
    Append To List  ${CONTCONTAPJ13}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTCONTAPJ13}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTCONTAPJ13}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTCONTAPJ13}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTCONTAPJ13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTCONTAPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTCONTAPJ13}  ${conta}
    Append To List  ${CONTCONTAPJ13}  Solteiro(a)
    Append To List  ${CONTCONTAPJ13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTCONTAPJ13}  ${nasc}


    #Instanciar Variavel Cliente PJ TR014
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTCONTAPJ14}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTCONTAPJ14}  ${company}
    Append To List  ${CONTCONTAPJ14}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTCONTAPJ14}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTCONTAPJ14}  ${temp}
    Append To List  ${CONTCONTAPJ14}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTAPJ14}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTCONTAPJ14}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTCONTAPJ14}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTCONTAPJ14}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTAPJ14}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTCONTAPJ14}  ${temp}
    Append To List  ${CONTCONTAPJ14}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTCONTAPJ14}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTCONTAPJ14}  ${nasc}
    Append To List  ${CONTCONTAPJ14}  Titular
    Append To List  ${CONTCONTAPJ14}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTCONTAPJ14}  ${temp}
    Append To List  ${CONTCONTAPJ14}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTCONTAPJ14}  ${conta}
    Append To List  ${CONTCONTAPJ14}  Solteiro(a)
    Append To List  ${CONTCONTAPJ14}  CURITIBA
    Append To List  ${CONTCONTAPJ14}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTCONTAPJ14}  Residencial
    Append To List  ${CONTCONTAPJ14}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTCONTAPJ14}  ${temp}
    Append To List  ${CONTCONTAPJ14}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTCONTAPJ14}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTCONTAPJ14}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTCONTAPJ14}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTCONTAPJ14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTCONTAPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTCONTAPJ14}  ${conta}
    Append To List  ${CONTCONTAPJ14}  Solteiro(a)
    Append To List  ${CONTCONTAPJ14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTCONTAPJ14}  ${nasc}


    #Instanciar Variavel Cliente PJ TR015
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTCONTAPJ15}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTCONTAPJ15}  ${company}
    Append To List  ${CONTCONTAPJ15}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTCONTAPJ15}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTCONTAPJ15}  ${temp}
    Append To List  ${CONTCONTAPJ15}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTAPJ15}  ${date}
     # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTCONTAPJ15}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTCONTAPJ15}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTCONTAPJ15}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTAPJ15}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTCONTAPJ15}  ${temp}
    Append To List  ${CONTCONTAPJ15}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTCONTAPJ15}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTCONTAPJ15}  ${nasc}
    Append To List  ${CONTCONTAPJ15}  Titular
    Append To List  ${CONTCONTAPJ15}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTCONTAPJ15}  ${temp}
    Append To List  ${CONTCONTAPJ15}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTCONTAPJ15}  ${conta}
    Append To List  ${CONTCONTAPJ15}  Solteiro(a)
    Append To List  ${CONTCONTAPJ15}  CURITIBA
    Append To List  ${CONTCONTAPJ15}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTCONTAPJ15}  Residencial
    Append To List  ${CONTCONTAPJ15}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTCONTAPJ15}  ${temp}
    Append To List  ${CONTCONTAPJ15}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTCONTAPJ15}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTCONTAPJ15}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTCONTAPJ15}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTCONTAPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTCONTAPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTCONTAPJ15}  ${conta}
    Append To List  ${CONTCONTAPJ15}  Solteiro(a)
    Append To List  ${CONTCONTAPJ15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTCONTAPJ15}  ${nasc}


    #Instanciar Variavel Cliente PJ TR016
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCOTPJ16}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTRATOCOTPJ16}  ${company}
    Append To List  ${CONTRATOCOTPJ16}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTRATOCOTPJ16}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCOTPJ16}  ${temp}
    Append To List  ${CONTRATOCOTPJ16}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPJ16}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTRATOCOTPJ16}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTRATOCOTPJ16}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTRATOCOTPJ16}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPJ16}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCOTPJ16}  ${temp}
    Append To List  ${CONTRATOCOTPJ16}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCOTPJ16}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCOTPJ16}  ${nasc}
    Append To List  ${CONTRATOCOTPJ16}  Titular
    Append To List  ${CONTRATOCOTPJ16}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTRATOCOTPJ16}  ${temp}
    Append To List  ${CONTRATOCOTPJ16}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPJ16}  ${conta}
    Append To List  ${CONTRATOCOTPJ16}  Solteiro(a)
    Append To List  ${CONTRATOCOTPJ16}  CURITIBA
    Append To List  ${CONTRATOCOTPJ16}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTRATOCOTPJ16}  Residencial
    Append To List  ${CONTRATOCOTPJ16}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTRATOCOTPJ16}  ${temp}
    Append To List  ${CONTRATOCOTPJ16}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTRATOCOTPJ16}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTRATOCOTPJ16}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTRATOCOTPJ16}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTRATOCOTPJ16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCOTPJ16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPJ16}  ${conta}
    Append To List  ${CONTRATOCOTPJ16}  Solteiro(a)
    Append To List  ${CONTRATOCOTPJ16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCOTPJ16}  ${nasc}


    #Instanciar Variavel Cliente PJ TR017
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCOTPJ17}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTRATOCOTPJ17}  ${company}
    Append To List  ${CONTRATOCOTPJ17}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTRATOCOTPJ17}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCOTPJ17}  ${temp}
    Append To List  ${CONTRATOCOTPJ17}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPJ17}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTRATOCOTPJ17}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTRATOCOTPJ17}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTRATOCOTPJ17}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPJ17}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCOTPJ17}  ${temp}
    Append To List  ${CONTRATOCOTPJ17}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCOTPJ17}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCOTPJ17}  ${nasc}
    Append To List  ${CONTRATOCOTPJ17}  Titular
    Append To List  ${CONTRATOCOTPJ17}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTRATOCOTPJ17}  ${temp}
    Append To List  ${CONTRATOCOTPJ17}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPJ17}  ${conta}
    Append To List  ${CONTRATOCOTPJ17}  Solteiro(a)
    Append To List  ${CONTRATOCOTPJ17}  CURITIBA
    Append To List  ${CONTRATOCOTPJ17}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTRATOCOTPJ17}  Residencial
    Append To List  ${CONTRATOCOTPJ17}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTRATOCOTPJ17}  ${temp}
    Append To List  ${CONTRATOCOTPJ17}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTRATOCOTPJ17}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTRATOCOTPJ17}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTRATOCOTPJ17}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTRATOCOTPJ17}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCOTPJ17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPJ17}  ${conta}
    Append To List  ${CONTRATOCOTPJ17}  Solteiro(a)
    Append To List  ${CONTRATOCOTPJ17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCOTPJ17}  ${nasc}


    #Instanciar Variavel Cliente PJ TR018
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCOTPJ18}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTRATOCOTPJ18}  ${company}
    Append To List  ${CONTRATOCOTPJ18}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTRATOCOTPJ18}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCOTPJ18}  ${temp}
    Append To List  ${CONTRATOCOTPJ18}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPJ18}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTRATOCOTPJ18}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTRATOCOTPJ18}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTRATOCOTPJ18}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPJ18}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCOTPJ18}  ${temp}
    Append To List  ${CONTRATOCOTPJ18}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCOTPJ18}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCOTPJ18}  ${nasc}
    Append To List  ${CONTRATOCOTPJ18}  Titular
    Append To List  ${CONTRATOCOTPJ18}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTRATOCOTPJ18}  ${temp}
    Append To List  ${CONTRATOCOTPJ18}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPJ18}  ${conta}
    Append To List  ${CONTRATOCOTPJ18}  Solteiro(a)
    Append To List  ${CONTRATOCOTPJ18}  CURITIBA
    Append To List  ${CONTRATOCOTPJ18}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTRATOCOTPJ18}  Residencial
    Append To List  ${CONTRATOCOTPJ18}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTRATOCOTPJ18}  ${temp}
    Append To List  ${CONTRATOCOTPJ18}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTRATOCOTPJ18}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTRATOCOTPJ18}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${CONTRATOCOTPJ18}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTRATOCOTPJ18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCOTPJ18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPJ18}  ${conta}
    Append To List  ${CONTRATOCOTPJ18}  Solteiro(a)
    Append To List  ${CONTRATOCOTPJ18}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCOTPJ18}  ${nasc}


    #Instanciar Variavel Cliente PJ TR019
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTPOTENCIALPJ19}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTPOTENCIALPJ19}  ${company}
    Append To List  ${CONTPOTENCIALPJ19}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTPOTENCIALPJ19}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTPOTENCIALPJ19}  ${temp}
    Append To List  ${CONTPOTENCIALPJ19}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTENCIALPJ19}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTPOTENCIALPJ19}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${CONTPOTENCIALPJ19}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTPOTENCIALPJ19}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTENCIALPJ19}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTPOTENCIALPJ19}  ${temp}
    Append To List  ${CONTPOTENCIALPJ19}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTENCIALPJ19}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTENCIALPJ19}  ${nasc}
    Append To List  ${CONTPOTENCIALPJ19}  Titular
    Append To List  ${CONTPOTENCIALPJ19}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTPOTENCIALPJ19}  ${temp}
    Append To List  ${CONTPOTENCIALPJ19}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTENCIALPJ19}  ${conta}
    Append To List  ${CONTPOTENCIALPJ19}  Solteiro(a)
    Append To List  ${CONTPOTENCIALPJ19}  CURITIBA
    Append To List  ${CONTPOTENCIALPJ19}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTPOTENCIALPJ19}  Residencial
    Append To List  ${CONTPOTENCIALPJ19}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTPOTENCIALPJ19}  ${temp}
    Append To List  ${CONTPOTENCIALPJ19}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTPOTENCIALPJ19}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTPOTENCIALPJ19}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTPOTENCIALPJ19}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTPOTENCIALPJ19}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTENCIALPJ19}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTENCIALPJ19}  ${conta}
    Append To List  ${CONTPOTENCIALPJ19}  Solteiro(a)
    Append To List  ${CONTPOTENCIALPJ19}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTENCIALPJ19}  ${nasc}


    #Instanciar Variavel Cliente PJ TR020
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTPOTENCIALPJ20}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTPOTENCIALPJ20}  ${company}
    Append To List  ${CONTPOTENCIALPJ20}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTPOTENCIALPJ20}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTPOTENCIALPJ20}  ${temp}
    Append To List  ${CONTPOTENCIALPJ20}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTENCIALPJ20}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTPOTENCIALPJ20}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${CONTPOTENCIALPJ20}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTPOTENCIALPJ20}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTENCIALPJ20}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTPOTENCIALPJ20}  ${temp}
    Append To List  ${CONTPOTENCIALPJ20}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTENCIALPJ20}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTENCIALPJ20}  ${nasc}
    Append To List  ${CONTPOTENCIALPJ20}  Titular
    Append To List  ${CONTPOTENCIALPJ20}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTPOTENCIALPJ20}  ${temp}
    Append To List  ${CONTPOTENCIALPJ20}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTENCIALPJ20}  ${conta}
    Append To List  ${CONTPOTENCIALPJ20}  Solteiro(a)
    Append To List  ${CONTPOTENCIALPJ20}  CURITIBA
    Append To List  ${CONTPOTENCIALPJ20}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTPOTENCIALPJ20}  Residencial
    Append To List  ${CONTPOTENCIALPJ20}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTPOTENCIALPJ20}  ${temp}
    Append To List  ${CONTPOTENCIALPJ20}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTPOTENCIALPJ20}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTPOTENCIALPJ20}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTPOTENCIALPJ20}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTPOTENCIALPJ20}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTENCIALPJ20}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTENCIALPJ20}  ${conta}
    Append To List  ${CONTPOTENCIALPJ20}  Solteiro(a)
    Append To List  ${CONTPOTENCIALPJ20}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTENCIALPJ20}  ${nasc}


    #Instanciar Variavel Cliente PJ TR021
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2: CNPJ/CPF/CAEPF
    Append To List  ${CONTCONTAPJ21}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTCONTAPJ21}  ${company}
    Append To List  ${CONTCONTAPJ21}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTCONTAPJ21}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTCONTAPJ21}  ${temp}
    Append To List  ${CONTCONTAPJ21}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTAPJ21}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTCONTAPJ21}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${CONTCONTAPJ21}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTCONTAPJ21}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTAPJ21}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTCONTAPJ21}  ${temp}
    Append To List  ${CONTCONTAPJ21}  Boleto


    #Instanciar Variavel Cliente PJ TR022
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTCONTAPJ22}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTCONTAPJ22}  ${company}
    Append To List  ${CONTCONTAPJ22}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTCONTAPJ22}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTCONTAPJ22}  ${temp}
    Append To List  ${CONTCONTAPJ22}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTAPJ22}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTCONTAPJ22}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${CONTCONTAPJ22}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTCONTAPJ22}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTAPJ22}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTCONTAPJ22}  ${temp}
    Append To List  ${CONTCONTAPJ22}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTCONTAPJ22}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTCONTAPJ22}  ${nasc}
    Append To List  ${CONTCONTAPJ22}  Titular
    Append To List  ${CONTCONTAPJ22}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTCONTAPJ22}  ${temp}
    Append To List  ${CONTCONTAPJ22}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTCONTAPJ22}  ${conta}
    Append To List  ${CONTCONTAPJ22}  Solteiro(a)
    Append To List  ${CONTCONTAPJ22}  CURITIBA
    Append To List  ${CONTCONTAPJ22}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTCONTAPJ22}  Residencial
    Append To List  ${CONTCONTAPJ22}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTCONTAPJ22}  ${temp}
    Append To List  ${CONTCONTAPJ22}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTCONTAPJ22}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTCONTAPJ22}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTCONTAPJ22}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTCONTAPJ22}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTCONTAPJ22}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTCONTAPJ22}  ${conta}
    Append To List  ${CONTCONTAPJ22}  Solteiro(a)
    Append To List  ${CONTCONTAPJ22}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTCONTAPJ22}  ${nasc}


    #Instanciar Variavel Cliente PJ TR023
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTCONTAPJ23}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTCONTAPJ23}  ${company}
    Append To List  ${CONTCONTAPJ23}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTCONTAPJ23}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTCONTAPJ23}  ${temp}
    Append To List  ${CONTCONTAPJ23}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTAPJ23}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTCONTAPJ23}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${CONTCONTAPJ23}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTCONTAPJ23}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTAPJ23}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTCONTAPJ23}  ${temp}
    Append To List  ${CONTCONTAPJ23}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTCONTAPJ23}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTCONTAPJ23}  ${nasc}
    Append To List  ${CONTCONTAPJ23}  Titular
    Append To List  ${CONTCONTAPJ23}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTCONTAPJ23}  ${temp}
    Append To List  ${CONTCONTAPJ23}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTCONTAPJ23}  ${conta}
    Append To List  ${CONTCONTAPJ23}  Solteiro(a)
    Append To List  ${CONTCONTAPJ23}  CURITIBA
    Append To List  ${CONTCONTAPJ23}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTCONTAPJ23}  Residencial
    Append To List  ${CONTCONTAPJ23}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTCONTAPJ23}  ${temp}
    Append To List  ${CONTCONTAPJ23}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTCONTAPJ23}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTCONTAPJ23}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTCONTAPJ23}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTCONTAPJ23}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTCONTAPJ23}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTCONTAPJ23}  ${conta}
    Append To List  ${CONTCONTAPJ23}  Solteiro(a)
    Append To List  ${CONTCONTAPJ23}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTCONTAPJ23}  ${nasc}


    #Instanciar Variavel Cliente PJ TR024
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCOTPJ24}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTRATOCOTPJ24}  ${company}
    Append To List  ${CONTRATOCOTPJ24}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTRATOCOTPJ24}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCOTPJ24}  ${temp}
    Append To List  ${CONTRATOCOTPJ24}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPJ24}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTRATOCOTPJ24}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${CONTRATOCOTPJ24}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTRATOCOTPJ24}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPJ24}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCOTPJ24}  ${temp}
    Append To List  ${CONTRATOCOTPJ24}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCOTPJ24}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCOTPJ24}  ${nasc}
    Append To List  ${CONTRATOCOTPJ24}  Titular
    Append To List  ${CONTRATOCOTPJ24}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTRATOCOTPJ24}  ${temp}
    Append To List  ${CONTRATOCOTPJ24}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPJ24}  ${conta}
    Append To List  ${CONTRATOCOTPJ24}  Solteiro(a)
    Append To List  ${CONTRATOCOTPJ24}  CURITIBA
    Append To List  ${CONTRATOCOTPJ24}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTRATOCOTPJ24}  Residencial
    Append To List  ${CONTRATOCOTPJ24}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTRATOCOTPJ24}  ${temp}
    Append To List  ${CONTRATOCOTPJ24}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTRATOCOTPJ24}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTRATOCOTPJ24}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTRATOCOTPJ24}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTRATOCOTPJ24}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCOTPJ24}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPJ24}  ${conta}
    Append To List  ${CONTRATOCOTPJ24}  Solteiro(a)
    Append To List  ${CONTRATOCOTPJ24}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCOTPJ24}  ${nasc}


    #Instanciar Variavel Cliente PJ TR025
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCOTPJ25}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTRATOCOTPJ25}  ${company}
    Append To List  ${CONTRATOCOTPJ25}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTRATOCOTPJ25}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCOTPJ25}  ${temp}
    Append To List  ${CONTRATOCOTPJ25}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPJ25}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTRATOCOTPJ25}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${CONTRATOCOTPJ25}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTRATOCOTPJ25}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPJ25}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCOTPJ25}  ${temp}
    Append To List  ${CONTRATOCOTPJ25}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCOTPJ25}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCOTPJ25}  ${nasc}
    Append To List  ${CONTRATOCOTPJ25}  Titular
    Append To List  ${CONTRATOCOTPJ25}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTRATOCOTPJ25}  ${temp}
    Append To List  ${CONTRATOCOTPJ25}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPJ25}  ${conta}
    Append To List  ${CONTRATOCOTPJ25}  Solteiro(a)
    Append To List  ${CONTRATOCOTPJ25}  CURITIBA
    Append To List  ${CONTRATOCOTPJ25}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTRATOCOTPJ25}  Residencial
    Append To List  ${CONTRATOCOTPJ25}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTRATOCOTPJ25}  ${temp}
    Append To List  ${CONTRATOCOTPJ25}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTRATOCOTPJ25}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTRATOCOTPJ25}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTRATOCOTPJ25}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTRATOCOTPJ25}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCOTPJ25}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPJ25}  ${conta}
    Append To List  ${CONTRATOCOTPJ25}  Solteiro(a)
    Append To List  ${CONTRATOCOTPJ25}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCOTPJ25}  ${nasc}


    #Instanciar Variavel Cliente PJ TR026
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCOTPJ26}  Potencial Cliente (PJ)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTRATOCOTPJ26}  ${company}
    Append To List  ${CONTRATOCOTPJ26}  ${company}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CONTRATOCOTPJ26}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCOTPJ26}  ${temp}
    Append To List  ${CONTRATOCOTPJ26}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPJ26}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTRATOCOTPJ26}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${CONTRATOCOTPJ26}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTRATOCOTPJ26}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCOTPJ26}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCOTPJ26}  ${temp}
    Append To List  ${CONTRATOCOTPJ26}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCOTPJ26}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCOTPJ26}  ${nasc}
    Append To List  ${CONTRATOCOTPJ26}  Titular
    Append To List  ${CONTRATOCOTPJ26}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTRATOCOTPJ26}  ${temp}
    Append To List  ${CONTRATOCOTPJ26}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPJ26}  ${conta}
    Append To List  ${CONTRATOCOTPJ26}  Solteiro(a)
    Append To List  ${CONTRATOCOTPJ26}  CURITIBA
    Append To List  ${CONTRATOCOTPJ26}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTRATOCOTPJ26}  Residencial
    Append To List  ${CONTRATOCOTPJ26}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTRATOCOTPJ26}  ${temp}
    Append To List  ${CONTRATOCOTPJ26}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTRATOCOTPJ26}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTRATOCOTPJ26}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTRATOCOTPJ26}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTRATOCOTPJ26}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCOTPJ26}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCOTPJ26}  ${conta}
    Append To List  ${CONTRATOCOTPJ26}  Solteiro(a)
    Append To List  ${CONTRATOCOTPJ26}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCOTPJ26}  ${nasc}


    #Instanciar Variavel Cliente CAEPF TR027
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTPOTCAEPF27}  Pessoa Jurídica (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTPOTCAEPF27}  ${company}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTPOTCAEPF27}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTPOTCAEPF27}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTPOTCAEPF27}  ${temp}
    Append To List  ${CONTPOTCAEPF27}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTCAEPF27}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTPOTCAEPF27}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTPOTCAEPF27}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${CONTPOTCAEPF27}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTCAEPF27}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTPOTCAEPF27}  ${temp}
    Append To List  ${CONTPOTCAEPF27}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTCAEPF27}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTCAEPF27}  ${nasc}
    Append To List  ${CONTPOTCAEPF27}  Titular
    Append To List  ${CONTPOTCAEPF27}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTPOTCAEPF27}  ${temp}
    Append To List  ${CONTPOTCAEPF27}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTCAEPF27}  ${conta}
    Append To List  ${CONTPOTCAEPF27}  Solteiro(a)
    Append To List  ${CONTPOTCAEPF27}  CURITIBA
    Append To List  ${CONTPOTCAEPF27}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTPOTCAEPF27}  Residencial
    Append To List  ${CONTPOTCAEPF27}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTPOTCAEPF27}  ${temp}
    Append To List  ${CONTPOTCAEPF27}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTPOTCAEPF27}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTPOTCAEPF27}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${CONTPOTCAEPF27}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTPOTCAEPF27}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTCAEPF27}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTCAEPF27}  ${conta}
    Append To List  ${CONTPOTCAEPF27}  Solteiro(a)
    Append To List  ${CONTPOTCAEPF27}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTCAEPF27}  ${nasc}


    #Instanciar Variavel Cliente CAEPF TR028
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTPOTCAEPF28}  Pessoa Jurídica (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTPOTCAEPF28}  ${company}
    Append To List  ${CONTPOTCAEPF28}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTPOTCAEPF28}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTPOTCAEPF28}  ${temp}
    Append To List  ${CONTPOTCAEPF28}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTCAEPF28}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${CONTPOTCAEPF28}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTPOTCAEPF28}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${CONTPOTCAEPF28}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTCAEPF28}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTPOTCAEPF28}  ${temp}
    Append To List  ${CONTPOTCAEPF28}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTCAEPF28}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTCAEPF28}  ${nasc}
    Append To List  ${CONTPOTCAEPF28}  Titular
    Append To List  ${CONTPOTCAEPF28}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTPOTCAEPF28}  ${temp}
    Append To List  ${CONTPOTCAEPF28}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTCAEPF28}  ${conta}
    Append To List  ${CONTPOTCAEPF28}  Solteiro(a)
    Append To List  ${CONTPOTCAEPF28}  CURITIBA
    Append To List  ${CONTPOTCAEPF28}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTPOTCAEPF28}  Residencial
    Append To List  ${CONTPOTCAEPF28}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTPOTCAEPF28}  ${temp}
    Append To List  ${CONTPOTCAEPF28}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTPOTCAEPF28}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTPOTCAEPF28}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${CONTPOTCAEPF28}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTPOTCAEPF28}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTCAEPF28}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTCAEPF28}  ${conta}
    Append To List  ${CONTPOTCAEPF28}  Solteiro(a)
    Append To List  ${CONTPOTCAEPF28}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTCAEPF28}  ${nasc}


    #Instanciar Variavel Cliente CAEPF TR029
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTPOTCAEPF29}  Pessoa Jurídica (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTPOTCAEPF29}  ${company}
    Append To List  ${CONTPOTCAEPF29}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTPOTCAEPF29}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTPOTCAEPF29}  ${temp}
    Append To List  ${CONTPOTCAEPF29}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTCAEPF29}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${CONTPOTCAEPF29}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTPOTCAEPF29}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${CONTPOTCAEPF29}  Concluído e Aceito
    #Adicionando: Arg10: Data de Vigencia, Arg11: Dia de Vencimento, Arg12: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTCAEPF29}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTPOTCAEPF29}  ${temp}
    Append To List  ${CONTPOTCAEPF29}  Boleto
    #Adicionando: Arg13: CPF Beneficiario, Arg14: Data de Nascimento, Arg15: Tipo, Arg16: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTCAEPF29}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTCAEPF29}  ${nasc}
    Append To List  ${CONTPOTCAEPF29}  Titular
    Append To List  ${CONTPOTCAEPF29}  00 - Titular
    #Adicionando: Arg17: CNS, Arg18: Sexo, Arg19: Nome da Mãe, Arg20: Estado Civil,  
    #             Arg21: Naturalidade, Arg22: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTPOTCAEPF29}  ${temp}
    Append To List  ${CONTPOTCAEPF29}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTCAEPF29}  ${conta}
    Append To List  ${CONTPOTCAEPF29}  Solteiro(a)
    Append To List  ${CONTPOTCAEPF29}  CURITIBA
    Append To List  ${CONTPOTCAEPF29}  Branca
    #Adicionando: Arg23: Tipo do Endereço, Arg24: CEP, Arg25: Número, Arg26: Tipo Telefone, Arg27: Numero Telefone
    Append To List  ${CONTPOTCAEPF29}  Residencial
    Append To List  ${CONTPOTCAEPF29}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTPOTCAEPF29}  ${temp}
    Append To List  ${CONTPOTCAEPF29}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTPOTCAEPF29}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${CONTPOTCAEPF29}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${CONTPOTCAEPF29}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, Arg35: Data Nascimento Dependente
    Append To List  ${CONTPOTCAEPF29}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTCAEPF29}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTCAEPF29}  ${conta}
    Append To List  ${CONTPOTCAEPF29}  Solteiro(a)
    Append To List  ${CONTPOTCAEPF29}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTCAEPF29}  ${nasc}   


    #Instanciar Variavel Cliente CAEPF TR030
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTCONTACAEPF30}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTCONTACAEPF30}  ${company}
    Append To List  ${CONTCONTACAEPF30}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTCONTACAEPF30}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTCONTACAEPF30}  ${temp}
    Append To List  ${CONTCONTACAEPF30}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTACAEPF30}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${CONTCONTACAEPF30}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTCONTACAEPF30}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${CONTCONTACAEPF30}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTACAEPF30}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTCONTACAEPF30}  ${temp}
    Append To List  ${CONTCONTACAEPF30}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTCONTACAEPF30}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTCONTACAEPF30}  ${nasc}
    Append To List  ${CONTCONTACAEPF30}  Titular
    Append To List  ${CONTCONTACAEPF30}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTCONTACAEPF30}  ${temp}
    Append To List  ${CONTCONTACAEPF30}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTCONTACAEPF30}  ${conta}
    Append To List  ${CONTCONTACAEPF30}  Solteiro(a)
    Append To List  ${CONTCONTACAEPF30}  CURITIBA
    Append To List  ${CONTCONTACAEPF30}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTCONTACAEPF30}  Residencial
    Append To List  ${CONTCONTACAEPF30}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTCONTACAEPF30}  ${temp}
    Append To List  ${CONTCONTACAEPF30}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTCONTACAEPF30}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTCONTACAEPF30}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${CONTCONTACAEPF30}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTCONTACAEPF30}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTCONTACAEPF30}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTCONTACAEPF30}  ${conta}
    Append To List  ${CONTCONTACAEPF30}  Solteiro(a)
    Append To List  ${CONTCONTACAEPF30}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTCONTACAEPF30}  ${nasc}


    #Instanciar Variavel Cliente CAEPF TR031
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTCONTACAEPF31}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTCONTACAEPF31}  ${company}
    Append To List  ${CONTCONTACAEPF31}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTCONTACAEPF31}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTCONTACAEPF31}  ${temp}
    Append To List  ${CONTCONTACAEPF31}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTACAEPF31}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${CONTCONTACAEPF31}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTCONTACAEPF31}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${CONTCONTACAEPF31}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTACAEPF31}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTCONTACAEPF31}  ${temp}
    Append To List  ${CONTCONTACAEPF31}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTCONTACAEPF31}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTCONTACAEPF31}  ${nasc}
    Append To List  ${CONTCONTACAEPF31}  Titular
    Append To List  ${CONTCONTACAEPF31}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTCONTACAEPF31}  ${temp}
    Append To List  ${CONTCONTACAEPF31}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTCONTACAEPF31}  ${conta}
    Append To List  ${CONTCONTACAEPF31}  Solteiro(a)
    Append To List  ${CONTCONTACAEPF31}  CURITIBA
    Append To List  ${CONTCONTACAEPF31}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTCONTACAEPF31}  Residencial
    Append To List  ${CONTCONTACAEPF31}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTCONTACAEPF31}  ${temp}
    Append To List  ${CONTCONTACAEPF31}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTCONTACAEPF31}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTCONTACAEPF31}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${CONTCONTACAEPF31}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTCONTACAEPF31}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTCONTACAEPF31}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTCONTACAEPF31}  ${conta}
    Append To List  ${CONTCONTACAEPF31}  Solteiro(a)
    Append To List  ${CONTCONTACAEPF31}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTCONTACAEPF31}  ${nasc}


    #Instanciar Variavel Cliente CAEPF TR032
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTCONTACAEPF32}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTCONTACAEPF32}  ${company}
    Append To List  ${CONTCONTACAEPF32}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTCONTACAEPF32}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTCONTACAEPF32}  ${temp}
    Append To List  ${CONTCONTACAEPF32}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTACAEPF32}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${CONTCONTACAEPF32}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTCONTACAEPF32}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${CONTCONTACAEPF32}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTCONTACAEPF32}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTCONTACAEPF32}  ${temp}
    Append To List  ${CONTCONTACAEPF32}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTCONTACAEPF32}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTCONTACAEPF32}  ${nasc}
    Append To List  ${CONTCONTACAEPF32}  Titular
    Append To List  ${CONTCONTACAEPF32}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTCONTACAEPF32}  ${temp}
    Append To List  ${CONTCONTACAEPF32}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTCONTACAEPF32}  ${conta}
    Append To List  ${CONTCONTACAEPF32}  Solteiro(a)
    Append To List  ${CONTCONTACAEPF32}  CURITIBA
    Append To List  ${CONTCONTACAEPF32}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTCONTACAEPF32}  Residencial
    Append To List  ${CONTCONTACAEPF32}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTCONTACAEPF32}  ${temp}
    Append To List  ${CONTCONTACAEPF32}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTCONTACAEPF32}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTCONTACAEPF32}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${CONTCONTACAEPF32}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTCONTACAEPF32}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTCONTACAEPF32}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTCONTACAEPF32}  ${conta}
    Append To List  ${CONTCONTACAEPF32}  Solteiro(a)
    Append To List  ${CONTCONTACAEPF32}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTCONTACAEPF32}  ${nasc}


    #Instanciar Variavel Cliente CAEPF TR033
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCONTCAEPF33}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTRATOCONTCAEPF33}  ${company}
    Append To List  ${CONTRATOCONTCAEPF33}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTRATOCONTCAEPF33}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCONTCAEPF33}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF33}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTCAEPF33}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${CONTRATOCONTCAEPF33}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTRATOCONTCAEPF33}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${CONTRATOCONTCAEPF33}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTCAEPF33}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCONTCAEPF33}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF33}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCONTCAEPF33}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCONTCAEPF33}  ${nasc}
    Append To List  ${CONTRATOCONTCAEPF33}  Titular
    Append To List  ${CONTRATOCONTCAEPF33}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTRATOCONTCAEPF33}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF33}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTCAEPF33}  ${conta}
    Append To List  ${CONTRATOCONTCAEPF33}  Solteiro(a)
    Append To List  ${CONTRATOCONTCAEPF33}  CURITIBA
    Append To List  ${CONTRATOCONTCAEPF33}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTRATOCONTCAEPF33}  Residencial
    Append To List  ${CONTRATOCONTCAEPF33}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTRATOCONTCAEPF33}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF33}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTRATOCONTCAEPF33}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTRATOCONTCAEPF33}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${CONTRATOCONTCAEPF33}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTRATOCONTCAEPF33}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCONTCAEPF33}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTCAEPF33}  ${conta}
    Append To List  ${CONTRATOCONTCAEPF33}  Solteiro(a)
    Append To List  ${CONTRATOCONTCAEPF33}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCONTCAEPF33}  ${nasc}


    #Instanciar Variavel Cliente CAEPF TR034
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCONTCAEPF34}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTRATOCONTCAEPF34}  ${company}
    Append To List  ${CONTRATOCONTCAEPF34}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTRATOCONTCAEPF34}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCONTCAEPF34}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF34}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTCAEPF34}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${CONTRATOCONTCAEPF34}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTRATOCONTCAEPF34}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${CONTRATOCONTCAEPF34}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTCAEPF34}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCONTCAEPF34}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF34}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCONTCAEPF34}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCONTCAEPF34}  ${nasc}
    Append To List  ${CONTRATOCONTCAEPF34}  Titular
    Append To List  ${CONTRATOCONTCAEPF34}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTRATOCONTCAEPF34}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF34}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTCAEPF34}  ${conta}
    Append To List  ${CONTRATOCONTCAEPF34}  Solteiro(a)
    Append To List  ${CONTRATOCONTCAEPF34}  CURITIBA
    Append To List  ${CONTRATOCONTCAEPF34}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTRATOCONTCAEPF34}  Residencial
    Append To List  ${CONTRATOCONTCAEPF34}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTRATOCONTCAEPF34}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF34}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTRATOCONTCAEPF34}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTRATOCONTCAEPF34}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${CONTRATOCONTCAEPF34}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTRATOCONTCAEPF34}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCONTCAEPF34}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTCAEPF34}  ${conta}
    Append To List  ${CONTRATOCONTCAEPF34}  Solteiro(a)
    Append To List  ${CONTRATOCONTCAEPF34}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCONTCAEPF34}  ${nasc}


    #Instanciar Variavel Cliente CAEPF TR035
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCONTCAEPF35}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTRATOCONTCAEPF35}  ${company}
    Append To List  ${CONTRATOCONTCAEPF35}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTRATOCONTCAEPF35}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCONTCAEPF35}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF35}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTCAEPF35}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${CONTRATOCONTCAEPF35}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${CONTRATOCONTCAEPF35}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${CONTRATOCONTCAEPF35}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTCAEPF35}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCONTCAEPF35}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF35}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCONTCAEPF35}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCONTCAEPF35}  ${nasc}
    Append To List  ${CONTRATOCONTCAEPF35}  Titular
    Append To List  ${CONTRATOCONTCAEPF35}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTRATOCONTCAEPF35}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF35}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTCAEPF35}  ${conta}
    Append To List  ${CONTRATOCONTCAEPF35}  Solteiro(a)
    Append To List  ${CONTRATOCONTCAEPF35}  CURITIBA
    Append To List  ${CONTRATOCONTCAEPF35}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTRATOCONTCAEPF35}  Residencial
    Append To List  ${CONTRATOCONTCAEPF35}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTRATOCONTCAEPF35}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF35}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTRATOCONTCAEPF35}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTRATOCONTCAEPF35}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${CONTRATOCONTCAEPF35}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTRATOCONTCAEPF35}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCONTCAEPF35}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTCAEPF35}  ${conta}
    Append To List  ${CONTRATOCONTCAEPF35}  Solteiro(a)
    Append To List  ${CONTRATOCONTCAEPF35}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCONTCAEPF35}  ${nasc}


    #Instanciar Variavel Cliente CAEPF TR036
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTPOTCAEPF36}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTPOTCAEPF36}  ${company}
    Append To List  ${CONTPOTCAEPF36}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTPOTCAEPF36}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTPOTCAEPF36}  ${temp}
    Append To List  ${CONTPOTCAEPF36}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTCAEPF36}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${CONTPOTCAEPF36}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${CONTPOTCAEPF36}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTPOTCAEPF36}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTCAEPF36}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTPOTCAEPF36}  ${temp}
    Append To List  ${CONTPOTCAEPF36}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTCAEPF36}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTCAEPF36}  ${nasc}
    Append To List  ${CONTPOTCAEPF36}  Titular
    Append To List  ${CONTPOTCAEPF36}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTPOTCAEPF36}  ${temp}
    Append To List  ${CONTPOTCAEPF36}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTCAEPF36}  ${conta}
    Append To List  ${CONTPOTCAEPF36}  Solteiro(a)
    Append To List  ${CONTPOTCAEPF36}  CURITIBA
    Append To List  ${CONTPOTCAEPF36}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTPOTCAEPF36}  Residencial
    Append To List  ${CONTPOTCAEPF36}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTPOTCAEPF36}  ${temp}
    Append To List  ${CONTPOTCAEPF36}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTPOTCAEPF36}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTPOTCAEPF36}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTPOTCAEPF36}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTPOTCAEPF36}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTCAEPF36}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTCAEPF36}  ${conta}
    Append To List  ${CONTPOTCAEPF36}  Solteiro(a)
    Append To List  ${CONTPOTCAEPF36}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTCAEPF36}  ${nasc}


    #Instanciar Variavel Cliente CAEPF TR037
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTPOTCAEPF37}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTPOTCAEPF37}  ${company}
    Append To List  ${CONTPOTCAEPF37}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTPOTCAEPF37}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTPOTCAEPF37}  ${temp}
    Append To List  ${CONTPOTCAEPF37}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTCAEPF37}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${CONTPOTCAEPF37}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${CONTPOTCAEPF37}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTPOTCAEPF37}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTCAEPF37}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTPOTCAEPF37}  ${temp}
    Append To List  ${CONTPOTCAEPF37}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTCAEPF37}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTCAEPF37}  ${nasc}
    Append To List  ${CONTPOTCAEPF37}  Titular
    Append To List  ${CONTPOTCAEPF37}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTPOTCAEPF37}  ${temp}
    Append To List  ${CONTPOTCAEPF37}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTCAEPF37}  ${conta}
    Append To List  ${CONTPOTCAEPF37}  Solteiro(a)
    Append To List  ${CONTPOTCAEPF37}  CURITIBA
    Append To List  ${CONTPOTCAEPF37}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTPOTCAEPF37}  Residencial
    Append To List  ${CONTPOTCAEPF37}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTPOTCAEPF37}  ${temp}
    Append To List  ${CONTPOTCAEPF37}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTPOTCAEPF37}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTPOTCAEPF37}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTPOTCAEPF37}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTPOTCAEPF37}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTCAEPF37}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTCAEPF37}  ${conta}
    Append To List  ${CONTPOTCAEPF37}  Solteiro(a)
    Append To List  ${CONTPOTCAEPF37}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTCAEPF37}  ${nasc}


    #Instanciar Variavel Cliente CAEPF TR038
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTPOTCAEPF38}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTPOTCAEPF38}  ${company}
    Append To List  ${CONTPOTCAEPF38}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTPOTCAEPF38}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTPOTCAEPF38}  ${temp}
    Append To List  ${CONTPOTCAEPF38}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTCAEPF38}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${CONTPOTCAEPF38}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${CONTPOTCAEPF38}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTPOTCAEPF38}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTCAEPF38}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTPOTCAEPF38}  ${temp}
    Append To List  ${CONTPOTCAEPF38}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTCAEPF38}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTCAEPF38}  ${nasc}
    Append To List  ${CONTPOTCAEPF38}  Titular
    Append To List  ${CONTPOTCAEPF38}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTPOTCAEPF38}  ${temp}
    Append To List  ${CONTPOTCAEPF38}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTCAEPF38}  ${conta}
    Append To List  ${CONTPOTCAEPF38}  Solteiro(a)
    Append To List  ${CONTPOTCAEPF38}  CURITIBA
    Append To List  ${CONTPOTCAEPF38}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTPOTCAEPF38}  Residencial
    Append To List  ${CONTPOTCAEPF38}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTPOTCAEPF38}  ${temp}
    Append To List  ${CONTPOTCAEPF38}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTPOTCAEPF38}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTPOTCAEPF38}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTPOTCAEPF38}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTPOTCAEPF38}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTCAEPF38}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTCAEPF38}  ${conta}
    Append To List  ${CONTPOTCAEPF38}  Solteiro(a)
    Append To List  ${CONTPOTCAEPF38}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTCAEPF38}  ${nasc}


    #Instanciar Variavel Cliente CAEPF TR039
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTPOTCAEPF39}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTPOTCAEPF39}  ${company}
    Append To List  ${CONTPOTCAEPF39}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTPOTCAEPF39}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTPOTCAEPF39}  ${temp}
    Append To List  ${CONTPOTCAEPF39}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTCAEPF39}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${CONTPOTCAEPF39}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${CONTPOTCAEPF39}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTPOTCAEPF39}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTCAEPF39}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTPOTCAEPF39}  ${temp}
    Append To List  ${CONTPOTCAEPF39}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTCAEPF39}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTCAEPF39}  ${nasc}
    Append To List  ${CONTPOTCAEPF39}  Titular
    Append To List  ${CONTPOTCAEPF39}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTPOTCAEPF39}  ${temp}
    Append To List  ${CONTPOTCAEPF39}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTCAEPF39}  ${conta}
    Append To List  ${CONTPOTCAEPF39}  Solteiro(a)
    Append To List  ${CONTPOTCAEPF39}  CURITIBA
    Append To List  ${CONTPOTCAEPF39}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTPOTCAEPF39}  Residencial
    Append To List  ${CONTPOTCAEPF39}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTPOTCAEPF39}  ${temp}
    Append To List  ${CONTPOTCAEPF39}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTPOTCAEPF39}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTPOTCAEPF39}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTPOTCAEPF39}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTPOTCAEPF39}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTCAEPF39}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTCAEPF39}  ${conta}
    Append To List  ${CONTPOTCAEPF39}  Solteiro(a)
    Append To List  ${CONTPOTCAEPF39}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTCAEPF39}  ${nasc}


    #Instanciar Variavel Cliente CAEPF TR040
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTPOTCAEPF40}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTPOTCAEPF40}  ${company}
    Append To List  ${CONTPOTCAEPF40}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTPOTCAEPF40}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTPOTCAEPF40}  ${temp}
    Append To List  ${CONTPOTCAEPF40}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTCAEPF40}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${CONTPOTCAEPF40}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${CONTPOTCAEPF40}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTPOTCAEPF40}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTPOTCAEPF40}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTPOTCAEPF40}  ${temp}
    Append To List  ${CONTPOTCAEPF40}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTCAEPF40}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTCAEPF40}  ${nasc}
    Append To List  ${CONTPOTCAEPF40}  Titular
    Append To List  ${CONTPOTCAEPF40}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTPOTCAEPF40}  ${temp}
    Append To List  ${CONTPOTCAEPF40}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTCAEPF40}  ${conta}
    Append To List  ${CONTPOTCAEPF40}  Solteiro(a)
    Append To List  ${CONTPOTCAEPF40}  CURITIBA
    Append To List  ${CONTPOTCAEPF40}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTPOTCAEPF40}  Residencial
    Append To List  ${CONTPOTCAEPF40}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTPOTCAEPF40}  ${temp}
    Append To List  ${CONTPOTCAEPF40}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTPOTCAEPF40}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTPOTCAEPF40}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTPOTCAEPF40}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTPOTCAEPF40}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTPOTCAEPF40}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTPOTCAEPF40}  ${conta}
    Append To List  ${CONTPOTCAEPF40}  Solteiro(a)
    Append To List  ${CONTPOTCAEPF40}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTPOTCAEPF40}  ${nasc}


        #Instanciar Variavel Cliente CAEPF TR041
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCONTCAEPF41}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTRATOCONTCAEPF41}  ${company}
    Append To List  ${CONTRATOCONTCAEPF41}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTRATOCONTCAEPF41}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCONTCAEPF41}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF41}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTCAEPF41}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${CONTRATOCONTCAEPF41}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${CONTRATOCONTCAEPF41}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTRATOCONTCAEPF41}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTCAEPF41}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCONTCAEPF41}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF41}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCONTCAEPF41}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCONTCAEPF41}  ${nasc}
    Append To List  ${CONTRATOCONTCAEPF41}  Titular
    Append To List  ${CONTRATOCONTCAEPF41}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTRATOCONTCAEPF41}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF41}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTCAEPF41}  ${conta}
    Append To List  ${CONTRATOCONTCAEPF41}  Solteiro(a)
    Append To List  ${CONTRATOCONTCAEPF41}  CURITIBA
    Append To List  ${CONTRATOCONTCAEPF41}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTRATOCONTCAEPF41}  Residencial
    Append To List  ${CONTRATOCONTCAEPF41}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTRATOCONTCAEPF41}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF41}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTRATOCONTCAEPF41}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTRATOCONTCAEPF41}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTRATOCONTCAEPF41}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTRATOCONTCAEPF41}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCONTCAEPF41}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTCAEPF41}  ${conta}
    Append To List  ${CONTRATOCONTCAEPF41}  Solteiro(a)
    Append To List  ${CONTRATOCONTCAEPF41}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCONTCAEPF41}  ${nasc}


    #Instanciar Variavel Cliente CAEPF TR042
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCONTCAEPF42}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTRATOCONTCAEPF42}  ${company}
    Append To List  ${CONTRATOCONTCAEPF42}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTRATOCONTCAEPF42}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCONTCAEPF42}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF42}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTCAEPF42}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${CONTRATOCONTCAEPF42}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${CONTRATOCONTCAEPF42}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTRATOCONTCAEPF42}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTCAEPF42}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCONTCAEPF42}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF42}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCONTCAEPF42}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCONTCAEPF42}  ${nasc}
    Append To List  ${CONTRATOCONTCAEPF42}  Titular
    Append To List  ${CONTRATOCONTCAEPF42}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTRATOCONTCAEPF42}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF42}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTCAEPF42}  ${conta}
    Append To List  ${CONTRATOCONTCAEPF42}  Solteiro(a)
    Append To List  ${CONTRATOCONTCAEPF42}  CURITIBA
    Append To List  ${CONTRATOCONTCAEPF42}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTRATOCONTCAEPF42}  Residencial
    Append To List  ${CONTRATOCONTCAEPF42}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTRATOCONTCAEPF42}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF42}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTRATOCONTCAEPF42}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTRATOCONTCAEPF42}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTRATOCONTCAEPF42}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTRATOCONTCAEPF42}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCONTCAEPF42}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTCAEPF42}  ${conta}
    Append To List  ${CONTRATOCONTCAEPF42}  Solteiro(a)
    Append To List  ${CONTRATOCONTCAEPF42}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCONTCAEPF42}  ${nasc}


    #Instanciar Variavel Cliente CAEPF TR043
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:Nome Fantasia, Arg3: CNPJ/CPF/CAEPF
    Append To List  ${CONTRATOCONTCAEPF43}  Potencial Cliente (CAEPF)
    ${temp}           FakerLibrary.Company
    ${company}        Remover Caracteres Especiais  ${temp}
    ${company}        Convert To Uppercase  ${company}
    Append To List  ${CONTRATOCONTCAEPF43}  ${company}
    Append To List  ${CONTRATOCONTCAEPF43}  ${company}
    ${temp}  Gerar CAEPF
    Append To List  ${CONTRATOCONTCAEPF43}  ${temp}
    #Adicionando: Arg4: Numero de Vida, Arg5: Tipo, Arg6: Data prevista
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CONTRATOCONTCAEPF43}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF43}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTCAEPF43}  ${date}
    # Adicionando: Arg7: Produto Assitencial Massa Teste, Arg8: Produto Assitencial já existente  Arg9: Fase cotação
    Append To List  ${CONTRATOCONTCAEPF43}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${CONTRATOCONTCAEPF43}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTRATOCONTCAEPF43}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${CONTRATOCONTCAEPF43}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${CONTRATOCONTCAEPF43}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF43}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCONTCAEPF43}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCONTCAEPF43}  ${nasc}
    Append To List  ${CONTRATOCONTCAEPF43}  Titular
    Append To List  ${CONTRATOCONTCAEPF43}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${CONTRATOCONTCAEPF43}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF43}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTCAEPF43}  ${conta}
    Append To List  ${CONTRATOCONTCAEPF43}  Solteiro(a)
    Append To List  ${CONTRATOCONTCAEPF43}  CURITIBA
    Append To List  ${CONTRATOCONTCAEPF43}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone
    Append To List  ${CONTRATOCONTCAEPF43}  Residencial
    Append To List  ${CONTRATOCONTCAEPF43}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${CONTRATOCONTCAEPF43}  ${temp}
    Append To List  ${CONTRATOCONTCAEPF43}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${CONTRATOCONTCAEPF43}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${CONTRATOCONTCAEPF43}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${CONTRATOCONTCAEPF43}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, Arg34: Data Nascimento Dependente
    Append To List  ${CONTRATOCONTCAEPF43}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CONTRATOCONTCAEPF43}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CONTRATOCONTCAEPF43}  ${conta}
    Append To List  ${CONTRATOCONTCAEPF43}  Solteiro(a)
    Append To List  ${CONTRATOCONTCAEPF43}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${CONTRATOCONTCAEPF43}  ${nasc}