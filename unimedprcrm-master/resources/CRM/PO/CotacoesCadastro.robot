*** Settings ***
Library     SeleniumLibrary
Library     String
Library     DebugLibrary
Resource    ../../../main.resource
*** Variables ***
${SLEEP} =  0
${TIMEOUT} =  30
${TITULO_COTACAO_CRIAR} =  xpath://*[@id="pagecontent"]/div[1]/h2
${TIT_CARREGAMENTO} =  xpath://*[@id="loadingPage"]/b
${COT_CONTA_TIPO} =  xpath://*[@id="conta_tipo"]
${COT_CONTA_NOME_CONTA} =  xpath://*[@id="conta_nome"]
${COT_OPO_DATA_PREV} =  xpath://*[@id="oportunidade_data_prevista"]
${COT_OPO_TIPO} =  xpath://*[@id="oportunidade_tipo"]
${COT_OPO_NUM_VIDA} =  xpath://*[@id="oportunidade_numero_vidas"]
${COT_OPO_CHECK_PRODUTO_PF_PJ} =  xpath://*[@id="oportunidade_produtos_pf_pj"]
${COT_BOTAO_PLANO} =  xpath://*[@id="label_plano"]/div/div/button
${COT_BOTAO_PROD_ASSIST} =  xpath://*[@id="label_assistencial"]/div/div/button
${COT_NOME_PROD_ASSIST} =  xpath://*[@id="label_assistencial"]/div/div/div/div/input
${COT_NOME_PLANO} =  xpath://*[@id="label_plano"]/div/div/div/div/input
${COT_PROD_ASSIST_RES} =  xpath://*[@id="label_assistencial"]/div/div/div/ul/li[3]/label/span
${COT_PLANO_RES} =  xpath://*[@id="label_plano"]/div/div/div/ul/li[3]/label/span
${COT_FASE_COTACAO} =  xpath://*[@id="stage"]
${COT_TITULO} =  xpath://*[@id="name"]
${COT_TIPO_CONTRATACAO} =  xpath://*[@id="tipo_de_contratacao_c"]
${COT_TIPO_COTACAO} =  id:tipo_de_cotacao_c
${Data_Indice}
${ID_PROD}
${COT_BT_SALVAR} =  xpath://input[@id='SAVE_HEADER']
${COT_MODAL_CONFIRMACAO} =  xpath://*[@id="confirmar_conclusao_h"]
${COT_BT_SIM_MODAL_CONFIRMACAO} =  xpath://*[@id="yui-gen0"]
${COT_BT_CONVENIO} =  xpath://*[@id="btn_convenio_c"]
${COT_CONVENIO} =  xpath://*[@id="convenio_c"]
${COT_ACESSORIO_RESGATEAIR} =  xpath://td[text()[contains(.,'RESGATE AIR')]]/input[3]
${COT_ACESSORIO_KITSEGUROPESSOAFISICA} =    xpath://td[text()[contains(.,'KIT SEGURO PF')]]/input[3]
${COT_ACESSORIO_KITSEGUROPESSOAJURIDICA} =  xpath://td[text()[contains(.,'KIT SEGURO PJ')]]/input[3]
${COT_PROD_TIPO_NEGOCIACAO_5050} =  xpath://*[@id="desconto_acrescimo_5050"]
${COT_INPUT_TITULO} =  xpath://*[@id="name"]
${INPUT_TOTAL_FAMILIAS} =  id:total_de_familias_c
${COT_TIPO_LAYOUT} =  id:layout_adesao_c
${FIXAR_TABELA_PRECO_POR_VIDAS} =  id:fixar_tabela_preco_c
${FAIXA_A_SER_FIXADA} =  id:vidas_para_fixar
${SALVAR_TABELA_COMPLETA} =  xpath://*[@id="modalTabelaCompleta"]/div/div/div[3]/button[contains(.,'Salvar')]
${RADIO_FAIXA_ETARIA} =  id:faixa
${VALOR_PRIMEIRA_FAIXA} =  id:primeira_faixa
${INPUT_VALOR_FINAL} =  id:valor_final_modal
${LABEL_FAIXA_FINAL} =  xpath://*[@id="conteudo_calcula_valor"]/div[3]/label[1]
${VALOR_FINAL_ACRESCIMO} =  id:valor_final_acrescimo
${BOTAO_APLICAR_VALOR} =  id:aplicar_valor
${BOTAO_CANCELAR_VALOR} =  id:cancelar_calcular
${INPUT_DESC_ACESSORIO_RESGATEAIR} =  xpath://*[@id="desc_acessorio_7de15142-4034-e27e-faea-607d92051431"]
${INPUT_ACRES_ACESSORIO_KIT_SEGURO_PESSOA_JURIDICA} =  xpath://*[@id="acre_acessorio_3c05d524-191b-852a-d8f8-607d92c71403"]
${INPUT_ACRES_ACESSORIO_KIT_SEGURO_PESSOA_FISICA} =  xpath://*[@id="acre_acessorio_3c05d524-191b-852a-d8f8-607d92c71403"]
${INPUT_VALIDO_ATE} =  id:expiration

*** Keywords ***
Verificar Página Cotações Criar
     Wait Until Element Contains  ${TITULO_COTACAO_CRIAR}   Cotações » Criar   timeout=${TIMEOUT}
     Verificar se o alerta não aparece

Apertar Plano
     Sleep  4
     Set Focus To Element  ${COT_BOTAO_PLANO}
     Click Element  ${COT_BOTAO_PLANO}

Apertar Produto Assistencial
     Sleep  4
     Set Focus To Element  ${COT_BOTAO_PROD_ASSIST}
     Click Element  ${COT_BOTAO_PROD_ASSIST}

Verificar se os Produtos Assistenciais estão apresentando em tela
     Wait Until Element Is Visible  ${COT_PROD_ASSIST_RES}  timeout=${TIMEOUT}

Selecionar o Produto Assitencial
     [Arguments]  ${arg1}
     ${COT_BT_PROD}  Catenate  SEPARATOR=  xpath://span[text()='  ${arg1}  ']
     Click Element  ${COT_BT_PROD}

Selecionar o Plano
     [Arguments]  ${arg1}
     ${COT_BT_PLANO}  Catenate  SEPARATOR=  xpath://span[text()='  ${arg1}  ']
     Click Element  ${COT_BT_PLANO}

Verificar se a tabela do Produto Assistencial está aparecendo
     [Arguments]  ${arg1}
     ${produto_assistencial}  Split String    ${arg1}
     Wait Until Page Contains  ${produto_assistencial[0]}  timeout=${TIMEOUT}


Selecionar Tipo de Conta com
     [Arguments]  ${arg1}
     Wait Until Element Is Visible  ${COT_CONTA_TIPO}  timeout=${TIMEOUT}
     Set Focus To Element  ${COT_CONTA_TIPO}
     Select From List By Label  ${COT_CONTA_TIPO}  ${arg1}

Preencher Nome da Conta
     [Arguments]  ${arg1}
     Input Text  ${COT_CONTA_NOME_CONTA}  ${arg1}  clear=True

Preencher Data Prevista da Oportunidade
     [Arguments]  ${arg1}
     Clear Element Text  ${COT_OPO_DATA_PREV}
     Execute Javascript  document.getElementById('oportunidade_data_prevista').value="${arg1}"
     #Input Text  ${COT_OPO_DATA_PREV}  ${arg1}  clear=True

Selecionar a Tipo da Oportunidade
     [Arguments]  ${arg1}
     Set Focus To Element  ${COT_OPO_TIPO}
     Select From List By Label  ${COT_OPO_TIPO}  ${arg1}

Preencher Número de Vidas da Oportunidade
     [Arguments]  ${arg1}
     Input Text  ${COT_OPO_NUM_VIDA}  ${arg1}  clear=True

Preencher Título
     [Arguments]  ${arg1}
     Input Text  ${COT_TITULO}  ${arg1}  clear=True

Preencher Valido Até
     [Arguments]  ${arg1}
     Input Text  ${INPUT_VALIDO_ATE}  ${arg1}  clear=True

Selecionar Tipo de Contratação com
     [Arguments]  ${arg1}
     Set Focus To Element  ${COT_TIPO_CONTRATACAO}
     Select From List By Label  ${COT_TIPO_CONTRATACAO}  ${arg1}
     Sleep  3s

Selecionar Base Quantidade Vidas Mensalidade com
     [Arguments]  ${arg1}
     Set Focus To Element  ${COT_TIPO_COTACAO}
     Select From List By Label  ${COT_TIPO_COTACAO}  ${arg1}
     Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
     Run Keyword And Ignore Error  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


Selecionar Fixar tabela de preço por faixa de vida com
     [Arguments]  ${arg1}
     Set Focus To Element  ${FIXAR_TABELA_PRECO_POR_VIDAS}
     Select From List By Label  ${FIXAR_TABELA_PRECO_POR_VIDAS}  ${arg1}


Clicar no botão "DEFINIR FAIXA DE VIDAS PARA FIXAR" e selecionou o segundo registro
     Set Focus To Element  xpath://*[@id="plano_produto_${ID_PROD}"]/div[1]/button
     Click Element    xpath://*[@id="plano_produto_${ID_PROD}"]/div[1]/button
     Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
     Run Keyword And Ignore Error  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    
     Wait Until Page Contains    Tabela de Preço Completa
     Set Focus To Element  ${FAIXA_A_SER_FIXADA}
     Select From List By Label  ${FAIXA_A_SER_FIXADA}  1 - 4 vidas
     ${faixa_vida_fixada_definida}   Get Value  xpath://*[@id="vidas_para_fixar"]/option[1]

     Set Focus To Element  ${SALVAR_TABELA_COMPLETA}
     Click Element    ${SALVAR_TABELA_COMPLETA}
     Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
     Run Keyword And Ignore Error  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
     ${faixa_vida_fixada}   Get Value  xpath://*[@id="valor_faixa_fixada_label_${ID_PROD}"]
     Should Be Equal   ${faixa_vida_fixada_definida}  ${faixa_vida_fixada}



Selecionar Tipo de Layout
     [Arguments]  ${arg1}
     Set Focus To Element  ${COT_TIPO_LAYOUT}
     Select From List By Label  ${COT_TIPO_LAYOUT}  ${arg1}


Preencher campo "Total de Familias" com
     [Arguments]  ${arg1}
     Set Focus To Element  ${INPUT_TOTAL_FAMILIAS}
     Input Text  ${INPUT_TOTAL_FAMILIAS}  ${arg1}

Marcar a Opção Demonstrou interesse em produtos PF e PJ?
     Select Checkbox  ${COT_OPO_CHECK_PRODUTO_PF_PJ}

Preencher Nome do Produto Assistencial na pesquisa
     [Arguments]  ${arg1}
     Input Text  ${COT_NOME_PROD_ASSIST}  ${arg1}  clear=True

Preencher Nome do Plano na pesquisa
    [Arguments]  ${arg1}
    Input Text  ${COT_NOME_PLANO}  ${arg1}  clear=True

Preencher Faixa etária com
     [Arguments]  ${arg1}
     ${numprod} =	Get Substring	${ID_PROD}  0  4
     ${COT_PROD_ASSIST_0_FAIXAETA}  Catenate  SEPARATOR=  xpath://*[@id="qtde_0_  ${numprod}  "]
     Input Text  ${COT_PROD_ASSIST_0_FAIXAETA}  ${arg1}  clear=True

Preencher o tipo de Negociação
     [Arguments]  ${arg1}
     ${numprod} =	Get Substring	${ID_PROD}  0  4
     ${COT_PROD_TIPO_NEGOCIACAO}  Catenate  SEPARATOR=  xpath://*[@id="desconto_acrescimo_  ${numprod}  "]
     Set Focus To Element  ${COT_PROD_TIPO_NEGOCIACAO}
     Select From List By Value  ${COT_PROD_TIPO_NEGOCIACAO}  ${arg1}

Preencher Valor da Negociação
     [Arguments]  @{arg1}
     Log Many  @{arg1}
     Run Keyword If      '${arg1[0]}' == 'desconto'      Preencher Desconto com   ${arg1[1]}
     Run Keyword If      '${arg1[0]}' == 'acrescimo'     Preencher Acrescimo com  ${arg1[1]}
     Run Keyword If      '${arg1[0]}' == 'calcula'       Preencher Calcula Valor com  ${arg1[1]}
     
Preencher Desconto com
     [Arguments]  ${arg1}
     #    Valor Mensalidade Base
     Sleep  5s
     ${vlr_mensalidade_base}  Catenate  SEPARATOR=  xpath://*[@id="valor_assistencial_0-18_  ${ID_PROD}  "]
     ${vlr} =  Get Value   ${vlr_mensalidade_base}
     ${vlr_base} =  Remove String  ${vlr}  R$
     ${vlr_base} =  Replace String  ${vlr_base}  ${space}  ${empty}
     ${vlr_base} =  Remove String  ${vlr_base}  ,
     ${vlr_base}    Convert To Number   ${vlr_base}  0
     Log Many  ${vlr_base}
     #    Valor Acessórios
     ${vlr_acessorio}  Catenate  SEPARATOR=  xpath://*[@id="valor_acessorio_unitario_0-18_  ${ID_PROD}  "]
     ${vlr} =  Get Value   ${vlr_acessorio}
     ${vlr_acessorio} =  Remove String  ${vlr}  R$ 
     ${vlr_acessorio} =  Replace String  ${vlr_acessorio}  ${space}  ${empty}
     ${vlr_acessorio} =  Remove String  ${vlr_acessorio}  ,
     ${vlr_acessorio}    Convert To Number  ${vlr_acessorio}  0
     Log Many  ${vlr_acessorio}
     #    Preencher % Desconto
     ${campo_desc}  Catenate  SEPARATOR=  xpath://*[@id="desc_  ${ID_PROD}  "]
     Click Element    ${campo_desc}
     Input Text  ${campo_desc}  ${arg1}    
     Click Element   ${vlr_mensalidade_base}
     #    Mensalidade Base (Ajustada)
     Sleep  5s
     ${vlr_base_ajustada}  Catenate  SEPARATOR=  xpath://*[@id="valor_assistencial_desc_0-18_  ${ID_PROD}  "]
     ${vlr} =  Get Value   ${vlr_base_ajustada}
     ${vlr_base_ajustada} =  Remove String  ${vlr}  R$
     ${vlr_base_ajustada} =  Replace String  ${vlr_base_ajustada}  ${space}  ${empty}
     ${vlr_base_ajustada} =  Remove String  ${vlr_base_ajustada}  ,
     ${vlr_base_ajustada}    Convert To Number   ${vlr_base_ajustada}  0
     Log Many  ${vlr_base_ajustada}
     #    Validação Calculo do desconto
     ${porc} =  Evaluate  ${arg1} / 100
     ${porc}    Convert To Number   ${porc}
     ${calc} =  Evaluate  ${vlr_base} * ${porc}
     ${calc} =  Evaluate  ${vlr_base} - ${calc}
     Log  ${calc}
     ${calc} =  Evaluate  float(round(${calc}))
     ${calc}  Convert To Number   ${calc}  0
     #${valor}  Evaluate  f'{str(${calc}).split(".")[0]}.{str(${calc}).split(".")[1][0:1]}'
     Should Be Equal    ${vlr_base_ajustada}    ${calc}    msg= Valores não estão corretos!
     

Preencher Acrescimo com
     [Arguments]  ${arg1}
     #    Valor Mensalidade Base
     Sleep  5s
     ${vlr_mensalidade_base}  Catenate  SEPARATOR=  xpath://*[@id="valor_assistencial_0-18_  ${ID_PROD}  "]
     ${vlr} =  Get Value   ${vlr_mensalidade_base}
     ${vlr_base} =  Remove String  ${vlr}  R$
     ${vlr_base} =  Replace String  ${vlr_base}  ${space}  ${empty}
     ${vlr_base} =  Remove String  ${vlr_base}  ,
     ${vlr_base}    Convert To Number   ${vlr_base}  0
     Log Many  ${vlr_base}
     #    Valor Acessórios
     ${vlr_acessorio}  Catenate  SEPARATOR=  xpath://*[@id="valor_acessorio_unitario_0-18_  ${ID_PROD}  "]
     ${vlr} =  Get Value   ${vlr_acessorio}
     ${vlr_acessorio} =  Remove String  ${vlr}  R$
     ${vlr_acessorio} =  Replace String  ${vlr_acessorio}  ${space}  ${empty}
     ${vlr_acessorio} =  Remove String  ${vlr_acessorio}  ,
     ${vlr_acessorio}    Convert To Number   ${vlr_acessorio}  0
     Log Many  ${vlr_acessorio}
     #    Preencher % Acrescimo
     ${campo_acr}  Catenate  SEPARATOR=  xpath://*[@id="acr_  ${ID_PROD}  "]
     Click Element   ${campo_acr} 
     Input Text  ${campo_acr}  ${arg1}
     Click Element   ${vlr_mensalidade_base}
     #    Mensalidade Base (Ajustada)
     Sleep  5s
     ${vlr_base_ajustada}  Catenate  SEPARATOR=  xpath://*[@id="valor_assistencial_desc_0-18_  ${ID_PROD}  "]
     ${vlr} =  Get Value   ${vlr_base_ajustada}
     ${vlr_base_ajustada} =  Remove String  ${vlr}  R$
     ${vlr_base_ajustada} =  Replace String  ${vlr_base_ajustada}  ${space}  ${empty}
     ${vlr_base_ajustada} =  Remove String  ${vlr_base_ajustada}  ,
     ${vlr_base_ajustada}    Convert To Number   ${vlr_base_ajustada}  0
     Log Many  ${vlr_base_ajustada}
     #    Validação Calculo do desconto
     ${porc} =  Evaluate  ${arg1} / 100
     ${porc} =  Evaluate  ${porc} + 1
     ${porc}    Convert To Number   ${porc}
     ${calc} =  Evaluate  ${vlr_base} * ${porc}
     Log  ${calc}
     ${calc} =  Evaluate  float(round(${calc}))
     ${calc}  Convert To Number   ${calc}  0
     #${valor}  Evaluate  f'{str(${calc}).split(".")[0]}.{str(${calc}).split(".")[1][0:1]}'
     Should Be Equal    ${vlr_base_ajustada}    ${calc}    msg= Valores não estão corretos!


Preencher Calcula Valor com
     [Arguments]  ${arg1}
     Wait Until Page Contains  Calcular Valor
     Sleep  5s
     Click Element     ${BOTAO_CANCELAR_VALOR}
     Sleep  5s
     Preencher o tipo de Negociação  calcula
     Wait Until Page Contains  Calcular Valor
     Sleep  5s
     Set Focus To Element  ${RADIO_FAIXA_ETARIA}
     Click Element  ${RADIO_FAIXA_ETARIA}
     Wait Until Page Contains  Valor Primeira Faixa:
     ${vlr_primeira_faixa}  Get Text  ${VALOR_PRIMEIRA_FAIXA}
     Input Text  ${INPUT_VALOR_FINAL}  ${arg1}
     Sleep  3s
     Repeat Keyword  2 times  Click Element  ${LABEL_FAIXA_FINAL}
     Wait Until Page Contains  Acréscimo de:
     Sleep  8s
     ${vlr_final_acrescimo}  Get Text  xpath://*[@id="valor_final_acrescimo"]
     ${vlr_final_acrescimo} =  Remove String  ${vlr_final_acrescimo}  %
     Set Focus To Element  ${BOTAO_APLICAR_VALOR}
     Execute Javascript   document.getElementById("aplicar_valor").click()
     Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
     Run Keyword And Ignore Error  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
     ${vlr} =  Get Value   xpath://*[@id="acr_${ID_PROD}"]
     Should Be Equal    ${vlr}      ${vlr_final_acrescimo}
    

Sem desconto e Acrescimo
    ${campo_desc}  Catenate  SEPARATOR=  xpath://*[@id="desc_  ${ID_PROD}  "]
    Click Element    ${campo_desc}
    ${campo_acr}  Catenate  SEPARATOR=  xpath://*[@id="acr_  ${ID_PROD}  "]
    Click Element    ${campo_acr}

Selecionar o campo Fase de Cotação com
     [Arguments]  ${arg1}
     Set Focus To Element  ${COT_FASE_COTACAO}
     Log To Console    "Selecionar o campo com o argumento 08"
     Select From List By Label  ${COT_FASE_COTACAO}  ${arg1}

Deselecionar os Acessorios do Produto Assistencial
     Unselect Checkbox  ${COT_ACESSORIO_RESGATEAIR}
     ${pf}  Run Keyword And Ignore Error  Select Checkbox  ${COT_ACESSORIO_KITSEGUROPESSOAFISICA}
     Run Keyword If  "${pf[0]}" == "FAIL"  Select Checkbox  ${COT_ACESSORIO_KITSEGUROPESSOAJURIDICA}


Selecionar os Acessorios do Produto Assistencial
     Select Checkbox  ${COT_ACESSORIO_RESGATEAIR}
     ${pf}  Run Keyword And Ignore Error  Select Checkbox  ${COT_ACESSORIO_KITSEGUROPESSOAFISICA}
     Run Keyword If  "${pf[0]}" == "FAIL"  Select Checkbox  ${COT_ACESSORIO_KITSEGUROPESSOAJURIDICA}


Preencher Desconto dos Acessorios do Produto Assistencial
     [Arguments]  ${arg1}
     Select Checkbox  ${COT_ACESSORIO_RESGATEAIR}
     Input Text  ${INPUT_DESC_ACESSORIO_RESGATEAIR}  ${arg1}


Preencher Acrescimo dos Acessorios do Produto Assistencial
     [Arguments]  ${arg1}
     ${pf}  Run Keyword And Ignore Error  Select Checkbox  ${COT_ACESSORIO_KITSEGUROPESSOAFISICA}
     Run Keyword If  "${pf[0]}" == "PASS"  Input Text  ${INPUT_ACRES_ACESSORIO_KIT_SEGURO_PESSOA_FISICA}  ${arg1}
     
     ${pj}  Run Keyword And Ignore Error  Select Checkbox  ${COT_ACESSORIO_KITSEGUROPESSOAJURIDICA}
     Run Keyword If  "${pj[0]}" == "PASS"  Input Text  ${INPUT_ACRES_ACESSORIO_KIT_SEGURO_PESSOA_JURIDICA}  ${arg1}


Apertar em Aprovar Cotação
     ${arg}  Catenate  SEPARATOR=  xpath://*[@id="btn_aprovar_  ${ID_PROD}  "]
     Set Focus To Element  ${arg}
     Click Element  ${arg}

Atribuir Valor de referencia do Produto
     [Arguments]  ${arg}
     ${produto_assistencial}  Split String    ${arg}
     #${COT_PROD_ADICIONADO_REF}  xpath://span[contains(text(),${produto_assistencial[0]}"]/../input[2]
     ${Data_Indice}  Get Element Attribute  xpath://span[contains(.,'${produto_assistencial[0]}')]/../input[2]  data-indice
     ${ID_PROD}  Get Element Attribute  xpath://span[contains(.,'${produto_assistencial[0]}')]/../input[2]  id
     Set Test Variables  ${Data_Indice}
     Set Test Variables  ${ID_PROD}

Apertar Botão Salvar Cotação
     Repeat Keyword  3 times  Press Keys  None  HOME
     Set Focus To Element  ${COT_BT_SALVAR}
     #Click Element  ${COT_BT_SALVAR}
     Sleep  5s
     Execute Javascript  document.getElementById("SAVE_HEADER").click()

Apertar Botão Consultar Convênio
     Click Element  ${COT_BT_CONVENIO}

Verificar se o alerta não aparece
     Wait Until Element Is Not Visible  ${TIT_CARREGAMENTO}  timeout=${TIMEOUT}

Apresenta a modal de confirmação
     Wait Until Element Is Visible  ${COT_MODAL_CONFIRMACAO}  timeout=${TIMEOUT}
     Wait Until Page Contains  Deseja mesmo concluir a cotação? A mesma não poderá ser alterada posteriormente.

Apertar o Botão Sim da Modal de Confirmação
     Click Element  ${COT_BT_SIM_MODAL_CONFIRMACAO}

Preencher o titulo da cotação
    [Arguments]  ${arg1}
    Wait Until Element Is Visible    ${COT_INPUT_TITULO}
    Sleep  6s
    ${arg1}  Get From List  ${arg1}  0
    ${arg1}  Remove String  ${arg1}  [  '  ]
    ${arg1}  Convert To Upper Case  ${arg1}
    Input Text  ${COT_INPUT_TITULO}  ${arg1}  clear=True


Preencher o tipo de Negociação com "Coletivo Empresarial"
     Set Focus To Element  ${COT_TIPO_CONTRATACAO}
     Select From List By Label  ${COT_TIPO_CONTRATACAO}  Coletivo Empresarial
     ${c}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
     Run Keyword If  "${c[0]}" == "PASS"  Run Keyword And Ignore Error  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


Preencher o tipo de Negociação com "Coletivo por Adesão"
     Set Focus To Element  ${COT_TIPO_CONTRATACAO}
     Select From List By Label  ${COT_TIPO_CONTRATACAO}  Coletivo por Adesão
     ${c}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
     Run Keyword If  "${c[0]}" == "PASS"  Run Keyword And Ignore Error  Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


Salvar Tabela Completa com a faixa de vida
    Set Focus To Element  xpath://*[@id="tabela_cotacao_${ID_PROD}"]/tbody/tr[1]/td/label
    ${faixa_de_vida}  Get Text  xpath://*[@id="tabela_cotacao_${ID_PROD}"]/tbody/tr[1]/td/label
    Capture Page Screenshot	filename=screenshot-tabela_completa-${faixa_de_vida}-{index}.png

    