*** Settings ***
Resource    ../../../main.resource
Library    FakerLibrary

*** Variables ***
@{CLIENTEPOTENCIALPF10}         #cenario1
@{CLIENTEPOTENCIALPF11}         #cenario2
@{CLIENTEPF12}                  #cenario3
@{CLIENTEPF13}                  #cenario4
@{CLIENTEPOTENCIALPJ14}         #cenario5
@{CLIENTEPOTENCIALPJ15}         #cenario6
@{CLIENTEPJ16}                  #cenario7
@{CLIENTEPJ17}                  #cenario8
@{CLIENTEPOTENCIALCAEPF18}      #cenario9
@{CLIENTEPOTENCIALCAEPF19}      #cenario10
@{CLIENTECAEPF20}               #cenario11
@{CLIENTECAEPF21}               #cenario12

*** Keywords ***
Instanciar Variaveis Conta
    #Instanciar Variavel Potencial Cliente PF TR010
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta
    Append To List  ${CLIENTEPOTENCIALPF10}  Potencial Cliente (PF)
    ${temp}     FakerLibrary.Name
    ${num}      Evaluate  random.randint(1, 5000)
    ${conta}    Catenate  Conta  ${temp}  ${num}
    ${conta}    Remover Caracteres Especiais  ${conta}
    ${conta}    Convert To Uppercase  ${conta}
    Append To List  ${CLIENTEPOTENCIALPF10}  ${conta}
    Set Global Variable  @{CLIENTEPOTENCIALPF10}
    Log Many  @{CLIENTEPOTENCIALPF10}

    #Instanciar Variavel Potencial Cliente PF TR011
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta, Arg3 Nome Social, Arg4 Genero Social
    #         ...Arg5 CNPJ/CPF/CAEPF, Arg6 Email, Arg7 Data Nascimento, Arg8 Sexo
    #         ...Arg9 Nome Mae, Arg10 Nome do Pai, Arg11 Estado Civil, Arg12 Naturalidade
    #         ...Arg13 Tipo Telefone, Arg14 Numero Celular
    Append To List  ${CLIENTEPOTENCIALPF11}  Potencial Cliente (PF)
    ${temp}         FakerLibrary.Name Male
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Catenate  Conta  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CLIENTEPOTENCIALPF11}  ${conta}
    ${nome}         Remover Caracteres Especiais  ${temp}
    ${nome}         Convert To Uppercase  ${nome}
    Append To List  ${CLIENTEPOTENCIALPF11}  ${nome}
    Append To List  ${CLIENTEPOTENCIALPF11}  Masculino
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CLIENTEPOTENCIALPF11}  ${temp}
    ${temp}         FakerLibrary.Email
    Append To List  ${CLIENTEPOTENCIALPF11}  ${temp}
    ${data}         FakerLibrary.Date Of Birth  minimum_age=18  maximum_age=70
    ${temp}         Comum.Colocar Data Formato Brasileiro  ${data} 
    Append To List  ${CLIENTEPOTENCIALPF11}  ${temp}
    Append To List  ${CLIENTEPOTENCIALPF11}  Masculino
    ${temp}         FakerLibrary.Name Female
    Append To List  ${CLIENTEPOTENCIALPF11}  ${temp}
    ${temp}         FakerLibrary.Name Male
    Append To List  ${CLIENTEPOTENCIALPF11}  ${temp}
    Append To List  ${CLIENTEPOTENCIALPF11}  Solteiro(a)
    Append To List  ${CLIENTEPOTENCIALPF11}  Curitiba
    Append To List  ${CLIENTEPOTENCIALPF11}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${tel}          Remover Caracteres Especiais de Telefone  ${temp}  
    Append To List  ${CLIENTEPOTENCIALPF11}  ${tel}
    Set Global Variable  @{CLIENTEPOTENCIALPF11}
    Log Many        @{CLIENTEPOTENCIALPF11}

    #Instanciar Variavel Cliente PF TR012
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta, Arg3 CNPJ/CPF/CAEPF
    Append To List  ${CLIENTEPF12}  Cliente (PF)
    ${temp}         FakerLibrary.Name Male
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Catenate  Conta  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CLIENTEPF12}  ${conta}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CLIENTEPF12}  ${temp}
    Set Global Variable  @{CLIENTEPF12}
    Log Many        @{CLIENTEPF12}

    #Instanciar Variavel Cliente PF TR013
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta, Arg3 Nome Social, Arg4 Genero Social
    #         ...Arg5 CNPJ/CPF/CAEPF, Arg6 Email, Arg7 Data Nascimento, Arg8 Sexo
    #         ...Arg9 Nome Mae, Arg10 Nome do Pai, Arg11 Estado Civil, Arg12 Naturalidade
    #         ...Arg13 Tipo Telefone, Arg14 Numero Celular
    Append To List  ${CLIENTEPF13}  Cliente (PF)
    ${temp}         FakerLibrary.Name Male
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Catenate  Conta  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CLIENTEPF13}  ${conta}
    ${nome}        Remover Caracteres Especiais  ${temp}
    ${nome}        Convert To Uppercase  ${nome}
    Append To List  ${CLIENTEPF13}  ${nome}
    Append To List  ${CLIENTEPF13}  Masculino
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CLIENTEPF13}  ${temp}
    ${temp}         FakerLibrary.Email
    Append To List  ${CLIENTEPF13}  ${temp}
    ${data}         FakerLibrary.Date Of Birth  minimum_age=18  maximum_age=70
    ${temp}         Comum.Colocar Data Formato Brasileiro  ${data} 
    Append To List  ${CLIENTEPF13}  ${temp}
    Append To List  ${CLIENTEPF13}  Masculino
    ${temp}         FakerLibrary.Name Female
    Append To List  ${CLIENTEPF13}  ${temp}
    ${temp}         FakerLibrary.Name Male
    Append To List  ${CLIENTEPF13}  ${temp}
    Append To List  ${CLIENTEPF13}  Solteiro(a)
    Append To List  ${CLIENTEPF13}  Curitiba
    Append To List  ${CLIENTEPF13}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${tel}          Remover Caracteres Especiais de Telefone  ${temp}  
    Append To List  ${CLIENTEPF13}  ${tel}
    Set Global Variable  @{CLIENTEPF13}
    Log Many        @{CLIENTEPF13}

    #Instanciar Variavel Potencial Cliente PJ TR014
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta
    Append To List  ${CLIENTEPOTENCIALPJ14}  Potencial Cliente (PJ)
    ${temp}     FakerLibrary.Company
    ${num}      Evaluate  random.randint(1, 5000)
    ${conta}    Catenate  Conta  ${temp}  ${num}
    ${conta}    Remover Caracteres Especiais  ${conta}
    ${conta}    Convert To Uppercase  ${conta}
    Append To List  ${CLIENTEPOTENCIALPJ14}  ${conta}
    Set Global Variable  @{CLIENTEPOTENCIALPJ14}
    Log Many  @{CLIENTEPOTENCIALPJ14}

    #Instanciar Variavel Potencial Cliente PJ TR015
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta, Arg3 Razao Social, Arg4 CNPJ/CPF/CAEPF, 
    #            Arg5 Porte da Empresa, Arg6 Natureza Jurídica, Arg7 Inscrição Estadual, Arg8 Inscrição Municipal
    #         ...Arg9 E-mail, Arg10 Tipo Telefone, Arg11 Numero Celular
    Append To List  ${CLIENTEPOTENCIALPJ15}  Potencial Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Catenate  Conta  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CLIENTEPOTENCIALPJ15}  ${conta}
    ${razao}        Remover Caracteres Especiais  ${temp}
    ${razao}        Convert To Uppercase  ${razao}
    Append To List  ${CLIENTEPOTENCIALPJ15}  ${razao}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CLIENTEPOTENCIALPJ15}  ${temp}
    Append To List  ${CLIENTEPOTENCIALPJ15}  ME
    Append To List  ${CLIENTEPOTENCIALPJ15}  101-5 - Órgão Público do Poder Executivo Federal
    ${temp}         Random Number    digits=12
    Append To List  ${CLIENTEPOTENCIALPJ15}  ${temp}
    ${temp}         Random Number    digits=12
    Append To List  ${CLIENTEPOTENCIALPJ15}  ${temp}
    ${temp}         FakerLibrary.Email
    Append To List  ${CLIENTEPOTENCIALPJ15}  ${temp}
    Append To List  ${CLIENTEPOTENCIALPJ15}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${tel}          Remover Caracteres Especiais de Telefone  ${temp}  
    Append To List  ${CLIENTEPOTENCIALPJ15}  ${tel}
    Set Global Variable  @{CLIENTEPOTENCIALPJ15}
    Log Many        @{CLIENTEPOTENCIALPJ15}

    #Instanciar Variavel Cliente PJ TR016
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta, Arg3 Razão Social, Arg4 CNPJ/CPF/CAEPF
    Append To List  ${CLIENTEPJ16}  Cliente (PJ)
    ${temp}  FakerLibrary.Company
    ${num}      Evaluate  random.randint(1, 5000)
    ${conta}    Catenate  Conta  ${temp}  ${num}
    ${conta}  Remover Caracteres Especiais  ${conta}
    ${conta} =  Convert To Uppercase  ${conta}
    Append To List  ${CLIENTEPJ16}  ${conta}
    ${razao}        Remover Caracteres Especiais  ${temp}
    ${razao}        Convert To Uppercase  ${razao}
    Append To List  ${CLIENTEPJ16}  ${razao}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CLIENTEPJ16}  ${temp}
    Set Global Variable  @{CLIENTEPJ16}
    Log Many  @{CLIENTEPJ16}

    #Instanciar Variavel Cliente PJ TR017
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta, Arg3 Razao Social, Arg4 CNPJ/CPF/CAEPF, 
    #            Arg5 Porte da Empresa, Arg6 Natureza Jurídica, Arg7 Inscrição Estadual, Arg8 Inscrição Municipal
    #         ...Arg9 E-mail, Arg10 Tipo Telefone, Arg11 Numero Celular
    Append To List  ${CLIENTEPJ17}  Cliente (PJ)
    ${temp}         FakerLibrary.Company
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Catenate  Conta  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CLIENTEPJ17}  ${conta}
    ${razao}        Remover Caracteres Especiais  ${temp}
    ${razao}        Convert To Uppercase  ${razao}
    Append To List  ${CLIENTEPJ17}  ${razao}
    ${temp}         FakerLibrary.Cnpj
    Append To List  ${CLIENTEPJ17}  ${temp}
    Append To List  ${CLIENTEPJ17}  ME
    Append To List  ${CLIENTEPJ17}  101-5 - Órgão Público do Poder Executivo Federal
    ${temp}         Random Number    digits=12
    Append To List  ${CLIENTEPJ17}  ${temp}
    ${temp}         Random Number    digits=12
    Append To List  ${CLIENTEPJ17}  ${temp}
    ${temp}         FakerLibrary.Email
    Append To List  ${CLIENTEPJ17}  ${temp}
    Append To List  ${CLIENTEPJ17}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${tel}          Remover Caracteres Especiais de Telefone  ${temp}  
    Append To List  ${CLIENTEPJ17}  ${tel}
    Set Global Variable  @{CLIENTEPJ17}
    Log Many        @{CLIENTEPJ17}

    #Instanciar Variavel Potencial Cliente CAEPF TR018
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta
    Append To List  ${CLIENTEPOTENCIALCAEPF18}  Potencial Cliente (CAEPF)
    ${temp}     FakerLibrary.Company
    ${num}      Evaluate  random.randint(1, 5000)
    ${conta}    Catenate  Conta  ${temp}  ${num}
    ${conta}    Remover Caracteres Especiais  ${conta}
    ${conta}    Convert To Uppercase  ${conta}
    Append To List  ${CLIENTEPOTENCIALCAEPF18}  ${conta}
    Set Global Variable  @{CLIENTEPOTENCIALCAEPF18}
    Log Many  @{CLIENTEPOTENCIALCAEPF18}

    #Instanciar Variavel Potencial Cliente CAEPF TR019
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta, Arg3 Razao Social, Arg4 CNPJ/CPF/CAEPF, 
    #            Arg5 CPF Responsável (CAEPF), Arg6 Inscrição Estadual, Arg7 Inscrição Municipal
    #         ...Arg8 E-mail, Arg9 Tipo Telefone, Arg10 Numero Celular
    Append To List  ${CLIENTEPOTENCIALCAEPF19}  Potencial Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${conta}        Catenate  Conta  ${temp}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CLIENTEPOTENCIALCAEPF19}  ${conta}
    ${razao}        Remover Caracteres Especiais  ${temp}
    ${razao}        Convert To Uppercase  ${razao}
    Append To List  ${CLIENTEPOTENCIALCAEPF19}  ${razao}
    ${temp}         Gerar CAEPF
    Append To List  ${CLIENTEPOTENCIALCAEPF19}  ${temp}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CLIENTEPOTENCIALCAEPF19}  ${temp}
    ${temp}         Random Number    digits=12
    Append To List  ${CLIENTEPOTENCIALCAEPF19}  ${temp}
    ${temp}         Random Number    digits=12
    Append To List  ${CLIENTEPOTENCIALCAEPF19}  ${temp}
    ${temp}         FakerLibrary.Email
    Append To List  ${CLIENTEPOTENCIALCAEPF19}  ${temp}
    Append To List  ${CLIENTEPOTENCIALCAEPF19}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${tel}          Remover Caracteres Especiais de Telefone  ${temp}  
    Append To List  ${CLIENTEPOTENCIALCAEPF19}  ${tel}
    Set Global Variable  @{CLIENTEPOTENCIALCAEPF19}
    Log Many        @{CLIENTEPOTENCIALCAEPF19}

    #Instanciar Variavel Cliente CAEPF TR020
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta, Arg3 Razao Social, Arg4 CNPJ/CPF/CAEPF, 
    #            Arg5 CPF Responsável (CAEPF)
    Append To List  ${CLIENTECAEPF20}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Catenate  Conta  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CLIENTECAEPF20}  ${conta}
    ${razao}        Remover Caracteres Especiais  ${temp}
    ${razao}        Convert To Uppercase  ${razao}
    Append To List  ${CLIENTECAEPF20}  ${razao}
    ${temp}         Gerar CAEPF
    Append To List  ${CLIENTECAEPF20}  ${temp}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CLIENTECAEPF20}  ${temp}
    Set Global Variable  @{CLIENTECAEPF20}
    Log Many        @{CLIENTECAEPF20}

    #Instanciar Variavel Cliente CAEPF TR021
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta, Arg3 Razao Social, Arg4 CNPJ/CPF/CAEPF, 
    #            Arg5 CPF Responsável (CAEPF), Arg6 Inscrição Estadual, Arg7 Inscrição Municipal
    #         ...Arg8 E-mail, Arg9 Tipo Telefone, Arg10 Numero Celular
    Append To List  ${CLIENTECAEPF21}  Cliente (CAEPF)
    ${temp}         FakerLibrary.Company
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Catenate  Conta  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CLIENTECAEPF21}  ${conta}
    ${razao}        Remover Caracteres Especiais  ${temp}
    ${razao}        Convert To Uppercase  ${razao}
    Append To List  ${CLIENTECAEPF21}  ${razao}
    ${temp}         Gerar CAEPF
    Append To List  ${CLIENTECAEPF21}  ${temp}
    ${temp}         FakerLibrary.Cpf
    Append To List  ${CLIENTECAEPF21}  ${temp}
    ${temp}         Random Number    digits=12
    Append To List  ${CLIENTECAEPF21}  ${temp}
    ${temp}         Random Number    digits=12
    Append To List  ${CLIENTECAEPF21}  ${temp}
    ${temp}         FakerLibrary.Email
    Append To List  ${CLIENTECAEPF21}  ${temp}
    Append To List  ${CLIENTECAEPF21}  Celular
    ${temp}         FakerLibrary.Cellphone Number
    ${tel}          Remover Caracteres Especiais de Telefone  ${temp}  
    Append To List  ${CLIENTECAEPF21}  ${tel}
    Set Global Variable  @{CLIENTECAEPF21}
    Log Many        @{CLIENTECAEPF21}
