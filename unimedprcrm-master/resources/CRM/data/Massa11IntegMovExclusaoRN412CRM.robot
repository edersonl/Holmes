*** Settings ***
Resource    ../../../main.resource

*** Variables ***
@{INTEGMOVEXCRN412PF01}
@{INTEGMOVEXCRN412PF02}
@{INTEGMOVEXCRN412PJ03}
@{INTEGMOVEXCRN412PJ04}
@{INTEGMOVEXCRN412CAEPF05}
@{INTEGMOVEXCRN412CAEPF06}

*** Keywords ***
Instanciar Variaveis IntegMovExclusaoRN412CRM
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCRN412PF01}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCRN412PF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCRN412PF01}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGMOVEXCRN412PF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVEXCRN412PF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCRN412PF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PF01}  ${nasc}
    Append To List  ${INTEGMOVEXCRN412PF01}  Titular
    Append To List  ${INTEGMOVEXCRN412PF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF01}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF01}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PF01}  CURITIBA
    Append To List  ${INTEGMOVEXCRN412PF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCRN412PF01}  Residencial
    Append To List  ${INTEGMOVEXCRN412PF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCRN412PF01}  5037 - UNIFAMILIA-AMB+HOSP.APTO.+OBST
    Append To List  ${INTEGMOVEXCRN412PF01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCRN412PF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF01}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF01}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCRN412PF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF01}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF01}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCRN412PF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF01}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF01}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCRN412PF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF01}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF01}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCRN412PF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF01}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF01}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PF01}  ${temp}


    #Instanciar Variavel Cliente PF TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCRN412PF02}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF02}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCRN412PF02}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCRN412PF02}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGMOVEXCRN412PF02}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVEXCRN412PF02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCRN412PF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PF02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PF02}  ${nasc}
    Append To List  ${INTEGMOVEXCRN412PF02}  Titular
    Append To List  ${INTEGMOVEXCRN412PF02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF02}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF02}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PF02}  CURITIBA
    Append To List  ${INTEGMOVEXCRN412PF02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCRN412PF02}  Residencial
    Append To List  ${INTEGMOVEXCRN412PF02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PF02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCRN412PF02}  5037 - UNIFAMILIA-AMB+HOSP.APTO.+OBST
    Append To List  ${INTEGMOVEXCRN412PF02}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCRN412PF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF02}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF02}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PF02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCRN412PF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF02}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF02}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCRN412PF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF02}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF02}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCRN412PF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF02}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF02}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCRN412PF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF02}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PF02}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PF02}  ${temp}


    #Instanciar Variavel Cliente PJ TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCRN412PJ03}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PJ03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCRN412PJ03}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCRN412PJ03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PJ03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${nasc}
    Append To List  ${INTEGMOVEXCRN412PJ03}  Titular
    Append To List  ${INTEGMOVEXCRN412PJ03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PJ03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ03}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PJ03}  CURITIBA
    Append To List  ${INTEGMOVEXCRN412PJ03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCRN412PJ03}  Residencial
    Append To List  ${INTEGMOVEXCRN412PJ03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PJ03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCRN412PJ03}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCRN412PJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ03}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PJ03}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCRN412PJ03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ03}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCRN412PJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ03}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCRN412PJ03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ03}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCRN412PJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ03}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PJ03}  ${temp}


    #Instanciar Variavel Cliente PJ TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCRN412PJ04}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PJ04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${date}
     # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCRN412PJ04}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCRN412PJ04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PJ04}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${nasc}
    Append To List  ${INTEGMOVEXCRN412PJ04}  Titular
    Append To List  ${INTEGMOVEXCRN412PJ04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PJ04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ04}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PJ04}  CURITIBA
    Append To List  ${INTEGMOVEXCRN412PJ04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCRN412PJ04}  Residencial
    Append To List  ${INTEGMOVEXCRN412PJ04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PJ04}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCRN412PJ04}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCRN412PJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ04}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    Append To List  ${INTEGMOVEXCRN412PJ04}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCRN412PJ04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ04}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCRN412PJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ04}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCRN412PJ04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ04}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCRN412PJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${conta}
    Append To List  ${INTEGMOVEXCRN412PJ04}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412PJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412PJ04}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${nasc}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Titular
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  CURITIBA
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Residencial
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF05}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR006
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${date}
     # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${nasc}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Titular
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  CURITIBA
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Residencial
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${conta}
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  Solteiro(a)
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCRN412CAEPF06}  ${temp}