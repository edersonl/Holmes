*** Settings ***

*** Variables ***
@{MUDANCAPRODCANALPF01}
@{MUDANCAPRODCANALCAEPF01}
@{MUDANCAPRODCANALCAEPF02}
@{MUDANCAPRODCANALPJ01}
@{MUDANCAPRODCANALPJ02}



*** Keywords ***
Instanciar Variaveis MudançaProdCanal
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MUDANCAPRODCANALPF01}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    Append To List  ${MUDANCAPRODCANALPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MUDANCAPRODCANALPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MUDANCAPRODCANALPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${MUDANCAPRODCANALPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MUDANCAPRODCANALPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    Append To List  ${MUDANCAPRODCANALPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPF01}  ${nasc}
    Append To List  ${MUDANCAPRODCANALPF01}  Titular
    Append To List  ${MUDANCAPRODCANALPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    Append To List  ${MUDANCAPRODCANALPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPF01}  ${conta}
    Append To List  ${MUDANCAPRODCANALPF01}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPF01}  CURITIBA
    Append To List  ${MUDANCAPRODCANALPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MUDANCAPRODCANALPF01}  Residencial
    Append To List  ${MUDANCAPRODCANALPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    Append To List  ${MUDANCAPRODCANALPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MUDANCAPRODCANALPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${MUDANCAPRODCANALPF01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MUDANCAPRODCANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPF01}  ${conta}
    Append To List  ${MUDANCAPRODCANALPF01}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    Append To List  ${MUDANCAPRODCANALPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MUDANCAPRODCANALPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPF01}  ${conta}
    Append To List  ${MUDANCAPRODCANALPF01}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MUDANCAPRODCANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPF01}  ${conta}
    Append To List  ${MUDANCAPRODCANALPF01}  Casado(a)
    Append To List  ${MUDANCAPRODCANALPF01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MUDANCAPRODCANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPF01}  ${conta}
    Append To List  ${MUDANCAPRODCANALPF01}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MUDANCAPRODCANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPF01}  ${conta}
    Append To List  ${MUDANCAPRODCANALPF01}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPF01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPF01}  ${temp}



    #Instanciar Variavel Cliente CAEPF TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MUDANCAPRODCANALCAEPF01}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${nasc}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Titular
    Append To List  ${MUDANCAPRODCANALCAEPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALCAEPF01}  CURITIBA
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Residencial
    Append To List  ${MUDANCAPRODCANALCAEPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MUDANCAPRODCANALCAEPF01}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${MUDANCAPRODCANALCAEPF01}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF01}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALCAEPF01}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MUDANCAPRODCANALCAEPF02}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${nasc}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Titular
    Append To List  ${MUDANCAPRODCANALCAEPF02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALCAEPF02}  CURITIBA
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Residencial
    Append To List  ${MUDANCAPRODCANALCAEPF02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MUDANCAPRODCANALCAEPF02}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${MUDANCAPRODCANALCAEPF02}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    #Adicionando - Contrato 3: Arg69: Tipo, Arg70: cnpj, Arg71: Nome Conta, Arg72: Numero de Vida, Arg73: Tipo, 
    #              Arg74: Data prevista, Arg75: Email, Arg76: Quantidade de vidas
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALCAEPF02}  ${temp}
    Append To List  ${MUDANCAPRODCANALCAEPF02}  4


    #Instanciar Variavel Cliente PJ TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MUDANCAPRODCANALPJ01}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ01}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    Append To List  ${MUDANCAPRODCANALPJ01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MUDANCAPRODCANALPJ01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MUDANCAPRODCANALPJ01}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${MUDANCAPRODCANALPJ01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MUDANCAPRODCANALPJ01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    Append To List  ${MUDANCAPRODCANALPJ01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPJ01}  ${nasc}
    Append To List  ${MUDANCAPRODCANALPJ01}  Titular
    Append To List  ${MUDANCAPRODCANALPJ01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    Append To List  ${MUDANCAPRODCANALPJ01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ01}  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ01}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPJ01}  CURITIBA
    Append To List  ${MUDANCAPRODCANALPJ01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MUDANCAPRODCANALPJ01}  Residencial
    Append To List  ${MUDANCAPRODCANALPJ01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    Append To List  ${MUDANCAPRODCANALPJ01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MUDANCAPRODCANALPJ01}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${MUDANCAPRODCANALPJ01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MUDANCAPRODCANALPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ01}  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ01}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    Append To List  ${MUDANCAPRODCANALPJ01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MUDANCAPRODCANALPJ01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ01}  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ01}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MUDANCAPRODCANALPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ01}  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ01}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPJ01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MUDANCAPRODCANALPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ01}  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ01}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MUDANCAPRODCANALPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ01}  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ01}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPJ01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPJ01}  ${temp}


    #Instanciar Variavel Cliente PJ TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MUDANCAPRODCANALPJ02}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    Append To List  ${MUDANCAPRODCANALPJ02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MUDANCAPRODCANALPJ02}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MUDANCAPRODCANALPJ02}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${MUDANCAPRODCANALPJ02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MUDANCAPRODCANALPJ02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    Append To List  ${MUDANCAPRODCANALPJ02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPJ02}  ${nasc}
    Append To List  ${MUDANCAPRODCANALPJ02}  Titular
    Append To List  ${MUDANCAPRODCANALPJ02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    Append To List  ${MUDANCAPRODCANALPJ02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPJ02}  CURITIBA
    Append To List  ${MUDANCAPRODCANALPJ02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MUDANCAPRODCANALPJ02}  Residencial
    Append To List  ${MUDANCAPRODCANALPJ02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    Append To List  ${MUDANCAPRODCANALPJ02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MUDANCAPRODCANALPJ02}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${MUDANCAPRODCANALPJ02}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MUDANCAPRODCANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    Append To List  ${MUDANCAPRODCANALPJ02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MUDANCAPRODCANALPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MUDANCAPRODCANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPJ02}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MUDANCAPRODCANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MUDANCAPRODCANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPJ02}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${MUDANCAPRODCANALPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${MUDANCAPRODCANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  ${conta}
    Append To List  ${MUDANCAPRODCANALPJ02}  Solteiro(a)
    Append To List  ${MUDANCAPRODCANALPJ02}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MUDANCAPRODCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MUDANCAPRODCANALPJ02}  ${temp}