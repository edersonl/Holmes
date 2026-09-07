*** Settings ***
Resource    ../../../main.resource

*** Variables ***
@{INTEGMOVMUDANCAPRODPF01}
@{INTEGMOVMUDANCAPRODPJ02}
@{INTEGMOVMUDANCAPRODCAEPF03}

*** Keywords ***
Instanciar Variaveis IntegMovMudancaProdCRM
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${nasc}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Titular
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  CURITIBA
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Residencial
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODPF01}  ${temp}


    #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${nasc}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Titular
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  CURITIBA
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Residencial
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    #Adicionando Titular - Pessoa: Arg85: Tipo, Arg86: cpf, Arg87: Nome Beneficiario, Arg88: Estado Civil, Arg89: Grau Dependencia, 
    #              Arg90: Data Nascimento Dependente, Arg91: Email, Arg92: CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg93: Tipo, Arg94: cpf, Arg95: Nome Beneficiario, Arg96: Estado Civil, Arg97: Grau Dependencia, 
    #              Arg98: Data Nascimento Dependente, Arg99: Email, Arg100: CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    #Adicionando Titular - Pessoa: Arg101: Tipo, Arg102: cpf, Arg103: Nome Beneficiario, Arg104: Estado Civil, Arg105: Grau Dependencia, 
    #              Arg106: Data Nascimento Dependente, Arg107: Email, Arg108: CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg109: Tipo, Arg110: cpf, Arg111: Nome Beneficiario, Arg112: Estado Civil, Arg113: Grau Dependencia, 
    #              Arg114: Data Nascimento Dependente, Arg115: Email, Arg116: CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODPJ02}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${date}
     # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${nasc}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Titular
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  CURITIBA
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Residencial
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    #Adicionando Titular - Pessoa: Arg85: Tipo, Arg86: cpf, Arg87: Nome Beneficiario, Arg88: Estado Civil, Arg89: Grau Dependencia, 
    #              Arg90: Data Nascimento Dependente, Arg91: Email, Arg92: CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg93: Tipo, Arg94: cpf, Arg95: Nome Beneficiario, Arg96: Estado Civil, Arg97: Grau Dependencia, 
    #              Arg98: Data Nascimento Dependente, Arg99: Email, Arg100: CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    #Adicionando Titular - Pessoa: Arg101: Tipo, Arg102: cpf, Arg103: Nome Beneficiario, Arg104: Estado Civil, Arg105: Grau Dependencia, 
    #              Arg106: Data Nascimento Dependente, Arg107: Email, Arg108: CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg109: Tipo, Arg110: cpf, Arg111: Nome Beneficiario, Arg112: Estado Civil, Arg113: Grau Dependencia, 
    #              Arg114: Data Nascimento Dependente, Arg115: Email, Arg116: CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${conta}
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  Solteiro(a)
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVMUDANCAPRODCAEPF03}  ${temp}