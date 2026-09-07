*** Settings ***

*** Variables ***
@{EXCLUSAOBENEFICIARIOCANALPF01}
@{EXCLUSAOBENEFICIARIOCANALPF02}
@{EXCLUSAOBENEFIARIOCAEPF01}
@{EXCLUSAOBENEFIARIOCAEPF02}
@{EXCLUSAOBENEFIARIOCAEPF03}
@{EXCLUSAOBENEFIARIOCAEPF04}
@{EXCLUSAOBENEFIARIOCAEPF05}
@{EXCLUSAOBENEFIARIOCAEPF06}
@{EXCLUSAOBENEFIARIOCAEPF07}
@{EXCLUSAOBENEFIARIOCAEPF08}
@{EXCLUSAOBENEFIARIOCAEPF09}
@{EXCLUSAOBENEFIARIOCAEPF10}
@{EXCLUSAOBENEFIARIOCAEPF11}
@{EXCLUSAOBENEFIARIOPJ12}
@{EXCLUSAOBENEFIARIOPJ13}
@{EXCLUSAOBENEFIARIOPJ14}
@{EXCLUSAOBENEFIARIOPJ15}
@{EXCLUSAOBENEFIARIOPJ16}
@{EXCLUSAOBENEFIARIOPJ17}
@{EXCLUSAOBENEFIARIOPJ18}
@{EXCLUSAOBENEFIARIOPJ19}
@{EXCLUSAOBENEFIARIOPJ20}

*** Keywords ***
Instanciar Variaveis ExclusaoBeneficiarioCanal
    #Instanciar Variavel Cliente PF com 2 beneficiarios
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${nasc}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Titular
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  CURITIBA
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Residencial
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Casado(a)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF01}  ${temp}

    ############# MASSA PARA O CENARIO 02
    #Instanciar Variavel Cliente PF com 2 beneficiarios com OBITOS
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Cliente (PF)
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}    Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${nasc}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Titular
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  CURITIBA
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Residencial
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  5033 - UNIFAMILIA-AMBULATORIAL
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=19
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}   ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Casado(a)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  01 - Cônjuge
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${conta}
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFICIARIOCANALPF02}  ${temp}


    ############# MASSA PARA O CENARIO 03
    #Instanciar Variavel Cliente CAEPF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF01}  ${temp}



    ############ MASSA PARA O CENARIO 04
    #Instanciar Variavel Cliente CAEPF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF02}  ${temp}



    ############ MASSA PARA O CENARIO 05
    #Instanciar Variavel Cliente CAEPF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=19
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    #Adicionando - Contrato 3: Arg69: Tipo, Arg70: cnpj, Arg71: Nome Conta, Arg72: Numero de Vida, Arg73: Tipo, 
    #              Arg74: Data prevista, Arg75: Email, Arg76: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF04}  4




    ############# MASSA PARA O CENARIO 06
    #Instanciar Variavel Cliente CAEPF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    #Adicionando - Contrato 3: Arg69: Tipo, Arg70: cnpj, Arg71: Nome Conta, Arg72: Numero de Vida, Arg73: Tipo, 
    #              Arg74: Data prevista, Arg75: Email, Arg76: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF03}  4


    
    ############ MASSA PARA O CENARIO 07
    #Instanciar Variavel Cliente CAEPF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    #Adicionando - Contrato 3: Arg69: Tipo, Arg70: cnpj, Arg71: Nome Conta, Arg72: Numero de Vida, Arg73: Tipo, 
    #              Arg74: Data prevista, Arg75: Email, Arg76: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF05}  4




    ############ MASSA PARA O CENARIO 08
    #Instanciar Variavel Cliente CAEPF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    #Adicionando - Contrato 3: Arg69: Tipo, Arg70: cnpj, Arg71: Nome Conta, Arg72: Numero de Vida, Arg73: Tipo, 
    #              Arg74: Data prevista, Arg75: Email, Arg76: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF06}  4




    ############ MASSA PARA O CENARIO 09
    #Instanciar Variavel Cliente CAEPF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    #Adicionando - Contrato 3: Arg69: Tipo, Arg70: cnpj, Arg71: Nome Conta, Arg72: Numero de Vida, Arg73: Tipo, 
    #              Arg74: Data prevista, Arg75: Email, Arg76: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF07}  4


    ############ MASSA PARA O CENARIO 10
    #Instanciar Variavel Cliente CAEPF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=11  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    #Adicionando - Contrato 3: Arg69: Tipo, Arg70: cnpj, Arg71: Nome Conta, Arg72: Numero de Vida, Arg73: Tipo, 
    #              Arg74: Data prevista, Arg75: Email, Arg76: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF08}  4



    ############ MASSA PARA O CENARIO 11
    #Instanciar Variavel Cliente CAEPF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  02/08/2015
    #Adicionando - Contrato 2: Arg29: Tipo, Arg30: cnpj, Arg31: Nome Conta, Arg32: Numero de Vida, Arg33: Tipo, 
    #              Arg34: Data prevista, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    #Adicionando Titular - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=19
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    #Adicionando - Contrato 3: Arg69: Tipo, Arg70: cnpj, Arg71: Nome Conta, Arg72: Numero de Vida, Arg73: Tipo, 
    #              Arg74: Data prevista, Arg75: Email, Arg76: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Cliente (CAEPF)
    ${temp}         Gerar CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${conta}
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${date}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOCAEPF09}  4


    ############ MASSA PARA O CENARIO 12
     #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=11  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ12}  ${temp}



    ############ MASSA PARA O CENARIO 13
     #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ13}  ${temp}


    ########### MASSA DO CENARIO 14
     #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  5050 - UNIFAMILIA ADESAO-AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  5051 - UNIFAMILIA ADESAO-AMB+HOS.APTO
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ14}  ${temp}



    ############ MASSA PARA O CENARIO 15
     #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=11  maximum_age=20
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ15}  ${temp}



     ############ MASSA PARA O CENARIO 16
     #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=11  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ16}  ${temp}



    ############ MASSA PARA O CENARIO 17
     #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ17}  ${temp}


    ############ MASSA PARA O CENARIO 18
    #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=20
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ18}  ${temp}



    ############ MASSA PARA O CENARIO 19
    #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ19}  ${temp}




    ############ MASSA PARA O CENARIO 20
    #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Tipo, Arg5: Data prevista
    ${temp}  Evaluate  random.randint(12, 28)
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Novos Negócios
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${date}
    # Adicionando: Arg6: Produto Assitencial, Arg7: Fase Cotação
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  5045 - UNIFAMILIA EMPRES.AMB+HOSP.ENF
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Concluído e Aceito
    #Adicionando: Arg8: Data de Vigencia, Arg9: Dia de Vencimento, Arg10: Forma de Cobrança
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${date}
    ${temp}  Evaluate  random.randint(1, 30)
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Boleto
    #Adicionando: Arg11: CPF Beneficiario, Arg12: Data de Nascimento, Arg13: Tipo, Arg14: Grau de Dependencia
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=18  maximum_age=70
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${nasc}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Titular
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  00 - Titular
    #Adicionando: Arg15: CNS, Arg16: Sexo, Arg17: Nome da Mãe, Arg18: Estado Civil,  
    #             Arg19: Naturalidade, Arg20: Raça
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Masculino
    ${temp}         FakerLibrary.Name Female  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  CURITIBA
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Branca
    #Adicionando: Arg21: Tipo do Endereço, Arg22: CEP, Arg23: Número, Arg24: Tipo Telefone, Arg25: Numero Telefone, Arg26: Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Residencial
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  80540000
    ${temp}  Evaluate  random.randint(1, 300)
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${temp}      Catenate  419  ${temp}  
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    #Adicionando - Pessoa: Arg27: Segundo Produto Assistencial, Arg28: Data de Admissão na empresa
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  5048 - UNIFAM.EMP.AMB+HOSP.APTO.+OBST
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  02/08/2015
    #Adicionando - Pessoa: Arg29: Tipo, Arg30: cpf, Arg31: Nome Beneficiario, Arg32: Estado Civil, Arg33: Grau Dependencia, 
    #              Arg34: Data Nascimento Dependente, Arg35: Email, Arg36: Quantidade de vidas
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth   minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  4
    #Adicionando Titular - Pessoa: Arg37: Tipo, Arg38: cpf, Arg39: Nome Beneficiario, Arg40: Estado Civil, Arg41: Grau Dependencia, 
    #              Arg42: Data Nascimento Dependente, Arg43: Email, Arg44: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Titular
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=12  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    #Adicionando Dependente - Pessoa: Arg45: Tipo, Arg46: cpf, Arg47: Nome Beneficiario, Arg48: Estado Civil, Arg49: Grau Dependencia, 
    #              Arg50: Data Nascimento Dependente, Arg51: Email, Arg52: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    #Adicionando Dependente - Pessoa: Arg53: Tipo, Arg54: cpf, Arg55: Nome Beneficiario, Arg56: Estado Civil, Arg57: Grau Dependencia, 
    #              Arg58: Data Nascimento Dependente, Arg59: Email, Arg60: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  10 - Filhos(as)
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=10  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    #Adicionando Dependente - Pessoa: Arg61: Tipo, Arg62: cpf, Arg63: Nome Beneficiario, Arg64: Estado Civil, Arg65: Grau Dependencia, 
    #              Arg66: Data Nascimento Dependente, Arg67: Email, Arg68: CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Dependente
    ${temp}         FakerLibrary.Cpf
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    ${temp}         FakerLibrary.Name  
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${conta}
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  Solteiro(a)
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  70 - Filho(as) adotivos
    ${nasc}  FakerLibrary.Date Of Birth    minimum_age=13  maximum_age=18
    @{w}  Split String    '${nasc}'  -
    ${nasc}    Set Variables  ${w}[2]/${w}[1]/${w}[0]
    ${nasc}    Remove String  ${nasc}  '
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${nasc}
    ${temp}        FakerLibrary.Email
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}
    ${temp}         Gerar CNS
    Append To List  ${EXCLUSAOBENEFIARIOPJ20}  ${temp}