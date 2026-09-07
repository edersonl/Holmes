*** Settings ***

*** Variables ***
@{PORTABILIDADECANALPF01}
@{PORTABILIDADECANALPF02}
@{PORTABILIDADECANALPF03}
@{PORTABILIDADECANALPF04}
@{PORTABILIDADECANALCLIENTEPF01}


*** Keywords ***
Instanciar Variaveis PortabilidadeCanal
#Instanciar Variavel Cliente PJ TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${PORTABILIDADECANALPF01}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF01}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    Append To List  ${PORTABILIDADECANALPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECANALPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${PORTABILIDADECANALPF01}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${PORTABILIDADECANALPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECANALPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    Append To List  ${PORTABILIDADECANALPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF01}  ${nasc}
    Append To List  ${PORTABILIDADECANALPF01}  Titular
    Append To List  ${PORTABILIDADECANALPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    Append To List  ${PORTABILIDADECANALPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF01}  ${conta}
    Append To List  ${PORTABILIDADECANALPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF01}  CURITIBA
    Append To List  ${PORTABILIDADECANALPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${PORTABILIDADECANALPF01}  Residencial
    Append To List  ${PORTABILIDADECANALPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    Append To List  ${PORTABILIDADECANALPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${PORTABILIDADECANALPF01}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${PORTABILIDADECANALPF01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${PORTABILIDADECANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF01}  ${conta}
    Append To List  ${PORTABILIDADECANALPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    Append To List  ${PORTABILIDADECANALPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${PORTABILIDADECANALPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF01}  ${conta}
    Append To List  ${PORTABILIDADECANALPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${PORTABILIDADECANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF01}  ${conta}
    Append To List  ${PORTABILIDADECANALPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${PORTABILIDADECANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF01}  ${conta}
    Append To List  ${PORTABILIDADECANALPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${PORTABILIDADECANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF01}  ${conta}
    Append To List  ${PORTABILIDADECANALPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF01}  ${temp}


    #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${PORTABILIDADECANALPF02}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF02}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    Append To List  ${PORTABILIDADECANALPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECANALPF02}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${PORTABILIDADECANALPF02}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${PORTABILIDADECANALPF02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECANALPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    Append To List  ${PORTABILIDADECANALPF02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF02}  ${nasc}
    Append To List  ${PORTABILIDADECANALPF02}  Titular
    Append To List  ${PORTABILIDADECANALPF02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    Append To List  ${PORTABILIDADECANALPF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF02}  ${conta}
    Append To List  ${PORTABILIDADECANALPF02}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF02}  CURITIBA
    Append To List  ${PORTABILIDADECANALPF02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${PORTABILIDADECANALPF02}  Residencial
    Append To List  ${PORTABILIDADECANALPF02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    Append To List  ${PORTABILIDADECANALPF02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${PORTABILIDADECANALPF02}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${PORTABILIDADECANALPF02}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${PORTABILIDADECANALPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF02}  ${conta}
    Append To List  ${PORTABILIDADECANALPF02}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    Append To List  ${PORTABILIDADECANALPF02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${PORTABILIDADECANALPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF02}  ${conta}
    Append To List  ${PORTABILIDADECANALPF02}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${PORTABILIDADECANALPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF02}  ${conta}
    Append To List  ${PORTABILIDADECANALPF02}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF02}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${PORTABILIDADECANALPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF02}  ${conta}
    Append To List  ${PORTABILIDADECANALPF02}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${PORTABILIDADECANALPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF02}  ${conta}
    Append To List  ${PORTABILIDADECANALPF02}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF02}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF02}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${PORTABILIDADECANALPF03}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    Append To List  ${PORTABILIDADECANALPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECANALPF03}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${PORTABILIDADECANALPF03}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${PORTABILIDADECANALPF03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECANALPF03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    Append To List  ${PORTABILIDADECANALPF03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF03}  ${nasc}
    Append To List  ${PORTABILIDADECANALPF03}  Titular
    Append To List  ${PORTABILIDADECANALPF03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    Append To List  ${PORTABILIDADECANALPF03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF03}  CURITIBA
    Append To List  ${PORTABILIDADECANALPF03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${PORTABILIDADECANALPF03}  Residencial
    Append To List  ${PORTABILIDADECANALPF03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    Append To List  ${PORTABILIDADECANALPF03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${PORTABILIDADECANALPF03}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${PORTABILIDADECANALPF03}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${PORTABILIDADECANALPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    Append To List  ${PORTABILIDADECANALPF03}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${PORTABILIDADECANALPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${PORTABILIDADECANALPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF03}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${PORTABILIDADECANALPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${PORTABILIDADECANALPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF03}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${PORTABILIDADECANALPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${PORTABILIDADECANALPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF03}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    #Adicionando Titular - Pessoa: Arg85: Tipo, Arg86: cpf, Arg87: Nome Beneficiario, Arg88: Estado Civil, Arg89: Grau Dependencia, 
    #              Arg90: Data Nascimento Dependente, Arg91: Email, Arg92: CNS
    Append To List  ${PORTABILIDADECANALPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg93: Tipo, Arg94: cpf, Arg95: Nome Beneficiario, Arg96: Estado Civil, Arg97: Grau Dependencia, 
    #              Arg98: Data Nascimento Dependente, Arg99: Email, Arg100: CNS
    Append To List  ${PORTABILIDADECANALPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  ${conta}
    Append To List  ${PORTABILIDADECANALPF03}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF03}  ${temp}


        #Instanciar Variavel Cliente CAEPF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${PORTABILIDADECANALPF04}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    Append To List  ${PORTABILIDADECANALPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECANALPF04}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${PORTABILIDADECANALPF04}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${PORTABILIDADECANALPF04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECANALPF04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    Append To List  ${PORTABILIDADECANALPF04}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF04}  ${nasc}
    Append To List  ${PORTABILIDADECANALPF04}  Titular
    Append To List  ${PORTABILIDADECANALPF04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    Append To List  ${PORTABILIDADECANALPF04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF04}  CURITIBA
    Append To List  ${PORTABILIDADECANALPF04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${PORTABILIDADECANALPF04}  Residencial
    Append To List  ${PORTABILIDADECANALPF04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    Append To List  ${PORTABILIDADECANALPF04}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${PORTABILIDADECANALPF04}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${PORTABILIDADECANALPF04}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${PORTABILIDADECANALPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    Append To List  ${PORTABILIDADECANALPF04}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${PORTABILIDADECANALPF04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${PORTABILIDADECANALPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF04}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${PORTABILIDADECANALPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${PORTABILIDADECANALPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF04}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${PORTABILIDADECANALPF04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${PORTABILIDADECANALPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  ${conta}
    Append To List  ${PORTABILIDADECANALPF04}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALPF04}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALPF04}  ${temp}


    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${nasc}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Titular
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${conta}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  CURITIBA
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Residencial
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${conta}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${conta}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${conta}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${conta}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${conta}
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECANALCLIENTEPF01}  ${temp}