*** Settings ***

*** Variables ***
@{EXCLUSAORN412CANALPF01}
@{EXCLUSAORN412CANALPF02}
@{EXCLUSAORN412CANALCAEPF01}
@{EXCLUSAORN412CANALCAEPF02}
@{EXCLUSAORN412CANALCAEPF03}
@{EXCLUSAORN412CANALCAEPF04}
@{EXCLUSAORN412CANALPJ01}
@{EXCLUSAORN412CANALPJ02}
@{EXCLUSAORN412CANALPJ03}
@{EXCLUSAORN412CANALPJ04}


*** Keywords ***
Instanciar Variaveis ExclusaoRN412Canal
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAORN412CANALPF01}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAORN412CANALPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${EXCLUSAORN412CANALPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPF01}  ${nasc}
    Append To List  ${EXCLUSAORN412CANALPF01}  Titular
    Append To List  ${EXCLUSAORN412CANALPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF01}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPF01}  CURITIBA
    Append To List  ${EXCLUSAORN412CANALPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAORN412CANALPF01}  Residencial
    Append To List  ${EXCLUSAORN412CANALPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAORN412CANALPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${EXCLUSAORN412CANALPF01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAORN412CANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF01}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAORN412CANALPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF01}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAORN412CANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF01}  Casado(a)
    Append To List  ${EXCLUSAORN412CANALPF01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAORN412CANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF01}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAORN412CANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF01}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPF01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPF01}  ${temp}


    #Instanciar Variavel Cliente PF TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAORN412CANALPF02}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF02}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALPF02}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAORN412CANALPF02}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${EXCLUSAORN412CANALPF02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPF02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPF02}  ${nasc}
    Append To List  ${EXCLUSAORN412CANALPF02}  Titular
    Append To List  ${EXCLUSAORN412CANALPF02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF02}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPF02}  CURITIBA
    Append To List  ${EXCLUSAORN412CANALPF02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAORN412CANALPF02}  Residencial
    Append To List  ${EXCLUSAORN412CANALPF02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPF02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAORN412CANALPF02}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${EXCLUSAORN412CANALPF02}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAORN412CANALPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF02}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPF02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAORN412CANALPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF02}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAORN412CANALPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF02}  Casado(a)
    Append To List  ${EXCLUSAORN412CANALPF02}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAORN412CANALPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF02}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAORN412CANALPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPF02}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPF02}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPF02}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${nasc}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Titular
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  CURITIBA
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Residencial
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF01}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${nasc}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Titular
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  CURITIBA
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Residencial
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF02}  ${temp}

    
    #Instanciar Variavel Cliente CAEPF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${nasc}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Titular
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  CURITIBA
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Residencial
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    #Adicionando - Contrato 3: Arg69: Tipo, Arg70: cnpj, Arg71: Nome Conta, Arg72: Numero de Vida, Arg73: Tipo, 
    #              Arg74: Data prevista, Arg75: Email, Arg76: Quantidade de vidas
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF03}  4


#Instanciar Variavel Cliente CAEPF TR006
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${nasc}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Titular
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  CURITIBA
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Residencial
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    #Adicionando - Contrato 3: Arg69: Tipo, Arg70: cnpj, Arg71: Nome Conta, Arg72: Numero de Vida, Arg73: Tipo, 
    #              Arg74: Data prevista, Arg75: Email, Arg76: Quantidade de vidas
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  ${temp}
    Append To List  ${EXCLUSAORN412CANALCAEPF04}  4


    #Instanciar Variavel Cliente PJ TR007
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAORN412CANALPJ01}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAORN412CANALPJ01}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${EXCLUSAORN412CANALPJ01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${nasc}
    Append To List  ${EXCLUSAORN412CANALPJ01}  Titular
    Append To List  ${EXCLUSAORN412CANALPJ01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ01}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ01}  CURITIBA
    Append To List  ${EXCLUSAORN412CANALPJ01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAORN412CANALPJ01}  Residencial
    Append To List  ${EXCLUSAORN412CANALPJ01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAORN412CANALPJ01}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${EXCLUSAORN412CANALPJ01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAORN412CANALPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ01}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAORN412CANALPJ01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ01}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAORN412CANALPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ01}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAORN412CANALPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ01}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAORN412CANALPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ01}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ01}  ${temp}



    #Instanciar Variavel Cliente PJ TR008
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAORN412CANALPJ02}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAORN412CANALPJ02}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${EXCLUSAORN412CANALPJ02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${nasc}
    Append To List  ${EXCLUSAORN412CANALPJ02}  Titular
    Append To List  ${EXCLUSAORN412CANALPJ02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ02}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ02}  CURITIBA
    Append To List  ${EXCLUSAORN412CANALPJ02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAORN412CANALPJ02}  Residencial
    Append To List  ${EXCLUSAORN412CANALPJ02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAORN412CANALPJ02}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${EXCLUSAORN412CANALPJ02}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAORN412CANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ02}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAORN412CANALPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ02}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAORN412CANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ02}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ02}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAORN412CANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ02}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAORN412CANALPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ02}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ02}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ02}  ${temp}



    #Instanciar Variavel Cliente PJ TR009
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAORN412CANALPJ03}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAORN412CANALPJ03}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${EXCLUSAORN412CANALPJ03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${nasc}
    Append To List  ${EXCLUSAORN412CANALPJ03}  Titular
    Append To List  ${EXCLUSAORN412CANALPJ03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ03}  CURITIBA
    Append To List  ${EXCLUSAORN412CANALPJ03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAORN412CANALPJ03}  Residencial
    Append To List  ${EXCLUSAORN412CANALPJ03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAORN412CANALPJ03}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${EXCLUSAORN412CANALPJ03}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAORN412CANALPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ03}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAORN412CANALPJ03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAORN412CANALPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ03}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAORN412CANALPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAORN412CANALPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ03}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${EXCLUSAORN412CANALPJ03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${EXCLUSAORN412CANALPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ03}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ03}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ03}  ${temp}


    #Instanciar Variavel Cliente PJ TR010
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAORN412CANALPJ04}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAORN412CANALPJ04}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${EXCLUSAORN412CANALPJ04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ04}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${nasc}
    Append To List  ${EXCLUSAORN412CANALPJ04}  Titular
    Append To List  ${EXCLUSAORN412CANALPJ04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ04}  CURITIBA
    Append To List  ${EXCLUSAORN412CANALPJ04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAORN412CANALPJ04}  Residencial
    Append To List  ${EXCLUSAORN412CANALPJ04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ04}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAORN412CANALPJ04}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${EXCLUSAORN412CANALPJ04}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAORN412CANALPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    Append To List  ${EXCLUSAORN412CANALPJ04}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAORN412CANALPJ04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAORN412CANALPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ04}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAORN412CANALPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAORN412CANALPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ04}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${EXCLUSAORN412CANALPJ04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${EXCLUSAORN412CANALPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${conta}
    Append To List  ${EXCLUSAORN412CANALPJ04}  Solteiro(a)
    Append To List  ${EXCLUSAORN412CANALPJ04}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAORN412CANALPJ04}  ${temp}