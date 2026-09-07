*** Settings ***
Resource    ../../../main.resource

*** Variables ***
@{CLIENTEPF1}           #cenario1
@{CLIENTEPF2}           #cenario2 e cenario7
@{CLIENTECNPJ3}         #cenario3
@{CLIENTECNPJ4}         #cenario4 e cenario8
@{CLIENTECAEPF5}        #cenario5
@{CLIENTECAEPF6}        #cenario6 e cenario9

*** Keywords ***
Instanciar Variaveis PotClienteResMerc
    #Instanciar Cliente PF TR001 Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" 
    Append To List  ${CLIENTEPF1}  Pessoa Física  
    ${temp}  FakerLibrary.Name
    Append To List  ${CLIENTEPF1}  ${temp}
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Catenate  Conta  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CLIENTEPF1}  ${conta}
    Set Global Variable  @{CLIENTEPF1}
    Log  ${CLIENTEPF1}
 
    #Instanciar Cliente PF TR002 Arg0:"Tipo de Pessoa" Arg1:"Nome"  Arg2:"Nome Conta" Arg3:"CPF" 
    #Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Celular"
    Append To List  ${CLIENTEPF2}  Pessoa Física
    ${temp}  FakerLibrary.Name
    Append To List  ${CLIENTEPF2}  ${temp}
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Catenate  Conta  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CLIENTEPF2}  ${conta}
    ${temp}  FakerLibrary.Cpf
    Append To List  ${CLIENTEPF2}  ${temp}
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CLIENTEPF2}  ${temp}
    ${temp}  FakerLibrary.Email
    Append To List  ${CLIENTEPF2}  ${temp}
    ${temp}  FakerLibrary.Phone Number
    Append To List  ${CLIENTEPF2}  ${temp}
    ${temp}  FakerLibrary.Cellphone Number
    Append To List  ${CLIENTEPF2}  ${temp}
    Set Global Variable  @{CLIENTEPF2}
    Log Many  @{CLIENTEPF2}
 
    #Instanciar Cliente PF TR003 Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" 
    Append To List  ${CLIENTECNPJ3}  Pessoa Jurídica (CNPJ)
    ${temp}  FakerLibrary.Company
    Append To List  ${CLIENTECNPJ3}  ${temp}
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Catenate  Conta  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CLIENTECNPJ3}  ${conta}
    Set Global Variable  @{CLIENTECNPJ3}
    Log  ${CLIENTECNPJ3}
 
    #Instanciar Cliente PF TR004 Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    # Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    # Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica" 
    Append To List  ${CLIENTECNPJ4}  Pessoa Jurídica (CNPJ)
    ${temp}  FakerLibrary.Company
    Append To List  ${CLIENTECNPJ4}  ${temp}
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Catenate  Conta  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CLIENTECNPJ4}  ${conta}
    ${temp}  FakerLibrary.Cnpj
    Append To List  ${CLIENTECNPJ4}  ${temp}
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CLIENTECNPJ4}  ${temp}
    ${temp}  FakerLibrary.Email
    Append To List  ${CLIENTECNPJ4}  ${temp}
    ${temp}  FakerLibrary.Phone Number
    Append To List  ${CLIENTECNPJ4}  ${temp}
    ${temp}  FakerLibrary.Phone Number
    Append To List  ${CLIENTECNPJ4}  ${temp}
    ${temp}  FakerLibrary.Company
    Append To List  ${CLIENTECNPJ4}  ${temp}
    Append To List  ${CLIENTECNPJ4}  ME
    Append To List  ${CLIENTECNPJ4}  Matriz
    Append To List  ${CLIENTECNPJ4}  1015
    Set Global Variable  @{CLIENTECNPJ4}

    #Instanciar Cliente CAEPF TR005 Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" 
    Append To List  ${CLIENTECAEPF5}  Pessoa Jurídica (CAEPF)
    ${temp}  FakerLibrary.Company
    Append To List  ${CLIENTECAEPF5}  ${temp}
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Catenate  Conta  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CLIENTECAEPF5}  ${conta}
    Set Global Variable  @{CLIENTECAEPF5}
    Log  ${CLIENTECAEPF5}

    #Instanciar Cliente CAEPF TR006 Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CAEPF"  
    # Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    # Arg8:"Razao Social"
    Append To List  ${CLIENTECAEPF6}  Pessoa Jurídica (CAEPF)
    ${temp}  FakerLibrary.Company
    Append To List  ${CLIENTECAEPF6}  ${temp}
    ${num}          Evaluate  random.randint(1, 5000)
    ${conta}        Catenate  Conta  ${temp}  ${num}
    ${conta}        Remover Caracteres Especiais  ${conta}
    ${conta}        Convert To Uppercase  ${conta}
    Append To List  ${CLIENTECAEPF6}  ${conta}
    ${temp}  Gerar CAEPF
    Append To List  ${CLIENTECAEPF6}  ${temp}
    ${temp}  FakerLibrary.Numerify	text=#
    Append To List  ${CLIENTECAEPF6}  ${temp}
    ${temp}  FakerLibrary.Email
    Append To List  ${CLIENTECAEPF6}  ${temp}
    ${temp}  FakerLibrary.Phone Number
    Append To List  ${CLIENTECAEPF6}  ${temp}
    ${temp}  FakerLibrary.Phone Number
    Append To List  ${CLIENTECAEPF6}  ${temp}
    ${temp}  FakerLibrary.Company
    Append To List  ${CLIENTECAEPF6}  ${temp}
    Set Global Variable  @{CLIENTECAEPF6}
    Log Many  ${CLIENTECAEPF6} 