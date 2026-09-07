*** Settings ***

*** Variables ***
@{INCLUSAOBENEFICIARIOCANALPJ01}
@{INCLUSAOBENEFICIARIOCANALPJ02}
@{INCLUSAOBENEFICIARIOCANALPJ03}
@{INCLUSAOBENEFICIARIOCANALPJ04}
@{INCLUSAOBENEFICIARIOCANALPJ05}
@{INCLUSAOBENEFICIARIOCANALPJ06}
@{INCLUSAOBENEFICIARIOCANALCAEPF01}
@{INCLUSAOBENEFICIARIOCANALCAEPF02}
@{INCLUSAOBENEFICIARIOCANALCAEPF03}
@{INCLUSAOBENEFICIARIOCANALCAEPF04}


*** Keywords ***
Instanciar Variaveis InclusaoBeneficiarioCanal
#Instanciar Variavel Cliente PJ TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${nasc}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Titular
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  CURITIBA
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Residencial
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ01}  ${temp}



    #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${nasc}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Titular
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  CURITIBA
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Residencial
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ02}  ${temp}


    #Instanciar Variavel Cliente PJ TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${nasc}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Titular
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  CURITIBA
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Residencial
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ03}  ${temp}


        #Instanciar Variavel Cliente PJ TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${nasc}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Titular
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  CURITIBA
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Residencial
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    #Adicionando Titular - Pessoa: Arg85: Tipo, Arg86: cpf, Arg87: Nome Beneficiario, Arg88: Estado Civil, Arg89: Grau Dependencia, 
    #              Arg90: Data Nascimento Dependente, Arg91: Email, Arg92: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg93: Tipo, Arg94: cpf, Arg95: Nome Beneficiario, Arg96: Estado Civil, Arg97: Grau Dependencia, 
    #              Arg98: Data Nascimento Dependente, Arg99: Email, Arg100: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ04}  ${temp}


    #Instanciar Variavel Cliente PJ TR009
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${nasc}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Titular
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  CURITIBA
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Residencial
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ05}  ${temp}


#Instanciar Variavel Cliente PJ TR010
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${nasc}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Titular
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  CURITIBA
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Residencial
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALPJ06}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR008
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${nasc}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Titular
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  CURITIBA
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Residencial
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    #Adicionando Titular - Pessoa: Arg85: Tipo, Arg86: cpf, Arg87: Nome Beneficiario, Arg88: Estado Civil, Arg89: Grau Dependencia, 
    #              Arg90: Data Nascimento Dependente, Arg91: Email, Arg92: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg93: Tipo, Arg94: cpf, Arg95: Nome Beneficiario, Arg96: Estado Civil, Arg97: Grau Dependencia, 
    #              Arg98: Data Nascimento Dependente, Arg99: Email, Arg100: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF01}  ${temp}

    #Instanciar Variavel Cliente CAEPF TR009
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${nasc}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Titular
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  CURITIBA
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Residencial
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF02}  ${temp}
    

    #Instanciar Variavel Cliente CAEPF TR012
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${nasc}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Titular
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  CURITIBA
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Residencial
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF03}  ${temp}


#Instanciar Variavel Cliente CAEPF TR011
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${nasc}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Titular
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  CURITIBA
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Residencial
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${conta}
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  Solteiro(a)
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INCLUSAOBENEFICIARIOCANALCAEPF04}  ${temp}