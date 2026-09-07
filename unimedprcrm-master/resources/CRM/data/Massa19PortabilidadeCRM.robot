*** Settings ***
Resource    ../../../main.resource
*** Variables ***
@{PORTABILIDADECRMPF01}
@{PORTABILIDADECRMPJ02}
@{PORTABILIDADECRMPJ03}
@{PORTABILIDADECRMCAEPF04}
@{PORTABILIDADECRMCAEPF05}

*** Keywords ***
Instanciar Variaveis PortabilidadeCRM
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${PORTABILIDADECRMPF01}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    Append To List  ${PORTABILIDADECRMPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECRMPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${PORTABILIDADECRMPF01}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${PORTABILIDADECRMPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${PORTABILIDADECRMPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECRMPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    Append To List  ${PORTABILIDADECRMPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPF01}  ${nasc}
    Append To List  ${PORTABILIDADECRMPF01}  Titular
    Append To List  ${PORTABILIDADECRMPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    Append To List  ${PORTABILIDADECRMPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPF01}  ${conta}
    Append To List  ${PORTABILIDADECRMPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPF01}  CURITIBA
    Append To List  ${PORTABILIDADECRMPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${PORTABILIDADECRMPF01}  Residencial
    Append To List  ${PORTABILIDADECRMPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    Append To List  ${PORTABILIDADECRMPF01}  Celular
    Append To List  ${PORTABILIDADECRMPF01}  (41) 987830493
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${PORTABILIDADECRMPF01}  5034 - UNIFAMILIA-AMBUL+HOSP.ENFERM.
    Append To List  ${PORTABILIDADECRMPF01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${PORTABILIDADECRMPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPF01}  ${conta}
    Append To List  ${PORTABILIDADECRMPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    Append To List  ${PORTABILIDADECRMPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${PORTABILIDADECRMPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPF01}  ${conta}
    Append To List  ${PORTABILIDADECRMPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${PORTABILIDADECRMPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPF01}  ${conta}
    Append To List  ${PORTABILIDADECRMPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPF01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${PORTABILIDADECRMPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPF01}  ${conta}
    Append To List  ${PORTABILIDADECRMPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${PORTABILIDADECRMPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPF01}  ${conta}
    Append To List  ${PORTABILIDADECRMPF01}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPF01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMPF01}  ${temp}


    #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${PORTABILIDADECRMPJ02}  Potencial Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPJ02}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    Append To List  ${PORTABILIDADECRMPJ02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECRMPJ02}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${PORTABILIDADECRMPJ02}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${PORTABILIDADECRMPJ02}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${PORTABILIDADECRMPJ02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECRMPJ02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    Append To List  ${PORTABILIDADECRMPJ02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPJ02}  ${nasc}
    Append To List  ${PORTABILIDADECRMPJ02}  Titular
    Append To List  ${PORTABILIDADECRMPJ02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    Append To List  ${PORTABILIDADECRMPJ02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPJ02}  ${conta}
    Append To List  ${PORTABILIDADECRMPJ02}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPJ02}  CURITIBA
    Append To List  ${PORTABILIDADECRMPJ02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${PORTABILIDADECRMPJ02}  Residencial
    Append To List  ${PORTABILIDADECRMPJ02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    Append To List  ${PORTABILIDADECRMPJ02}  Celular
    Append To List  ${PORTABILIDADECRMPJ02}  (41) 987830493
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${PORTABILIDADECRMPJ02}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    # Append To List  ${PORTABILIDADECRMPJ02}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${PORTABILIDADECRMPJ02}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${PORTABILIDADECRMPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPJ02}  ${conta}
    Append To List  ${PORTABILIDADECRMPJ02}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    Append To List  ${PORTABILIDADECRMPJ02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${PORTABILIDADECRMPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPJ02}  ${conta}
    Append To List  ${PORTABILIDADECRMPJ02}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${PORTABILIDADECRMPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPJ02}  ${conta}
    Append To List  ${PORTABILIDADECRMPJ02}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPJ02}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${PORTABILIDADECRMPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPJ02}  ${conta}
    Append To List  ${PORTABILIDADECRMPJ02}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${PORTABILIDADECRMPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPJ02}  ${conta}
    Append To List  ${PORTABILIDADECRMPJ02}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPJ02}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMPJ02}  ${temp}


    #Instanciar Variavel Cliente PJ TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${PORTABILIDADECRMPJ03}  Potencial Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPJ03}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    Append To List  ${PORTABILIDADECRMPJ03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECRMPJ03}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${PORTABILIDADECRMPJ03}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTABILIDADECRMPJ03}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${PORTABILIDADECRMPJ03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECRMPJ03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    Append To List  ${PORTABILIDADECRMPJ03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPJ03}  ${nasc}
    Append To List  ${PORTABILIDADECRMPJ03}  Titular
    Append To List  ${PORTABILIDADECRMPJ03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    Append To List  ${PORTABILIDADECRMPJ03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPJ03}  ${conta}
    Append To List  ${PORTABILIDADECRMPJ03}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPJ03}  CURITIBA
    Append To List  ${PORTABILIDADECRMPJ03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${PORTABILIDADECRMPJ03}  Residencial
    Append To List  ${PORTABILIDADECRMPJ03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    Append To List  ${PORTABILIDADECRMPJ03}  Celular
    Append To List  ${PORTABILIDADECRMPJ03}  (41) 987830493
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${PORTABILIDADECRMPJ03}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${PORTABILIDADECRMPJ03}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${PORTABILIDADECRMPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPJ03}  ${conta}
    Append To List  ${PORTABILIDADECRMPJ03}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    Append To List  ${PORTABILIDADECRMPJ03}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${PORTABILIDADECRMPJ03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPJ03}  ${conta}
    Append To List  ${PORTABILIDADECRMPJ03}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${PORTABILIDADECRMPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPJ03}  ${conta}
    Append To List  ${PORTABILIDADECRMPJ03}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPJ03}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${PORTABILIDADECRMPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPJ03}  ${conta}
    Append To List  ${PORTABILIDADECRMPJ03}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPJ03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${PORTABILIDADECRMPJ03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMPJ03}  ${conta}
    Append To List  ${PORTABILIDADECRMPJ03}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMPJ03}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMPJ03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMPJ03}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${PORTABILIDADECRMCAEPF04}  Potencial Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    Append To List  ${PORTABILIDADECRMCAEPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${PORTABILIDADECRMCAEPF04}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${PORTABILIDADECRMCAEPF04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    Append To List  ${PORTABILIDADECRMCAEPF04}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${nasc}
    Append To List  ${PORTABILIDADECRMCAEPF04}  Titular
    Append To List  ${PORTABILIDADECRMCAEPF04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    Append To List  ${PORTABILIDADECRMCAEPF04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF04}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMCAEPF04}  CURITIBA
    Append To List  ${PORTABILIDADECRMCAEPF04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${PORTABILIDADECRMCAEPF04}  Residencial
    Append To List  ${PORTABILIDADECRMCAEPF04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    Append To List  ${PORTABILIDADECRMCAEPF04}  Celular
    Append To List  ${PORTABILIDADECRMCAEPF04}  (41) 987830493
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${PORTABILIDADECRMCAEPF04}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${PORTABILIDADECRMCAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF04}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    Append To List  ${PORTABILIDADECRMCAEPF04}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${PORTABILIDADECRMCAEPF04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF04}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${PORTABILIDADECRMCAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF04}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMCAEPF04}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${PORTABILIDADECRMCAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF04}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${PORTABILIDADECRMCAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF04}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMCAEPF04}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMCAEPF04}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${PORTABILIDADECRMCAEPF05}  Potencial Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    Append To List  ${PORTABILIDADECRMCAEPF05}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${PORTABILIDADECRMCAEPF05}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${PORTABILIDADECRMCAEPF05}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    Append To List  ${PORTABILIDADECRMCAEPF05}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${nasc}
    Append To List  ${PORTABILIDADECRMCAEPF05}  Titular
    Append To List  ${PORTABILIDADECRMCAEPF05}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    Append To List  ${PORTABILIDADECRMCAEPF05}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF05}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMCAEPF05}  CURITIBA
    Append To List  ${PORTABILIDADECRMCAEPF05}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${PORTABILIDADECRMCAEPF05}  Residencial
    Append To List  ${PORTABILIDADECRMCAEPF05}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    Append To List  ${PORTABILIDADECRMCAEPF05}  Celular
    Append To List  ${PORTABILIDADECRMCAEPF05}  (41) 987830493
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${PORTABILIDADECRMCAEPF05}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${PORTABILIDADECRMCAEPF05}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${PORTABILIDADECRMCAEPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF05}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMCAEPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    Append To List  ${PORTABILIDADECRMCAEPF05}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${PORTABILIDADECRMCAEPF05}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF05}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMCAEPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${PORTABILIDADECRMCAEPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF05}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMCAEPF05}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${PORTABILIDADECRMCAEPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF05}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMCAEPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${PORTABILIDADECRMCAEPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${conta}
    Append To List  ${PORTABILIDADECRMCAEPF05}  Solteiro(a)
    Append To List  ${PORTABILIDADECRMCAEPF05}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${PORTABILIDADECRMCAEPF05}  ${temp}