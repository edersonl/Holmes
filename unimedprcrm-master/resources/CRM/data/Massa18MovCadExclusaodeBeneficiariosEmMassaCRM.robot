*** Settings ***
Resource    ../../../main.resource
*** Variables ***
@{MOVEXCLUSAOMASSAPJ01}
@{MOVEXCLUSAOMASSAPJ02}
@{MOVEXCLUSAOMASSACAEPF03}
@{MOVEXCLUSAOMASSACAEPF04}


*** Keywords ***
Instanciar Variaveis MovCadExclusaodeBeneficiariosEmMassaCRM
    #Instanciar Variavel Cliente PJ TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Concluído e Aceito
    #Adicionando: Arg9: Data de Vigencia / Exclusão, Arg10: Dia de Vencimento, Arg11: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Boleto
    #Adicionando: Arg12: CPF Beneficiario, Arg13: Data de Nascimento, Arg14: Tipo, Arg15: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${nasc}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Titular
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  00 - Titular
    #Adicionando: Arg16: CNS, Arg17: Sexo, Arg18: Nome da Mãe, Arg19: Estado Civil,  
    #             Arg20: Naturalidade, Arg21: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  CURITIBA
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Branca
    #Adicionando: Arg22: Tipo do Endereço, Arg23: CEP, Arg24: Número, Arg25: Tipo Telefone, Arg26: Numero Telefone, Arg27: Email
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Residencial
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Celular
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  41 98245-6885
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    #Adicionando - Pessoa: Arg28: Segundo Produto Assistencial, Arg29: Data de Admissão na empresa
    Append To List  ${MOVEXCLUSAOMASSAPJ01}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  02/08/2015
    #Adicionando - Contrato 2: Arg30: Tipo, Arg31: cnpj, Arg32: Nome Conta, Arg33: Numero de Vida, Arg34: Tipo, 
    #              Arg35: Data prevista, Arg36: Email, Arg37: Quantidade de vidas
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Cliente (PJ)
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  4
    #Adicionando Titular - Pessoa: Arg38: Tipo, Arg39: cpf, Arg40: Nome Beneficiario, Arg41: Estado Civil, Arg42: Grau Dependencia, 
    #              Arg43: Data Nascimento Dependente, Arg44: Email, Arg45: CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg46: Tipo, Arg47: cpf, Arg48: Nome Beneficiario, Arg49: Estado Civil, Arg50: Grau Dependencia, 
    #              Arg51: Data Nascimento Dependente, Arg52: Email, Arg53: CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    #Adicionando Titular - Pessoa: Arg54: Tipo, Arg55: cpf, Arg56: Nome Beneficiario, Arg57: Estado Civil, Arg58: Grau Dependencia, 
    #              Arg59: Data Nascimento Dependente, Arg60: Email, Arg61: CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg62: Tipo, Arg63: cpf, Arg64: Nome Beneficiario, Arg65: Estado Civil, Arg66: Grau Dependencia, 
    #              Arg67: Data Nascimento Dependente, Arg68: Email, Arg69: CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ01}  ${temp}


    #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia / Exclusão, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${nasc}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Titular
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  CURITIBA
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Residencial
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Celular
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  41 98245-6885
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVEXCLUSAOMASSAPJ02}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Cliente (PJ)
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    #Adicionando Titular - Pessoa: Arg85: Tipo, Arg86: cpf, Arg87: Nome Beneficiario, Arg88: Estado Civil, Arg89: Grau Dependencia, 
    #              Arg90: Data Nascimento Dependente, Arg91: Email, Arg92: CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg93: Tipo, Arg94: cpf, Arg95: Nome Beneficiario, Arg96: Estado Civil, Arg97: Grau Dependencia, 
    #              Arg98: Data Nascimento Dependente, Arg99: Email, Arg100: CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSAPJ02}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia / Exclusão, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${nasc}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Titular
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  CURITIBA
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Residencial
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Celular
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  41 98245-6885
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF03}  ${temp}


    #Instanciar Variavel Cliente CAEPF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${date}
    # Adicionando: Arg6: Produto Assitencial Massa Teste, Arg7: Produto Assitencial já existente  Arg8: Fase cotação
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia / Exclusão, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${nasc}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Titular
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  CURITIBA
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Residencial
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Celular
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  41 98245-6885
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}   ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    #Adicionando Titular - Pessoa: Arg69: Tipo, Arg70: cpf, Arg71: Nome Beneficiario, Arg72: Estado Civil, Arg73: Grau Dependencia, 
    #              Arg74: Data Nascimento Dependente, Arg75: Email, Arg76: CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg77: Tipo, Arg78: cpf, Arg79: Nome Beneficiario, Arg80: Estado Civil, Arg81: Grau Dependencia, 
    #              Arg82: Data Nascimento Dependente, Arg83: Email, Arg84: CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    #Adicionando Titular - Pessoa: Arg85: Tipo, Arg86: cpf, Arg87: Nome Beneficiario, Arg88: Estado Civil, Arg89: Grau Dependencia, 
    #              Arg90: Data Nascimento Dependente, Arg91: Email, Arg92: CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg93: Tipo, Arg94: cpf, Arg95: Nome Beneficiario, Arg96: Estado Civil, Arg97: Grau Dependencia, 
    #              Arg98: Data Nascimento Dependente, Arg99: Email, Arg100: CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${conta}
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  Solteiro(a)
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${MOVEXCLUSAOMASSACAEPF04}  ${temp}