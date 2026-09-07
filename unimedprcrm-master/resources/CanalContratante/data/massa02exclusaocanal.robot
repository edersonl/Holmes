*** Settings ***

*** Variables ***
@{MOVCADASTRALEXCPF01}
@{MOVCADASTRALEXCPJ01}
@{MOVCADASTRALEXCPJ02}
@{MOVCADASTRALEXCCAEPF01}
@{MOVCADASTRALEXCCAEPF02}



*** Keywords ***
Instanciar Variaveis ExclusaoCanal
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVCADASTRALEXCPF01}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    Append To List  ${MOVCADASTRALEXCPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVCADASTRALEXCPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVCADASTRALEXCPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${MOVCADASTRALEXCPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVCADASTRALEXCPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    Append To List  ${MOVCADASTRALEXCPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPF01}  ${nasc}
    Append To List  ${MOVCADASTRALEXCPF01}  Titular
    Append To List  ${MOVCADASTRALEXCPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    Append To List  ${MOVCADASTRALEXCPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPF01}  ${conta}
    Append To List  ${MOVCADASTRALEXCPF01}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPF01}  CURITIBA
    Append To List  ${MOVCADASTRALEXCPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVCADASTRALEXCPF01}  Residencial
    Append To List  ${MOVCADASTRALEXCPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    Append To List  ${MOVCADASTRALEXCPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVCADASTRALEXCPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${MOVCADASTRALEXCPF01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVCADASTRALEXCPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPF01}  ${conta}
    Append To List  ${MOVCADASTRALEXCPF01}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    Append To List  ${MOVCADASTRALEXCPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVCADASTRALEXCPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPF01}  ${conta}
    Append To List  ${MOVCADASTRALEXCPF01}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVCADASTRALEXCPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPF01}  ${conta}
    Append To List  ${MOVCADASTRALEXCPF01}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPF01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVCADASTRALEXCPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPF01}  ${conta}
    Append To List  ${MOVCADASTRALEXCPF01}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVCADASTRALEXCPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPF01}  ${conta}
    Append To List  ${MOVCADASTRALEXCPF01}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPF01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCPF01}  ${temp}




#Instanciar Variavel Cliente PJ TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVCADASTRALEXCPJ01}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ01}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    Append To List  ${MOVCADASTRALEXCPJ01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVCADASTRALEXCPJ01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVCADASTRALEXCPJ01}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${MOVCADASTRALEXCPJ01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia / Exclusão, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVCADASTRALEXCPJ01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    Append To List  ${MOVCADASTRALEXCPJ01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPJ01}  ${nasc}
    Append To List  ${MOVCADASTRALEXCPJ01}  Titular
    Append To List  ${MOVCADASTRALEXCPJ01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    Append To List  ${MOVCADASTRALEXCPJ01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ01}  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ01}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPJ01}  CURITIBA
    Append To List  ${MOVCADASTRALEXCPJ01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVCADASTRALEXCPJ01}  Residencial
    Append To List  ${MOVCADASTRALEXCPJ01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    Append To List  ${MOVCADASTRALEXCPJ01}  Celular
    Append To List  ${MOVCADASTRALEXCPJ01}  41 98245-6885
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVCADASTRALEXCPJ01}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${MOVCADASTRALEXCPJ01}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVCADASTRALEXCPJ01}  Cliente (PJ)
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ01}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    Append To List  ${MOVCADASTRALEXCPJ01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVCADASTRALEXCPJ01}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    Append To List  ${MOVCADASTRALEXCPJ01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVCADASTRALEXCPJ01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ01}  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ01}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVCADASTRALEXCPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ01}  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ01}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVCADASTRALEXCPJ01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ01}  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ01}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVCADASTRALEXCPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ01}  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ01}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCPJ01}  ${temp}


    #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVCADASTRALEXCPJ02}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ02}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    Append To List  ${MOVCADASTRALEXCPJ02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVCADASTRALEXCPJ02}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVCADASTRALEXCPJ02}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${MOVCADASTRALEXCPJ02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVCADASTRALEXCPJ02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    Append To List  ${MOVCADASTRALEXCPJ02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPJ02}  ${nasc}
    Append To List  ${MOVCADASTRALEXCPJ02}  Titular
    Append To List  ${MOVCADASTRALEXCPJ02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    Append To List  ${MOVCADASTRALEXCPJ02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ02}  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ02}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPJ02}  CURITIBA
    Append To List  ${MOVCADASTRALEXCPJ02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVCADASTRALEXCPJ02}  Residencial
    Append To List  ${MOVCADASTRALEXCPJ02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    Append To List  ${MOVCADASTRALEXCPJ02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVCADASTRALEXCPJ02}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${MOVCADASTRALEXCPJ02}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVCADASTRALEXCPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ02}  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ02}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    Append To List  ${MOVCADASTRALEXCPJ02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVCADASTRALEXCPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ02}  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ02}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVCADASTRALEXCPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ02}  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ02}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPJ02}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVCADASTRALEXCPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ02}  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ02}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVCADASTRALEXCPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ02}  ${conta}
    Append To List  ${MOVCADASTRALEXCPJ02}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCPJ02}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCPJ02}  ${temp}



    #Instanciar Variavel Cliente CAEPF TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVCADASTRALEXCCAEPF01}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia / Exclusão, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${nasc}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Titular
    Append To List  ${MOVCADASTRALEXCCAEPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCCAEPF01}  CURITIBA
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Residencial
    Append To List  ${MOVCADASTRALEXCCAEPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Celular
    Append To List  ${MOVCADASTRALEXCCAEPF01}  41 98245-6885
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVCADASTRALEXCCAEPF01}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${MOVCADASTRALEXCCAEPF01}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF01}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCCAEPF01}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVCADASTRALEXCCAEPF02}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${nasc}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Titular
    Append To List  ${MOVCADASTRALEXCCAEPF02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCCAEPF02}  CURITIBA
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Residencial
    Append To List  ${MOVCADASTRALEXCCAEPF02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVCADASTRALEXCCAEPF02}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${MOVCADASTRALEXCCAEPF02}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${conta}
    Append To List  ${MOVCADASTRALEXCCAEPF02}  Solteiro(a)
    Append To List  ${MOVCADASTRALEXCCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVCADASTRALEXCCAEPF02}  ${temp}