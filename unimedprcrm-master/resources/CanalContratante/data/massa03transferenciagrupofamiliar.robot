*** Settings ***
*** Variables ***
@{MOVTRANFGRUPOFAMILIARMASSAPF01}
@{MOVTRANFGRUPOFAMILIARMASSAPJ01}
@{MOVTRANFGRUPOFAMILIARMASSAPJ02}
@{MOVTRANFGRUPOFAMILIARMASSACAEPF01}
@{MOVTRANFGRUPOFAMILIARMASSACAEPF02}


*** Keywords ***
Instanciar Variaveis MovCadTranferenciaDeGrupoFamiliarEmMassaCanal
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${nasc}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Titular
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  CURITIBA
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Residencial
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPF01}  ${temp}


    #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${nasc}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Titular
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  CURITIBA
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Residencial
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ01}  ${temp}


    #Instanciar Variavel Cliente PJ TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${nasc}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Titular
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  CURITIBA
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Residencial
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSAPJ02}  ${temp}



    #Instanciar Variavel Cliente CAEPF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${nasc}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Titular
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  CURITIBA
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Residencial
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${nasc}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Titular
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  CURITIBA
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Residencial
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Solteiro(a)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    #Adicionando - Contrato 3: Arg69: Tipo, Arg70: cnpj, Arg71: Nome Conta, Arg72: Numero de Vida, Arg73: Tipo, 
    #              Arg74: Data prevista, Arg75: Email, Arg76: Quantidade de vidas
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  ${temp}
    Append To List  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02}  4