*** Settings ***
Library     SeleniumLibrary
Library     String
Resource    ../../../main.resource
*** Variables ***
${SLEEP} =  0
${TIMEOUT} =  30
${CNPJ_CPF_CAEPF_CONTRATO} =  id:conta_documento
${NOME_DA_CONTA_CONTRATO} =  id:conta_nome
${TITULO_CONTRATO} =  xpath://*[@id="name"]
${CONTA_CONTRATO} =  xpath://*[@id="Default_AOS_Contracts_Subpanel"]/tbody/tr[3]/td[4]/span
${DATA_VIGENCIA} =  id:start_date
${DIA_VENCIMENTO_C} =  id:dia_vencimento_c
${FORMA_COBRANCA_C} =  id:forma_cobranca_c
${BOTAO_SALVAR_CONTRATO} =  id:SAVE_HEADER
${CRIAR_BENEFICIARIOS} =  id:saude_BENEFICIARIOS_criar_button
${CODIGO_AGRUPADOR} =  id:codigo_agrupador_c
${LABEL_INTEGRACAO_AUTOMATICA} =  id:mov_exclusao_integracao_auto_c_label
${INTEGRACAO_AUTOMATICA_EXCLUISAO} =  id:mov_exclusao_integracao_auto_c

*** Keywords ***
Verificar Tela de Cadastro Contratos
    ${v}  Run Keyword And Ignore Error  Wait Until Page Contains  Contratos » Criar  timeout=${TIMEOUT}
    
Verificar se o campo Titulo contrato está preenchido com  
    [Arguments]  ${arg1}
    Sleep  3s
    ${titulocontrato} =  Get Value  id:name
    ${arg1} =  Convert To Uppercase  ${arg1}
    ${v}  Run Keyword And Ignore Error  Should Be Equal  ${titulocontrato}  ${arg1}
    ${valuetitulocontrato}  Run Keyword If  "${v[0]}" == "FAIL"  Get Text  id:name
    Run Keyword If  "${v[0]}" == "FAIL"  Should Be Equal  ${valuetitulocontrato}  ${arg1}
    
Verificar se o campo Conta contrato está preenchido com  
    [Arguments]  ${arg1}
    ${v}  Run Keyword And Ignore Error  ${contacontrato} =  Get Text  ${CONTA_CONTRATO}
    Run Keyword If  "${v[0]}" == "PASS"  ${arg1} =  Convert To Uppercase  ${arg1}
    Run Keyword If  "${v[0]}" == "PASS"  Should Be Equal  ${contacontrato}  ${arg1}


Preencher o campo CNPJ/CPF/CAEPF
    [Arguments]  ${arg1}
    Input Text  ${CNPJ_CPF_CAEPF_CONTRATO}  ${arg1}
    Sleep  ${SLEEP}

Preencher o campo Nome da Conta
    [Arguments]  ${arg1}
    Input Text  ${NOME_DA_CONTA_CONTRATO}  ${arg1}
    Sleep  ${SLEEP}

Colocar o tipo como Potencial Cliente (PF)
    # Selecionar Tipo de Pessoa
    Wait Until Element Is Visible    xpath=//select[@id="conta_tipo"]
    Select From List By Label  xpath=//select[@id="conta_tipo"]  Cliente (PF)
    Sleep  ${SLEEP}

Preencher o campo Data de Vigencia
    [Arguments]  ${arg1}
    ${c}  Run Keyword And Ignore Error   Execute Javascript  document.getElementById('start_date').value="${arg1}"
    #Input Text  ${DATA_VIGENCIA}  ${arg1}
    Sleep  ${SLEEP}

Preencher o campo Codigo Agrupador
    [Arguments]  ${arg1}
    ${c}  Run Keyword And Ignore Error   Set Focus To Element  ${CODIGO_AGRUPADOR}
    Run Keyword If  "${c[0]}" == "PASS"  Execute Javascript  document.getElementById('codigo_agrupador_c').value="${arg1}"
    Sleep  ${SLEEP}

Preencher o campo Dia de Vencimento
    [Arguments]  ${arg1}
    ${c}  Run Keyword And Ignore Error   Set Focus To Element  ${DIA_VENCIMENTO_C}
    Run Keyword If  "${c[0]}" == "PASS"  Click Element  ${DIA_VENCIMENTO_C}
    Run Keyword If  "${c[0]}" == "PASS"  Input Text  ${DIA_VENCIMENTO_C}  ${arg1}
    Sleep  ${SLEEP}

Colocar Forma de Cobrança com
    [Arguments]  ${arg1}
    ${c}  Run Keyword And Ignore Error   Select From List By Label  ${FORMA_COBRANCA_C}  ${arg1}
    

Clicar em Salvar Contrato
    Sleep  5s
    ${c}  Run Keyword And Ignore Error   Set Focus To Element  ${BOTAO_SALVAR_CONTRATO}
    Run Keyword If  "${c[0]}" == "PASS"  Sleep  3s
    Run Keyword If  "${c[0]}" == "PASS"  Execute Javascript   document.getElementById("SAVE_HEADER").click()

Apresentar a Modal de Preencher Endereço residencial
    ${r}  Run Keyword And Ignore Error   Wait Until Page Contains  O contratante não possui endereço residencial cadastrado, clique em “sim” para cadastrar o endereço.
    Run Keyword If  "${r[0]}" == "PASS"  PotencialClienteCadastro.Apertar Botão Não do Modal

Apresentar a Modal de Preencher Endereço comercial
    ${c}  Run Keyword And Ignore Error   Wait Until Page Contains  O contratante não possui endereço comercial cadastrado, clique em “sim” para cadastrar o endereço.
    Run Keyword If  "${c[0]}" == "PASS"  PotencialClienteCadastro.Apertar Botão Não do Modal

Movimentação de Exclusão – Integração automática (Ativa)
    Set Focus To Element  ${LABEL_INTEGRACAO_AUTOMATICA}
    Select From List By Label  ${INTEGRACAO_AUTOMATICA_EXCLUISAO}  Sim
    Sleep  2s