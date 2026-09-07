*** Settings ***
Resource    ../../../main.resource

*** Variables ***
${SLEEP} =  0
${TIMEOUT} =  30
${NOME_OPORTUNIDADE} =  xpath://*[@id="name"]
${NUMERO_VIDAS} =  xpath://*[@id="amount"]
${TIPO} =  xpath://*[@id="opportunity_type"]
${DATA_PREVISTA} =  xpath://*[@id="date_closed"]
${NOME_CONTA} =  xpath://*[@id="account_id"]/following-sibling::span
${NOME_CONTA_OUTRO} =    xpath=//*[@id="account_name"]
#${NOME_CONTA} =  xpath://*[@id="account_name_label"]//..//..//td[4]/span
${BOTAO_CONTA} =  xpath://*[@id="btn_account_name"]
${BOTAO_SALVAR_OPORTUNIDADE} =  css:#SAVE_HEADER
${CHECK_PRODUTO_PF_PJ} =  xpath://*[@id="produtos_pf_pj_c"]
${NOME_CONTA_FANTASIA} =  xpath://*[@id="account_id"]
#${NOME_CONTA_FANTASIA} =  xpath://*[@id="Default_Opportunities_Subpanel"]/tbody/tr[1]/td[4]/span
${INPUT_NOME_CONTA} =  id:account_id
${ORIGEM_POTENCIAL} =  xpath://*[@id="origem_pai"]

*** Keywords ***
Verificar Tela de Cadastro Oportunidades
    Wait Until Page Contains  Oportunidades » Criar  timeout=${TIMEOUT}

Verificar se o campo Nome Conta está preenchido com  
    [Arguments]  ${arg1}   
    ${field_nome} =  Run Keyword And Return Status    Element Should Be Visible    ${BOTAO_CONTA}
    IF    ${field_nome} == True
        ${nomeconta} =  Get Value  ${NOME_CONTA_OUTRO}
    ELSE
        ${nomeconta} =  Get Text  ${NOME_CONTA}
    END
    ${arg1} =  Convert To Uppercase  ${arg1[1]}
    ${v}  Run Keyword And Ignore Error  Should Be Equal  ${nomeconta}  ${arg1}
    ${valuenomeconta}  Run Keyword If  "${v[0]}" == "FAIL"  Get Value  ${INPUT_NOME_CONTA}
    Run Keyword If  "${v[0]}" == "FAIL"  Should Be Equal  ${valuenomeconta}  ${arg1}

Verificar se o compo Nome Conta Fantasia está preenchido com
    [Arguments]  ${arg1}  
    ${nomeconta} =  Get Value  ${NOME_CONTA_FANTASIA}
    ${arg1} =  Convert To Uppercase  ${arg1[1]}
    ${v}  Run Keyword And Ignore Error  Should Be Equal  ${nomeconta}  ${arg1}
    ${valuenomeconta}  Run Keyword If  "${v[0]}" == "FAIL"  Get Value  ${INPUT_NOME_CONTA}
    Run Keyword If  "${v[0]}" == "FAIL"  Should Be Equal  ${valuenomeconta}  ${arg1}

Verificar se o campo Nome Oportunidade está preenchido com  
    [Arguments]  ${arg1}
    ${nomeoportunidade} =  Get Value  ${NOME_OPORTUNIDADE}
    ${arg1} =  Remover Caracteres Especiais  ${arg1[1]}
    ${arg1} =  Convert To Uppercase  ${arg1}
    Should Be Equal  ${nomeoportunidade}  ${arg1}

Verificar se o campo Nome Oportunidade CNPJ está preenchido com  
    [Arguments]  ${arg1}
    ${nomeoportunidade} =  Get Value  ${NOME_OPORTUNIDADE}
    ${arg1} =  Remover Caracteres Especiais  ${arg1[1]}
    ${arg1} =  Convert To Uppercase  ${arg1}
    ${arg1} =  Remover Números da string  ${arg1}
    ${arg1} =  Replace String    ${arg1}    "CONTA "    ${EMPTY}
    Should Be Equal As Strings  ${nomeoportunidade}  ${arg1}

Verificar se o campo Data Prevista está preenchido com  
    [Arguments]  ${arg1}
    ${dataprevista} =  Get Value  ${DATA_PREVISTA}
    Should Be Equal  ${dataprevista}  ${arg1}

Preencher Nome Oportunidade com
    [Arguments]  ${arg1}
    Input Text  ${NOME_OPORTUNIDADE}  ${arg1}
    Sleep  ${SLEEP}

Preencher Número de Vida Com
    [Arguments]  ${arg1}
    Input Text  ${NUMERO_VIDAS}  ${arg1}
    Sleep  ${SLEEP}
    

Preencher Origem do Potencial
    Select From List By Label    xpath=//select[@id='origem_pai']       Auto Gerado
    Sleep  ${SLEEP}

Colocar Tipo com
    [Arguments]  ${arg1}
    Select From List By Label  ${TIPO}  ${arg1}

Colocar Origem de Vida
    [Arguments]  ${arg1}
    ${STATE} =    Run Keyword And Return Status    Page Should Contain    ${ORIGEM_POTENCIAL}
    IF    ${STATE} == True
        Select From List By Label  ${ORIGEM_POTENCIAL}  ${arg1}
        Sleep  ${SLEEP}
    END

Preencher Data Prevista Com
    [Arguments]  ${arg1}
    Input Text  ${DATA_PREVISTA}  ${arg1}
    Sleep  ${SLEEP}

Marcar a Opção Demonstrou interesse em produtos PF e PJ?
    Select Checkbox  ${CHECK_PRODUTO_PF_PJ}

Apertar no Botão Buscar Conta
    Click Button  ${BOTAO_CONTA}

Apertar Botão Salvar Oportunidade
    Click Element  ${BOTAO_SALVAR_OPORTUNIDADE}