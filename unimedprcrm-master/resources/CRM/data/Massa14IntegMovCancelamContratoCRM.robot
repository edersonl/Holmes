*** Settings ***
Resource    ../../../main.resource

*** Variables ***
@{INTEGMOVCANCELAMCONTRATOCRMPF01}
@{INTEGMOVCANCELAMCONTRATOCRMPF03}
@{INTEGMOVCANCELAMCONTRATOCRMPF04}
@{INTEGMOVCANCELAMCONTRATOCRMPF05}
@{INTEGMOVCANCELAMCONTRATOCRMPF06}
@{INTEGMOVCANCELAMCONTRATOCRMPJ08}
@{INTEGMOVCANCELAMCONTRATOCRMPJ09}
@{INTEGMOVCANCELAMCONTRATOCRMPJ10}
@{INTEGMOVCANCELAMCONTRATOCRMPJ11}
@{INTEGMOVCANCELAMCONTRATOCRMPJ12}
@{INTEGMOVCANCELAMCONTRATOCRMCAEPF13}
@{INTEGMOVCANCELAMCONTRATOCRMCAEPF14}
@{INTEGMOVCANCELAMCONTRATOCRMCAEPF15}
@{INTEGMOVCANCELAMCONTRATOCRMCAEPF16}
@{INTEGMOVCANCELAMCONTRATOCRMCAEPF17}

*** Keywords ***
Instanciar Variaveis IntegMovCancelamContratoCRM
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${nasc}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Titular
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  CURITIBA
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Residencial
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF01}  ${temp}


    #Instanciar Variavel Cliente PF TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${nasc}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Titular
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  CURITIBA
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Residencial
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF03}  ${temp}


    #Instanciar Variavel Cliente PF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${nasc}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Titular
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  CURITIBA
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Residencial
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF04}  ${temp}


    #Instanciar Variavel Cliente PF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${nasc}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Titular
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  CURITIBA
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Residencial
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF05}  ${temp}


    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${nasc}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Titular
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  CURITIBA
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Residencial
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPF06}  ${temp}


    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${date}
     # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${nasc}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Titular
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  CURITIBA
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Residencial
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ08}  ${temp}


    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${nasc}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Titular
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  CURITIBA
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Residencial
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ09}  ${temp}


    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${nasc}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Titular
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  CURITIBA
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Residencial
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ10}  ${temp}


    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${nasc}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Titular
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  CURITIBA
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Residencial
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ11}  ${temp}


    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${nasc}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Titular
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  CURITIBA
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Residencial
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMPJ12}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR013
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${nasc}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Titular
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  CURITIBA
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Residencial
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR014
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${nasc}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Titular
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  CURITIBA
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Residencial
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR015
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${nasc}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Titular
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  CURITIBA
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Residencial
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR016
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${nasc}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Titular
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  CURITIBA
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Residencial
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR016
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${nasc}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Titular
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  CURITIBA
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Residencial
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${conta}
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  Solteiro(a)
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17}  ${temp}
