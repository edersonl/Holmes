*** Settings ***
Resource    ../../../main.resource
*** Variables ***
@{DECDESAUDEPF01}
@{DECDESAUDEPF02}
@{DECDESAUDEPF03}
@{DECDESAUDEPF04}
@{DECDESAUDEPF05}
@{DECDESAUDEPF06}
@{DECDESAUDEPJ07}
@{DECDESAUDEPJ08}
@{DECDESAUDEPJ09}
@{DECDESAUDEPJ10}
@{DECDESAUDEPJ11}
@{DECDESAUDECAEPF12}
@{DECDESAUDECAEPF13}
@{DECDESAUDECAEPF14}
@{DECDESAUDECAEPF15}
@{DECDESAUDECAEPF16}
@{DECDESAUDEMOVPF01}

*** Keywords ***
Instanciar Variaveis Dec de Saude
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDEPF01}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${DECDESAUDEPF01}  4
    Append To List  ${DECDESAUDEPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${DECDESAUDEPF01}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${DECDESAUDEPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${DECDESAUDEPF01}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDEPF01}  ${temp}
    Append To List  ${DECDESAUDEPF01}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPF01}  ${nasc}
    Append To List  ${DECDESAUDEPF01}  Titular
    Append To List  ${DECDESAUDEPF01}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPF01}  ${temp}
    Append To List  ${DECDESAUDEPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPF01}  ${conta}
    Append To List  ${DECDESAUDEPF01}  Solteiro(a)
    Append To List  ${DECDESAUDEPF01}  CURITIBA
    Append To List  ${DECDESAUDEPF01}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${DECDESAUDEPF01}  Residencial
    Append To List  ${DECDESAUDEPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDEPF01}  ${temp}
    Append To List  ${DECDESAUDEPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDEPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPF01}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${DECDESAUDEPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${DECDESAUDEPF01}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: Altura - m, Arg32: Altura - cm, Arg33: Peso, Arg34: PA, Arg35: PA
    Append To List  ${DECDESAUDEPF01}  Titular
    Append To List  ${DECDESAUDEPF01}  1
    ${temp}  Evaluate  random.randint(40, 98)
    Append To List  ${DECDESAUDEPF01}  ${temp}
    ${temp}  Evaluate  random.randint(58, 102)
    Append To List  ${DECDESAUDEPF01}  ${temp}
    ${temp}  Evaluate  random.randint(11, 14)
    Append To List  ${DECDESAUDEPF01}  ${temp}
    ${temp}  Evaluate  random.randint(6, 9)
    Append To List  ${DECDESAUDEPF01}  ${temp}


    #Instanciar Variavel Cliente PF TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDEPF02}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPF02}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPF02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${DECDESAUDEPF02}  4
    Append To List  ${DECDESAUDEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPF02}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${DECDESAUDEPF02}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${DECDESAUDEPF02}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${DECDESAUDEPF02}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDEPF02}  ${temp}
    Append To List  ${DECDESAUDEPF02}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPF02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPF02}  ${nasc}
    Append To List  ${DECDESAUDEPF02}  Titular
    Append To List  ${DECDESAUDEPF02}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPF02}  ${temp}
    Append To List  ${DECDESAUDEPF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPF02}  ${conta}
    Append To List  ${DECDESAUDEPF02}  Solteiro(a)
    Append To List  ${DECDESAUDEPF02}  CURITIBA
    Append To List  ${DECDESAUDEPF02}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${DECDESAUDEPF02}  Residencial
    Append To List  ${DECDESAUDEPF02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDEPF02}  ${temp}
    Append To List  ${DECDESAUDEPF02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDEPF02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPF02}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${DECDESAUDEPF02}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${DECDESAUDEPF02}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: Altura - m, Arg32: Altura - cm, Arg33: Peso, Arg34: PA, Arg35: PA
    Append To List  ${DECDESAUDEPF02}  Titular
    Append To List  ${DECDESAUDEPF02}  1
    ${temp}  Evaluate  random.randint(40, 98)
    Append To List  ${DECDESAUDEPF02}  ${temp}
    ${temp}  Evaluate  random.randint(58, 102)
    Append To List  ${DECDESAUDEPF02}  ${temp}
    ${temp}  Evaluate  random.randint(11, 14)
    Append To List  ${DECDESAUDEPF02}  ${temp}
    ${temp}  Evaluate  random.randint(6, 9)
    Append To List  ${DECDESAUDEPF02}  ${temp}


    #Instanciar Variavel Cliente PF TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDEPF03}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPF03}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPF03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${DECDESAUDEPF03}  4
    Append To List  ${DECDESAUDEPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPF03}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${DECDESAUDEPF03}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${DECDESAUDEPF03}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${DECDESAUDEPF03}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPF03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDEPF03}  ${temp}
    Append To List  ${DECDESAUDEPF03}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPF03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPF03}  ${nasc}
    Append To List  ${DECDESAUDEPF03}  Titular
    Append To List  ${DECDESAUDEPF03}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPF03}  ${temp}
    Append To List  ${DECDESAUDEPF03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPF03}  ${conta}
    Append To List  ${DECDESAUDEPF03}  Solteiro(a)
    Append To List  ${DECDESAUDEPF03}  CURITIBA
    Append To List  ${DECDESAUDEPF03}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${DECDESAUDEPF03}  Residencial
    Append To List  ${DECDESAUDEPF03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDEPF03}  ${temp}
    Append To List  ${DECDESAUDEPF03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDEPF03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPF03}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${DECDESAUDEPF03}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${DECDESAUDEPF03}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: Altura - m, Arg32: Altura - cm, Arg33: Peso, Arg34: PA, Arg35: PA
    Append To List  ${DECDESAUDEPF03}  Titular
    Append To List  ${DECDESAUDEPF03}  1
    ${temp}  Evaluate  random.randint(40, 98)
    Append To List  ${DECDESAUDEPF03}  ${temp}
    ${temp}  Evaluate  random.randint(58, 102)
    Append To List  ${DECDESAUDEPF03}  ${temp}
    ${temp}  Evaluate  random.randint(11, 14)
    Append To List  ${DECDESAUDEPF03}  ${temp}
    ${temp}  Evaluate  random.randint(6, 9)
    Append To List  ${DECDESAUDEPF03}  ${temp}


    #Instanciar Variavel Cliente PF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDEPF04}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPF04}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPF04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${DECDESAUDEPF04}  3
    Append To List  ${DECDESAUDEPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPF04}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${DECDESAUDEPF04}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${DECDESAUDEPF04}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${DECDESAUDEPF04}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPF04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDEPF04}  ${temp}
    Append To List  ${DECDESAUDEPF04}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPF04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPF04}  ${nasc}
    Append To List  ${DECDESAUDEPF04}  Titular
    Append To List  ${DECDESAUDEPF04}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPF04}  ${temp}
    Append To List  ${DECDESAUDEPF04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPF04}  ${conta}
    Append To List  ${DECDESAUDEPF04}  Solteiro(a)
    Append To List  ${DECDESAUDEPF04}  CURITIBA
    Append To List  ${DECDESAUDEPF04}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${DECDESAUDEPF04}  Residencial
    Append To List  ${DECDESAUDEPF04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDEPF04}  ${temp}
    Append To List  ${DECDESAUDEPF04}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDEPF04}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPF04}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${DECDESAUDEPF04}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${DECDESAUDEPF04}  02/08/2015
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: Altura - m, Arg32: Altura - cm, Arg33: Peso, Arg34: PA, Arg35: PA
    Append To List  ${DECDESAUDEPF04}  Titular
    Append To List  ${DECDESAUDEPF04}  1
    ${temp}  Evaluate  random.randint(40, 98)
    Append To List  ${DECDESAUDEPF04}  ${temp}
    ${temp}  Evaluate  random.randint(58, 102)
    Append To List  ${DECDESAUDEPF04}  ${temp}
    ${temp}  Evaluate  random.randint(11, 14)
    Append To List  ${DECDESAUDEPF04}  ${temp}
    ${temp}  Evaluate  random.randint(6, 9)
    Append To List  ${DECDESAUDEPF04}  ${temp}
    Append To List  ${DECDESAUDEPF04}  (41) 39464652
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg38: Tipo, Arg39: cpf, Arg40: Nome Beneficiario, Arg41: Estado Civil, Arg42: Grau Dependencia, 
    #              Arg43: Data Nascimento Dependente, Arg44: Email, Arg45: CNS
    Append To List  ${DECDESAUDEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPF04}  ${conta}
    Append To List  ${DECDESAUDEPF04}  Casado(a)
    Append To List  ${DECDESAUDEPF04}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg46: Tipo, Arg47: cpf, Arg48: Nome Beneficiario, Arg49: Estado Civil, Arg50: Grau Dependencia, 
    #              Arg51: Data Nascimento Dependente, Arg52: Email, Arg53: CNS
    Append To List  ${DECDESAUDEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPF04}  ${conta}
    Append To List  ${DECDESAUDEPF04}  Solteiro(a)
    Append To List  ${DECDESAUDEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPF04}  ${temp}


    #Instanciar Variavel Cliente PF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDEPF05}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPF05}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPF05}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${DECDESAUDEPF05}  2
    Append To List  ${DECDESAUDEPF05}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPF05}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${DECDESAUDEPF05}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${DECDESAUDEPF05}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${DECDESAUDEPF05}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPF05}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDEPF05}  ${temp}
    Append To List  ${DECDESAUDEPF05}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPF05}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPF05}  ${nasc}
    Append To List  ${DECDESAUDEPF05}  Titular
    Append To List  ${DECDESAUDEPF05}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPF05}  ${temp}
    Append To List  ${DECDESAUDEPF05}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPF05}  ${conta}
    Append To List  ${DECDESAUDEPF05}  Solteiro(a)
    Append To List  ${DECDESAUDEPF05}  CURITIBA
    Append To List  ${DECDESAUDEPF05}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${DECDESAUDEPF05}  Residencial
    Append To List  ${DECDESAUDEPF05}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDEPF05}  ${temp}
    Append To List  ${DECDESAUDEPF05}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDEPF05}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPF05}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${DECDESAUDEPF05}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${DECDESAUDEPF05}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: Altura - m, Arg31: Altura - cm, Arg32: Peso, Arg33: PA, Arg34: PA
    Append To List  ${DECDESAUDEPF05}  Titular
    Append To List  ${DECDESAUDEPF05}  1
    ${temp}  Evaluate  random.randint(40, 98)
    Append To List  ${DECDESAUDEPF05}  ${temp}
    ${temp}  Evaluate  random.randint(58, 102)
    Append To List  ${DECDESAUDEPF05}  ${temp}
    ${temp}  Evaluate  random.randint(11, 14)
    Append To List  ${DECDESAUDEPF05}  ${temp}
    ${temp}  Evaluate  random.randint(6, 9)
    Append To List  ${DECDESAUDEPF05}  ${temp}


    #Instanciar Variavel Cliente PF TR006
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDEPF06}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPF06}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPF06}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${DECDESAUDEPF06}  2
    Append To List  ${DECDESAUDEPF06}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPF06}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${DECDESAUDEPF06}  ${GLOBAL_ASSISTENCIAL_PF}
    Append To List  ${DECDESAUDEPF06}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${DECDESAUDEPF06}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPF06}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDEPF06}  ${temp}
    Append To List  ${DECDESAUDEPF06}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPF06}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPF06}  ${nasc}
    Append To List  ${DECDESAUDEPF06}  Titular
    Append To List  ${DECDESAUDEPF06}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPF06}  ${temp}
    Append To List  ${DECDESAUDEPF06}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPF06}  ${conta}
    Append To List  ${DECDESAUDEPF06}  Solteiro(a)
    Append To List  ${DECDESAUDEPF06}  CURITIBA
    Append To List  ${DECDESAUDEPF06}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${DECDESAUDEPF06}  Residencial
    Append To List  ${DECDESAUDEPF06}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDEPF06}  ${temp}
    Append To List  ${DECDESAUDEPF06}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDEPF06}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPF06}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${DECDESAUDEPF06}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${DECDESAUDEPF06}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: Altura - m, Arg31: Altura - cm, Arg32: Peso, Arg33: PA, Arg34: PA
    Append To List  ${DECDESAUDEPF06}  Titular
    Append To List  ${DECDESAUDEPF06}  1
    ${temp}  Evaluate  random.randint(40, 98)
    Append To List  ${DECDESAUDEPF06}  ${temp}
    ${temp}  Evaluate  random.randint(58, 102)
    Append To List  ${DECDESAUDEPF06}  ${temp}
    ${temp}  Evaluate  random.randint(11, 14)
    Append To List  ${DECDESAUDEPF06}  ${temp}
    ${temp}  Evaluate  random.randint(6, 9)
    Append To List  ${DECDESAUDEPF06}  ${temp}


    #Instanciar Variavel Cliente PJ TR007
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDEPJ07}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPJ07}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${DECDESAUDEPJ07}  15
    Append To List  ${DECDESAUDEPJ07}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPJ07}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${DECDESAUDEPJ07}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${DECDESAUDEPJ07}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${DECDESAUDEPJ07}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPJ07}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    Append To List  ${DECDESAUDEPJ07}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPJ07}  ${nasc}
    Append To List  ${DECDESAUDEPJ07}  Titular
    Append To List  ${DECDESAUDEPJ07}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    Append To List  ${DECDESAUDEPJ07}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPJ07}  ${conta}
    Append To List  ${DECDESAUDEPJ07}  Solteiro(a)
    Append To List  ${DECDESAUDEPJ07}  CURITIBA
    Append To List  ${DECDESAUDEPJ07}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${DECDESAUDEPJ07}  Residencial
    Append To List  ${DECDESAUDEPJ07}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    Append To List  ${DECDESAUDEPJ07}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${DECDESAUDEPJ07}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${DECDESAUDEPJ07}  02/08/2020
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: Altura - m, Arg32: Altura - cm, Arg33: Peso, Arg34: PA, Arg35: PA
    Append To List  ${DECDESAUDEPJ07}  Titular
    Append To List  ${DECDESAUDEPJ07}  1
    ${temp}  Evaluate  random.randint(40, 98)
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    ${temp}  Evaluate  random.randint(58, 102)
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    ${temp}  Evaluate  random.randint(11, 14)
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    ${temp}  Evaluate  random.randint(6, 9)
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    Append To List  ${DECDESAUDEPJ07}  (41) 39464652
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    #Adicionando Dependente - Pessoa: Arg38: Tipo, Arg39: cpf, Arg40: Nome Beneficiario, Arg41: Estado Civil, Arg42: Grau Dependencia, 
    #              Arg43: Data Nascimento Dependente, Arg44: Email, Arg45: CNS
    Append To List  ${DECDESAUDEPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPJ07}  ${conta}
    Append To List  ${DECDESAUDEPJ07}  Casado(a)
    Append To List  ${DECDESAUDEPJ07}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${DECDESAUDEPJ07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPJ07}  ${conta}
    Append To List  ${DECDESAUDEPJ07}  Solteiro(a)
    Append To List  ${DECDESAUDEPJ07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPJ07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPJ07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPJ07}  ${temp}


    #Instanciar Variavel Cliente PJ TR008
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDEPJ08}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPJ08}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${DECDESAUDEPJ08}  30
    Append To List  ${DECDESAUDEPJ08}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPJ08}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${DECDESAUDEPJ08}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${DECDESAUDEPJ08}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${DECDESAUDEPJ08}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPJ08}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    Append To List  ${DECDESAUDEPJ08}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPJ08}  ${nasc}
    Append To List  ${DECDESAUDEPJ08}  Titular
    Append To List  ${DECDESAUDEPJ08}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    Append To List  ${DECDESAUDEPJ08}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPJ08}  ${conta}
    Append To List  ${DECDESAUDEPJ08}  Solteiro(a)
    Append To List  ${DECDESAUDEPJ08}  CURITIBA
    Append To List  ${DECDESAUDEPJ08}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${DECDESAUDEPJ08}  Residencial
    Append To List  ${DECDESAUDEPJ08}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    Append To List  ${DECDESAUDEPJ08}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${DECDESAUDEPJ08}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${DECDESAUDEPJ08}  02/08/2020
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: Altura - m, Arg31: Altura - cm, Arg32: Peso, Arg33: PA, Arg34: PA
    Append To List  ${DECDESAUDEPJ08}  Titular
    Append To List  ${DECDESAUDEPJ08}  1
    ${temp}  Evaluate  random.randint(40, 98)
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    ${temp}  Evaluate  random.randint(58, 102)
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    ${temp}  Evaluate  random.randint(11, 14)
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    ${temp}  Evaluate  random.randint(6, 9)
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    Append To List  ${DECDESAUDEPJ08}  (41) 39464652
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    #Adicionando Dependente - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${DECDESAUDEPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPJ08}  ${conta}
    Append To List  ${DECDESAUDEPJ08}  Casado(a)
    Append To List  ${DECDESAUDEPJ08}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${DECDESAUDEPJ08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPJ08}  ${conta}
    Append To List  ${DECDESAUDEPJ08}  Solteiro(a)
    Append To List  ${DECDESAUDEPJ08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPJ08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPJ08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPJ08}  ${temp}


    #Instanciar Variavel Cliente PJ TR009
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDEPJ09}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPJ09}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${DECDESAUDEPJ09}  10
    Append To List  ${DECDESAUDEPJ09}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPJ09}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${DECDESAUDEPJ09}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${DECDESAUDEPJ09}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${DECDESAUDEPJ09}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPJ09}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    Append To List  ${DECDESAUDEPJ09}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPJ09}  ${nasc}
    Append To List  ${DECDESAUDEPJ09}  Titular
    Append To List  ${DECDESAUDEPJ09}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    Append To List  ${DECDESAUDEPJ09}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPJ09}  ${conta}
    Append To List  ${DECDESAUDEPJ09}  Solteiro(a)
    Append To List  ${DECDESAUDEPJ09}  CURITIBA
    Append To List  ${DECDESAUDEPJ09}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${DECDESAUDEPJ09}  Residencial
    Append To List  ${DECDESAUDEPJ09}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    Append To List  ${DECDESAUDEPJ09}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${DECDESAUDEPJ09}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${DECDESAUDEPJ09}  02/08/2020
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: Altura - m, Arg31: Altura - cm, Arg32: Peso, Arg33: PA, Arg34: PA
    Append To List  ${DECDESAUDEPJ09}  Titular
    Append To List  ${DECDESAUDEPJ09}  1
    ${temp}  Evaluate  random.randint(40, 98)
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    ${temp}  Evaluate  random.randint(58, 102)
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    ${temp}  Evaluate  random.randint(11, 14)
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    ${temp}  Evaluate  random.randint(6, 9)
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    Append To List  ${DECDESAUDEPJ09}  (41) 39464652
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    #Adicionando Dependente - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${DECDESAUDEPJ09}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPJ09}  ${conta}
    Append To List  ${DECDESAUDEPJ09}  Casado(a)
    Append To List  ${DECDESAUDEPJ09}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPJ09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${DECDESAUDEPJ09}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPJ09}  ${conta}
    Append To List  ${DECDESAUDEPJ09}  Solteiro(a)
    Append To List  ${DECDESAUDEPJ09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPJ09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPJ09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPJ09}  ${temp}


    #Instanciar Variavel Cliente PJ TR010
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDEPJ10}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPJ10}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${DECDESAUDEPJ10}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${DECDESAUDEPJ10}  10
    Append To List  ${DECDESAUDEPJ10}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPJ10}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${DECDESAUDEPJ10}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${DECDESAUDEPJ10}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${DECDESAUDEPJ10}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPJ10}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDEPJ10}  ${temp}
    Append To List  ${DECDESAUDEPJ10}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPJ10}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPJ10}  ${nasc}
    Append To List  ${DECDESAUDEPJ10}  Titular
    Append To List  ${DECDESAUDEPJ10}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPJ10}  ${temp}
    Append To List  ${DECDESAUDEPJ10}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPJ10}  ${conta}
    Append To List  ${DECDESAUDEPJ10}  Solteiro(a)
    Append To List  ${DECDESAUDEPJ10}  CURITIBA
    Append To List  ${DECDESAUDEPJ10}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${DECDESAUDEPJ10}  Residencial
    Append To List  ${DECDESAUDEPJ10}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDEPJ10}  ${temp}
    Append To List  ${DECDESAUDEPJ10}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDEPJ10}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPJ10}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${DECDESAUDEPJ10}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${DECDESAUDEPJ10}  02/08/2020
    #Adicionando - Pessoa: Arg30: Tipo, Arg31: Altura - m, Arg32: Altura - cm, Arg33: Peso, Arg34: PA, Arg35: PA
    Append To List  ${DECDESAUDEPJ10}  Titular
    Append To List  ${DECDESAUDEPJ10}  1
    ${temp}  Evaluate  random.randint(40, 98)
    Append To List  ${DECDESAUDEPJ10}  ${temp}
    ${temp}  Evaluate  random.randint(58, 102)
    Append To List  ${DECDESAUDEPJ10}  ${temp}
    ${temp}  Evaluate  random.randint(11, 14)
    Append To List  ${DECDESAUDEPJ10}  ${temp}
    ${temp}  Evaluate  random.randint(6, 9)
    Append To List  ${DECDESAUDEPJ10}  ${temp}
    Append To List  ${DECDESAUDEPJ10}  (41) 39464652
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPJ10}  ${temp}


    #Instanciar Variavel Cliente PJ TR011
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDEPJ11}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPJ11}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${DECDESAUDEPJ11}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${DECDESAUDEPJ11}  10
    Append To List  ${DECDESAUDEPJ11}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPJ11}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${DECDESAUDEPJ11}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${DECDESAUDEPJ11}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${DECDESAUDEPJ11}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEPJ11}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDEPJ11}  ${temp}
    Append To List  ${DECDESAUDEPJ11}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEPJ11}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEPJ11}  ${nasc}
    Append To List  ${DECDESAUDEPJ11}  Titular
    Append To List  ${DECDESAUDEPJ11}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEPJ11}  ${temp}
    Append To List  ${DECDESAUDEPJ11}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEPJ11}  ${conta}
    Append To List  ${DECDESAUDEPJ11}  Solteiro(a)
    Append To List  ${DECDESAUDEPJ11}  CURITIBA
    Append To List  ${DECDESAUDEPJ11}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${DECDESAUDEPJ11}  Residencial
    Append To List  ${DECDESAUDEPJ11}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDEPJ11}  ${temp}
    Append To List  ${DECDESAUDEPJ11}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDEPJ11}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPJ11}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${DECDESAUDEPJ11}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${DECDESAUDEPJ11}  02/08/2020
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: Altura - m, Arg31: Altura - cm, Arg32: Peso, Arg33: PA, Arg34: PA
    Append To List  ${DECDESAUDEPJ11}  Titular
    Append To List  ${DECDESAUDEPJ11}  1
    ${temp}  Evaluate  random.randint(40, 98)
    Append To List  ${DECDESAUDEPJ11}  ${temp}
    ${temp}  Evaluate  random.randint(58, 102)
    Append To List  ${DECDESAUDEPJ11}  ${temp}
    ${temp}  Evaluate  random.randint(11, 14)
    Append To List  ${DECDESAUDEPJ11}  ${temp}
    ${temp}  Evaluate  random.randint(6, 9)
    Append To List  ${DECDESAUDEPJ11}  ${temp}
    Append To List  ${DECDESAUDEPJ11}  (41) 39464652
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEPJ11}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR012
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDECAEPF12}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDECAEPF12}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${DECDESAUDECAEPF12}  15
    Append To List  ${DECDESAUDECAEPF12}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDECAEPF12}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${DECDESAUDECAEPF12}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${DECDESAUDECAEPF12}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${DECDESAUDECAEPF12}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDECAEPF12}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    Append To List  ${DECDESAUDECAEPF12}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDECAEPF12}  ${nasc}
    Append To List  ${DECDESAUDECAEPF12}  Titular
    Append To List  ${DECDESAUDECAEPF12}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    Append To List  ${DECDESAUDECAEPF12}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDECAEPF12}  ${conta}
    Append To List  ${DECDESAUDECAEPF12}  Solteiro(a)
    Append To List  ${DECDESAUDECAEPF12}  CURITIBA
    Append To List  ${DECDESAUDECAEPF12}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${DECDESAUDECAEPF12}  Residencial
    Append To List  ${DECDESAUDECAEPF12}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    Append To List  ${DECDESAUDECAEPF12}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${DECDESAUDECAEPF12}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${DECDESAUDECAEPF12}  02/08/2020
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: Altura - m, Arg31: Altura - cm, Arg32: Peso, Arg33: PA, Arg34: PA
    Append To List  ${DECDESAUDECAEPF12}  Titular
    Append To List  ${DECDESAUDECAEPF12}  1
    ${temp}  Evaluate  random.randint(40, 98)
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    ${temp}  Evaluate  random.randint(58, 102)
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    ${temp}  Evaluate  random.randint(11, 14)
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    ${temp}  Evaluate  random.randint(6, 9)
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    Append To List  ${DECDESAUDECAEPF12}  (41) 39464652
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    #Adicionando Dependente - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${DECDESAUDECAEPF12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDECAEPF12}  ${conta}
    Append To List  ${DECDESAUDECAEPF12}  Casado(a)
    Append To List  ${DECDESAUDECAEPF12}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDECAEPF12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${DECDESAUDECAEPF12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDECAEPF12}  ${conta}
    Append To List  ${DECDESAUDECAEPF12}  Solteiro(a)
    Append To List  ${DECDESAUDECAEPF12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDECAEPF12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDECAEPF12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDECAEPF12}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR013
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDECAEPF13}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDECAEPF13}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${DECDESAUDECAEPF13}  30
    Append To List  ${DECDESAUDECAEPF13}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDECAEPF13}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${DECDESAUDECAEPF13}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${DECDESAUDECAEPF13}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${DECDESAUDECAEPF13}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDECAEPF13}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    Append To List  ${DECDESAUDECAEPF13}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDECAEPF13}  ${nasc}
    Append To List  ${DECDESAUDECAEPF13}  Titular
    Append To List  ${DECDESAUDECAEPF13}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    Append To List  ${DECDESAUDECAEPF13}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDECAEPF13}  ${conta}
    Append To List  ${DECDESAUDECAEPF13}  Solteiro(a)
    Append To List  ${DECDESAUDECAEPF13}  CURITIBA
    Append To List  ${DECDESAUDECAEPF13}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${DECDESAUDECAEPF13}  Residencial
    Append To List  ${DECDESAUDECAEPF13}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    Append To List  ${DECDESAUDECAEPF13}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${DECDESAUDECAEPF13}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${DECDESAUDECAEPF13}  02/08/2020
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: Altura - m, Arg31: Altura - cm, Arg32: Peso, Arg33: PA, Arg34: PA
    Append To List  ${DECDESAUDECAEPF13}  Titular
    Append To List  ${DECDESAUDECAEPF13}  1
    ${temp}  Evaluate  random.randint(40, 98)
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    ${temp}  Evaluate  random.randint(58, 102)
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    ${temp}  Evaluate  random.randint(11, 14)
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    ${temp}  Evaluate  random.randint(6, 9)
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    Append To List  ${DECDESAUDECAEPF13}  (41) 39464652
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    #Adicionando Dependente - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${DECDESAUDECAEPF13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDECAEPF13}  ${conta}
    Append To List  ${DECDESAUDECAEPF13}  Casado(a)
    Append To List  ${DECDESAUDECAEPF13}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDECAEPF13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${DECDESAUDECAEPF13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDECAEPF13}  ${conta}
    Append To List  ${DECDESAUDECAEPF13}  Solteiro(a)
    Append To List  ${DECDESAUDECAEPF13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDECAEPF13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDECAEPF13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDECAEPF13}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR014
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDECAEPF14}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDECAEPF14}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${DECDESAUDECAEPF14}  10
    Append To List  ${DECDESAUDECAEPF14}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDECAEPF14}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${DECDESAUDECAEPF14}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${DECDESAUDECAEPF14}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${DECDESAUDECAEPF14}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDECAEPF14}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    Append To List  ${DECDESAUDECAEPF14}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDECAEPF14}  ${nasc}
    Append To List  ${DECDESAUDECAEPF14}  Titular
    Append To List  ${DECDESAUDECAEPF14}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    Append To List  ${DECDESAUDECAEPF14}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDECAEPF14}  ${conta}
    Append To List  ${DECDESAUDECAEPF14}  Solteiro(a)
    Append To List  ${DECDESAUDECAEPF14}  CURITIBA
    Append To List  ${DECDESAUDECAEPF14}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${DECDESAUDECAEPF14}  Residencial
    Append To List  ${DECDESAUDECAEPF14}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    Append To List  ${DECDESAUDECAEPF14}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${DECDESAUDECAEPF14}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${DECDESAUDECAEPF14}  02/08/2020
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: Altura - m, Arg31: Altura - cm, Arg32: Peso, Arg33: PA, Arg34: PA
    Append To List  ${DECDESAUDECAEPF14}  Titular
    Append To List  ${DECDESAUDECAEPF14}  1
    ${temp}  Evaluate  random.randint(40, 98)
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    ${temp}  Evaluate  random.randint(58, 102)
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    ${temp}  Evaluate  random.randint(11, 14)
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    ${temp}  Evaluate  random.randint(6, 9)
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    Append To List  ${DECDESAUDECAEPF14}  (41) 39464652
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    #Adicionando Dependente - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${DECDESAUDECAEPF14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDECAEPF14}  ${conta}
    Append To List  ${DECDESAUDECAEPF14}  Casado(a)
    Append To List  ${DECDESAUDECAEPF14}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDECAEPF14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${DECDESAUDECAEPF14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDECAEPF14}  ${conta}
    Append To List  ${DECDESAUDECAEPF14}  Solteiro(a)
    Append To List  ${DECDESAUDECAEPF14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDECAEPF14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDECAEPF14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDECAEPF14}  ${temp}


    #Instanciar Variavel Cliente PJ TR015
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDECAEPF15}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDECAEPF15}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${DECDESAUDECAEPF15}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${DECDESAUDECAEPF15}  10
    Append To List  ${DECDESAUDECAEPF15}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDECAEPF15}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${DECDESAUDECAEPF15}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${DECDESAUDECAEPF15}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${DECDESAUDECAEPF15}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDECAEPF15}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDECAEPF15}  ${temp}
    Append To List  ${DECDESAUDECAEPF15}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDECAEPF15}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDECAEPF15}  ${nasc}
    Append To List  ${DECDESAUDECAEPF15}  Titular
    Append To List  ${DECDESAUDECAEPF15}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDECAEPF15}  ${temp}
    Append To List  ${DECDESAUDECAEPF15}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDECAEPF15}  ${conta}
    Append To List  ${DECDESAUDECAEPF15}  Solteiro(a)
    Append To List  ${DECDESAUDECAEPF15}  CURITIBA
    Append To List  ${DECDESAUDECAEPF15}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${DECDESAUDECAEPF15}  Residencial
    Append To List  ${DECDESAUDECAEPF15}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDECAEPF15}  ${temp}
    Append To List  ${DECDESAUDECAEPF15}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDECAEPF15}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDECAEPF15}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${DECDESAUDECAEPF15}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${DECDESAUDECAEPF15}  02/08/2020
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: Altura - m, Arg31: Altura - cm, Arg32: Peso, Arg33: PA, Arg34: PA
    Append To List  ${DECDESAUDECAEPF15}  Titular
    Append To List  ${DECDESAUDECAEPF15}  1
    ${temp}  Evaluate  random.randint(40, 98)
    Append To List  ${DECDESAUDECAEPF15}  ${temp}
    ${temp}  Evaluate  random.randint(58, 102)
    Append To List  ${DECDESAUDECAEPF15}  ${temp}
    ${temp}  Evaluate  random.randint(11, 14)
    Append To List  ${DECDESAUDECAEPF15}  ${temp}
    ${temp}  Evaluate  random.randint(6, 9)
    Append To List  ${DECDESAUDECAEPF15}  ${temp}
    Append To List  ${DECDESAUDECAEPF15}  (41) 39464652
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDECAEPF15}  ${temp}


    #Instanciar Variavel Cliente PJ TR015
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDECAEPF16}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDECAEPF16}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${DECDESAUDECAEPF16}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    Append To List  ${DECDESAUDECAEPF16}  10
    Append To List  ${DECDESAUDECAEPF16}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDECAEPF16}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${DECDESAUDECAEPF16}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${DECDESAUDECAEPF16}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${DECDESAUDECAEPF16}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDECAEPF16}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDECAEPF16}  ${temp}
    Append To List  ${DECDESAUDECAEPF16}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDECAEPF16}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDECAEPF16}  ${nasc}
    Append To List  ${DECDESAUDECAEPF16}  Titular
    Append To List  ${DECDESAUDECAEPF16}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDECAEPF16}  ${temp}
    Append To List  ${DECDESAUDECAEPF16}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDECAEPF16}  ${conta}
    Append To List  ${DECDESAUDECAEPF16}  Solteiro(a)
    Append To List  ${DECDESAUDECAEPF16}  CURITIBA
    Append To List  ${DECDESAUDECAEPF16}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${DECDESAUDECAEPF16}  Residencial
    Append To List  ${DECDESAUDECAEPF16}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDECAEPF16}  ${temp}
    Append To List  ${DECDESAUDECAEPF16}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDECAEPF16}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDECAEPF16}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${DECDESAUDECAEPF16}  5046 - UNIFAMILIA EMPRES.AMB+HOSP.APT
    Append To List  ${DECDESAUDECAEPF16}  02/08/2020
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: Altura - m, Arg31: Altura - cm, Arg32: Peso, Arg33: PA, Arg34: PA
    Append To List  ${DECDESAUDECAEPF16}  Titular
    Append To List  ${DECDESAUDECAEPF16}  1
    ${temp}  Evaluate  random.randint(40, 98)
    Append To List  ${DECDESAUDECAEPF16}  ${temp}
    ${temp}  Evaluate  random.randint(58, 102)
    Append To List  ${DECDESAUDECAEPF16}  ${temp}
    ${temp}  Evaluate  random.randint(11, 14)
    Append To List  ${DECDESAUDECAEPF16}  ${temp}
    ${temp}  Evaluate  random.randint(6, 9)
    Append To List  ${DECDESAUDECAEPF16}  ${temp}
    Append To List  ${DECDESAUDECAEPF16}  (41) 39464652
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDECAEPF16}  ${temp}


    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${DECDESAUDEMOVPF01}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEMOVPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEMOVPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${DECDESAUDEMOVPF01}  ${temp}
    Append To List  ${DECDESAUDEMOVPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEMOVPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${DECDESAUDEMOVPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${DECDESAUDEMOVPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${DECDESAUDEMOVPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${DECDESAUDEMOVPF01}  ${temp}
    Append To List  ${DECDESAUDEMOVPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEMOVPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEMOVPF01}  ${nasc}
    Append To List  ${DECDESAUDEMOVPF01}  Titular
    Append To List  ${DECDESAUDEMOVPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEMOVPF01}  ${temp}
    Append To List  ${DECDESAUDEMOVPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEMOVPF01}  ${conta}
    Append To List  ${DECDESAUDEMOVPF01}  Solteiro(a)
    Append To List  ${DECDESAUDEMOVPF01}  CURITIBA
    Append To List  ${DECDESAUDEMOVPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${DECDESAUDEMOVPF01}  Residencial
    Append To List  ${DECDESAUDEMOVPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${DECDESAUDEMOVPF01}  ${temp}
    Append To List  ${DECDESAUDEMOVPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${DECDESAUDEMOVPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEMOVPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${DECDESAUDEMOVPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${DECDESAUDEMOVPF01}  02/08/2015
    #Adicionando - Dependente: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${DECDESAUDEMOVPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEMOVPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEMOVPF01}  ${conta}
    Append To List  ${DECDESAUDEMOVPF01}  Solteiro(a)
    Append To List  ${DECDESAUDEMOVPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEMOVPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEMOVPF01}  ${temp}
    Append To List  ${DECDESAUDEMOVPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${DECDESAUDEMOVPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEMOVPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEMOVPF01}  ${conta}
    Append To List  ${DECDESAUDEMOVPF01}  Solteiro(a)
    Append To List  ${DECDESAUDEMOVPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEMOVPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEMOVPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEMOVPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${DECDESAUDEMOVPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${DECDESAUDEMOVPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${DECDESAUDEMOVPF01}  ${conta}
    Append To List  ${DECDESAUDEMOVPF01}  Solteiro(a)
    Append To List  ${DECDESAUDEMOVPF01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${DECDESAUDEMOVPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${DECDESAUDEMOVPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${DECDESAUDEMOVPF01}  ${temp}