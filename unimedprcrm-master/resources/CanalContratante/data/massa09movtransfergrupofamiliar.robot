*** Settings ***

*** Variables ***
@{MOVTRANSFGRUPOFAMILIARCANALPF01}
@{MOVTRANSFGRUPOFAMILIARCANALCAEPF01}
@{MOVTRANSFGRUPOFAMILIARCANALCAEPF02}
@{MOVTRANSFGRUPOFAMILIARCANALCAEPF03}
@{MOVTRANSFGRUPOFAMILIARCANALCAEPF04}
@{MOVTRANSFGRUPOFAMILIARCANALPJ01}
@{MOVTRANSFGRUPOFAMILIARCANALPJ02}
@{MOVTRANSFGRUPOFAMILIARCANALPJ03}
@{MOVTRANSFGRUPOFAMILIARCANALPJ04}
@{MOVTRANSFGRUPOFAMILIARCANALPJ05}
@{MOVTRANSFGRUPOFAMILIARCANALPJ06}
@{MOVTRANSFGRUPOFAMILIARCANALPJ07}
@{MOVTRANSFGRUPOFAMILIARCANALPJ08}

*** Keywords ***
Instanciar Variaveis MovCadTransfGrupoFamiliar
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${nasc}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Titular
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  CURITIBA
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Residencial
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Casado(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPF01}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${nasc}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Titular
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  CURITIBA
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Residencial
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${nasc}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Titular
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  CURITIBA
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Residencial
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    #Adicionando - Contrato 3: Arg69: Tipo, Arg70: cnpj, Arg71: Nome Conta, Arg72: Numero de Vida, Arg73: Tipo, 
    #              Arg74: Data prevista, Arg75: Email, Arg76: Quantidade de vidas
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF02}  4



    #Instanciar Variavel Cliente PJ TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${nasc}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Titular
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  CURITIBA
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Residencial
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ01}  ${temp}


    #Instanciar Variavel Cliente PJ TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${nasc}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Titular
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  CURITIBA
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Residencial
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ02}  ${temp}


    #Instanciar Variavel Cliente PJ TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${nasc}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Titular
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  CURITIBA
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Residencial
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ03}  ${temp}


    #Instanciar Variavel Cliente PJ TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${nasc}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Titular
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  CURITIBA
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Residencial
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ04}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${nasc}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Titular
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  CURITIBA
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Residencial
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${nasc}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Titular
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  CURITIBA
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Residencial
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    #Adicionando - Contrato 3: Arg69: Tipo, Arg70: cnpj, Arg71: Nome Conta, Arg72: Numero de Vida, Arg73: Tipo, 
    #              Arg74: Data prevista, Arg75: Email, Arg76: Quantidade de vidas
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF04}  4



    #Instanciar Variavel Cliente PJ TR006
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${nasc}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Titular
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  CURITIBA
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Residencial
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ05}  ${temp}


    #Instanciar Variavel Cliente PJ TR006
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${nasc}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Titular
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  CURITIBA
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Residencial
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ06}  ${temp}



    #Instanciar Variavel Cliente PJ TR007
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${nasc}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Titular
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  CURITIBA
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Residencial
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ07}  ${temp}


    #Instanciar Variavel Cliente PJ TR007
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${nasc}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Titular
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  CURITIBA
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Residencial
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${conta}
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  Solteiro(a)
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVTRANSFGRUPOFAMILIARCANALPJ08}  ${temp}