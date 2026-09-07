*** Settings ***
*** Variables ***
@{IMPORTACAOBENEFICIARIOCNPJ01}
@{IMPORTACAOBENEFICIARIOCAEPF01}

*** Keywords ***
Instanciar Variaveis ImportacaoBeneficiarioCanal
#Instanciar Variavel Cliente PJ TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${nasc}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Titular
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Solteiro(a)
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  CURITIBA
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Residencial
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Solteiro(a)
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Solteiro(a)
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Solteiro(a)
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Solteiro(a)
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Solteiro(a)
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Solteiro(a)
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  Solteiro(a)
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCNPJ01}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR009
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${nasc}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Titular
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Solteiro(a)
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  CURITIBA
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Residencial
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Solteiro(a)
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Solteiro(a)
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Solteiro(a)
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Solteiro(a)
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${conta}
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  Solteiro(a)
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${IMPORTACAOBENEFICIARIOCAEPF01}  ${temp}