*** Settings ***
Resource    ../../../main.resource
*** Variables ***
@{INTEGMOVINCLUSAOCRMPF01}
@{INTEGMOVINCLUSAOCRMPF02}
@{INTEGMOVINCLUSAOCRMPJ03}
@{INTEGMOVINCLUSAOCRMPJ04}
@{INTEGMOVINCLUSAOCRMCAEPF05}
@{INTEGMOVINCLUSAOCRMCAEPF06}
@{INTEGMOVINCLUSAOCRMPJ07}
@{INTEGMOVINCLUSAOCRMPJ08}
@{INTEGMOVINCLUSAOCRMCAEPF09}
@{INTEGMOVINCLUSAOCRMCAEPF10}
@{INTEGMOVINCLUSAOCRMPJ11}
@{INTEGMOVINCLUSAOCRMCAEPF12}
@{INTEGMOVINCLUSAOCRMPJ13}
@{INTEGMOVINCLUSAOCRMPJ14}
@{INTEGMOVINCLUSAOCRMPJ15}
@{INTEGMOVINCLUSAOCRMCAEPF16}
@{INTEGMOVINCLUSAOCRMCAEPF17}
@{INTEGMOVINCLUSAOCRMCAEPF18}


*** Keywords ***
Instanciar Variaveis IntegMovInclusaoCRM
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Concluído e Aceito

    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF01}  ${temp}


    #Instanciar Variavel Cliente PF TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPF02}  ${temp}


    #Instanciar Variavel Cliente PJ TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${date}
     # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    # Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ03}  ${temp}


    #Instanciar Variavel Cliente PJ TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    # Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    #Adicionando Titular - Pessoa: Arg85: Tipo, Arg86: cpf, Arg87: Nome Beneficiario, Arg88: Estado Civil, Arg89: Grau Dependencia, 
    #              Arg90: Data Nascimento Dependente, Arg91: Email, Arg92: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg93: Tipo, Arg94: cpf, Arg95: Nome Beneficiario, Arg96: Estado Civil, Arg97: Grau Dependencia, 
    #              Arg98: Data Nascimento Dependente, Arg99: Email, Arg100: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ04}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF05}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR006
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    #Adicionando Titular - Pessoa: Arg85: Tipo, Arg86: cpf, Arg87: Nome Beneficiario, Arg88: Estado Civil, Arg89: Grau Dependencia, 
    #              Arg90: Data Nascimento Dependente, Arg91: Email, Arg92: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg93: Tipo, Arg94: cpf, Arg95: Nome Beneficiario, Arg96: Estado Civil, Arg97: Grau Dependencia, 
    #              Arg98: Data Nascimento Dependente, Arg99: Email, Arg100: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF06}  ${temp}


    #Instanciar Variavel Cliente PJ TR007
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ07}  ${temp}


    #Instanciar Variavel Cliente PJ TR008
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ08}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR009
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF09}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR010
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF10}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR012
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF12}  ${temp}


    #Instanciar Variavel Cliente PJ TR011
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ11}  ${temp}


    #Instanciar Variavel Cliente PJ TR013
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    #Adicionando Titular - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  10 - Filho(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    #Adicionando Dependente - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  10 - Filho(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    #Adicionando Titular - Pessoa: Arg85: Tipo, Arg86: cpf, Arg87: Nome Beneficiario, Arg88: Estado Civil, Arg89: Grau Dependencia, 
    #              Arg90: Data Nascimento Dependente, Arg91: Email, Arg92: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  10 - Filho(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    #Adicionando Dependente - Pessoa: Arg93: Tipo, Arg94: cpf, Arg95: Nome Beneficiario, Arg96: Estado Civil, Arg97: Grau Dependencia, 
    #              Arg98: Data Nascimento Dependente, Arg99: Email, Arg100: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    #Adicionando Dependente - Pessoa: Arg101: Tipo, Arg102: cpf, Arg103: Nome Beneficiario, Arg104: Estado Civil, Arg105: Grau Dependencia, 
    #              Arg106: Data Nascimento Dependente, Arg107: Email, Arg108: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  10 - Filho(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ13}  ${temp}


    #Instanciar Variavel Cliente PJ TR014
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: DNV, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${nasc}
    ${temp}        Gerar DNV
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ14}  ${temp}


    #Instanciar Variavel Cliente PJ TR015
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    #Adicionando Dependente - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  10 - Filho(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    #Adicionando Titular - Pessoa: Arg85: Tipo, Arg86: cpf, Arg87: Nome Beneficiario, Arg88: Estado Civil, Arg89: Grau Dependencia, 
    #              Arg90: Data Nascimento Dependente, Arg91: Email, Arg92: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  10 - Filho(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    #Adicionando Dependente - Pessoa: Arg93: Tipo, Arg94: cpf, Arg95: Nome Beneficiario, Arg96: Estado Civil, Arg97: Grau Dependencia, 
    #              Arg98: Data Nascimento Dependente, Arg99: Email, Arg100: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    #Adicionando Dependente - Pessoa: Arg101: Tipo, Arg102: cpf, Arg103: Nome Beneficiario, Arg104: Estado Civil, Arg105: Grau Dependencia, 
    #              Arg106: Data Nascimento Dependente, Arg107: Email, Arg108: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMPJ15}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR016
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    #Adicionando Titular - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  10 - Filho(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    #Adicionando Dependente - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  10 - Filho(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    #Adicionando Titular - Pessoa: Arg85: Tipo, Arg86: cpf, Arg87: Nome Beneficiario, Arg88: Estado Civil, Arg89: Grau Dependencia, 
    #              Arg90: Data Nascimento Dependente, Arg91: Email, Arg92: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  10 - Filho(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    #Adicionando Dependente - Pessoa: Arg93: Tipo, Arg94: cpf, Arg95: Nome Beneficiario, Arg96: Estado Civil, Arg97: Grau Dependencia, 
    #              Arg98: Data Nascimento Dependente, Arg99: Email, Arg100: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    #Adicionando Dependente - Pessoa: Arg101: Tipo, Arg102: cpf, Arg103: Nome Beneficiario, Arg104: Estado Civil, Arg105: Grau Dependencia, 
    #              Arg106: Data Nascimento Dependente, Arg107: Email, Arg108: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  10 - Filho(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF16}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR017
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    #Adicionando Titular - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  10 - Filho(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF17}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR018
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${nasc}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Titular
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  CURITIBA
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Residencial
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    #Adicionando Dependente - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  10 - Filho(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    #Adicionando Titular - Pessoa: Arg85: Tipo, Arg86: cpf, Arg87: Nome Beneficiario, Arg88: Estado Civil, Arg89: Grau Dependencia, 
    #              Arg90: Data Nascimento Dependente, Arg91: Email, Arg92: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  10 - Filho(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    #Adicionando Dependente - Pessoa: Arg93: Tipo, Arg94: cpf, Arg95: Nome Beneficiario, Arg96: Estado Civil, Arg97: Grau Dependencia, 
    #              Arg98: Data Nascimento Dependente, Arg99: Email, Arg100: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    #Adicionando Dependente - Pessoa: Arg101: Tipo, Arg102: cpf, Arg103: Nome Beneficiario, Arg104: Estado Civil, Arg105: Grau Dependencia, 
    #              Arg106: Data Nascimento Dependente, Arg107: Email, Arg108: CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${conta}
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVINCLUSAOCRMCAEPF18}  ${temp}