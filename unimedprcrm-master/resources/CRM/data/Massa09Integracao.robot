*** Settings ***

Resource    ../../../main.resource

*** Variables ***
@{INTEGRACAOPOTPF01}
@{INTEGRACAOPOTPF02}
@{INTEGRACAOPOTPF03}
@{INTEGRACAOPOTPJ04}
@{INTEGRACAOPOTPJ05}
@{INTEGRACAOPOTPJ06}
@{INTEGRACAOPOTPJ07}
@{INTEGRACAOPOTPJ08}
@{INTEGRACAOPOTPJ09}
@{INTEGRACAOPOTPJ10}
@{INTEGRACAOPOTPJ11}
@{INTEGRACAOPOTPJ12}
@{INTEGRACAOPOTPJ13}
@{INTEGRACAOPOTPJ14}
@{INTEGRACAOPOTPJ15}
@{INTEGRACAOPOTPJ16}
@{INTEGRACAOPOTPJ17}
@{IMPORTBENEFINTEG01}
@{IMPORTBENEFINTEG02}
@{IMPORTBENEFINTEG03}
@{IMPORTBENEFINTEG04}
@{IMPORTBENEFINTEG05}


*** Keywords ***
Instanciar Variaveis Integracao
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPF01}  Pessoa Física
    ${temp}           FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(1, 28)
    Append To List  ${INTEGRACAOPOTPF01}  ${temp}
    Append To List  ${INTEGRACAOPOTPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPF01}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGRACAOPOTPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGRACAOPOTPF01}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPF01}  ${temp}
    Append To List  ${INTEGRACAOPOTPF01}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPF01}  ${nasc}
    Append To List  ${INTEGRACAOPOTPF01}  Titular
    Append To List  ${INTEGRACAOPOTPF01}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPF01}  ${temp}
    Append To List  ${INTEGRACAOPOTPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPF01}  ${conta}
    Append To List  ${INTEGRACAOPOTPF01}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPF01}  CURITIBA
    Append To List  ${INTEGRACAOPOTPF01}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${INTEGRACAOPOTPF01}  Residencial
    Append To List  ${INTEGRACAOPOTPF01}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPF01}  165
    Append To List  ${INTEGRACAOPOTPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPF01}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGRACAOPOTPF01}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, 
    #              Arg35: Data Nascimento Dependente, Arg36: Email, Arg37: Quantidade de vidas
    Append To List  ${INTEGRACAOPOTPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPF01}  ${conta}
    Append To List  ${INTEGRACAOPOTPF01}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPF01}  ${temp}
    Append To List  ${INTEGRACAOPOTPF01}  2


    #Instanciar Variavel Cliente PF TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPF02}  Pessoa Física
    ${temp}           FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPF02}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPF02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(1, 28)
    Append To List  ${INTEGRACAOPOTPF02}  ${temp}
    Append To List  ${INTEGRACAOPOTPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPF02}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPF02}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGRACAOPOTPF02}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGRACAOPOTPF02}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPF02}  ${temp}
    Append To List  ${INTEGRACAOPOTPF02}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPF02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPF02}  ${nasc}
    Append To List  ${INTEGRACAOPOTPF02}  Titular
    Append To List  ${INTEGRACAOPOTPF02}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPF02}  ${temp}
    Append To List  ${INTEGRACAOPOTPF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPF02}  ${conta}
    Append To List  ${INTEGRACAOPOTPF02}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPF02}  CURITIBA
    Append To List  ${INTEGRACAOPOTPF02}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${INTEGRACAOPOTPF02}  Residencial
    Append To List  ${INTEGRACAOPOTPF02}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPF02}  165
    Append To List  ${INTEGRACAOPOTPF02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPF02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPF02}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPF02}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGRACAOPOTPF02}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, 
    #              Arg35: Data Nascimento Dependente, Arg36: Email, Arg37: Quantidade de vidas
    Append To List  ${INTEGRACAOPOTPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPF02}  ${conta}
    Append To List  ${INTEGRACAOPOTPF02}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPF02}  ${temp}
    Append To List  ${INTEGRACAOPOTPF02}  2


    #Instanciar Variavel Cliente PF TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPF03}  Pessoa Física
    ${temp}           FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPF03}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPF03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(1, 28)
    Append To List  ${INTEGRACAOPOTPF03}  ${temp}
    Append To List  ${INTEGRACAOPOTPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPF03}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPF03}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGRACAOPOTPF03}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGRACAOPOTPF03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPF03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPF03}  ${temp}
    Append To List  ${INTEGRACAOPOTPF03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPF03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPF03}  ${nasc}
    Append To List  ${INTEGRACAOPOTPF03}  Titular
    Append To List  ${INTEGRACAOPOTPF03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPF03}  ${temp}
    Append To List  ${INTEGRACAOPOTPF03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPF03}  ${conta}
    Append To List  ${INTEGRACAOPOTPF03}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPF03}  CURITIBA
    Append To List  ${INTEGRACAOPOTPF03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGRACAOPOTPF03}  Residencial
    Append To List  ${INTEGRACAOPOTPF03}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPF03}  165
    Append To List  ${INTEGRACAOPOTPF03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPF03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPF03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPF03}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGRACAOPOTPF03}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGRACAOPOTPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPF03}  ${conta}
    Append To List  ${INTEGRACAOPOTPF03}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPF03}  ${temp}
    Append To List  ${INTEGRACAOPOTPF03}  2


    #Instanciar Variavel Cliente PF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPJ04}  Pessoa Jurídica (CNPJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ04}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGRACAOPOTPJ04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(30, 40)
    Append To List  ${INTEGRACAOPOTPJ04}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ04}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPJ04}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${INTEGRACAOPOTPJ04}  5052 - UNIFAMILIA ADESAO-AMB+HOSP+OBS
    Append To List  ${INTEGRACAOPOTPJ04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPJ04}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ04}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ04}  ${nasc}
    Append To List  ${INTEGRACAOPOTPJ04}  Titular
    Append To List  ${INTEGRACAOPOTPJ04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPJ04}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ04}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ04}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ04}  CURITIBA
    Append To List  ${INTEGRACAOPOTPJ04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGRACAOPOTPJ04}  Residencial
    Append To List  ${INTEGRACAOPOTPJ04}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPJ04}  165
    Append To List  ${INTEGRACAOPOTPJ04}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPJ04}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ04}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPJ04}  5052 - UNIFAMILIA ADESAO-AMB+HOSP+OBS
    Append To List  ${INTEGRACAOPOTPJ04}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGRACAOPOTPJ04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ04}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ04}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ04}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ04}  2


    #Instanciar Variavel Cliente PF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPJ05}  Pessoa Jurídica (CNPJ)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ05}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGRACAOPOTPJ05}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(30, 40)
    Append To List  ${INTEGRACAOPOTPJ05}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ05}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ05}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPJ05}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${INTEGRACAOPOTPJ05}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${INTEGRACAOPOTPJ05}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ05}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPJ05}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ05}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ05}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ05}  ${nasc}
    Append To List  ${INTEGRACAOPOTPJ05}  Titular
    Append To List  ${INTEGRACAOPOTPJ05}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPJ05}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ05}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ05}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ05}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ05}  CURITIBA
    Append To List  ${INTEGRACAOPOTPJ05}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGRACAOPOTPJ05}  Residencial
    Append To List  ${INTEGRACAOPOTPJ05}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPJ05}  165
    Append To List  ${INTEGRACAOPOTPJ05}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPJ05}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ05}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPJ05}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${INTEGRACAOPOTPJ05}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGRACAOPOTPJ05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ05}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ05}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ05}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ05}  1


    #Instanciar Variavel Cliente PF TR006
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPJ06}  Pessoa Jurídica (CNPJ)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ06}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGRACAOPOTPJ06}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(30, 40)
    Append To List  ${INTEGRACAOPOTPJ06}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ06}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ06}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPJ06}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${INTEGRACAOPOTPJ06}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${INTEGRACAOPOTPJ06}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ06}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPJ06}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ06}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ06}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ06}  ${nasc}
    Append To List  ${INTEGRACAOPOTPJ06}  Titular
    Append To List  ${INTEGRACAOPOTPJ06}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPJ06}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ06}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ06}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ06}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ06}  CURITIBA
    Append To List  ${INTEGRACAOPOTPJ06}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGRACAOPOTPJ06}  Residencial
    Append To List  ${INTEGRACAOPOTPJ06}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPJ06}  165
    Append To List  ${INTEGRACAOPOTPJ06}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPJ06}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ06}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPJ06}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${INTEGRACAOPOTPJ06}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGRACAOPOTPJ06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ06}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ06}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ06}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ06}  1


    #Instanciar Variavel Cliente PF TR007
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPJ07}  Pessoa Jurídica (CNPJ)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ07}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGRACAOPOTPJ07}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(30, 40)
    Append To List  ${INTEGRACAOPOTPJ07}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ07}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ07}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPJ07}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGRACAOPOTPJ07}  5044 - UNIFAMILIA EMPRESARIAL AMBULAT
    Append To List  ${INTEGRACAOPOTPJ07}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ07}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPJ07}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ07}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ07}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ07}  ${nasc}
    Append To List  ${INTEGRACAOPOTPJ07}  Titular
    Append To List  ${INTEGRACAOPOTPJ07}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPJ07}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ07}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ07}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ07}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ07}  CURITIBA
    Append To List  ${INTEGRACAOPOTPJ07}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGRACAOPOTPJ07}  Residencial
    Append To List  ${INTEGRACAOPOTPJ07}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPJ07}  165
    Append To List  ${INTEGRACAOPOTPJ07}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPJ07}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ07}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPJ07}  5047 - UNIFAM.EMP.AMB+HOSP.ENF.+OBST.
    Append To List  ${INTEGRACAOPOTPJ07}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGRACAOPOTPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ07}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ07}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ07}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ07}  2


    #Instanciar Variavel Cliente PF TR008
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPJ08}  Pessoa Jurídica (CNPJ)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ08}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGRACAOPOTPJ08}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(30, 40)
    Append To List  ${INTEGRACAOPOTPJ08}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ08}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ08}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPJ08}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGRACAOPOTPJ08}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGRACAOPOTPJ08}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ08}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPJ08}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ08}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ08}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ08}  ${nasc}
    Append To List  ${INTEGRACAOPOTPJ08}  Titular
    Append To List  ${INTEGRACAOPOTPJ08}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPJ08}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ08}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ08}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ08}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ08}  CURITIBA
    Append To List  ${INTEGRACAOPOTPJ08}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${INTEGRACAOPOTPJ08}  Residencial
    Append To List  ${INTEGRACAOPOTPJ08}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPJ08}  165
    Append To List  ${INTEGRACAOPOTPJ08}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPJ08}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ08}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPJ08}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGRACAOPOTPJ08}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, 
    #              Arg35: Data Nascimento Dependente, Arg36: Email, Arg37: Quantidade de vidas
    Append To List  ${INTEGRACAOPOTPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ08}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ08}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ08}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ08}  1


    #Instanciar Variavel Cliente PF TR009
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPJ09}  Pessoa Jurídica (CNPJ)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ09}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGRACAOPOTPJ09}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(1, 28)
    Append To List  ${INTEGRACAOPOTPJ09}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ09}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ09}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPJ09}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGRACAOPOTPJ09}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGRACAOPOTPJ09}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ09}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPJ09}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ09}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ09}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ09}  ${nasc}
    Append To List  ${INTEGRACAOPOTPJ09}  Titular
    Append To List  ${INTEGRACAOPOTPJ09}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPJ09}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ09}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ09}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ09}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ09}  CURITIBA
    Append To List  ${INTEGRACAOPOTPJ09}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGRACAOPOTPJ09}  Residencial
    Append To List  ${INTEGRACAOPOTPJ09}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPJ09}  165
    Append To List  ${INTEGRACAOPOTPJ09}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPJ09}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ09}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPJ09}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGRACAOPOTPJ09}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGRACAOPOTPJ09}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ09}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ09}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ09}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ09}  2


    #Instanciar Variavel Cliente PF TR010
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPJ10}  Pessoa Jurídica (CNPJ)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ10}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGRACAOPOTPJ10}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${INTEGRACAOPOTPJ10}  29
    Append To List  ${INTEGRACAOPOTPJ10}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ10}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPJ10}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGRACAOPOTPJ10}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGRACAOPOTPJ10}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ10}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPJ10}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ10}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ10}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ10}  ${nasc}
    Append To List  ${INTEGRACAOPOTPJ10}  Titular
    Append To List  ${INTEGRACAOPOTPJ10}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPJ10}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ10}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ10}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ10}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ10}  CURITIBA
    Append To List  ${INTEGRACAOPOTPJ10}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGRACAOPOTPJ10}  Residencial
    Append To List  ${INTEGRACAOPOTPJ10}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPJ10}  165
    Append To List  ${INTEGRACAOPOTPJ10}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPJ10}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ10}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPJ10}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGRACAOPOTPJ10}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGRACAOPOTPJ10}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ10}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ10}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ10}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ10}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ10}  2


    #Instanciar Variavel Cliente PF TR011
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPJ11}  Pessoa Jurídica (CNPJ)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ11}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGRACAOPOTPJ11}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}         Evaluate  random.randint(30, 50)
    Append To List  ${INTEGRACAOPOTPJ11}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ11}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ11}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPJ11}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGRACAOPOTPJ11}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${INTEGRACAOPOTPJ11}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ11}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPJ11}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ11}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ11}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ11}  ${nasc}
    Append To List  ${INTEGRACAOPOTPJ11}  Titular
    Append To List  ${INTEGRACAOPOTPJ11}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPJ11}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ11}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ11}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ11}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ11}  CURITIBA
    Append To List  ${INTEGRACAOPOTPJ11}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${INTEGRACAOPOTPJ11}  Residencial
    Append To List  ${INTEGRACAOPOTPJ11}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPJ11}  165
    Append To List  ${INTEGRACAOPOTPJ11}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPJ11}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ11}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPJ11}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${INTEGRACAOPOTPJ11}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, 
    #              Arg35: Data Nascimento Dependente, Arg36: Email, Arg37: Quantidade de vidas, Arg38: Convenio Das Massas, Arg39: Convenio fixo
    Append To List  ${INTEGRACAOPOTPJ11}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ11}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ11}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ11}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ11}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ11}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ11}  1
    Append To List  ${INTEGRACAOPOTPJ11}  ${NOME_CONVENIO}
    Append To List  ${INTEGRACAOPOTPJ11}  Convênio LEW


    #Instanciar Variavel Cliente PF TR012
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPJ12}  Pessoa Jurídica (CNPJ)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ12}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGRACAOPOTPJ12}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}         Evaluate  random.randint(30, 50)
    Append To List  ${INTEGRACAOPOTPJ12}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ12}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ12}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPJ12}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGRACAOPOTPJ12}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${INTEGRACAOPOTPJ12}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ12}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPJ12}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ12}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ12}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ12}  ${nasc}
    Append To List  ${INTEGRACAOPOTPJ12}  Titular
    Append To List  ${INTEGRACAOPOTPJ12}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPJ12}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ12}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ12}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ12}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ12}  CURITIBA
    Append To List  ${INTEGRACAOPOTPJ12}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${INTEGRACAOPOTPJ12}  Residencial
    Append To List  ${INTEGRACAOPOTPJ12}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPJ12}  165
    Append To List  ${INTEGRACAOPOTPJ12}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPJ12}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ12}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPJ12}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${INTEGRACAOPOTPJ12}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, 
    #              Arg35: Data Nascimento Dependente, Arg36: Email, Arg37: Quantidade de vidas, Arg38: Convenio Massas, Arg39: Convenio Fixo
    Append To List  ${INTEGRACAOPOTPJ12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ12}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ12}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ12}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ12}  1
    Append To List  ${INTEGRACAOPOTPJ12}  ${NOME_CONVENIO}
    Append To List  ${INTEGRACAOPOTPJ12}  Convênio LEW
    #Adicionando - Desconto e Acrescimo: Arg40: Tipo negociação, Arg41: Valor, Arg42: Tipo negociação, Arg43: Valor
    Append To List  ${INTEGRACAOPOTPJ12}  desconto
    Append To List  ${INTEGRACAOPOTPJ12}  10
    Append To List  ${INTEGRACAOPOTPJ12}  acrescimo
    Append To List  ${INTEGRACAOPOTPJ12}  20


    #Instanciar Variavel Cliente PF TR013
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPJ13}  Pessoa Jurídica (CNPJ)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ13}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGRACAOPOTPJ13}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}         Evaluate  random.randint(30, 50)
    Append To List  ${INTEGRACAOPOTPJ13}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ13}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ13}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPJ13}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGRACAOPOTPJ13}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${INTEGRACAOPOTPJ13}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ13}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPJ13}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ13}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ13}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ13}  ${nasc}
    Append To List  ${INTEGRACAOPOTPJ13}  Titular
    Append To List  ${INTEGRACAOPOTPJ13}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPJ13}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ13}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ13}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ13}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ13}  CURITIBA
    Append To List  ${INTEGRACAOPOTPJ13}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${INTEGRACAOPOTPJ13}  Residencial
    Append To List  ${INTEGRACAOPOTPJ13}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPJ13}  165
    Append To List  ${INTEGRACAOPOTPJ13}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPJ13}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ13}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPJ13}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${INTEGRACAOPOTPJ13}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, 
    #              Arg35: Data Nascimento Dependente, Arg36: Email, Arg37: Quantidade de vidas, Arg38: Convenio Massa , Arg39: Convenio Fixo
    Append To List  ${INTEGRACAOPOTPJ13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ13}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ13}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ13}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ13}  1
    Append To List  ${INTEGRACAOPOTPJ13}  ${NOME_CONVENIO}
    Append To List  ${INTEGRACAOPOTPJ13}  Convênio LEW    
    
    #Adicionando - Desconto e Acrescimo: Arg40: Tipo negociação, Arg41: Valor, Arg42: Tipo negociação, Arg43: Valor
    Append To List  ${INTEGRACAOPOTPJ13}  desconto
    Append To List  ${INTEGRACAOPOTPJ13}  10
    Append To List  ${INTEGRACAOPOTPJ13}  acrescimo
    Append To List  ${INTEGRACAOPOTPJ13}  20


    #Instanciar Variavel Cliente PF TR014
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPJ14}  Pessoa Jurídica (CNPJ)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ14}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGRACAOPOTPJ14}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}         Evaluate  random.randint(30, 50)
    Append To List  ${INTEGRACAOPOTPJ14}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ14}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ14}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPJ14}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGRACAOPOTPJ14}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGRACAOPOTPJ14}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ14}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPJ14}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ14}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ14}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ14}  ${nasc}
    Append To List  ${INTEGRACAOPOTPJ14}  Titular
    Append To List  ${INTEGRACAOPOTPJ14}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPJ14}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ14}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ14}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ14}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ14}  CURITIBA
    Append To List  ${INTEGRACAOPOTPJ14}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${INTEGRACAOPOTPJ14}  Residencial
    Append To List  ${INTEGRACAOPOTPJ14}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPJ14}  165
    Append To List  ${INTEGRACAOPOTPJ14}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPJ14}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ14}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPJ14}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGRACAOPOTPJ14}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, 
    #              Arg35: Data Nascimento Dependente, Arg36: Email, Arg37: Quantidade de vidas, Arg38: Convenio Masssa , Arg39: Convenio Fixo
    Append To List  ${INTEGRACAOPOTPJ14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ14}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ14}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ14}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ14}  1
    Append To List  ${INTEGRACAOPOTPJ14}  ${NOME_CONVENIO}
    Append To List  ${INTEGRACAOPOTPJ14}  Convênio LEW
    #Adicionando - Desconto e Acrescimo: Arg40: Tipo negociação, Arg41: Valor, Arg42: Tipo negociação, Arg43: Valor
    Append To List  ${INTEGRACAOPOTPJ14}  calcula
    Append To List  ${INTEGRACAOPOTPJ14}  150,00
    Append To List  ${INTEGRACAOPOTPJ14}  acrescimo
    Append To List  ${INTEGRACAOPOTPJ14}  20


    #Instanciar Variavel Cliente PF TR015
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPJ15}  Pessoa Jurídica (CNPJ)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ15}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGRACAOPOTPJ15}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}         Evaluate  random.randint(30, 50)
    Append To List  ${INTEGRACAOPOTPJ15}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ15}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ15}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPJ15}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGRACAOPOTPJ15}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGRACAOPOTPJ15}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ15}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPJ15}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ15}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ15}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ15}  ${nasc}
    Append To List  ${INTEGRACAOPOTPJ15}  Titular
    Append To List  ${INTEGRACAOPOTPJ15}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPJ15}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ15}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ15}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ15}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ15}  CURITIBA
    Append To List  ${INTEGRACAOPOTPJ15}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGRACAOPOTPJ15}  Residencial
    Append To List  ${INTEGRACAOPOTPJ15}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPJ15}  165
    Append To List  ${INTEGRACAOPOTPJ15}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPJ15}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ15}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPJ15}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGRACAOPOTPJ15}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas, Arg37: Convenio
    Append To List  ${INTEGRACAOPOTPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ15}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ15}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ15}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ15}  1
    Append To List  ${INTEGRACAOPOTPJ15}  Convênio LEW
    #Adicionando - Desconto e Acrescimo: Arg38: Tipo negociação, Arg39: Valor, Arg40: Tipo negociação, Arg41: Valor
    Append To List  ${INTEGRACAOPOTPJ15}  desconto
    Append To List  ${INTEGRACAOPOTPJ15}  10
    Append To List  ${INTEGRACAOPOTPJ15}  acrescimo
    Append To List  ${INTEGRACAOPOTPJ15}  20


    #Instanciar Variavel Cliente PF TR016
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPJ16}  Pessoa Jurídica (CNPJ)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ16}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGRACAOPOTPJ16}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}         Evaluate  random.randint(30, 50)
    Append To List  ${INTEGRACAOPOTPJ16}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ16}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ16}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPJ16}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGRACAOPOTPJ16}  5072 - COLETIVO EMPRESARIAL REGIONAL ENFERMARIA
    Append To List  ${INTEGRACAOPOTPJ16}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ16}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPJ16}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ16}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ16}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ16}  ${nasc}
    Append To List  ${INTEGRACAOPOTPJ16}  Titular
    Append To List  ${INTEGRACAOPOTPJ16}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPJ16}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ16}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ16}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ16}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ16}  CURITIBA
    Append To List  ${INTEGRACAOPOTPJ16}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${INTEGRACAOPOTPJ16}  Residencial
    Append To List  ${INTEGRACAOPOTPJ16}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPJ16}  165
    Append To List  ${INTEGRACAOPOTPJ16}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPJ16}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ16}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPJ16}  5073 - COLETIVO EMPRESARIAL REGIONAL APARTAMENTO
    Append To List  ${INTEGRACAOPOTPJ16}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, 
    #              Arg35: Data Nascimento Dependente, Arg36: Email, Arg37: Quantidade de vidas, Arg38: Convenio Massas , Arg39: Convenio Fixo
    Append To List  ${INTEGRACAOPOTPJ16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ16}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ16}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ16}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ16}  1
    Append To List  ${INTEGRACAOPOTPJ16}  ${NOME_CONVENIO}
    Append To List  ${INTEGRACAOPOTPJ16}  Convênio LEW
    #Adicionando - Desconto e Acrescimo: Arg40: Tipo negociação, Arg41: Valor, Arg42: Tipo negociação, Arg43: Valor
    Append To List  ${INTEGRACAOPOTPJ16}  desconto
    Append To List  ${INTEGRACAOPOTPJ16}  10
    Append To List  ${INTEGRACAOPOTPJ16}  acrescimo
    Append To List  ${INTEGRACAOPOTPJ16}  20


    #Instanciar Variavel Cliente PF TR017
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGRACAOPOTPJ17}  Pessoa Jurídica (CNPJ)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ17}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGRACAOPOTPJ17}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}         Evaluate  random.randint(30, 50)
    Append To List  ${INTEGRACAOPOTPJ17}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ17}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ17}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGRACAOPOTPJ17}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGRACAOPOTPJ17}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGRACAOPOTPJ17}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGRACAOPOTPJ17}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGRACAOPOTPJ17}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ17}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ17}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ17}  ${nasc}
    Append To List  ${INTEGRACAOPOTPJ17}  Titular
    Append To List  ${INTEGRACAOPOTPJ17}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGRACAOPOTPJ17}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ17}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ17}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ17}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ17}  CURITIBA
    Append To List  ${INTEGRACAOPOTPJ17}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGRACAOPOTPJ17}  Residencial
    Append To List  ${INTEGRACAOPOTPJ17}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGRACAOPOTPJ17}  165
    Append To List  ${INTEGRACAOPOTPJ17}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGRACAOPOTPJ17}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ17}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGRACAOPOTPJ17}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGRACAOPOTPJ17}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas, Arg37: Convenio
    Append To List  ${INTEGRACAOPOTPJ17}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGRACAOPOTPJ17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGRACAOPOTPJ17}  ${conta}
    Append To List  ${INTEGRACAOPOTPJ17}  Solteiro(a)
    Append To List  ${INTEGRACAOPOTPJ17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGRACAOPOTPJ17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGRACAOPOTPJ17}  ${temp}
    Append To List  ${INTEGRACAOPOTPJ17}  1
    Append To List  ${INTEGRACAOPOTPJ17}  Convênio LEW
    #Adicionando - Desconto e Acrescimo: Arg38: Tipo negociação, Arg39: Valor, Arg40: Tipo negociação, Arg41: Valor
    Append To List  ${INTEGRACAOPOTPJ17}  desconto
    Append To List  ${INTEGRACAOPOTPJ17}  10
    Append To List  ${INTEGRACAOPOTPJ17}  acrescimo
    Append To List  ${INTEGRACAOPOTPJ17}  20


    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${IMPORTBENEFINTEG01}  Pessoa Física
    ${temp}           FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTBENEFINTEG01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTBENEFINTEG01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(1, 28)
    Append To List  ${IMPORTBENEFINTEG01}  ${temp}
    Append To List  ${IMPORTBENEFINTEG01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${IMPORTBENEFINTEG01}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${IMPORTBENEFINTEG01}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${IMPORTBENEFINTEG01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${IMPORTBENEFINTEG01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${IMPORTBENEFINTEG01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${IMPORTBENEFINTEG01}  ${temp}
    Append To List  ${IMPORTBENEFINTEG01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTBENEFINTEG01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTBENEFINTEG01}  ${nasc}
    Append To List  ${IMPORTBENEFINTEG01}  Titular
    Append To List  ${IMPORTBENEFINTEG01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${IMPORTBENEFINTEG01}  ${temp}
    Append To List  ${IMPORTBENEFINTEG01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTBENEFINTEG01}  ${conta}
    Append To List  ${IMPORTBENEFINTEG01}  Solteiro(a)
    Append To List  ${IMPORTBENEFINTEG01}  CURITIBA
    Append To List  ${IMPORTBENEFINTEG01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${IMPORTBENEFINTEG01}  Residencial
    Append To List  ${IMPORTBENEFINTEG01}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${IMPORTBENEFINTEG01}  165
    Append To List  ${IMPORTBENEFINTEG01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${IMPORTBENEFINTEG01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTBENEFINTEG01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${IMPORTBENEFINTEG01}   ${GLOBAL_ASSISTENCIAL_PF}
    # Append To List  ${IMPORTBENEFINTEG01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${IMPORTBENEFINTEG01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${IMPORTBENEFINTEG01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTBENEFINTEG01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTBENEFINTEG01}  ${conta}
    Append To List  ${IMPORTBENEFINTEG01}  Solteiro(a)
    Append To List  ${IMPORTBENEFINTEG01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTBENEFINTEG01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTBENEFINTEG01}  ${temp}
    Append To List  ${IMPORTBENEFINTEG01}  2


    #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${IMPORTBENEFINTEG02}  Pessoa Jurídica (CNPJ)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTBENEFINTEG02}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${IMPORTBENEFINTEG02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}         Evaluate  random.randint(30, 50)
    Append To List  ${IMPORTBENEFINTEG02}  ${temp}
    Append To List  ${IMPORTBENEFINTEG02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${IMPORTBENEFINTEG02}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${IMPORTBENEFINTEG02}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${IMPORTBENEFINTEG02}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${IMPORTBENEFINTEG02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${IMPORTBENEFINTEG02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${IMPORTBENEFINTEG02}  ${temp}
    Append To List  ${IMPORTBENEFINTEG02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTBENEFINTEG02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTBENEFINTEG02}  ${nasc}
    Append To List  ${IMPORTBENEFINTEG02}  Titular
    Append To List  ${IMPORTBENEFINTEG02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${IMPORTBENEFINTEG02}  ${temp}
    Append To List  ${IMPORTBENEFINTEG02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTBENEFINTEG02}  ${conta}
    Append To List  ${IMPORTBENEFINTEG02}  Solteiro(a)
    Append To List  ${IMPORTBENEFINTEG02}  CURITIBA
    Append To List  ${IMPORTBENEFINTEG02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${IMPORTBENEFINTEG02}  Residencial
    Append To List  ${IMPORTBENEFINTEG02}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${IMPORTBENEFINTEG02}  165
    Append To List  ${IMPORTBENEFINTEG02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${IMPORTBENEFINTEG02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTBENEFINTEG02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${IMPORTBENEFINTEG02}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    # Append To List  ${IMPORTBENEFINTEG02}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${IMPORTBENEFINTEG02}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas, Arg37: Convenio
    Append To List  ${IMPORTBENEFINTEG02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTBENEFINTEG02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTBENEFINTEG02}  ${conta}
    Append To List  ${IMPORTBENEFINTEG02}  Solteiro(a)
    Append To List  ${IMPORTBENEFINTEG02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTBENEFINTEG02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTBENEFINTEG02}  ${temp}
    Append To List  ${IMPORTBENEFINTEG02}  1
    Append To List  ${IMPORTBENEFINTEG02}  Convênio LEW
    #Adicionando - Desconto e Acrescimo: Arg38: Tipo negociação, Arg39: Valor, Arg40: Tipo negociação, Arg41: Valor
    Append To List  ${IMPORTBENEFINTEG02}  desconto
    Append To List  ${IMPORTBENEFINTEG02}  10
    Append To List  ${IMPORTBENEFINTEG02}  acrescimo
    Append To List  ${IMPORTBENEFINTEG02}  20


    #Instanciar Variavel Cliente PJ TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${IMPORTBENEFINTEG03}  Pessoa Jurídica (CNPJ)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTBENEFINTEG03}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${IMPORTBENEFINTEG03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}         Evaluate  random.randint(30, 50)
    Append To List  ${IMPORTBENEFINTEG03}  ${temp}
    Append To List  ${IMPORTBENEFINTEG03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${IMPORTBENEFINTEG03}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${IMPORTBENEFINTEG03}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${IMPORTBENEFINTEG03}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${IMPORTBENEFINTEG03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${IMPORTBENEFINTEG03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${IMPORTBENEFINTEG03}  ${temp}
    Append To List  ${IMPORTBENEFINTEG03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTBENEFINTEG03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTBENEFINTEG03}  ${nasc}
    Append To List  ${IMPORTBENEFINTEG03}  Titular
    Append To List  ${IMPORTBENEFINTEG03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${IMPORTBENEFINTEG03}  ${temp}
    Append To List  ${IMPORTBENEFINTEG03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTBENEFINTEG03}  ${conta}
    Append To List  ${IMPORTBENEFINTEG03}  Solteiro(a)
    Append To List  ${IMPORTBENEFINTEG03}  CURITIBA
    Append To List  ${IMPORTBENEFINTEG03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${IMPORTBENEFINTEG03}  Residencial
    Append To List  ${IMPORTBENEFINTEG03}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${IMPORTBENEFINTEG03}  165
    Append To List  ${IMPORTBENEFINTEG03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${IMPORTBENEFINTEG03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTBENEFINTEG03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${IMPORTBENEFINTEG03}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    # Append To List  ${IMPORTBENEFINTEG03}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${IMPORTBENEFINTEG03}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas, Arg37: Convenio
    Append To List  ${IMPORTBENEFINTEG03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTBENEFINTEG03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTBENEFINTEG03}  ${conta}
    Append To List  ${IMPORTBENEFINTEG03}  Solteiro(a)
    Append To List  ${IMPORTBENEFINTEG03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTBENEFINTEG03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTBENEFINTEG03}  ${temp}
    Append To List  ${IMPORTBENEFINTEG03}  1
    Append To List  ${IMPORTBENEFINTEG03}  Convênio LEW
    #Adicionando - Desconto e Acrescimo: Arg38: Tipo negociação, Arg39: Valor, Arg40: Tipo negociação, Arg41: Valor
    Append To List  ${IMPORTBENEFINTEG03}  desconto
    Append To List  ${IMPORTBENEFINTEG03}  10
    Append To List  ${IMPORTBENEFINTEG03}  acrescimo
    Append To List  ${IMPORTBENEFINTEG03}  20


    #Instanciar Variavel Cliente CAEPF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${IMPORTBENEFINTEG04}  Pessoa Jurídica (CAEPF)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTBENEFINTEG04}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${IMPORTBENEFINTEG04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}         Evaluate  random.randint(30, 50)
    Append To List  ${IMPORTBENEFINTEG04}  ${temp}
    Append To List  ${IMPORTBENEFINTEG04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${IMPORTBENEFINTEG04}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${IMPORTBENEFINTEG04}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${IMPORTBENEFINTEG04}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${IMPORTBENEFINTEG04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${IMPORTBENEFINTEG04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${IMPORTBENEFINTEG04}  ${temp}
    Append To List  ${IMPORTBENEFINTEG04}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTBENEFINTEG04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTBENEFINTEG04}  ${nasc}
    Append To List  ${IMPORTBENEFINTEG04}  Titular
    Append To List  ${IMPORTBENEFINTEG04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${IMPORTBENEFINTEG04}  ${temp}
    Append To List  ${IMPORTBENEFINTEG04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTBENEFINTEG04}  ${conta}
    Append To List  ${IMPORTBENEFINTEG04}  Solteiro(a)
    Append To List  ${IMPORTBENEFINTEG04}  CURITIBA
    Append To List  ${IMPORTBENEFINTEG04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${IMPORTBENEFINTEG04}  Residencial
    Append To List  ${IMPORTBENEFINTEG04}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${IMPORTBENEFINTEG04}  165
    Append To List  ${IMPORTBENEFINTEG04}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${IMPORTBENEFINTEG04}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTBENEFINTEG04}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${IMPORTBENEFINTEG04}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    # Append To List  ${IMPORTBENEFINTEG04}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${IMPORTBENEFINTEG04}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas, Arg37: Convenio
    Append To List  ${IMPORTBENEFINTEG04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTBENEFINTEG04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTBENEFINTEG04}  ${conta}
    Append To List  ${IMPORTBENEFINTEG04}  Solteiro(a)
    Append To List  ${IMPORTBENEFINTEG04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTBENEFINTEG04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTBENEFINTEG04}  ${temp}
    Append To List  ${IMPORTBENEFINTEG04}  1
    Append To List  ${IMPORTBENEFINTEG04}  Convênio LEW
    #Adicionando - Desconto e Acrescimo: Arg38: Tipo negociação, Arg39: Valor, Arg40: Tipo negociação, Arg41: Valor
    Append To List  ${IMPORTBENEFINTEG04}  desconto
    Append To List  ${IMPORTBENEFINTEG04}  10
    Append To List  ${IMPORTBENEFINTEG04}  acrescimo
    Append To List  ${IMPORTBENEFINTEG04}  20


    #Instanciar Variavel Cliente CAEPF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${IMPORTBENEFINTEG05}  Pessoa Jurídica (CAEPF)
    ${name}         FakerLibrary.First Name
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  ${name}  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTBENEFINTEG05}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${IMPORTBENEFINTEG05}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}         Evaluate  random.randint(30, 50)
    Append To List  ${IMPORTBENEFINTEG05}  ${temp}
    Append To List  ${IMPORTBENEFINTEG05}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${IMPORTBENEFINTEG05}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${IMPORTBENEFINTEG05}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    Append To List  ${IMPORTBENEFINTEG05}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${IMPORTBENEFINTEG05}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${IMPORTBENEFINTEG05}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${IMPORTBENEFINTEG05}  ${temp}
    Append To List  ${IMPORTBENEFINTEG05}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTBENEFINTEG05}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTBENEFINTEG05}  ${nasc}
    Append To List  ${IMPORTBENEFINTEG05}  Titular
    Append To List  ${IMPORTBENEFINTEG05}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${IMPORTBENEFINTEG05}  ${temp}
    Append To List  ${IMPORTBENEFINTEG05}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTBENEFINTEG05}  ${conta}
    Append To List  ${IMPORTBENEFINTEG05}  Solteiro(a)
    Append To List  ${IMPORTBENEFINTEG05}  CURITIBA
    Append To List  ${IMPORTBENEFINTEG05}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${IMPORTBENEFINTEG05}  Residencial
    Append To List  ${IMPORTBENEFINTEG05}  80540000
    # ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${IMPORTBENEFINTEG05}  165
    Append To List  ${IMPORTBENEFINTEG05}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${IMPORTBENEFINTEG05}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTBENEFINTEG05}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${IMPORTBENEFINTEG05}  ${GLOBAL_ASSISTENCIAL_ADESAO}
    # Append To List  ${IMPORTBENEFINTEG05}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${IMPORTBENEFINTEG05}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas, Arg37: Convenio
    Append To List  ${IMPORTBENEFINTEG05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${IMPORTBENEFINTEG05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${IMPORTBENEFINTEG05}  ${conta}
    Append To List  ${IMPORTBENEFINTEG05}  Solteiro(a)
    Append To List  ${IMPORTBENEFINTEG05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${IMPORTBENEFINTEG05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${IMPORTBENEFINTEG05}  ${temp}
    Append To List  ${IMPORTBENEFINTEG05}  1
    Append To List  ${IMPORTBENEFINTEG05}  Convênio LEW
    #Adicionando - Desconto e Acrescimo: Arg38: Tipo negociação, Arg39: Valor, Arg40: Tipo negociação, Arg41: Valor
    Append To List  ${IMPORTBENEFINTEG05}  desconto
    Append To List  ${IMPORTBENEFINTEG05}  10
    Append To List  ${IMPORTBENEFINTEG05}  acrescimo
    Append To List  ${IMPORTBENEFINTEG05}  20