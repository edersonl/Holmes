*** Settings ***
Resource    ../main.resource

*** Variables ***

*** Keywords ***
Abrir Nav
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window  
    Go To   ${CRM_URL}
    # Go To  http://192.168.1.78/crm-qualidade-sherlock/index.php?module=Home&action=index
    # Go To  http://192.168.1.78/crm-qualidade/index.php?module=AOS_Contracts&offset=1&stamp=1624637859029491900&return_module=AOS_Contracts&action=DetailView&record=1bd25c9a-2bc3-e6f4-6d9c-60d5fa05d703
    # Go To  https://192.168.1.78/crm/index.php?action=Login&module=Users
    # Go To  https://qualidade.unimedpr.coop.br/crm/index.php?action=Login&module=Users

Abrir Canal do Contratante
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window  
    Go To  ${CANAL_URL}

Instancia Variaveis
    [Arguments]  ${arg1}
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window
    Log  ${arg1}
    Run Keyword If  '${arg1}' == '01'  Instanciar Variaveis PotClienteResMerc
    Run Keyword If  '${arg1}' == '02'  Instanciar Variaveis Conta
    Run Keyword If  '${arg1}' == '03'  Instanciar Variaveis Oportunidades
    # Run Keyword If  '${arg1}' == '03'  Instanciar Variaveis Conta
    Run Keyword If  '${arg1}' == '04'  Instanciar Variaveis Cotacao 
    Run Keyword If  '${arg1}' == '05'  Instanciar Variaveis Portabilidade
    Run Keyword If  '${arg1}' == '06'  Instanciar Variaveis Beneficiário
    Run Keyword If  '${arg1}' == '07'  Instanciar Variaveis Dec de Saude
    Run Keyword If  '${arg1}' == '08'  Instanciar Variaveis Contrato
    Run Keyword If  '${arg1}' == '09'  Instanciar Variaveis Integracao
    Run Keyword If  '${arg1}' == '10'  Instanciar Variaveis IntegMovExclusaoCRM
    Run Keyword If  '${arg1}' == '11'  Instanciar Variaveis IntegMovExclusaoRN412CRM
    Run Keyword If  '${arg1}' == '12'  Instanciar Variaveis IntegMovMudancaProdCRM
    Run Keyword If  '${arg1}' == '13'  Instanciar Variaveis IntegMovTransfGrupFamilCRM
    Run Keyword If  '${arg1}' == '14'  Instanciar Variaveis IntegMovCancelamContratoCRM
    Run Keyword If  '${arg1}' == '15'  Instanciar Variaveis ImportDeBenefMovCadastral
    Run Keyword If  '${arg1}' == '16'  Instanciar Variaveis IntegMovInclusaoCRM
    Run Keyword If  '${arg1}' == '17'  Instanciar Variaveis MovCadTranferenciaDeGrupoFamiliarEmMassaCRM
    Run Keyword If  '${arg1}' == '18'  Instanciar Variaveis MovCadExclusaodeBeneficiariosEmMassaCRM
    Run Keyword If  '${arg1}' == '19'  Instanciar Variaveis PortabilidadeCRM
    Run Keyword If  '${arg1}' == '20'  Instanciar Variaveis ServicoVendasAPI
    Run Keyword If  '${arg1}' == 'C01'  Instanciar Variaveis PortabilidadeCanal
    Run Keyword If  '${arg1}' == 'C02'  Instanciar Variaveis ExclusaoCanal
    Run Keyword If  '${arg1}' == 'C03'  Instanciar Variaveis MovCadTranferenciaDeGrupoFamiliarEmMassaCanal
    Run Keyword If  '${arg1}' == 'C04'  Instanciar Variaveis InclusaoBeneficiarioCanal
    Run Keyword If  '${arg1}' == 'C05'  Instanciar Variaveis ImportacaoBeneficiarioCanal
    Run Keyword If  '${arg1}' == 'C06'  Instanciar Variaveis ExclusaoBeneficiarioCanal
    Run Keyword If  '${arg1}' == 'C07'  Instanciar Variaveis ExclusaoRN412Canal
    Run Keyword If  '${arg1}' == 'C08'  Instanciar Variaveis MudançaProdCanal
    Run Keyword If  '${arg1}' == 'C09'  Instanciar Variaveis MovCadTransfGrupoFamiliar
    Close Window


Gerar CAEPF
    Go To  ${GERADOR_URL}
    Click Button  xpath=//form[4]/input[2]
    ${caepf} =  Execute Javascript  return document.body.childNodes[0].nodeValue
    RETURN  ${caepf}

Gerar CNS
    Go To  ${GERADOR_URL}
    Click Button  xpath=//form[5]/input[2]
    ${cns} =  Execute Javascript  return document.body.childNodes[0].nodeValue
    RETURN  ${cns}

Gerar DNV
    Go To  ${GERADOR_URL}
    Click Button  xpath=//form[7]/input[2]
    ${dnv} =  Execute Javascript  return document.body.childNodes[0].nodeValue
    RETURN  ${dnv}

Remover Caracteres Especiais
    [Arguments]  ${arg1}
    ${arg1} =  Replace String  ${arg1}  Pinto  Bento
    ${arg1} =  Replace String  ${arg1}  - EI  EI
    ${arg1} =  Replace String  ${arg1}  - ME  ME
    ${arg1} =  Remove String  ${arg1}  .
    ${arg1} =  Remove String  ${arg1}  /
    ${arg1} =  Remove String  ${arg1}  -
    ${arg1} =  Remove String  ${arg1}  ,
    ${arg1} =  Remove String  ${arg1}  R$
    ${arg1} =  Remove String  ${arg1}  [
    ${arg1} =  Remove String  ${arg1}  ]
    ${arg1} =  Remove String  ${arg1}  '
    ${arg1} =  Replace String  ${arg1}  ç  c
    ${arg1} =  Replace String  ${arg1}  á  a
    ${arg1} =  Replace String  ${arg1}  é  e
    ${arg1} =  Replace String  ${arg1}  í  i
    ${arg1} =  Replace String  ${arg1}  ó  o
    ${arg1} =  Replace String  ${arg1}  ú  u
    ${arg1} =  Replace String  ${arg1}  â  a
    ${arg1} =  Replace String  ${arg1}  ê  e
    ${arg1} =  Replace String  ${arg1}  ô  o
    ${arg1} =  Replace String  ${arg1}  ã  a
    ${arg1} =  Replace String  ${arg1}  õ  o
    RETURN  ${arg1}

Remover Números da string
    [Arguments]  ${arg1}
    ${arg1} =  Remove String  ${arg1}  1
    ${arg1} =  Remove String  ${arg1}  2
    ${arg1} =  Remove String  ${arg1}  3
    ${arg1} =  Remove String  ${arg1}  4
    ${arg1} =  Remove String  ${arg1}  5
    ${arg1} =  Remove String  ${arg1}  6
    ${arg1} =  Remove String  ${arg1}  7
    ${arg1} =  Remove String  ${arg1}  8
    ${arg1} =  Remove String  ${arg1}  9
    ${arg1} =  Remove String  ${arg1}  0
    RETURN  ${arg1}

Colocar Data Formato Brasileiro
    [Arguments]  ${dtnasc}
    ${stringdt}  Convert To String  ${dtnasc}
    @{dt}        Split String  ${stringdt}  -
    ${data}      Catenate  ${dt[2]}  /  ${dt[1]}  /  ${dt[0]}
    ${data}      Remove String  ${data}  ${SPACE}
    RETURN     ${data}

Remover Caracteres Especiais de Telefone 
    [Arguments]  ${tel}
    ${tel}      Remove String  ${tel}  ${SPACE}
    ${tel}      Remove String  ${tel}  -  (  )  /
    ${tel}      Get Substring  ${tel}  -11
    RETURN  ${tel}

Remover Caracteres Especiais (ID Contratante)
    [Arguments]  ${arg1}
    ${arg1} =  Remove String  ${arg1}  -0
    ${arg1} =  Remove String  ${arg1}  -
    RETURN  ${arg1}

clickWait
    [Arguments]  ${element}  ${waitElement}
    FOR  ${ITEM}  IN RANGE  0  10
        Run Keyword and Ignore Error  Wait Until Element Is Visible  ${element}  ${timeout}
        Run Keyword and Ignore Error  Click Element  ${element}
        ${progress}  Run Keyword and Ignore Error  Wait Until Element Is Visible  ${waitElement}  ${timeout}
        Exit For Loop If  '${progress[0]}'=='PASS'
    END
    

# Limpar Variaveis
#     ${DADOS_BENEF}  Create List
#     ${DADOS_BENEF_DEPENDENTE}  Create List
#     ${DADOS_CONTA}  Create List
#     ${DADOS_CONTRATO}  Create List
#     ${TIPO_CONTA}   Create List
#     ${QUERY_C}  Create List
#     ${QUERY_B}  Create List
#     ${QUERY_E}  Create List
#     ${QUERY_D}  Create List
#     ${QUERY_BI}  Create List
#     ${QUERY_EI}     Create List
#     ${QUERY_MOV}    Create List
#     ${QUERY_UPDATE_PARAM_GERAL}     Create List
#     ${QUERY_EXC_CONTRATO}   Create List
#     ${QUERY_COUNT_FILA_AGEND}   Create List
#     ${DATA_MOV}     Create List
#     ${QUERY_DATA_MOV_CAD1}  Create List
#     ${ID_MOVIMENTACAO_CADASTRAL}    Create List
#     ${QUERY_DATA_MOV_CAD2}  Create List
#     ${QUERY_DATA_TITULAR}   Create List
    

Fechar Nav
    Capture Page Screenshot
    Close All Browsers
