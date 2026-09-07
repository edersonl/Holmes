*** Settings ***
*** Variables ***
@{SERVICOVENDAPF01}
@{SERVICOVENDAPJ02}
@{SERVICOVENDAPJ03}
@{SERVICOVENDACAEPF04}
@{SERVICOVENDACAEPF05}

*** Keywords ***
Instanciar Variaveis ServicoVendasAPI
    #Instanciar Variavel Cliente PF TR001
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${SERVICOVENDAPF01}  Prospect
    ${temp}         FakerLibrary.Name
    ${conta}        Remover Caracteres Especiais  ${temp}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${SERVICOVENDAPF01}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${SERVICOVENDAPF01}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Email, Arg5: Tipo Telefone, Arg6: Numero
    ${temp}  Evaluate  random.randint(1, 8)
    Append To List  ${SERVICOVENDAPF01}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${SERVICOVENDAPF01}  ${temp}
    Append To List  ${SERVICOVENDAPF01}  celular
    Append To List  ${SERVICOVENDAPF01}  41987830493
    #Arg7: Tipo, Arg8: Data prevista
    Append To List  ${SERVICOVENDAPF01}  New Business
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%Y-%m-%d
    Append To List  ${SERVICOVENDAPF01}  ${date}
    # Arg9: Fase Cotação, Arg10: Data de Vigencia, Arg11: Dia de Vencimento
    Append To List  ${SERVICOVENDAPF01}  Closed Accepted
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%Y-%m-%d
    Append To List  ${SERVICOVENDAPF01}  ${date}
    Append To List  ${SERVICOVENDAPF01}  ${date}
    # Adicionando: Arg12: Produto Assitencial, Arg13: Acessorio, Arg14: Tipo Contratacao, Arg15: Tipo Cotacao
    Append To List  ${SERVICOVENDAPF01}  5001
    Append To List  ${SERVICOVENDAPF01}  1041
    Append To List  ${SERVICOVENDAPF01}  indiv_familiar
    Append To List  ${SERVICOVENDAPF01}  individual_familiar


    #Instanciar Variavel Cliente PJ TR002
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${SERVICOVENDAPJ02}  Prospect_PJ
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${SERVICOVENDAPJ02}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${SERVICOVENDAPJ02}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Email, Arg5: Tipo Telefone, Arg6: Numero
    ${temp}  Evaluate  random.randint(1, 8)
    Append To List  ${SERVICOVENDAPJ02}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${SERVICOVENDAPJ02}  ${temp}
    Append To List  ${SERVICOVENDAPJ02}  celular
    Append To List  ${SERVICOVENDAPJ02}  41987830493
    #Arg7: Tipo, Arg8: Data prevista
    Append To List  ${SERVICOVENDAPJ02}  New Business
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%Y-%m-%d
    Append To List  ${SERVICOVENDAPJ02}  ${date}
    # Arg9: Fase Cotação, Arg10: Data de Vigencia, Arg11: Dia de Vencimento
    Append To List  ${SERVICOVENDAPJ02}  Closed Accepted
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%Y-%m-%d
    Append To List  ${SERVICOVENDAPJ02}  ${date}
    Append To List  ${SERVICOVENDAPJ02}  ${date}
    # Adicionando: Arg12: Produto Assitencial, Arg13: Acessorio, Arg14: Produto Assitencial, Arg15: Acessorio, Arg16: Tipo Contratacao, Arg17: Tipo Cotacao
    Append To List  ${SERVICOVENDAPJ02}  5045
    Append To List  ${SERVICOVENDAPJ02}  1060
    Append To List  ${SERVICOVENDAPJ02}  5048
    Append To List  ${SERVICOVENDAPJ02}  1060
    Append To List  ${SERVICOVENDAPJ02}  coletivo_empresarial
    Append To List  ${SERVICOVENDAPJ02}  beneficiarios


    #Instanciar Variavel Cliente PJ TR003
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${SERVICOVENDAPJ03}  Prospect_PJ
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${SERVICOVENDAPJ03}  ${conta}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${SERVICOVENDAPJ03}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Email, Arg5: Tipo Telefone, Arg6: Numero
    ${temp}  Evaluate  random.randint(1, 8)
    Append To List  ${SERVICOVENDAPJ03}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${SERVICOVENDAPJ03}  ${temp}
    Append To List  ${SERVICOVENDAPJ03}  celular
    Append To List  ${SERVICOVENDAPJ03}  41987830493
    #Arg7: Tipo, Arg8: Data prevista
    Append To List  ${SERVICOVENDAPJ03}  New Business
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%Y-%m-%d
    Append To List  ${SERVICOVENDAPJ03}  ${date}
    # Arg9: Fase Cotação, Arg10: Data de Vigencia, Arg11: Dia de Vencimento
    Append To List  ${SERVICOVENDAPJ03}  Closed Accepted
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%Y-%m-%d
    Append To List  ${SERVICOVENDAPJ03}  ${date}
    Append To List  ${SERVICOVENDAPJ03}  ${date}
    # Adicionando: Arg12: Produto Assitencial, Arg13: Acessorio, Arg14: Produto Assitencial, Arg15: Acessorio, Arg16: Tipo Contratacao, Arg17: Tipo Cotacao
    Append To List  ${SERVICOVENDAPJ03}  5050
    Append To List  ${SERVICOVENDAPJ03}  1060
    Append To List  ${SERVICOVENDAPJ03}  5051
    Append To List  ${SERVICOVENDAPJ03}  1060
    Append To List  ${SERVICOVENDAPJ03}  coletivo_adesao
    Append To List  ${SERVICOVENDAPJ03}  beneficiarios


    #Instanciar Variavel Cliente CAEPF TR004
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${SERVICOVENDACAEPF04}  Prospect_CAEPF
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${SERVICOVENDACAEPF04}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${SERVICOVENDACAEPF04}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Email, Arg5: Tipo Telefone, Arg6: Numero
    ${temp}  Evaluate  random.randint(1, 8)
    Append To List  ${SERVICOVENDACAEPF04}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${SERVICOVENDACAEPF04}  ${temp}
    Append To List  ${SERVICOVENDACAEPF04}  celular
    Append To List  ${SERVICOVENDACAEPF04}  41987830493
    #Arg7: Tipo, Arg8: Data prevista
    Append To List  ${SERVICOVENDACAEPF04}  New Business
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%Y-%m-%d
    Append To List  ${SERVICOVENDACAEPF04}  ${date}
    # Arg9: Fase Cotação, Arg10: Data de Vigencia, Arg11: Dia de Vencimento
    Append To List  ${SERVICOVENDACAEPF04}  Closed Accepted
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%Y-%m-%d
    Append To List  ${SERVICOVENDACAEPF04}  ${date}
    Append To List  ${SERVICOVENDACAEPF04}  ${date}
    # Adicionando: Arg12: Produto Assitencial, Arg13: Acessorio, Arg14: Produto Assitencial, Arg15: Acessorio, Arg16: Tipo Contratacao, Arg17: Tipo Cotacao
    Append To List  ${SERVICOVENDACAEPF04}  5045
    Append To List  ${SERVICOVENDACAEPF04}  1060
    Append To List  ${SERVICOVENDACAEPF04}  5048
    Append To List  ${SERVICOVENDACAEPF04}  1060
    Append To List  ${SERVICOVENDACAEPF04}  coletivo_empresarial
    Append To List  ${SERVICOVENDACAEPF04}  beneficiarios


    #Instanciar Variavel Cliente CAEPF TR005
    #Argumentos: Arg0: Tipo, Arg1: Nome Conta, Arg2:CNPJ/CPF/CAEPF
    Append To List  ${SERVICOVENDACAEPF05}  Prospect_CAEPF
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Corp   ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${SERVICOVENDACAEPF05}  ${conta}
    ${temp}         Gerar CAEPF
    Append To List  ${SERVICOVENDACAEPF05}  ${temp}
    #Adicionando: Arg3: Numero de Vida, Arg4: Email, Arg5: Tipo Telefone, Arg6: Numero
    ${temp}  Evaluate  random.randint(1, 8)
    Append To List  ${SERVICOVENDACAEPF05}  ${temp}
    ${temp}        FakerLibrary.Email
    Append To List  ${SERVICOVENDACAEPF05}  ${temp}
    Append To List  ${SERVICOVENDACAEPF05}  celular
    Append To List  ${SERVICOVENDACAEPF05}  41987830493
    #Arg7: Tipo, Arg8: Data prevista
    Append To List  ${SERVICOVENDACAEPF05}  New Business
    ${date}  Get Current Date
    ${date}  Add Time To Date   ${date}     180 days
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%Y-%m-%d
    Append To List  ${SERVICOVENDACAEPF05}  ${date}
    # Arg9: Fase Cotação, Arg10: Data de Vigencia, Arg11: Dia de Vencimento
    Append To List  ${SERVICOVENDACAEPF05}  Closed Accepted
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%Y-%m-%d
    Append To List  ${SERVICOVENDACAEPF05}  ${date}
    Append To List  ${SERVICOVENDACAEPF05}  ${date}
    # Adicionando: Arg12: Produto Assitencial, Arg13: Acessorio, Arg14: Produto Assitencial, Arg15: Acessorio, Arg16: Tipo Contratacao, Arg17: Tipo Cotacao
    Append To List  ${SERVICOVENDACAEPF05}  5050
    Append To List  ${SERVICOVENDACAEPF05}  1060
    Append To List  ${SERVICOVENDACAEPF05}  5051
    Append To List  ${SERVICOVENDACAEPF05}  1060
    Append To List  ${SERVICOVENDACAEPF05}  coletivo_adesao
    Append To List  ${SERVICOVENDACAEPF05}  beneficiarios