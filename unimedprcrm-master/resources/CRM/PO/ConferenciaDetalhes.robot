*** Settings ***
Library     SeleniumLibrary
Library     DebugLibrary
Resource    ../../../main.resource
*** Variables ***
@{DADOS_CONTA}
@{DADOS_CONTRATO}
@{DADOS_BENEF}
@{TIPO_CONTA}
@{DADOS_BENEF_DEPENDENTE}

${SLEEP} =  0
${TIMEOUT} =  30
${TITULO_CONFERENCIA} =  xpath://*[@id="pagecontent"]/div[1]/h2
${SETA_VALIDAR} =  xpath://*[@id="detail_header_action_menu"]/li/span
${SUBMENU_APROVAR_CONFERENCIA} =  xpath://*[@id="detail_header_action_menu"]/li/ul/li[1]/a[contains(text(), 'Aprovar')]
${INPUT_PARECER_CONFERENCIA} =  xpath://*[@id="modal_acoes_conferencia"]/div/div/div[2]/div[4]/textarea
${BTN_SALVAR_CONFERENCIA} =  xpath://*[@id="modal_acoes_conferencia"]/div/div/div[4]/button[contains(text(), 'Salvar')]
${ABA_VISAO_GERAL} =  xpath://*[@id="tab0"]/em[contains(text(), 'Visão Geral')]
${ABA_RESUMO_CONFERENCIA} =  xpath://*[@id="tab1"]/em[contains(text(), 'Resumo Conferência')]
${HISTORICO_REVISOES_ACAO} =  xpath://*[@id="subPanel"]/tbody/tr[1]/td[1]/span
${DATA_ACAO} =  xpath://*[@id="subPanel"]/tbody/tr[1]/td[3]
${ABA_CONTRATO} =  xpath://*[@id="tab3"]/em[contains(text(), 'Contrato')]
${SITUACAO_CONTRATO} =  xpath://*[@id="DEFAULT"]/tbody/tr[1]/td[2]
${PAINEL_SOLICITACOES_DE_INTEGRACAO} =  xpath://*[@id="subpanel_title_saude_solicita_integracao"]/table/tbody/tr/td[1]/h3/span
${SITUACAO_INTEGRACAO} =  xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a
${BTN_EFETUAR_INTEGRACAO} =  xpath://*[@id="detail_header_action_menu"]/li/a[contains(text(), 'Efetuar Integração')]
${ID_CONTRATANTE_SISTEMA_GESTAO} =  id:con_id_contratante_gestao_c
${ID_SISTEMA_DE_GESTAO} =  id:contrato_id_sistema_gestao_c
${NUMERO_CONTRATO} =  id:cod_contrato_c
${VALOR_TOTAL_ACESSORIO} =  id:valor_total_acessorio_c
${VALOR_TOTAL_ASSISTENCIAL} =  id:valor_total_assistencial_c
${VALOR_DO_CONTRATO} =  id:total_contract_value
${TITULO_CONTRATO} =  xpath//*[@id="name"]/a

${ABA_CONTA} =  xpath://*[@id="tab2"]/em[contains(text(), 'Conta')]
${CONF_TIPO_CONTA} =  xpath://*[@id="LBL_ACCOUNT_INFORMATION"]/tbody/tr[1]/td[2]
${ABA_BENEFICIARIOS} =  xpath://*[@id="tab4"]/em[contains(text(), 'Beneficiários')]
${CONF_NOME_CONTA} =  id:name
${CONF_CNPJ_CPF_CAEPF} =  id:cnpj_mf_c
${CONF_DATA_NASC} =  id:data_nasc_c
${CONF_SEXO} =  id:sexo_c
${CONF_NOME_MAE} =  id:nome_mae_c
${CONF_ESTADO_CIVIL} =  id:estado_civil_c
${CONF_NATURALIDADE} =  id:saude_cidade_id_c
${CONF_RACA} =  id:raca_c
${CONF_PAIS_NASC} =  id:pais_nascimento_c
${CONF_NACIONALIDADE} =  id:nacionalidade_combo_c
${CONF_TIPO_END} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[1]/td[2]/span
${CONF_CEP} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[2]/td[2]/span
${CONF_ENDERECO} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[2]/td[4]/span
${CONF_NUMERO} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[3]/td[2]/span
${CONF_BAIRRO} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[4]/td[2]/span
${CONF_COMPLEMENTO} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[3]/td[4]/span
${CONF_UF} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[4]/td[4]/span
${CONF_CIDADE} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[5]/td[2]/span
${CONF_PAIS} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[5]/td[4]/span
${CONF_TIPO_TELEFONE} =  xpath://*[@id="RegistrosTelefones_span"]/table/tbody/tr[1]/td[2]/span
${CONF_NUMERO_TELEFONE} =  xpath://*[@id="RegistrosTelefones_span"]/table/tbody/tr[1]/td[4]/span

${CONF_NOME_BENEF} =  xpath://*[@id="subPanel"]/tbody/tr[1]/td[3]/span/a
${CONF_VIGENCIA_BENEF} =  id:ben_data_vigencia_c
${CONF_CARENCIA_BENEF} =  id:data_base_carencia_c
${CONF_CPF_BENEF} =  id:cpf
${CONF_DATA_NASC_BENEF} =  id:data_nasc
${CONF_IDADE_BENEF} =  id:idade
${CONF_NOME_MAE_BENEF} =  id:nome_mae
${CONF_SEXO_BENEF} =  xpath://*[@id="LBL_EDITVIEW_PANEL_PESSOA"]/tbody/tr[3]/td[2]
${CONF_CNS_BENEF} =  id:cns
${CONF_GRAU_DEP_BENEF} =  id:grau_dependencia_color
${CONF_COD_FAMILIA_BENEF} =  id:codigo_familia
${CONF_TIPO_BENEF} =  id:tipo_color
${CONF_EMAIL_BENEF} =  xpath://*[@id="RegistrosEmails_span"]/table/tbody/tr/td[2]/span
${CONF_NUMERO_TEL_BENEF} =  xpath://*[@id="RegistrosTelefones_span"]/table/tbody/tr[1]/td[4]/span
${CONF_NATURALIDADE_BENEF} =  xpath://*[@id="LBL_EDITVIEW_PANEL_PESSOA"]/tbody/tr[8]/td[4]
${CONF_RACA_BENEF} =  xpath://*[@id="LBL_EDITVIEW_PANEL_PESSOA"]/tbody/tr[9]/td[4]
${CONF_ESTADO_CIVIL_BENEF} =  xpath://*[@id="LBL_EDITVIEW_PANEL_PESSOA"]/tbody/tr[7]/td[2]
${CONF_TIPO_ENDERECO_BENEF} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[1]/td[2]/span
${CONF_CEP_BENEF} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[2]/td[2]/span
${CONF_NUMERO_BENEF} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[3]/td[2]/span
${CONF_BAIRRO_BENEF} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[4]/td[2]/span
${CONF_CIDADE_BENEF} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[5]/td[2]/span
${CONF_ENDERECO_BENEF} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[2]/td[4]/span
${CONF_COMPLEMENTO_BENEF} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[3]/td[4]/span
${CONF_PARANA_BENEF} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[4]/td[4]/span
${CONF_PAIS_BENEF} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[5]/td[4]/span

${CONF_NOME_BENEF_DEPENDENTE} =  xpath://*[@id="subPanel"]/tbody/tr[2]/td[3]/span/a
${CONF_VIGENCIA_BENEF_DEPENDENTE} =  id:ben_data_vigencia_c
${CONF_CARENCIA_BENEF_DEPENDENTE} =  id:data_base_carencia_c
${CONF_CPF_BENEF_DEPENDENTE} =  id:cpf
${CONF_DATA_NASC_BENEF_DEPENDENTE} =  id:data_nasc
${CONF_IDADE_BENEF_DEPENDENTE} =  id:idade
${CONF_NOME_MAE_BENEF_DEPENDENTE} =  id:nome_mae
${CONF_SEXO_BENEF_DEPENDENTE} =  xpath://*[@id="LBL_EDITVIEW_PANEL_PESSOA"]/tbody/tr[3]/td[2]
${CONF_CNS_BENEF_DEPENDENTE} =  id:cns
${CONF_GRAU_DEP_BENEF_DEPENDENTE} =  id:grau_dependencia_color
${CONF_COD_FAMILIA_BENEF_DEPENDENTE} =  id:codigo_familia
${CONF_TIPO_BENEF_DEPENDENTE} =  id:tipo_color
${CONF_EMAIL_BENEF_DEPENDENTE} =  xpath://*[@id="RegistrosEmails_span"]/table/tbody/tr/td[2]/span
${CONF_NUMERO_TEL_BENEF_DEPENDENTE} =  xpath://*[@id="RegistrosTelefones_span"]/table/tbody/tr[1]/td[4]/span
${CONF_NATURALIDADE_BENEF_DEPENDENTE} =  xpath://*[@id="LBL_EDITVIEW_PANEL_PESSOA"]/tbody/tr[8]/td[4]
${CONF_RACA_BENEF_DEPENDENTE} =  xpath://*[@id="LBL_EDITVIEW_PANEL_PESSOA"]/tbody/tr[9]/td[4]
${CONF_ESTADO_CIVIL_BENEF_DEPENDENTE} =  xpath://*[@id="LBL_EDITVIEW_PANEL_PESSOA"]/tbody/tr[7]/td[2]
${CONF_TIPO_ENDERECO_BENEF_DEPENDENTE} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[1]/td[2]/span
${CONF_CEP_BENEF_DEPENDENTE} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[2]/td[2]/span
${CONF_NUMERO_BENEF_DEPENDENTE} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[3]/td[2]/span
${CONF_BAIRRO_BENEF_DEPENDENTE} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[4]/td[2]/span
${CONF_CIDADE_BENEF_DEPENDENTE} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[5]/td[2]/span
${CONF_ENDERECO_BENEF_DEPENDENTE} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[2]/td[4]/span
${CONF_COMPLEMENTO_BENEF_DEPENDENTE} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[3]/td[4]/span
${CONF_PARANA_BENEF_DEPENDENTE} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[4]/td[4]/span
${CONF_PAIS_BENEF_DEPENDENTE} =  xpath://*[@id="RegistrosEnderecos_span"]/table/tbody/tr[5]/td[4]/span
${MENU_MOVIMENTACAO_CADASTRAL} =  xpath://*[@id="tab4"]/em[contains(., 'Movimentação Cadastral')]

*** Keywords ***
Verificar Página Conferencia Detalhes
    [Arguments]  ${arg1}
    Wait Until Element Contains  ${TITULO_CONFERENCIA}   Conferência » ${arg1}   timeout=${TIMEOUT}

Verificar Página Conferencia Detalhes (Mov Cadastral)
    Wait Until Element Contains  ${TITULO_CONFERENCIA}   Conferência »    timeout=${TIMEOUT}
    Sleep  5s

Clicar no menu "VALIDAR DADOS"
    [Arguments]  ${arg1}
    Wait Until Page Contains    Conferência » ${arg1}     timeout=${TIMEOUT}
    Set Focus To Element  ${MENU_VALIDAR_DADOS}
    Click Element  ${MENU_VALIDAR_DADOS}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}

Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    Wait Until Page Contains    Conferência »      timeout=${TIMEOUT}
    Set Focus To Element  ${MENU_VALIDAR_DADOS}
    Click Element  ${MENU_VALIDAR_DADOS}
    Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}

Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    ${n}  Run Keyword And Ignore Error   Wait Until Page Contains    A tabela de preço desse contrato não será enviada ao sistema de gestão, você confirma?     timeout=${TIMEOUT}
    Run Keyword If  "${n[0]}" == "PASS"  Click Element   ${BOTAO_SIM_CONFIRMACAO}
    Run Keyword If  "${n[0]}" == "PASS"  Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword If  "${n[0]}" == "PASS"  Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
    
    ${s}  Run Keyword And Ignore Error   Wait Until Page Contains    A tabela de preço desse contrato será enviada ao sistema de gestão, você confirma?     timeout=${TIMEOUT}
    Run Keyword If  "${s[0]}" == "PASS"  Click Element   ${BOTAO_SIM_CONFIRMACAO}
    Run Keyword If  "${s[0]}" == "PASS"  Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
    Run Keyword If  "${s[0]}" == "PASS"  Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
  

CRM deve atualizar tela Conferência » Titulo Contrato, aba "Resumo Conferência" com a situação "Validação Efetuada com Sucesso" na cor Azul
    [Arguments]  ${arg1}
    Wait Until Page Contains    Conferência » ${arg1}     timeout=${TIMEOUT}
    Wait Until Page Contains    Validação Efetuada com Sucesso     timeout=${TIMEOUT}


Os Campos "Quantidade de Vidas (Inconsistência Cadastral)" e "Quantidade de Vidas (Advertência)" com resultado zerado
    ${qtd_vidas_inconsistencia}  Get Text  ${QUANTIDADE_DE_VIDAS_INCONSISTENCIA}
    ${qtd_vidas_advertencia}  Get Text  ${QUANTIDADE_DE_VIDAS_ADVERTENCIA}
    Should Be Equal  ${qtd_vidas_inconsistencia}  0
    Should Be Equal  ${qtd_vidas_advertencia}  0


Os Campo "Quantidade de Vidas (Correto)" com resultado igual ao campo "Quantidade de Vidas"
    [Arguments]  ${arg1}
    # Quantidade de Vidas se refere ao numero de Beneficiarios cadastrados
    ${qtd_vidas}  Get Text  ${QUANTIDADE_DE_VIDAS}
    ${qtd_vidas_correto}  Get Text  ${QUANTIDADE_DE_VIDAS_CORRETO}
    Should Be Equal  ${qtd_vidas}  ${arg1}
    Should Be Equal  ${qtd_vidas_correto}  ${arg1}


Clicar menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"
    Set Focus To Element  ${SETA_VALIDAR}
    Sleep  5s
    ${e}  Run Keyword And Ignore Error     Click Element  ${SETA_VALIDAR}
    Run Keyword If  "${e[0]}" == "FAIL"    Run Keyword And Ignore Error    Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "FAIL"    Run Keyword And Ignore Error    Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "FAIL"    Sleep  10s
    Run Keyword If  "${e[0]}" == "FAIL"    Wait Until Element Is Visible    ${SETA_VALIDAR}     timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "FAIL"    Set Focus To Element  ${SETA_VALIDAR}
    Run Keyword If  "${e[0]}" == "FAIL"    Click Element  ${SETA_VALIDAR}
    Sleep           2s
    Click Element  ${SUBMENU_APROVAR_CONFERENCIA}
Preencher campo "Parecer" e clicar no botão "SALVAR"
    Wait Until Page Contains    Aprovar Conferência     timeout=${TIMEOUT}
    ${e}  Run Keyword And Ignore Error   Set Focus To Element   ${INPUT_PARECER_CONFERENCIA}
    Run Keyword If  "${e[0]}" == "PASS"    Sleep  3s
    Run Keyword If  "${e[0]}" == "PASS"    Input Text  ${INPUT_PARECER_CONFERENCIA}  Teste Automação - Prime
    Run Keyword If  "${e[0]}" == "PASS"    Sleep  5s

    ${f}  Run Keyword And Ignore Error   Set Focus To Element   xpath://*[@id="modal_acoes_conferencia"]/div/div/div[2]/div[5]/textarea
    Run Keyword If  "${f[0]}" == "PASS"    Sleep  3s
    Run Keyword If  "${f[0]}" == "PASS"    Input Text  xpath://*[@id="modal_acoes_conferencia"]/div/div/div[2]/div[5]/textarea  Teste Automação - Prime
    Run Keyword If  "${f[0]}" == "PASS"    Sleep  5s

    Set Focus To Element   ${BTN_SALVAR_CONFERENCIA}
    Click Element  ${BTN_SALVAR_CONFERENCIA}

    ${date}  Get Current Date    UTC    -3 hours 1 minute   exclude_millis=yes
    ${date_hora_atual}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%d/%m/%Y %H:
    Set Global Variable  ${date_hora_atual}

    Run Keyword And Ignore Error    Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword And Ignore Error    Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}


CRM deve atualizar tela Conferência » Titulo Contrato, aba "Visão Geral" com a situação "Aprovado"
    Set Focus To Element    ${ABA_VISAO_GERAL}
    Click Element   ${ABA_VISAO_GERAL}
    Wait Until Page Contains    Aprovada    timeout=${TIMEOUT}


Aba "Resumo Conferência" com registro "Aprovado" no painel "Histórico de Revisões/Ajustes", com o "Parecer" e data e hora que foi realizada a ação
    Set Focus To Element    ${ABA_RESUMO_CONFERENCIA}
    Click Element   ${ABA_RESUMO_CONFERENCIA}
    Sleep  5s
    Wait Until Page Contains    Aprovada    timeout=${TIMEOUT}
    Log  Status da Ação é: Aprovada

    Wait Until Page Contains     ${date_hora_atual}    timeout=${TIMEOUT}
    Log To Console  Data da Ação é: ${date_hora_atual}


Aba "Contrato" com situação igual a "Aprovado"
    Set Focus To Element    ${ABA_CONTRATO}
    Click Element     ${ABA_CONTRATO}
    Sleep  5s
    Wait Until Page Contains    Aprovada    timeout=${TIMEOUT}
    Log  Situação do contrato é: Aprovada


Painel "Solicitações de Integração" com registro "Integração Solicitada"
    Repeat Keyword  3 times  Press Keys  None  END
    Set Focus To Element    ${PAINEL_SOLICITACOES_DE_INTEGRACAO}
    Sleep  5s
    Wait Until Page Contains    Integração Solicitada    timeout=${TIMEOUT}
    Log  Situação da Integração é: Integração Solicitada


Clicar registro "Integração Solicitada"
    Sleep  3s
    Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), 'Integração Solicitada')]
    Click Element     xpath://*[@id="subPanel"]/tbody/tr/td[1]/span/a[contains(text(), 'Integração Solicitada')]


Clicar botão "EFETUAR INTEGRAÇÃO"
    [Arguments]  ${arg1}
    ${r}  Run Keyword And Ignore Error     Wait Until Page Contains    Solicitação de Integração » ${arg1}    timeout=${TIMEOUT}
    Run Keyword If  "${r[0]}" == "FAIL"    Wait Until Page Contains    Solicitação de Integração »    timeout=${TIMEOUT}
    Set Focus To Element    ${BTN_EFETUAR_INTEGRACAO}
    Click Element     ${BTN_EFETUAR_INTEGRACAO}
    ${c}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "PASS"   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=260


CRM deve atualizar tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    Wait Until Page Contains    Solicitação de Integração »    timeout=${TIMEOUT}
    Wait Until Page Contains    Integrada com Sucesso    timeout=${TIMEOUT}


CRM deve atualizar tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    Wait Until Page Contains    Solicitação de Integração »    timeout=${TIMEOUT}
    Wait Until Page Contains    Integrada com Sucesso    timeout=${TIMEOUT}


CRM deve atualizar tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    Wait Until Page Contains    Conferência »    timeout=${TIMEOUT}
    Wait Until Page Contains    Encerrada    timeout=${TIMEOUT}


CRM deve atualizar tela de Conferência » ID Mov Cadastral, com a situação "Integrado com sucesso"
    Wait Until Page Contains    Conferência »    timeout=${TIMEOUT}
    Run Keyword And Ignore Error  Wait Until Page Contains    Integrado com Sucesso    timeout=${TIMEOUT}
    Run Keyword And Ignore Error  Wait Until Page Contains    Integração Solicitada    timeout=${TIMEOUT}

    ${d}  Run Keyword And Ignore Error  Wait Until Page Contains    Encerrada    timeout=${TIMEOUT}
    Run Keyword If  "${d[0]}" == "FAIL"   Wait Until Page Contains    Aprovada    timeout=${TIMEOUT}


Painel "Solicitação de Integração" com registro "Integrada com Sucesso"
    Repeat Keyword  3 times  Press Keys  None  END
    Set Focus To Element    ${PAINEL_SOLICITACOES_DE_INTEGRACAO}
    Sleep  5s
    Wait Until Page Contains    Integrada com Sucesso    timeout=${TIMEOUT}
    Log  Situação da Integração é: Integrada com Sucesso


No Contrato campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"
    [Arguments]  ${arg1}
    ${c}  Run Keyword And Ignore Error  Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "FAIL"   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=120
    Set Focus To Element  xpath://*[@id="soi_cod_origem"]/a[contains(text(), '${arg1}')]
    Sleep  15s
    ${r}  Run Keyword And Ignore Error   Click Link  xpath://*[@id="soi_cod_origem"]/a[contains(text(), '${arg1}')]
    Run Keyword If  "${r[0]}" == "FAIL"   Click Link  xpath://*[@id="soi_cod_origem"]/a
    Wait Until Page Contains    Conferência »    timeout=${TIMEOUT}
    Set Focus To Element    ${ABA_CONTRATO}
    Click Element     ${ABA_CONTRATO}

    Wait Until Page Contains    Integrado   timeout=${TIMEOUT}

    ${id_contratante}  Get Text  ${ID_CONTRATANTE_SISTEMA_GESTAO}
    ${id_sistema_gestao}  Get Text  ${ID_SISTEMA_DE_GESTAO}
    Log Many  ID Contratante Sistema Gestão:  ${id_contratante}
    Log Many  ID no Sistema de Gestão:  ${id_sistema_gestao}


Clicar no "Codigo/Identificar de Origem"
    Repeat Keyword  3 times  Press Keys  None  HOME
    ${r}  Run Keyword And Ignore Error   Set Focus To Element  xpath://*[@id="soi_cod_origem"]/a
    Run Keyword If  "${r[0]}" == "PASS"   Sleep  3s
    Run Keyword If  "${r[0]}" == "PASS"   Click Element  xpath://*[@id="soi_cod_origem"]/a
    Run Keyword If  "${r[0]}" == "PASS"   Wait Until Page Contains    Conferência »    timeout=${TIMEOUT}
    Run Keyword If  "${r[0]}" == "PASS"   Sleep  3s

    ${s}  Run Keyword And Ignore Error   Set Focus To Element  xpath://*[@id="movimentacao_protocolo"]/a
    Run Keyword If  "${s[0]}" == "PASS"   Sleep  3s
    Run Keyword If  "${s[0]}" == "PASS"   Click Element  xpath://*[@id="movimentacao_protocolo"]/a
    Run Keyword If  "${s[0]}" == "PASS"   Wait Until Page Contains    Movimentação Cadastral »    timeout=${TIMEOUT}
    Run Keyword If  "${s[0]}" == "PASS"   Sleep  3s

    
Clicar no Link "Titulo"
    [Arguments]  ${arg1}
    Set Focus To Element  xpath://*[@id="name"][contains(., '${arg1}')]
    Execute Javascript  document.getElementById("name").click();
    Sleep  10s
    Click Element  xpath://*[@id="name"]/a[contains(., '${arg1}')]
    Wait Until Page Contains    Contratos »     timeout=${TIMEOUT}


Salvar dados preenchidos na aba Conta, Contrato e Beneficiarios
    [Arguments]  @{arg1}
    # ----- Aba Conta -----
    Set Focus To Element    ${ABA_CONTA}
    Click Element    ${ABA_CONTA}
    
    ${conf_tipo_conta}  Get Text  ${CONF_TIPO_CONTA}
    Append To List    ${TIPO_CONTA}    ${conf_tipo_conta}
    Set Test Variables   @{TIPO_CONTA}
    
    Run Keyword If  '${conf_tipo_conta}' == 'Cliente (PF)'   Salvar dados Conta PF
    Run Keyword If  '${conf_tipo_conta}' == 'Cliente (PJ)'   Salvar dados Conta PJ

    Salvar Dados Aba Contrato
    Salvar Dados Aba Beneficiarios  @{arg1}


Salvar dados preenchidos na aba Conta e Contrato
    [Arguments]  @{arg1}
    # ----- Aba Conta -----
    Set Focus To Element    ${ABA_CONTA}
    Click Element    ${ABA_CONTA}
    
    ${conf_tipo_conta}  Get Text  ${CONF_TIPO_CONTA}
    Append To List    ${TIPO_CONTA}    ${conf_tipo_conta}
    Set Test Variables   @{TIPO_CONTA}
    
    Run Keyword If  '${conf_tipo_conta}' == 'Cliente (PF)'   Salvar dados Conta PF
    Run Keyword If  '${conf_tipo_conta}' == 'Cliente (PJ)'   Salvar dados Conta PJ

    Salvar Dados Aba Contrato


Salvar Dados Aba Contrato
    # ----- Aba Contrato -----
    Set Focus To Element    ${ABA_CONTRATO}
    Click Element     ${ABA_CONTRATO}
    @{DADOS_CONTRATO}  Create List

    # Arg0: ID Contratante, Arg1: ID Sistema de Gestão, Arg2: Numero Contrato
    ${id_contratante}  Get Text  ${ID_CONTRATANTE_SISTEMA_GESTAO}
    ${DB_id_contratante}   Remover Caracteres Especiais (ID Contratante)    ${id_contratante}
    Append To List    ${DADOS_CONTRATO}    ${DB_id_contratante}

    ${id_sistema_gestao}  Get Text  ${ID_SISTEMA_DE_GESTAO}
    ${DB_id_sistema_gestao}  Remover Caracteres Especiais    ${id_sistema_gestao}
    Append To List    ${DADOS_CONTRATO}    ${DB_id_sistema_gestao}

    ${numero_contrato}  Get Text  ${NUMERO_CONTRATO}
    Append To List    ${DADOS_CONTRATO}    ${numero_contrato}

    ${valor_total_acessorio}  Get Text  ${VALOR_TOTAL_ACESSORIO}
    Append To List    ${DADOS_CONTRATO}    ${valor_total_acessorio}

    ${valor_total_assistencial}  Get Text  ${VALOR_TOTAL_ASSISTENCIAL}
    Append To List    ${DADOS_CONTRATO}    ${valor_total_assistencial}

    ${valor_do_contrato}  Get Text  ${VALOR_DO_CONTRATO}
    Append To List    ${DADOS_CONTRATO}    ${valor_do_contrato}

    Set Test Variables   @{DADOS_CONTRATO}
    Log Many  @{DADOS_CONTRATO}
    

Salvar Dados Aba Beneficiarios
    [Arguments]  @{arg1}
    # ----- Aba Beneficiarios -----
    Set Focus To Element    ${ABA_BENEFICIARIOS}
    Click Element    ${ABA_BENEFICIARIOS}
    Sleep  3s
    ${titular}  Get Text  ${CONF_NOME_BENEF}
    Run Keyword And Ignore Error  Run Keyword If  "${titular}" == "${arg1[1]}"    Salvar dados Beneficiario Titular  @{arg1}
    Run Keyword And Ignore Error  Set Focus To Element  ${CONF_NOME_BENEF_DEPENDENTE}
    ${Dependente}  Run Keyword And Ignore Error  Get Text  ${CONF_NOME_BENEF_DEPENDENTE}   
    #Run Keyword If  "${Dependente}" == "PASS"   Salvar dados Beneficiario Dependente  @{arg1}
    Run Keyword And Ignore Error   Salvar dados Beneficiario Dependente  @{arg1} 


Salvar dados Beneficiario Titular
    [Arguments]  @{arg1}
    # Titular - Arg0: Nome, Arg1: Vigencia, Arg2: Carencia, Arg3: CPF, Arg4: Data Nasc, Arg5: Idade,
    # ... Arg6: Sexo, Arg7: CNS, Arg8: Tipo, Arg9: Grau Dependencia, Arg10: Cod Familia, Arg11: Nome Mãe, Arg12: Email,
    # ... Arg13: Numero Tel, Arg14: Naturalidade, Arg15: Raça, Arg16: Estado Civil, Arg17: Tipo Endereco,
    # ... Arg18: CEP, Arg19: Numero, Arg20: Bairro, Arg21: Cidade, Arg22: Endereço - Rua, Arg23: Complemento,
    # ... Arg24: Estado, Arg25: Pais
    Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr[1]/td[3]/span[contains(., '${arg1[1]}')]
    Click Element  xpath://*[@id="subPanel"]/tbody/tr[1]/td[3]/span[contains(., '${arg1[1]}')]
    # Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr[1]/td[3]/span[contains(., 'LARISSA CUNHA SALES SA')]
    # Click Element  xpath://*[@id="subPanel"]/tbody/tr[1]/td[3]/span[contains(., 'LARISSA CUNHA SALES SA')]
    ${e}  Run Keyword And Ignore Error    Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "PASS"   Run Keyword And Ignore Error    Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}

    ${conf_nome_benef}  Get Text  ${CONF_NOME_BENEF}
    Append To List       ${DADOS_BENEF}    ${conf_nome_benef}

    ${conf_vigencia_benef}  Get Text  ${CONF_VIGENCIA_BENEF}
    ${conf_vigencia_benef}  Convert Date       ${conf_vigencia_benef}     date_format=%d/%m/%Y      result_format=%Y-%m-%d
    ${conf_vigencia_benef}  Catenate  ${conf_vigencia_benef}   00:00:00
    Append To List       ${DADOS_BENEF}    ${conf_vigencia_benef}

    ${conf_carencia_benef}  Get Text  xpath://*[@id="LBL_EDITVIEW_PANEL_BENEFICIARIO"]/tbody/tr[3]/td[4]
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%Y-%m-%d
    ${conf_carencia_benef}  Run Keyword If  '${conf_carencia_benef}' == '${EMPTY}'  Replace String  ${conf_carencia_benef}  ${EMPTY}  ${date}
    ${conf_carencia_benef}  Catenate  ${conf_carencia_benef}   00:00:00
    Append To List       ${DADOS_BENEF}    ${conf_carencia_benef}
    
    ${conf_cpf_benef}  Get Text  ${CONF_CPF_BENEF}
    ${conf_cpf_benef}    Remover Caracteres Especiais    ${conf_cpf_benef}
    Append To List       ${DADOS_BENEF}    ${conf_cpf_benef}
    
    ${conf_data_nasc_benef}  Get Text  ${CONF_DATA_NASC_BENEF}
    ${conf_data_nasc_benef}  Convert Date       ${conf_data_nasc_benef}     date_format=%d/%m/%Y      result_format=%Y-%m-%d
    ${conf_data_nasc_benef}  Catenate  ${conf_data_nasc_benef}   00:00:00
    Append To List       ${DADOS_BENEF}    ${conf_data_nasc_benef}

    ${conf_idade_benef}  Get Text  ${CONF_IDADE_BENEF}
    Replace String  ${conf_idade_benef}  ${space}anos  ${space}
    Append To List       ${DADOS_BENEF}    ${conf_idade_benef}

    ${conf_sexo_benef}  Get Text  ${CONF_SEXO_BENEF}
    ${conf_sexo_benef}  Run Keyword If  '${conf_sexo_benef}' == 'Masculino'  Replace String  ${conf_sexo_benef}  Masculino  masculino
    Append To List       ${DADOS_BENEF}    ${conf_sexo_benef}

    ${conf_cns_benef}  Get Text  ${CONF_CNS_BENEF}
    Append To List       ${DADOS_BENEF}    ${conf_cns_benef}

    ${conf_tipo_benef}  Get Text  ${CONF_TIPO_BENEF}
    Append To List       ${DADOS_BENEF}    ${conf_tipo_benef}

    ${conf_grau_dep_benef}  Get Text  ${CONF_GRAU_DEP_BENEF}
    Append To List       ${DADOS_BENEF}    ${conf_grau_dep_benef}

    ${conf_cod_familia_benef}  Get Text  ${CONF_COD_FAMILIA_BENEF}
    Append To List       ${DADOS_BENEF}    ${conf_cod_familia_benef}

    ${conf_nome_mae_benef}  Get Text  ${CONF_NOME_MAE_BENEF}
    Append To List       ${DADOS_BENEF}    ${conf_nome_mae_benef}

    ${conf_email_benef}  Get Text  ${CONF_EMAIL_BENEF}
    Append To List       ${DADOS_BENEF}    ${conf_email_benef}

    ${conf_numero_tel_benef}  Get Text  ${CONF_NUMERO_TEL_BENEF}
    ${conf_numero_tel_benef}    Remove String  ${conf_numero_tel_benef}  (41)
    ${conf_numero_tel_benef}    Remover Caracteres Especiais    ${conf_numero_tel_benef}
    Append To List       ${DADOS_BENEF}    ${conf_numero_tel_benef}

    ${conf_naturalidade_benef}  Get Text  ${CONF_NATURALIDADE_BENEF}
    ${conf_naturalidade_benef}    Replace String  ${conf_naturalidade_benef}  ${conf_naturalidade_benef}  CURITIBA
    Append To List       ${DADOS_BENEF}    ${conf_naturalidade_benef}

    ${conf_raca_benef}  Get Text  ${CONF_RACA_BENEF}
    ${conf_raca_benef}  Run Keyword If  '${conf_raca_benef}' == 'Branca'  Replace String  ${conf_raca_benef}  Branca  Branco
    Append To List       ${DADOS_BENEF}    ${conf_raca_benef}

    ${conf_estado_civil_benef}  Get Text  ${CONF_ESTADO_CIVIL_BENEF}
    ${conf_estado_civil_benef}    Remove String  ${conf_estado_civil_benef}  (a)
    ${conf_estado_civil_benef}  Run Keyword If  '${conf_estado_civil_benef}' == 'Solteiro'  Replace String  ${conf_estado_civil_benef}  Solteiro  solteiro
    Append To List       ${DADOS_BENEF}    ${conf_estado_civil_benef}

    ${conf_tipo_endereco_benef}  Get Text  ${CONF_TIPO_ENDERECO_BENEF}
    Append To List       ${DADOS_BENEF}    ${conf_tipo_endereco_benef}

    ${conf_cep_benef}  Get Text  ${CONF_CEP_BENEF}
    Append To List       ${DADOS_BENEF}    ${conf_cep_benef}

    ${conf_numero_benef}  Get Text  ${CONF_NUMERO_BENEF}
    Append To List       ${DADOS_BENEF}    ${conf_numero_benef}

    ${conf_bairro_benef}  Get Text  ${CONF_BAIRRO_BENEF}
    Append To List       ${DADOS_BENEF}    ${conf_bairro_benef}

    ${conf_cidade_benef}  Get Text  ${CONF_CIDADE_BENEF}
    Append To List       ${DADOS_BENEF}    ${conf_cidade_benef}
    
    ${conf_endereco_benef}  Get Text  ${CONF_ENDERECO_BENEF}
    Append To List       ${DADOS_BENEF}    ${conf_endereco_benef}

    ${conf_complemento_benef}  Get Text  ${CONF_COMPLEMENTO_BENEF}
    Append To List       ${DADOS_BENEF}    ${conf_complemento_benef}

    ${conf_parana_benef}  Get Text  ${CONF_PARANA_BENEF}
    Append To List       ${DADOS_BENEF}    ${conf_parana_benef}

    ${conf_pais_benef}  Get Text  ${CONF_PAIS_BENEF}
    Append To List       ${DADOS_BENEF}    ${conf_pais_benef}

    Set Test Variables   @{DADOS_BENEF}
    Log Many  @{DADOS_BENEF}
    


Salvar dados Beneficiario Dependente
    [Arguments]  @{arg1}
    # ----- Dependente -----
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s
    Set Focus To Element    xpath://*[@id="subPanel"]/tbody/tr[2]/td[3]/span[contains(., '${arg1[31]}')]
    Click Element  xpath://*[@id="subPanel"]/tbody/tr[2]/td[3]/span[contains(., '${arg1[31]}')]
    ${e}  Run Keyword And Ignore Error    Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "PASS"   Run Keyword And Ignore Error    Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}

    # Dependente - Arg0: Nome, Arg1: Vigencia, Arg2: Carencia, Arg3: CPF, Arg4: Data Nasc, Arg5: Idade,
    # ... Arg6: Sexo, Arg7: CNS, Arg8: Tipo, Arg9: Grau Dependencia, Arg10: Cod Familia, Arg11: Nome Mãe, Arg12: Email,
    # ... Arg13: Numero Tel, Arg14: Naturalidade, Arg15: Raça, Arg16: Estado Civil, Arg17: Tipo Endereco,
    # ... Arg18: CEP, Arg19: Numero, Arg20: Bairro, Arg21: Cidade, Arg22: Endereço - Rua, Arg23: Complemento,
    # ... Arg24: Estado, Arg25: Pais

    ${conf_nome_benef_dependente}  Get Text  ${CONF_NOME_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_nome_benef_dependente}

    ${conf_vigencia_benef_dependente}  Get Text  ${CONF_VIGENCIA_BENEF_DEPENDENTE}
    ${conf_vigencia_benef_dependente}  Convert Date       ${conf_vigencia_benef_dependente}     date_format=%d/%m/%Y      result_format=%Y-%m-%d
    ${conf_vigencia_benef_dependente}  Catenate  ${conf_vigencia_benef_dependente}  00:00:00
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_vigencia_benef_dependente}

    ${conf_carencia_benef_dependente}  Get Text  xpath://*[@id="LBL_EDITVIEW_PANEL_BENEFICIARIO"]/tbody/tr[3]/td[4]
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%Y-%m-%d
    #${conf_carencia_benef}  Run Keyword If  '${conf_carencia_benef}' == '${EMPTY}'  Replace String  ${conf_carencia_benef}  ${EMPTY}  ${date}
    ${conf_carencia_benef_dependente}  Catenate  ${date}  00:00:00
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_carencia_benef_dependente}
    
    ${conf_cpf_benef_dependente}  Get Text  ${CONF_CPF_BENEF_DEPENDENTE}
    ${conf_cpf_benef_dependente}    Remover Caracteres Especiais    ${conf_cpf_benef_dependente}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_cpf_benef_dependente}
    
    ${conf_data_nasc_benef_dependente}  Get Text  ${CONF_DATA_NASC_BENEF_DEPENDENTE}
    ${conf_data_nasc_benef_dependente}  Convert Date       ${conf_data_nasc_benef_dependente}     date_format=%d/%m/%Y      result_format=%Y-%m-%d
    ${conf_data_nasc_benef_dependente}  Catenate  ${conf_data_nasc_benef_dependente}   00:00:00
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_data_nasc_benef_dependente}

    ${conf_idade_benef_dependente}  Get Text  ${CONF_IDADE_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_idade_benef_dependente}

    ${conf_sexo_benef_dependente}  Get Text  ${CONF_SEXO_BENEF_DEPENDENTE}
    ${conf_sexo_benef_dependente}  Run Keyword If  '${conf_sexo_benef_dependente}' == 'Masculino'  Replace String  ${conf_sexo_benef_dependente}  Masculino  masculino
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_sexo_benef_dependente}

    ${conf_cns_benef_dependente}  Get Text  ${CONF_CNS_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_cns_benef_dependente}

    ${conf_tipo_benef_dependente}  Get Text  ${CONF_TIPO_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_tipo_benef_dependente}

    ${conf_grau_dep_benef_dependente}  Get Text  ${CONF_GRAU_DEP_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_grau_dep_benef_dependente}

    ${conf_cod_familia_benef_dependente}  Get Text  ${CONF_COD_FAMILIA_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_cod_familia_benef_dependente}

    ${conf_nome_mae_benef_dependente}  Get Text  ${CONF_NOME_MAE_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_nome_mae_benef_dependente}

    ${conf_email_benef_dependente}  Get Text  ${CONF_EMAIL_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_email_benef_dependente}

    ${conf_numero_tel_benef_dependente}  Get Text  ${CONF_NUMERO_TEL_BENEF_DEPENDENTE}
    ${conf_numero_tel_benef_dependente}    Remove String  ${conf_numero_tel_benef_dependente}  (41)
    ${conf_numero_tel_benef_dependente}    Remover Caracteres Especiais    ${conf_numero_tel_benef_dependente}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_numero_tel_benef_dependente}

    ${conf_naturalidade_benef_dependente}  Get Text  ${CONF_NATURALIDADE_BENEF_DEPENDENTE}
    ${conf_naturalidade_benef_dependente}    Replace String  ${conf_naturalidade_benef_dependente}  ${conf_naturalidade_benef_dependente}  CURITIBA
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_naturalidade_benef_dependente}

    ${conf_raca_benef_dependente}  Get Text  ${CONF_RACA_BENEF_DEPENDENTE}
    ${conf_raca_benef_dependente}  Run Keyword If  '${conf_raca_benef_dependente}' == 'Branca'  Replace String  ${conf_raca_benef_dependente}  Branca  Branco
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_raca_benef_dependente}

    ${conf_estado_civil_benef_dependente}  Get Text  ${CONF_ESTADO_CIVIL_BENEF_DEPENDENTE}
    ${conf_estado_civil_benef_dependente}    Remove String  ${conf_estado_civil_benef_dependente}  (a)
    ${conf_estado_civil_benef_dependente}  Run Keyword If  '${conf_estado_civil_benef_dependente}' == 'Solteiro'  Replace String  ${conf_estado_civil_benef_dependente}  Solteiro  solteiro
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_estado_civil_benef_dependente}

    ${conf_tipo_endereco_benef_dependente}  Get Text  ${CONF_TIPO_ENDERECO_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_tipo_endereco_benef_dependente}

    ${conf_cep_benef_dependente}  Get Text  ${CONF_CEP_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_cep_benef_dependente}

    ${conf_numero_benef_dependente}  Get Text  ${CONF_NUMERO_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_numero_benef_dependente}

    ${conf_bairro_benef_dependente}  Get Text  ${CONF_BAIRRO_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_bairro_benef_dependente}

    ${conf_cidade_benef_dependente}  Get Text  ${CONF_CIDADE_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_cidade_benef_dependente}
    
    ${conf_endereco_benef_dependente}  Get Text  ${CONF_ENDERECO_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_endereco_benef_dependente}

    ${conf_complemento_benef_dependente}  Get Text  ${CONF_COMPLEMENTO_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_complemento_benef_dependente}

    ${conf_parana_benef_dependente}  Get Text  ${CONF_PARANA_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_parana_benef_dependente}

    ${conf_pais_benef_dependente}  Get Text  ${CONF_PAIS_BENEF_DEPENDENTE}
    Append To List       ${DADOS_BENEF_DEPENDENTE}    ${conf_pais_benef_dependente}

    Set Test Variables   @{DADOS_BENEF_DEPENDENTE}
    Log Many  @{DADOS_BENEF_DEPENDENTE}


Salvar dados Conta PF
    # Arg0: Nome, Arg1: CPF/CNPJ, Arg2: Data Nasc, Arg3: Sexo, Arg4: Nome Mãe, Arg5: Estado Civil,
    # ...   Arg6: Naturalidade, Arg7: Raça, Arg8: Pais Nasc, Arg9: Nacionalidade, Arg10: Tipo Endereço,
    # ...   Arg11: CEP, Arg12: Endereço, Arg13: Numero, Arg14: Bairro, Arg15: Complemento, Arg16:UF, Arg17: Cidade, Arg18: Pais,
    # ...   Arg19: Tipo Telefone, Arg20: Numero Telefone
    @{DADOS_CONTA}  Create List
    ${conf_nome_conta}  Get Text  ${CONF_NOME_CONTA}
    Append To List     ${DADOS_CONTA}    ${conf_nome_conta}

    ${conf_cnpj_cpf_caepf}  Get Text  ${CONF_CNPJ_CPF_CAEPF}
    ${conf_cnpj_cpf_caepf}    Remover Caracteres Especiais    ${conf_cnpj_cpf_caepf}
    ${conf_cnpj_cpf_caepf}    Convert To Integer    ${conf_cnpj_cpf_caepf}
    Append To List    ${DADOS_CONTA}    ${conf_cnpj_cpf_caepf}

    ${conf_data_nasc}  Get Text  ${CONF_DATA_NASC}
    ${conf_data_nasc}    Remover Caracteres Especiais     ${conf_data_nasc}
    Append To List    ${DADOS_CONTA}    ${conf_data_nasc}

    ${conf_sexo}  Get Text  xpath://*[@id="LBL_DETAILVIEW_PANEL2"]/tbody/tr[1]/td[4]
    Append To List    ${DADOS_CONTA}    ${conf_sexo}
    
    ${conf_nome_mae}  Get Text  ${CONF_NOME_MAE}    
    Append To List     ${DADOS_CONTA}    ${conf_nome_mae}

    ${conf_estado_civil}  Get Text  xpath://*[@id="LBL_DETAILVIEW_PANEL2"]/tbody/tr[3]/td[2]
    Append To List    ${DADOS_CONTA}    ${conf_estado_civil}

    ${conf_naturalidade}  Get Text  ${CONF_NATURALIDADE}
    Append To List     ${DADOS_CONTA}    ${conf_naturalidade}

    ${conf_raca}  Get Text  xpath://*[@id="LBL_DETAILVIEW_PANEL2"]/tbody/tr[5]/td[4]
    Append To List     ${DADOS_CONTA}    ${conf_raca}

    ${conf_pais_nasc}  Get Text  xpath://*[@id="LBL_DETAILVIEW_PANEL2"]/tbody/tr[4]/td[2]
    Append To List     ${DADOS_CONTA}    ${conf_pais_nasc}

    ${conf_nacionalidade}  Get Text  xpath://*[@id="LBL_DETAILVIEW_PANEL2"]/tbody/tr[5]/td[2]
    Append To List    ${DADOS_CONTA}    ${conf_nacionalidade}

    ${conf_tipo_end}  Get Text  ${CONF_TIPO_END}
    Append To List    ${DADOS_CONTA}    ${conf_tipo_end}

    ${conf_cep}  Get Text  ${CONF_CEP}
    ${conf_cep}    Remover Caracteres Especiais    ${conf_cep}
    ${conf_cep}    Convert To Integer    ${conf_cep}
    Append To List    ${DADOS_CONTA}    ${conf_cep}

    ${conf_endereco}  Get Text  ${CONF_ENDERECO}       
    Append To List     ${DADOS_CONTA}    ${conf_endereco}


    ${conf_numero}  Get Text  ${CONF_NUMERO}
    ${conf_numero}    Convert To Integer    ${conf_numero}
    Append To List     ${DADOS_CONTA}    ${conf_numero}

    ${conf_bairro}  Get Text  ${CONF_BAIRRO} 
    Append To List     ${DADOS_CONTA}    ${conf_bairro}

    ${conf_complemento}  Get Text  ${CONF_COMPLEMENTO}
    ${conf_complemento}  Run Keyword If  '${conf_complemento}' == 'None'  Replace String  ${conf_complemento}  None   None      
    Log  ${conf_complemento}
    Append To List    ${DADOS_CONTA}    ${conf_complemento}
    
    ${conf_uf}  Get Text  ${CONF_UF}
    ${conf_uf} =  Replace String  ${conf_uf}  Paraná  PR
    Append To List    ${DADOS_CONTA}    ${conf_uf}

    ${conf_cidade}  Get Text  ${CONF_CIDADE}
    Append To List    ${DADOS_CONTA}    ${conf_cidade}

    ${conf_pais}  Get Text  ${CONF_PAIS}
    Append To List    ${DADOS_CONTA}    ${conf_pais}

    ${conf_tipo_telefone}  Get Text  ${CONF_TIPO_TELEFONE}
    Append To List    ${DADOS_CONTA}    ${conf_tipo_telefone}

    ${conf_numero_telefone}  Get Text  ${CONF_NUMERO_TELEFONE}
    Log Many  ${conf_numero_telefone} 
    ${conf_numero_telefone}    Remove String  ${conf_numero_telefone}  (41)
    ${conf_numero_telefone}    Remover Caracteres Especiais    ${conf_numero_telefone}
    Append To List    ${DADOS_CONTA}    ${conf_numero_telefone}

    Set Test Variables   @{DADOS_CONTA}
    Log Many  @{DADOS_CONTA}


Salvar dados Conta PJ
    # Arg0: Nome, Arg1: CPF/CNPJ, Arg2: Tipo Endereço,
    # ...   Arg3: CEP, Arg4: Endereço, Arg5: Numero, Arg6: Bairro, Arg7: Complemento, Arg8:UF, Arg9: Cidade, Arg10: Pais
    @{DADOS_CONTA}  Create List
    ${conf_nome_conta}  Get Text  ${CONF_NOME_CONTA}
    Append To List     ${DADOS_CONTA}    ${conf_nome_conta}

    ${conf_cnpj_cpf_caepf}  Get Text  ${CONF_CNPJ_CPF_CAEPF}
    ${conf_cnpj_cpf_caepf}    Remover Caracteres Especiais    ${conf_cnpj_cpf_caepf}
    ${conf_cnpj_cpf_caepf}    Convert To Integer    ${conf_cnpj_cpf_caepf}
    Append To List    ${DADOS_CONTA}    ${conf_cnpj_cpf_caepf}

    ${conf_tipo_end}  Get Text  ${CONF_TIPO_END}
    Append To List    ${DADOS_CONTA}    ${conf_tipo_end}

    ${conf_cep}  Get Text  ${CONF_CEP}
    ${conf_cep}    Remover Caracteres Especiais    ${conf_cep}
    ${conf_cep}    Convert To Integer    ${conf_cep}
    Append To List    ${DADOS_CONTA}    ${conf_cep}

    ${conf_endereco}  Get Text  ${CONF_ENDERECO}       
    Append To List     ${DADOS_CONTA}    ${conf_endereco}

    ${conf_numero}  Get Text  ${CONF_NUMERO}
    ${conf_numero}    Convert To Integer    ${conf_numero}
    Append To List     ${DADOS_CONTA}    ${conf_numero}

    ${conf_bairro}  Get Text  ${CONF_BAIRRO} 
    Append To List     ${DADOS_CONTA}    ${conf_bairro}

    ${conf_complemento}  Get Text  ${CONF_COMPLEMENTO}
    ${conf_complemento}  Run Keyword If  '${conf_complemento}' == 'None'  Replace String  ${conf_complemento}  None  None 
    Log  ${conf_complemento}
    Append To List    ${DADOS_CONTA}    ${conf_complemento}
    
    ${conf_uf}  Get Text  ${CONF_UF}
    ${conf_uf} =  Replace String  ${conf_uf}  Paraná  PR
    Append To List    ${DADOS_CONTA}    ${conf_uf}

    ${conf_cidade}  Get Text  ${CONF_CIDADE}
    Append To List    ${DADOS_CONTA}    ${conf_cidade}

    ${conf_pais}  Get Text  ${CONF_PAIS}
    Append To List    ${DADOS_CONTA}    ${conf_pais}
    
    Set Test Variables   @{DADOS_CONTA}
    Log Many  @{DADOS_CONTA}


Salvar dados preenchidos na aba Conta, Contrato e Beneficiarios - Importação Vidas
    [Arguments]  @{arg1}
    # ----- Aba Conta -----
    Set Focus To Element    ${ABA_CONTA}
    Click Element    ${ABA_CONTA}
    
    ${conf_tipo_conta}  Get Text  ${CONF_TIPO_CONTA}
    Append To List    ${TIPO_CONTA}    ${conf_tipo_conta}
    Set Test Variables   @{TIPO_CONTA}
    
    Run Keyword If  '${conf_tipo_conta}' == 'Cliente (PF)'   Salvar dados Conta PF
    Run Keyword If  '${conf_tipo_conta}' == 'Cliente (PJ)'   Salvar dados Conta PJ

    Salvar Dados Aba Contrato
    Salvar Dados Aba Beneficiarios - Vidas  @{arg1}


Salvar Dados Aba Beneficiarios - Vidas
    [Arguments]  @{arg1}
    # ----- Aba Beneficiarios -----
    Set Focus To Element    ${ABA_BENEFICIARIOS}
    Click Element    ${ABA_BENEFICIARIOS}
    Sleep  3s
    ${elementos}  Get WebElements  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts_conferencia']/table//span[contains(text(), 'Titular')]/../../../td[3]/span/a
    @{list_info_titular}  Create List
    FOR  ${t}  IN  @{elementos}
        ${nome}  Get Text  ${t}
        ${informacoes}  Salvar dados Beneficiario Titular - Vidas  ${nome}
        Append To List  ${list_info_titular}  ${informacoes}
    END
    ${result_beneficiario}  Query - Validação Beneficiarios importados
    ${result_endereco}  Query - Validação Endereço importados
    Log  ${result_beneficiario}
    Log  ${list_info_titular}
    Set Test Variables  @{list_info_titular}
    ${result}  Run Keyword And Return Status  Validar Linhas - Beneficiarios  ${list_info_titular}  ${result_beneficiario}
    ${result}  Run Keyword And Return Status  Validar Linhas - Endereco  ${list_info_titular}  ${result_endereco}
    

    ${elementos}  Get WebElements  xpath://div[@id='list_subpanel_saude_beneficiarios_aos_contracts_conferencia']/table//span[contains(text(), 'Cônjuge') or contains(text(), 'Filhos(as)')]/../../../td[3]/span/a
    @{list_info_dependente}  Create List
    FOR  ${t}  IN  @{elementos}
        ${nome}  Get Text  ${t}
        ${informacoes}  Salvar dados Beneficiario Dependente - Vidas  ${nome}
        Append To List  ${list_info_dependente}  ${informacoes}
    END
    ${result_beneficiario}  Query - Validação Beneficiarios importados
    ${result_endereco}  Query - Validação Endereço importados
    Log  ${result_beneficiario}
    Log  ${list_info_dependente}
    Set Test Variables  @{list_info_dependente}
    ${result}  Run Keyword And Return Status  Validar Linhas - Beneficiarios  ${list_info_dependente}  ${result_beneficiario}
    ${result}  Run Keyword And Return Status  Validar Linhas - Endereco  ${list_info_dependente}  ${result_endereco}
    

Validar Linhas - Beneficiarios
    [Arguments]  ${lista_final}  ${lista_banco}
    FOR  ${depn}  IN  @{lista_final}
        Validar Linha - Beneficiarios  ${depn}  ${lista_banco}
    END

Validar Linha - Beneficiarios
    [Arguments]  ${lista_final}  ${lista_banco}
    FOR  ${i}  IN  @{lista_banco}
        ${db_carencia}  Set Variables  ${i[1]}
        ${db_nascimento}  Set Variables  ${i[2]}
        ${db_nascimento}  Convert To String  ${db_nascimento}

        ${tl_carencia}  Set Variables  ${lista_final[2]}
        ${tl_nascimento}  Set Variables  ${lista_final[4]}
        Should Be Equal  ${db_nascimento}  ${tl_nascimento}
        Should Be Equal  ${db_carencia}  ${tl_carencia}
    END


Validar Linhas - Endereco
    [Arguments]  ${lista_final}  ${lista_banco}
    FOR  ${depn}  IN  @{lista_final}
        Validar Linha - Endereco  ${depn}  ${lista_banco}
    END

Validar Linha - Endereco
    [Arguments]  ${lista_final}  ${lista_banco}
    FOR  ${i}  IN  @{lista_banco}
        ${db_tipo_endereco}  Set Variables     ${i[1]}
        ${db_cep}            Set Variables     ${i[2]}
        ${db_logradouro}     Set Variables     ${i[3]}
        ${db_numero}         Set Variables     ${i[4]}
        ${db_complemento}    Set Variables     ${i[5]}
        ${db_bairro}         Set Variables     ${i[6]}
        
        ${tl_tipo_endereco}  Set Variables     ${lista_final[17]}
        ${tl_cep}            Set Variables     ${lista_final[18]}
        ${tl_logradouro}     Set Variables     ${lista_final[22]}
        ${tl_numero}         Set Variables     ${lista_final[19]}
        ${tl_complemento}    Set Variables     ${lista_final[23]}
        ${tl_bairro}         Set Variables     ${lista_final[20]}

        Should Be Equal  ${db_tipo_endereco}   ${tl_tipo_endereco}
        Should Be Equal  ${db_cep}             ${tl_cep}
        Should Be Equal  ${db_logradouro}      ${tl_logradouro}
        Should Be Equal  ${db_numero}          ${tl_numero}
        Should Be Equal  ${db_complemento}     ${tl_complemento}
        Should Be Equal  ${db_bairro}          ${tl_bairro}
    END


Salvar dados Beneficiario Titular - Vidas
    [Arguments]  ${titular}
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s
    # Titular - Arg0: Nome, Arg1: Vigencia, Arg2: Carencia, Arg3: CPF, Arg4: Data Nasc, Arg5: Idade,
    # ... Arg6: Sexo, Arg7: CNS, Arg8: Tipo, Arg9: Grau Dependencia, Arg10: Cod Familia, Arg11: Nome Mãe, Arg12: Email,
    # ... Arg13: Numero Tel, Arg14: Naturalidade, Arg15: Raça, Arg16: Estado Civil, Arg17: Tipo Endereco,
    # ... Arg18: CEP, Arg19: Numero, Arg20: Bairro, Arg21: Cidade, Arg22: Endereço - Rua, Arg23: Complemento,
    # ... Arg24: Estado, Arg25: Pais
    @{LISTA_TEMP_TITULAR}    Create List
    Set Focus To Element    xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts_conferencia"]//span[contains(., '${titular}')]/a
    Click Element    xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts_conferencia"]//span[contains(., '${titular}')]/a
    ${e}  Run Keyword And Ignore Error    Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "PASS"   Run Keyword And Ignore Error    Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}

    ${conf_nome_benef}  Get Text  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts_conferencia"]//span[contains(., '${titular}')]/a
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_nome_benef}

    ${conf_vigencia_benef}  Get Text  ${CONF_VIGENCIA_BENEF}
    ${conf_vigencia_benef}  Convert Date       ${conf_vigencia_benef}     date_format=%d/%m/%Y      result_format=%Y-%m-%d
    ${conf_vigencia_benef}  Catenate  ${conf_vigencia_benef}   00:00:00
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_vigencia_benef}

    ${conf_carencia_benef}  Get Text  xpath://*[@id="LBL_EDITVIEW_PANEL_BENEFICIARIO"]/tbody/tr[3]/td[4]
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%Y-%m-%d
    ${conf_carencia_benef}  Run Keyword If  '${conf_carencia_benef}' == '${EMPTY}'  Replace String  ${conf_carencia_benef}  ${EMPTY}  ${date}
    ${conf_carencia_benef}  Catenate  ${conf_carencia_benef}   00:00:00
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_carencia_benef}
    
    ${conf_cpf_benef}  Get Text  ${CONF_CPF_BENEF}
    ${conf_cpf_benef}    Remover Caracteres Especiais    ${conf_cpf_benef}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_cpf_benef}
    
    ${conf_data_nasc_benef}  Get Text  ${CONF_DATA_NASC_BENEF}
    ${conf_data_nasc_benef}  Convert Date       ${conf_data_nasc_benef}     date_format=%d/%m/%Y      result_format=%Y-%m-%d
    ${conf_data_nasc_benef}  Catenate  ${conf_data_nasc_benef}   00:00:00
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_data_nasc_benef}

    ${conf_idade_benef}  Get Text  ${CONF_IDADE_BENEF}
    Replace String  ${conf_idade_benef}  ${space}anos  ${space}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_idade_benef}

    ${conf_sexo_benef}  Get Text  ${CONF_SEXO_BENEF}
    ${conf_sexo_benef}  Run Keyword If  '${conf_sexo_benef}' == 'Masculino'  Replace String  ${conf_sexo_benef}  Masculino  masculino
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_sexo_benef}

    ${conf_cns_benef}  Get Text  ${CONF_CNS_BENEF}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_cns_benef}

    ${conf_tipo_benef}  Get Text  ${CONF_TIPO_BENEF}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_tipo_benef}

    ${conf_grau_dep_benef}  Get Text  ${CONF_GRAU_DEP_BENEF}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_grau_dep_benef}

    ${conf_cod_familia_benef}  Get Text  ${CONF_COD_FAMILIA_BENEF}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_cod_familia_benef}

    ${conf_nome_mae_benef}  Get Text  ${CONF_NOME_MAE_BENEF}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_nome_mae_benef}

    ${conf_email_benef}  Get Text  ${CONF_EMAIL_BENEF}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_email_benef}

    ${conf_numero_tel_benef}  Get Text  ${CONF_NUMERO_TEL_BENEF}
    ${conf_numero_tel_benef}    Remove String  ${conf_numero_tel_benef}  (41)
    ${conf_numero_tel_benef}    Remover Caracteres Especiais    ${conf_numero_tel_benef}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_numero_tel_benef}

    ${conf_naturalidade_benef}  Get Text  ${CONF_NATURALIDADE_BENEF}
    ${conf_naturalidade_benef}    Replace String  ${conf_naturalidade_benef}  ${conf_naturalidade_benef}  CURITIBA
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_naturalidade_benef}

    ${conf_raca_benef}  Get Text  ${CONF_RACA_BENEF}
    ${conf_raca_benef}  Run Keyword If  '${conf_raca_benef}' == 'Branca'  Replace String  ${conf_raca_benef}  Branca  Branco
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_raca_benef}

    ${conf_estado_civil_benef}  Get Text  ${CONF_ESTADO_CIVIL_BENEF}
    ${conf_estado_civil_benef}    Remove String  ${conf_estado_civil_benef}  (a)
    ${conf_estado_civil_benef}  Run Keyword If  '${conf_estado_civil_benef}' == 'Solteiro'  Replace String  ${conf_estado_civil_benef}  Solteiro  solteiro
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_estado_civil_benef}

    ${conf_tipo_endereco_benef}  Get Text  ${CONF_TIPO_ENDERECO_BENEF}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_tipo_endereco_benef}

    ${conf_cep_benef}  Get Text  ${CONF_CEP_BENEF}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_cep_benef}

    ${conf_numero_benef}  Get Text  ${CONF_NUMERO_BENEF}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_numero_benef}

    ${conf_bairro_benef}  Get Text  ${CONF_BAIRRO_BENEF}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_bairro_benef}

    ${conf_cidade_benef}  Get Text  ${CONF_CIDADE_BENEF}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_cidade_benef}
    
    ${conf_endereco_benef}  Get Text  ${CONF_ENDERECO_BENEF}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_endereco_benef}

    ${conf_complemento_benef}  Get Text  ${CONF_COMPLEMENTO_BENEF}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_complemento_benef}

    ${conf_parana_benef}  Get Text  ${CONF_PARANA_BENEF}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_parana_benef}

    ${conf_pais_benef}  Get Text  ${CONF_PAIS_BENEF}
    Append To List       ${LISTA_TEMP_TITULAR}    ${conf_pais_benef}

    Log Many  @{LISTA_TEMP_TITULAR}
    RETURN    @{LISTA_TEMP_TITULAR}


Salvar dados Beneficiario Dependente - Vidas
    [Arguments]  ${dependente}
    # ----- Dependente -----
    Repeat Keyword  3 times  Press Keys  None  HOME
    Sleep  3s
    @{LISTA_TEMP_DEPENDENTE}    Create List
    Set Focus To Element    xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts_conferencia"]//span[contains(., '${dependente}')]/a
    Click Element  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts_conferencia"]//span[contains(., '${dependente}')]/a
    ${e}  Run Keyword And Ignore Error    Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "PASS"   Run Keyword And Ignore Error    Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=${TIMEOUT}

    # Dependente - Arg0: Nome, Arg1: Vigencia, Arg2: Carencia, Arg3: CPF, Arg4: Data Nasc, Arg5: Idade,
    # ... Arg6: Sexo, Arg7: CNS, Arg8: Tipo, Arg9: Grau Dependencia, Arg10: Cod Familia, Arg11: Nome Mãe, Arg12: Email,
    # ... Arg13: Numero Tel, Arg14: Naturalidade, Arg15: Raça, Arg16: Estado Civil, Arg17: Tipo Endereco,
    # ... Arg18: CEP, Arg19: Numero, Arg20: Bairro, Arg21: Cidade, Arg22: Endereço - Rua, Arg23: Complemento,
    # ... Arg24: Estado, Arg25: Pais

    ${conf_nome_benef_dependente}  Get Text  xpath://div[@id="list_subpanel_saude_beneficiarios_aos_contracts_conferencia"]//span[contains(., '${dependente}')]/a
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_nome_benef_dependente}

    ${conf_vigencia_benef_dependente}  Get Text  ${CONF_VIGENCIA_BENEF_DEPENDENTE}
    ${conf_vigencia_benef_dependente}  Convert Date       ${conf_vigencia_benef_dependente}     date_format=%d/%m/%Y      result_format=%Y-%m-%d
    ${conf_vigencia_benef_dependente}  Catenate  ${conf_vigencia_benef_dependente}   00:00:00
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_vigencia_benef_dependente}

    ${conf_carencia_benef_dependente}  Get Text  xpath://*[@id="LBL_EDITVIEW_PANEL_BENEFICIARIO"]/tbody/tr[3]/td[4]
    ${date}  Get Current Date
    ${date}  Convert Date       ${date}     exclude_millis=yes
    ${date}  Convert Date       ${date}     date_format=%Y-%m-%d %H:%M:%S      result_format=%Y-%m-%d
    ${conf_carencia_benef}  Run Keyword If  '${conf_carencia_benef}' == '${EMPTY}'  Replace String  ${conf_carencia_benef}  ${EMPTY}  ${date}
    ${conf_carencia_benef_dependente}  Catenate  ${conf_carencia_benef_dependente}   00:00:00
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_carencia_benef_dependente}
    
    ${conf_cpf_benef_dependente}  Get Text  ${CONF_CPF_BENEF_DEPENDENTE}
    ${conf_cpf_benef_dependente}    Remover Caracteres Especiais    ${conf_cpf_benef_dependente}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_cpf_benef_dependente}
    
    ${conf_data_nasc_benef_dependente}  Get Text  ${CONF_DATA_NASC_BENEF_DEPENDENTE}
    ${conf_data_nasc_benef_dependente}  Convert Date       ${conf_data_nasc_benef_dependente}     date_format=%d/%m/%Y      result_format=%Y-%m-%d
    ${conf_data_nasc_benef_dependente}  Catenate  ${conf_data_nasc_benef_dependente}   00:00:00
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_data_nasc_benef_dependente}

    ${conf_idade_benef_dependente}  Get Text  ${CONF_IDADE_BENEF_DEPENDENTE}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_idade_benef_dependente}

    ${conf_sexo_benef_dependente}  Get Text  ${CONF_SEXO_BENEF_DEPENDENTE}
    ${conf_sexo_benef_dependente}  Run Keyword If  '${conf_sexo_benef_dependente}' == 'Masculino'  Replace String  ${conf_sexo_benef_dependente}  Masculino  masculino
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_sexo_benef_dependente}

    ${conf_cns_benef_dependente}  Get Text  ${CONF_CNS_BENEF_DEPENDENTE}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_cns_benef_dependente}

    ${conf_tipo_benef_dependente}  Get Text  ${CONF_TIPO_BENEF_DEPENDENTE}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_tipo_benef_dependente}

    ${conf_grau_dep_benef_dependente}  Get Text  ${CONF_GRAU_DEP_BENEF_DEPENDENTE}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_grau_dep_benef_dependente}

    ${conf_cod_familia_benef_dependente}  Get Text  ${CONF_COD_FAMILIA_BENEF_DEPENDENTE}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_cod_familia_benef_dependente}

    ${conf_nome_mae_benef_dependente}  Get Text  ${CONF_NOME_MAE_BENEF_DEPENDENTE}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_nome_mae_benef_dependente}

    ${conf_email_benef_dependente}  Get Text  ${CONF_EMAIL_BENEF_DEPENDENTE}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_email_benef_dependente}

    ${conf_numero_tel_benef_dependente}  Get Text  ${CONF_NUMERO_TEL_BENEF_DEPENDENTE}
    ${conf_numero_tel_benef_dependente}    Remove String  ${conf_numero_tel_benef_dependente}  (41)
    ${conf_numero_tel_benef_dependente}    Remover Caracteres Especiais    ${conf_numero_tel_benef_dependente}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_numero_tel_benef_dependente}

    ${conf_naturalidade_benef_dependente}  Get Text  ${CONF_NATURALIDADE_BENEF_DEPENDENTE}
    ${conf_naturalidade_benef_dependente}    Replace String  ${conf_naturalidade_benef_dependente}  ${conf_naturalidade_benef_dependente}  CURITIBA
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_naturalidade_benef_dependente}

    ${conf_raca_benef_dependente}  Get Text  ${CONF_RACA_BENEF_DEPENDENTE}
    ${conf_raca_benef_dependente}  Run Keyword If  '${conf_raca_benef_dependente}' == 'Branca'  Replace String  ${conf_raca_benef_dependente}  Branca  Branco
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_raca_benef_dependente}

    ${conf_estado_civil_benef_dependente}  Get Text  ${CONF_ESTADO_CIVIL_BENEF_DEPENDENTE}
    ${conf_estado_civil_benef_dependente}    Remove String  ${conf_estado_civil_benef_dependente}  (a)
    ${conf_estado_civil_benef_dependente}  Run Keyword If  '${conf_estado_civil_benef_dependente}' == 'Solteiro'  Replace String  ${conf_estado_civil_benef_dependente}  Solteiro  solteiro
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_estado_civil_benef_dependente}

    ${conf_tipo_endereco_benef_dependente}  Get Text  ${CONF_TIPO_ENDERECO_BENEF_DEPENDENTE}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_tipo_endereco_benef_dependente}

    ${conf_cep_benef_dependente}  Get Text  ${CONF_CEP_BENEF_DEPENDENTE}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_cep_benef_dependente}

    ${conf_numero_benef_dependente}  Get Text  ${CONF_NUMERO_BENEF_DEPENDENTE}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_numero_benef_dependente}

    ${conf_bairro_benef_dependente}  Get Text  ${CONF_BAIRRO_BENEF_DEPENDENTE}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_bairro_benef_dependente}

    ${conf_cidade_benef_dependente}  Get Text  ${CONF_CIDADE_BENEF_DEPENDENTE}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_cidade_benef_dependente}
    
    ${conf_endereco_benef_dependente}  Get Text  ${CONF_ENDERECO_BENEF_DEPENDENTE}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_endereco_benef_dependente}

    ${conf_complemento_benef_dependente}  Get Text  ${CONF_COMPLEMENTO_BENEF_DEPENDENTE}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_complemento_benef_dependente}

    ${conf_parana_benef_dependente}  Get Text  ${CONF_PARANA_BENEF_DEPENDENTE}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_parana_benef_dependente}

    ${conf_pais_benef_dependente}  Get Text  ${CONF_PAIS_BENEF_DEPENDENTE}
    Append To List       ${LISTA_TEMP_DEPENDENTE}    ${conf_pais_benef_dependente}

    Log Many  @{LISTA_TEMP_DEPENDENTE}
    RETURN    @{LISTA_TEMP_DEPENDENTE}


Contrato BENEFICIÁRIO devem estar com produto alterado
    Set Focus To Element  ${MENU_MOVIMENTACAO_CADASTRAL}
    Click Element    ${MENU_MOVIMENTACAO_CADASTRAL}
    
    ${nome_beneficiario1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  3  4
    ${alteracao1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  3  6
    ${produto_antigo1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  3  8
    ${produto_novo_alterado1}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  3  9

    Should Not Be Equal  ${produto_antigo1}  ${produto_novo_alterado1}
    Log  O Beneficiario ${nome_beneficiario1} possuia o ${produto_antigo1} e foi trocado para ${produto_novo_alterado1} com alteração para ${alteracao1}.

    ${nome_beneficiario2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  4  4
    ${alteracao2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  4  6
    ${produto_antigo2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  4  8
    ${produto_novo_alterado2}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  4  9

    Should Not Be Equal  ${produto_antigo2}  ${produto_novo_alterado2}
    Log  O Beneficiario ${nome_beneficiario2} possuia o ${produto_antigo2} e foi trocado para ${produto_novo_alterado2} com alteração para ${alteracao2}.

    ${nome_beneficiario3}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  5  4
    ${alteracao3}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  5  6
    ${produto_antigo3}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  5  8
    ${produto_novo_alterado3}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  5  9

    Should Not Be Equal  ${produto_antigo3}  ${produto_novo_alterado3}
    Log  O Beneficiario ${nome_beneficiario3} possuia o ${produto_antigo3} e foi trocado para ${produto_novo_alterado3} com alteração para ${alteracao3}.

    ${nome_beneficiario4}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  6  4
    ${alteracao4}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  6  6
    ${produto_antigo4}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  6  8
    ${produto_novo_alterado4}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  6  9

    Should Not Be Equal  ${produto_antigo4}  ${produto_novo_alterado4}
    Log  O Beneficiario ${nome_beneficiario4} possuia o ${produto_antigo4} e foi trocado para ${produto_novo_alterado4} com alteração para ${alteracao4}.

    ${nome_beneficiario5}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  7  4
    ${alteracao5}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  7  6
    ${produto_antigo5}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  7  8
    ${produto_novo_alterado5}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  7  9

    Should Not Be Equal  ${produto_antigo5}  ${produto_novo_alterado5}
    Log  O Beneficiario ${nome_beneficiario5} possuia o ${produto_antigo5} e foi trocado para ${produto_novo_alterado5} com alteração para ${alteracao5}.

    ${nome_beneficiario6}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  8  4
    ${alteracao6}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  8  6
    ${produto_antigo6}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  8  8
    ${produto_novo_alterado6}  Get Table Cell  xpath://div[@id="list_subpanel_saude_movimentacao_cadastral_saude_movimentacao_troca_1_conferencia"]/table  8  9

    Should Not Be Equal  ${produto_antigo6}  ${produto_novo_alterado6}
    Log  O Beneficiario ${nome_beneficiario6} possuia o ${produto_antigo6} e foi trocado para ${produto_novo_alterado6} com alteração para ${alteracao6}.
