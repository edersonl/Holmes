*** Settings ***

Resource    ../../../main.resource

*** Variables ***
@{INTEGMOVEXCPF01}
@{INTEGMOVEXCPF02}
@{INTEGMOVEXCPF03}
@{INTEGMOVEXCPF04}
@{INTEGMOVEXCPF05}
@{INTEGMOVEXCPJ06}
@{INTEGMOVEXCPJ07}
@{INTEGMOVEXCPJ08}
@{INTEGMOVEXCPJ09}
@{INTEGMOVEXCPJ10}
@{INTEGMOVEXCPJ11}
@{INTEGMOVEXCPJ12}
@{INTEGMOVEXCPJ13}
@{INTEGMOVEXCPJ14}
@{INTEGMOVEXCPJ15}
@{INTEGMOVEXCPJ16}
@{INTEGMOVEXCPJ17}
@{INTEGMOVEXCCAEPF18}
@{INTEGMOVEXCCAEPF19}
@{INTEGMOVEXCCAEPF20}
@{INTEGMOVEXCCAEPF21}
@{INTEGMOVEXCCAEPF22}
@{INTEGMOVEXCCAEPF23}


*** Keywords ***
Instanciar Variaveis IntegMovExclusaoCRM    
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPF01}  Cliente (PF)
    ${temp}           FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(1, 28)
    Append To List  ${INTEGMOVEXCPF01}  ${temp}
    Append To List  ${INTEGMOVEXCPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPF01}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGMOVEXCPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVEXCPF01}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPF01}  ${temp}
    Append To List  ${INTEGMOVEXCPF01}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPF01}  ${nasc}
    Append To List  ${INTEGMOVEXCPF01}  Titular
    Append To List  ${INTEGMOVEXCPF01}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPF01}  ${temp}
    Append To List  ${INTEGMOVEXCPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPF01}  ${conta}
    Append To List  ${INTEGMOVEXCPF01}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPF01}  CURITIBA
    Append To List  ${INTEGMOVEXCPF01}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${INTEGMOVEXCPF01}  Residencial
    Append To List  ${INTEGMOVEXCPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPF01}  ${temp}
    Append To List  ${INTEGMOVEXCPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPF01}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVEXCPF01}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, 
    #              Arg35: Data Nascimento Dependente, Arg36: Email, Arg37: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPF01}  ${conta}
    Append To List  ${INTEGMOVEXCPF01}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPF01}  ${temp}
    Append To List  ${INTEGMOVEXCPF01}  2


    #Instanciar Variavel Cliente PF TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPF02}  Cliente (PF)
    ${temp}           FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPF02}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPF02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(1, 28)
    Append To List  ${INTEGMOVEXCPF02}  ${temp}
    Append To List  ${INTEGMOVEXCPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPF02}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPF02}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGMOVEXCPF02}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVEXCPF02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPF02}  ${temp}
    Append To List  ${INTEGMOVEXCPF02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPF02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPF02}  ${nasc}
    Append To List  ${INTEGMOVEXCPF02}  Titular
    Append To List  ${INTEGMOVEXCPF02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPF02}  ${temp}
    Append To List  ${INTEGMOVEXCPF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPF02}  ${conta}
    Append To List  ${INTEGMOVEXCPF02}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPF02}  CURITIBA
    Append To List  ${INTEGMOVEXCPF02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCPF02}  Residencial
    Append To List  ${INTEGMOVEXCPF02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPF02}  ${temp}
    Append To List  ${INTEGMOVEXCPF02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPF02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPF02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPF02}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVEXCPF02}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPF02}  ${conta}
    Append To List  ${INTEGMOVEXCPF02}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPF02}  ${temp}
    Append To List  ${INTEGMOVEXCPF02}  2


    #Instanciar Variavel Cliente PF TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPF03}  Cliente (PF)
    ${temp}           FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPF03}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPF03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(1, 28)
    Append To List  ${INTEGMOVEXCPF03}  ${temp}
    Append To List  ${INTEGMOVEXCPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPF03}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPF03}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGMOVEXCPF03}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVEXCPF03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPF03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPF03}  ${temp}
    Append To List  ${INTEGMOVEXCPF03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPF03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPF03}  ${nasc}
    Append To List  ${INTEGMOVEXCPF03}  Titular
    Append To List  ${INTEGMOVEXCPF03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPF03}  ${temp}
    Append To List  ${INTEGMOVEXCPF03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPF03}  ${conta}
    Append To List  ${INTEGMOVEXCPF03}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPF03}  CURITIBA
    Append To List  ${INTEGMOVEXCPF03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCPF03}  Residencial
    Append To List  ${INTEGMOVEXCPF03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPF03}  ${temp}
    Append To List  ${INTEGMOVEXCPF03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPF03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPF03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPF03}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVEXCPF03}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPF03}  ${conta}
    Append To List  ${INTEGMOVEXCPF03}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPF03}  ${temp}
    Append To List  ${INTEGMOVEXCPF03}  2


    #Instanciar Variavel Cliente PF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPF04}  Cliente (PF)
    ${temp}           FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPF04}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPF04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(1, 28)
    Append To List  ${INTEGMOVEXCPF04}  ${temp}
    Append To List  ${INTEGMOVEXCPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPF04}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPF04}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGMOVEXCPF04}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVEXCPF04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPF04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPF04}  ${temp}
    Append To List  ${INTEGMOVEXCPF04}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPF04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPF04}  ${nasc}
    Append To List  ${INTEGMOVEXCPF04}  Titular
    Append To List  ${INTEGMOVEXCPF04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPF04}  ${temp}
    Append To List  ${INTEGMOVEXCPF04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPF04}  ${conta}
    Append To List  ${INTEGMOVEXCPF04}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPF04}  CURITIBA
    Append To List  ${INTEGMOVEXCPF04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCPF04}  Residencial
    Append To List  ${INTEGMOVEXCPF04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPF04}  ${temp}
    Append To List  ${INTEGMOVEXCPF04}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPF04}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPF04}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPF04}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVEXCPF04}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPF04}  ${conta}
    Append To List  ${INTEGMOVEXCPF04}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPF04}  ${temp}
    Append To List  ${INTEGMOVEXCPF04}  2


    #Instanciar Variavel Cliente PF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPF05}  Cliente (PF)
    ${temp}           FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPF05}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPF05}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(1, 28)
    Append To List  ${INTEGMOVEXCPF05}  ${temp}
    Append To List  ${INTEGMOVEXCPF05}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPF05}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPF05}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${INTEGMOVEXCPF05}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVEXCPF05}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPF05}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPF05}  ${temp}
    Append To List  ${INTEGMOVEXCPF05}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPF05}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPF05}  ${nasc}
    Append To List  ${INTEGMOVEXCPF05}  Titular
    Append To List  ${INTEGMOVEXCPF05}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPF05}  ${temp}
    Append To List  ${INTEGMOVEXCPF05}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPF05}  ${conta}
    Append To List  ${INTEGMOVEXCPF05}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPF05}  CURITIBA
    Append To List  ${INTEGMOVEXCPF05}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCPF05}  Residencial
    Append To List  ${INTEGMOVEXCPF05}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPF05}  ${temp}
    Append To List  ${INTEGMOVEXCPF05}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPF05}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPF05}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPF05}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${INTEGMOVEXCPF05}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPF05}  ${conta}
    Append To List  ${INTEGMOVEXCPF05}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPF05}  ${temp}
    Append To List  ${INTEGMOVEXCPF05}  2


    #Instanciar Variavel Cliente PJ TR006
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPJ06}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ06}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVEXCPJ06}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(1, 28)
    Append To List  ${INTEGMOVEXCPJ06}  ${temp}
    Append To List  ${INTEGMOVEXCPJ06}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ06}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPJ06}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCPJ06}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCPJ06}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ06}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPJ06}  ${temp}
    Append To List  ${INTEGMOVEXCPJ06}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ06}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ06}  ${nasc}
    Append To List  ${INTEGMOVEXCPJ06}  Titular
    Append To List  ${INTEGMOVEXCPJ06}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ06}  ${temp}
    Append To List  ${INTEGMOVEXCPJ06}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ06}  ${conta}
    Append To List  ${INTEGMOVEXCPJ06}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ06}  CURITIBA
    Append To List  ${INTEGMOVEXCPJ06}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCPJ06}  Residencial
    Append To List  ${INTEGMOVEXCPJ06}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPJ06}  ${temp}
    Append To List  ${INTEGMOVEXCPJ06}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPJ06}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ06}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPJ06}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCPJ06}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPJ06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ06}  ${conta}
    Append To List  ${INTEGMOVEXCPJ06}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ06}  ${temp}
    Append To List  ${INTEGMOVEXCPJ06}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCPJ06}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ06}  ${conta}
    Append To List  ${INTEGMOVEXCPJ06}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCPJ06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ06}  ${conta}
    Append To List  ${INTEGMOVEXCPJ06}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ06}  ${temp}


    #Instanciar Variavel Cliente PJ TR007
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPJ07}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    Append To List  ${INTEGMOVEXCPJ07}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ07}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPJ07}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCPJ07}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCPJ07}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ07}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    Append To List  ${INTEGMOVEXCPJ07}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ07}  ${nasc}
    Append To List  ${INTEGMOVEXCPJ07}  Titular
    Append To List  ${INTEGMOVEXCPJ07}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    Append To List  ${INTEGMOVEXCPJ07}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ07}  CURITIBA
    Append To List  ${INTEGMOVEXCPJ07}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${INTEGMOVEXCPJ07}  Residencial
    Append To List  ${INTEGMOVEXCPJ07}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    Append To List  ${INTEGMOVEXCPJ07}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPJ07}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCPJ07}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, 
    #              Arg35: Data Nascimento Dependente, Arg36: Email, Arg37: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    Append To List  ${INTEGMOVEXCPJ07}  4
    #Adicionando Titular - Pessoa: Arg38: Tipo, Arg39: cpf, Arg40: Nome Beneficiario, Arg41: Estado Civil, Arg42: Grau Dependencia, 
    #              Arg43: Data Nascimento Dependente, Arg44: Email, Arg45: CNS
    Append To List  ${INTEGMOVEXCPJ07}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    #Adicionando Dependente - Pessoa: Arg46: Tipo, Arg47: cpf, Arg48: Nome Beneficiario, Arg49: Estado Civil, Arg50: Grau Dependencia, 
    #              Arg51: Data Nascimento Dependente, Arg52: Email, Arg53: CNS
    Append To List  ${INTEGMOVEXCPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    #Adicionando Titular - Pessoa: Arg54: Tipo, Arg55: cpf, Arg56: Nome Beneficiario, Arg57: Estado Civil, Arg58: Grau Dependencia, 
    #              Arg59: Data Nascimento Dependente, Arg60: Email, Arg61: CNS
    Append To List  ${INTEGMOVEXCPJ07}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    #Adicionando Dependente - Pessoa: Arg62: Tipo, Arg63: cpf, Arg64: Nome Beneficiario, Arg65: Estado Civil, Arg66: Grau Dependencia, 
    #              Arg67: Data Nascimento Dependente, Arg68: Email, Arg69: CNS
    Append To List  ${INTEGMOVEXCPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    #Adicionando Titular - Pessoa: Arg70: Tipo, Arg71: cpf, Arg72: Nome Beneficiario, Arg73: Estado Civil, Arg74: Grau Dependencia, 
    #              Arg75: Data Nascimento Dependente, Arg76: Email, Arg77: CNS
    Append To List  ${INTEGMOVEXCPJ07}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    #Adicionando Dependente - Pessoa: Arg78: Tipo, Arg79: cpf, Arg80: Nome Beneficiario, Arg81: Estado Civil, Arg82: Grau Dependencia, 
    #              Arg83: Data Nascimento Dependente, Arg84: Email, Arg85: CNS
    Append To List  ${INTEGMOVEXCPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    #Adicionando Titular - Pessoa: Arg86: Tipo, Arg87: cpf, Arg88: Nome Beneficiario, Arg89: Estado Civil, Arg90: Grau Dependencia, 
    #              Arg91: Data Nascimento Dependente, Arg92: Email, Arg93: CNS
    Append To List  ${INTEGMOVEXCPJ07}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    #Adicionando Dependente - Pessoa: Arg94: Tipo, Arg95: cpf, Arg96: Nome Beneficiario, Arg97: Estado Civil, Arg98: Grau Dependencia, 
    #              Arg99: Data Nascimento Dependente, Arg100: Email, Arg101: CNS
    Append To List  ${INTEGMOVEXCPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    #Adicionando Titular - Pessoa: Arg102: Tipo, Arg103: cpf, Arg104: Nome Beneficiario, Arg105: Estado Civil, Arg106: Grau Dependencia, 
    #              Arg107: Data Nascimento Dependente, Arg108: Email, Arg109: CNS
    Append To List  ${INTEGMOVEXCPJ07}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    #Adicionando Dependente - Pessoa: Arg110: Tipo, Arg111: cpf, Arg112: Nome Beneficiario, Arg113: Estado Civil, Arg114: Grau Dependencia, 
    #              Arg115: Data Nascimento Dependente, Arg116: Email, Arg117: CNS
    Append To List  ${INTEGMOVEXCPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  ${conta}
    Append To List  ${INTEGMOVEXCPJ07}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ07}  ${temp}


    #Instanciar Variavel Cliente PJ TR008
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPJ08}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ08}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    Append To List  ${INTEGMOVEXCPJ08}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ08}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPJ08}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCPJ08}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCPJ08}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ08}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    Append To List  ${INTEGMOVEXCPJ08}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ08}  ${nasc}
    Append To List  ${INTEGMOVEXCPJ08}  Titular
    Append To List  ${INTEGMOVEXCPJ08}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    Append To List  ${INTEGMOVEXCPJ08}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ08}  ${conta}
    Append To List  ${INTEGMOVEXCPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ08}  CURITIBA
    Append To List  ${INTEGMOVEXCPJ08}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${INTEGMOVEXCPJ08}  Residencial
    Append To List  ${INTEGMOVEXCPJ08}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    Append To List  ${INTEGMOVEXCPJ08}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPJ08}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCPJ08}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: cpf, Arg32: Nome Beneficiario, Arg33: Estado Civil, Arg34: Grau Dependencia, 
    #              Arg35: Data Nascimento Dependente, Arg36: Email, Arg37: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ08}  ${conta}
    Append To List  ${INTEGMOVEXCPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    Append To List  ${INTEGMOVEXCPJ08}  4
    #Adicionando Titular - Pessoa: Arg38: Tipo, Arg39: cpf, Arg40: Nome Beneficiario, Arg41: Estado Civil, Arg42: Grau Dependencia, 
    #              Arg43: Data Nascimento Dependente, Arg44: Email, Arg45: CNS
    Append To List  ${INTEGMOVEXCPJ08}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ08}  ${conta}
    Append To List  ${INTEGMOVEXCPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    #Adicionando Dependente - Pessoa: Arg46: Tipo, Arg47: cpf, Arg48: Nome Beneficiario, Arg49: Estado Civil, Arg50: Grau Dependencia, 
    #              Arg51: Data Nascimento Dependente, Arg52: Email, Arg53: CNS
    Append To List  ${INTEGMOVEXCPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ08}  ${conta}
    Append To List  ${INTEGMOVEXCPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    #Adicionando Titular - Pessoa: Arg54: Tipo, Arg55: cpf, Arg56: Nome Beneficiario, Arg57: Estado Civil, Arg58: Grau Dependencia, 
    #              Arg59: Data Nascimento Dependente, Arg60: Email, Arg61: CNS
    Append To List  ${INTEGMOVEXCPJ08}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ08}  ${conta}
    Append To List  ${INTEGMOVEXCPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    #Adicionando Dependente - Pessoa: Arg62: Tipo, Arg63: cpf, Arg64: Nome Beneficiario, Arg65: Estado Civil, Arg66: Grau Dependencia, 
    #              Arg67: Data Nascimento Dependente, Arg68: Email, Arg69: CNS
    Append To List  ${INTEGMOVEXCPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ08}  ${conta}
    Append To List  ${INTEGMOVEXCPJ08}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ08}  ${temp}


    #Instanciar Variavel Cliente PJ TR009
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPJ09}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ09}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    Append To List  ${INTEGMOVEXCPJ09}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ09}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPJ09}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCPJ09}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCPJ09}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ09}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    Append To List  ${INTEGMOVEXCPJ09}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ09}  ${nasc}
    Append To List  ${INTEGMOVEXCPJ09}  Titular
    Append To List  ${INTEGMOVEXCPJ09}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    Append To List  ${INTEGMOVEXCPJ09}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ09}  ${conta}
    Append To List  ${INTEGMOVEXCPJ09}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ09}  CURITIBA
    Append To List  ${INTEGMOVEXCPJ09}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCPJ09}  Residencial
    Append To List  ${INTEGMOVEXCPJ09}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    Append To List  ${INTEGMOVEXCPJ09}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPJ09}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCPJ09}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPJ09}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ09}  ${conta}
    Append To List  ${INTEGMOVEXCPJ09}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    Append To List  ${INTEGMOVEXCPJ09}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCPJ09}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ09}  ${conta}
    Append To List  ${INTEGMOVEXCPJ09}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCPJ09}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ09}  ${conta}
    Append To List  ${INTEGMOVEXCPJ09}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCPJ09}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ09}  ${conta}
    Append To List  ${INTEGMOVEXCPJ09}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCPJ09}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ09}  ${conta}
    Append To List  ${INTEGMOVEXCPJ09}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ09}  ${temp}


    #Instanciar Variavel Cliente PJ TR010
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPJ10}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ10}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    Append To List  ${INTEGMOVEXCPJ10}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ10}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPJ10}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCPJ10}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCPJ10}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ10}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    Append To List  ${INTEGMOVEXCPJ10}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ10}  ${nasc}
    Append To List  ${INTEGMOVEXCPJ10}  Titular
    Append To List  ${INTEGMOVEXCPJ10}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    Append To List  ${INTEGMOVEXCPJ10}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ10}  ${conta}
    Append To List  ${INTEGMOVEXCPJ10}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ10}  CURITIBA
    Append To List  ${INTEGMOVEXCPJ10}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCPJ10}  Residencial
    Append To List  ${INTEGMOVEXCPJ10}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    Append To List  ${INTEGMOVEXCPJ10}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPJ10}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCPJ10}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPJ10}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ10}  ${conta}
    Append To List  ${INTEGMOVEXCPJ10}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ10}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    Append To List  ${INTEGMOVEXCPJ10}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCPJ10}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ10}  ${conta}
    Append To List  ${INTEGMOVEXCPJ10}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ10}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCPJ10}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ10}  ${conta}
    Append To List  ${INTEGMOVEXCPJ10}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ10}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCPJ10}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ10}  ${conta}
    Append To List  ${INTEGMOVEXCPJ10}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ10}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCPJ10}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ10}  ${conta}
    Append To List  ${INTEGMOVEXCPJ10}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ10}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ10}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ10}  ${temp}


    #Instanciar Variavel Cliente PJ TR011
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPJ11}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ11}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    Append To List  ${INTEGMOVEXCPJ11}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ11}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPJ11}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCPJ11}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCPJ11}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ11}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    Append To List  ${INTEGMOVEXCPJ11}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ11}  ${nasc}
    Append To List  ${INTEGMOVEXCPJ11}  Titular
    Append To List  ${INTEGMOVEXCPJ11}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    Append To List  ${INTEGMOVEXCPJ11}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ11}  ${conta}
    Append To List  ${INTEGMOVEXCPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ11}  CURITIBA
    Append To List  ${INTEGMOVEXCPJ11}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCPJ11}  Residencial
    Append To List  ${INTEGMOVEXCPJ11}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    Append To List  ${INTEGMOVEXCPJ11}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPJ11}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCPJ11}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPJ11}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ11}  ${conta}
    Append To List  ${INTEGMOVEXCPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ11}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ11}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    Append To List  ${INTEGMOVEXCPJ11}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCPJ11}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ11}  ${conta}
    Append To List  ${INTEGMOVEXCPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ11}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ11}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCPJ11}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ11}  ${conta}
    Append To List  ${INTEGMOVEXCPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ11}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ11}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCPJ11}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ11}  ${conta}
    Append To List  ${INTEGMOVEXCPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ11}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ11}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCPJ11}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ11}  ${conta}
    Append To List  ${INTEGMOVEXCPJ11}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ11}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ11}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ11}  ${temp}


    #Instanciar Variavel Cliente PJ TR012
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPJ12}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ12}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    Append To List  ${INTEGMOVEXCPJ12}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ12}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPJ12}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCPJ12}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCPJ12}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ12}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    Append To List  ${INTEGMOVEXCPJ12}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ12}  ${nasc}
    Append To List  ${INTEGMOVEXCPJ12}  Titular
    Append To List  ${INTEGMOVEXCPJ12}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    Append To List  ${INTEGMOVEXCPJ12}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ12}  ${conta}
    Append To List  ${INTEGMOVEXCPJ12}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ12}  CURITIBA
    Append To List  ${INTEGMOVEXCPJ12}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCPJ12}  Residencial
    Append To List  ${INTEGMOVEXCPJ12}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    Append To List  ${INTEGMOVEXCPJ12}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPJ12}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCPJ12}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPJ12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ12}  ${conta}
    Append To List  ${INTEGMOVEXCPJ12}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    Append To List  ${INTEGMOVEXCPJ12}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCPJ12}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ12}  ${conta}
    Append To List  ${INTEGMOVEXCPJ12}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCPJ12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ12}  ${conta}
    Append To List  ${INTEGMOVEXCPJ12}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCPJ12}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ12}  ${conta}
    Append To List  ${INTEGMOVEXCPJ12}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCPJ12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ12}  ${conta}
    Append To List  ${INTEGMOVEXCPJ12}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ12}  ${temp}


    #Instanciar Variavel Cliente PJ TR013
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPJ13}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ13}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    Append To List  ${INTEGMOVEXCPJ13}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ13}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPJ13}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCPJ13}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCPJ13}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ13}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    Append To List  ${INTEGMOVEXCPJ13}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ13}  ${nasc}
    Append To List  ${INTEGMOVEXCPJ13}  Titular
    Append To List  ${INTEGMOVEXCPJ13}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    Append To List  ${INTEGMOVEXCPJ13}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ13}  ${conta}
    Append To List  ${INTEGMOVEXCPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ13}  CURITIBA
    Append To List  ${INTEGMOVEXCPJ13}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCPJ13}  Residencial
    Append To List  ${INTEGMOVEXCPJ13}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    Append To List  ${INTEGMOVEXCPJ13}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPJ13}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCPJ13}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPJ13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ13}  ${conta}
    Append To List  ${INTEGMOVEXCPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    Append To List  ${INTEGMOVEXCPJ13}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCPJ13}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ13}  ${conta}
    Append To List  ${INTEGMOVEXCPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCPJ13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ13}  ${conta}
    Append To List  ${INTEGMOVEXCPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCPJ13}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ13}  ${conta}
    Append To List  ${INTEGMOVEXCPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCPJ13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ13}  ${conta}
    Append To List  ${INTEGMOVEXCPJ13}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ13}  ${temp}


    #Instanciar Variavel Cliente PJ TR014
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPJ14}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    Append To List  ${INTEGMOVEXCPJ14}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ14}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPJ14}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCPJ14}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCPJ14}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ14}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    Append To List  ${INTEGMOVEXCPJ14}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ14}  ${nasc}
    Append To List  ${INTEGMOVEXCPJ14}  Titular
    Append To List  ${INTEGMOVEXCPJ14}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    Append To List  ${INTEGMOVEXCPJ14}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ14}  CURITIBA
    Append To List  ${INTEGMOVEXCPJ14}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCPJ14}  Residencial
    Append To List  ${INTEGMOVEXCPJ14}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    Append To List  ${INTEGMOVEXCPJ14}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPJ14}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCPJ14}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPJ14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    Append To List  ${INTEGMOVEXCPJ14}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCPJ14}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCPJ14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCPJ14}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCPJ14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${INTEGMOVEXCPJ14}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${INTEGMOVEXCPJ14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  ${conta}
    Append To List  ${INTEGMOVEXCPJ14}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ14}  ${temp}


    #Instanciar Variavel Cliente PJ TR015
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPJ15}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ15}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    Append To List  ${INTEGMOVEXCPJ15}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ15}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPJ15}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCPJ15}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCPJ15}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ15}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    Append To List  ${INTEGMOVEXCPJ15}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ15}  ${nasc}
    Append To List  ${INTEGMOVEXCPJ15}  Titular
    Append To List  ${INTEGMOVEXCPJ15}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    Append To List  ${INTEGMOVEXCPJ15}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ15}  ${conta}
    Append To List  ${INTEGMOVEXCPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ15}  CURITIBA
    Append To List  ${INTEGMOVEXCPJ15}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCPJ15}  Residencial
    Append To List  ${INTEGMOVEXCPJ15}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    Append To List  ${INTEGMOVEXCPJ15}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPJ15}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCPJ15}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ15}  ${conta}
    Append To List  ${INTEGMOVEXCPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    Append To List  ${INTEGMOVEXCPJ15}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCPJ15}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ15}  ${conta}
    Append To List  ${INTEGMOVEXCPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ15}  ${conta}
    Append To List  ${INTEGMOVEXCPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCPJ15}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ15}  ${conta}
    Append To List  ${INTEGMOVEXCPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ15}  ${conta}
    Append To List  ${INTEGMOVEXCPJ15}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ15}  ${temp}


    #Instanciar Variavel Cliente PJ TR016
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPJ16}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ16}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    Append To List  ${INTEGMOVEXCPJ16}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ16}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPJ16}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCPJ16}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCPJ16}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ16}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    Append To List  ${INTEGMOVEXCPJ16}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ16}  ${nasc}
    Append To List  ${INTEGMOVEXCPJ16}  Titular
    Append To List  ${INTEGMOVEXCPJ16}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    Append To List  ${INTEGMOVEXCPJ16}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ16}  ${conta}
    Append To List  ${INTEGMOVEXCPJ16}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ16}  CURITIBA
    Append To List  ${INTEGMOVEXCPJ16}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCPJ16}  Residencial
    Append To List  ${INTEGMOVEXCPJ16}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    Append To List  ${INTEGMOVEXCPJ16}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPJ16}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCPJ16}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPJ16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ16}  ${conta}
    Append To List  ${INTEGMOVEXCPJ16}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    Append To List  ${INTEGMOVEXCPJ16}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCPJ16}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ16}  ${conta}
    Append To List  ${INTEGMOVEXCPJ16}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCPJ16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ16}  ${conta}
    Append To List  ${INTEGMOVEXCPJ16}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCPJ16}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ16}  ${conta}
    Append To List  ${INTEGMOVEXCPJ16}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCPJ16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ16}  ${conta}
    Append To List  ${INTEGMOVEXCPJ16}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ16}  ${temp}


    #Instanciar Variavel Cliente PJ TR017
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCPJ17}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ17}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    Append To List  ${INTEGMOVEXCPJ17}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ17}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCPJ17}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCPJ17}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCPJ17}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCPJ17}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    Append To List  ${INTEGMOVEXCPJ17}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ17}  ${nasc}
    Append To List  ${INTEGMOVEXCPJ17}  Titular
    Append To List  ${INTEGMOVEXCPJ17}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    Append To List  ${INTEGMOVEXCPJ17}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ17}  ${conta}
    Append To List  ${INTEGMOVEXCPJ17}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ17}  CURITIBA
    Append To List  ${INTEGMOVEXCPJ17}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCPJ17}  Residencial
    Append To List  ${INTEGMOVEXCPJ17}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    Append To List  ${INTEGMOVEXCPJ17}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCPJ17}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCPJ17}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCPJ17}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ17}  ${conta}
    Append To List  ${INTEGMOVEXCPJ17}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    Append To List  ${INTEGMOVEXCPJ17}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCPJ17}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ17}  ${conta}
    Append To List  ${INTEGMOVEXCPJ17}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCPJ17}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ17}  ${conta}
    Append To List  ${INTEGMOVEXCPJ17}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCPJ17}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ17}  ${conta}
    Append To List  ${INTEGMOVEXCPJ17}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCPJ17}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCPJ17}  ${conta}
    Append To List  ${INTEGMOVEXCPJ17}  Solteiro(a)
    Append To List  ${INTEGMOVEXCPJ17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCPJ17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCPJ17}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR018
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCCAEPF18}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF18}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF18}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCCAEPF18}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCCAEPF18}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCCAEPF18}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCCAEPF18}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCCAEPF18}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF18}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF18}  ${nasc}
    Append To List  ${INTEGMOVEXCCAEPF18}  Titular
    Append To List  ${INTEGMOVEXCCAEPF18}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF18}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF18}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF18}  CURITIBA
    Append To List  ${INTEGMOVEXCCAEPF18}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCCAEPF18}  Residencial
    Append To List  ${INTEGMOVEXCCAEPF18}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF18}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCCAEPF18}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCCAEPF18}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCCAEPF18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF18}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF18}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF18}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCCAEPF18}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF18}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF18}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCCAEPF18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF18}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF18}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCCAEPF18}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF18}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF18}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCCAEPF18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF18}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF18}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF18}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF18}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR019
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCCAEPF19}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF19}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF19}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCCAEPF19}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCCAEPF19}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCCAEPF19}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCCAEPF19}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCCAEPF19}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF19}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF19}  ${nasc}
    Append To List  ${INTEGMOVEXCCAEPF19}  Titular
    Append To List  ${INTEGMOVEXCCAEPF19}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF19}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF19}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF19}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF19}  CURITIBA
    Append To List  ${INTEGMOVEXCCAEPF19}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCCAEPF19}  Residencial
    Append To List  ${INTEGMOVEXCCAEPF19}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF19}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCCAEPF19}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCCAEPF19}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCCAEPF19}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF19}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF19}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF19}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF19}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF19}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCCAEPF19}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF19}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF19}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF19}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF19}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCCAEPF19}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF19}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF19}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF19}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF19}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCCAEPF19}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF19}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF19}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF19}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF19}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCCAEPF19}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF19}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF19}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF19}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF19}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF19}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR020
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCCAEPF20}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF20}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF20}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCCAEPF20}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCCAEPF20}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCCAEPF20}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCCAEPF20}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCCAEPF20}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF20}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF20}  ${nasc}
    Append To List  ${INTEGMOVEXCCAEPF20}  Titular
    Append To List  ${INTEGMOVEXCCAEPF20}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF20}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF20}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF20}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF20}  CURITIBA
    Append To List  ${INTEGMOVEXCCAEPF20}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCCAEPF20}  Residencial
    Append To List  ${INTEGMOVEXCCAEPF20}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF20}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCCAEPF20}  5${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCCAEPF20}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCCAEPF20}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF20}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF20}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF20}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF20}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF20}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCCAEPF20}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF20}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF20}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF20}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF20}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCCAEPF20}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF20}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF20}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF20}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF20}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCCAEPF20}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF20}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF20}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF20}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF20}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCCAEPF20}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF20}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF20}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF20}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF20}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF20}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR021
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCCAEPF21}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF21}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF21}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCCAEPF21}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCCAEPF21}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCCAEPF21}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCCAEPF21}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCCAEPF21}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF21}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF21}  ${nasc}
    Append To List  ${INTEGMOVEXCCAEPF21}  Titular
    Append To List  ${INTEGMOVEXCCAEPF21}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF21}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF21}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF21}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF21}  CURITIBA
    Append To List  ${INTEGMOVEXCCAEPF21}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCCAEPF21}  Residencial
    Append To List  ${INTEGMOVEXCCAEPF21}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF21}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCCAEPF21}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCCAEPF21}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCCAEPF21}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF21}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF21}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF21}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF21}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF21}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCCAEPF21}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF21}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF21}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF21}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF21}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCCAEPF21}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF21}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF21}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF21}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF21}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCCAEPF21}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF21}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF21}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF21}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF21}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCCAEPF21}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF21}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF21}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF21}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF21}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF21}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR022
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCCAEPF22}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF22}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF22}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCCAEPF22}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCCAEPF22}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCCAEPF22}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCCAEPF22}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCCAEPF22}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF22}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF22}  ${nasc}
    Append To List  ${INTEGMOVEXCCAEPF22}  Titular
    Append To List  ${INTEGMOVEXCCAEPF22}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF22}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF22}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF22}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF22}  CURITIBA
    Append To List  ${INTEGMOVEXCCAEPF22}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCCAEPF22}  Residencial
    Append To List  ${INTEGMOVEXCCAEPF22}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF22}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCCAEPF22}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCCAEPF22}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCCAEPF22}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF22}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF22}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF22}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF22}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF22}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCCAEPF22}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF22}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF22}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF22}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF22}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCCAEPF22}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF22}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF22}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF22}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF22}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCCAEPF22}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF22}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF22}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF22}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF22}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCCAEPF22}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF22}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF22}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF22}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF22}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF22}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR023
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${INTEGMOVEXCCAEPF23}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF23}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF23}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCCAEPF23}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${INTEGMOVEXCCAEPF23}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${INTEGMOVEXCCAEPF23}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${INTEGMOVEXCCAEPF23}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${INTEGMOVEXCCAEPF23}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF23}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF23}  ${nasc}
    Append To List  ${INTEGMOVEXCCAEPF23}  Titular
    Append To List  ${INTEGMOVEXCCAEPF23}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF23}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF23}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF23}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF23}  CURITIBA
    Append To List  ${INTEGMOVEXCCAEPF23}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${INTEGMOVEXCCAEPF23}  Residencial
    Append To List  ${INTEGMOVEXCCAEPF23}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF23}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${INTEGMOVEXCCAEPF23}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${INTEGMOVEXCCAEPF23}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${INTEGMOVEXCCAEPF23}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF23}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF23}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF23}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF23}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    Append To List  ${INTEGMOVEXCCAEPF23}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${INTEGMOVEXCCAEPF23}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF23}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF23}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF23}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF23}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${INTEGMOVEXCCAEPF23}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF23}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF23}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF23}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF23}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${INTEGMOVEXCCAEPF23}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF23}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF23}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF23}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF23}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${INTEGMOVEXCCAEPF23}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF23}  ${conta}
    Append To List  ${INTEGMOVEXCCAEPF23}  Solteiro(a)
    Append To List  ${INTEGMOVEXCCAEPF23}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${INTEGMOVEXCCAEPF23}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${INTEGMOVEXCCAEPF23}  ${temp}