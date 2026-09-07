*** Settings ***
Resource    ../../../main.resource

*** Variables ***
${TIMEOUT} =  30
${MENU_COMERCIAL} =  xpath://*[@id="grouptab_0"][contains(.,'Comercial')]
${SUBMENU_POTENCIAL_CLIENTE} =  xpath://a[contains(text(), "Comercial")]/..//a[text()="Potenciais Clientes"]
${SUBMENU_CONTAS} =  xpath://a[contains(text(), "Comercial")]/..//a[text()="Contas"]
${SUBMENU_OPORTUNIDADE} =  xpath://a[contains(text(), "Comercial")]/..//a[text()="Oportunidades"]
${SUBMENU_COTACOES} =  xpath://a[contains(text(), "Comercial")]/..//a[text()="Cotações"]
${SUBMENU_CONTRATOS} =  xpath://a[contains(text(), "Comercial")]/..//a[text()="Contratos"]
${SUBMENU_SOLICITACAO_PORTABILIDADE} =  xpath://a[contains(text(), "Todos")]/..//a[contains(., 'Solicitação de Portabilidade')]
${MENU_OPERACOES} =  id:grouptab_1

${SUBMENU_IMPORTACAO} =     xpath:(//li/a[@module='saude_IMPORTACAO'])[1]
### NOVOS 
${MENU_PRODUTOS} =     xpath://a[@id='grouptab_2']
${SUBMENU_CONVENIO} =     xpath:(//ul[@class='dropdown-menu']//a[text()='Convênio'])[1]
${SUBMENU_PLANOS} =     xpath:(//ul[@class='dropdown-menu']//a[text()='Planos'])[1]
${SUBMENU_PRODUTOS} =     xpath:(//ul[@class='dropdown-menu']//a[text()='Produtos'])[1]
${SUBMENU_TODOS_ALCADA} =     xpath:(//span[@class='notCurrentTab'])[9]/ul//a[text()='Alçada']
### NOVOS 
${SUBMENU_CONFERENCIA} =  xpath://a[text()="Conferência"]
${MENU_PERFIL} =  id:usermenu
${SUBMENU_ADMINISTRADOR} =  xpath://*[contains(text(),"Prime Automação")]/../..//a[contains(text(), "Administrador")]
${LINK_AGENDADORES} =  xpath://*[@id="scheduler"]
${INPUT_NOME_DA_TAREFA} =  id:name_basic
${PESQUISAR_TAREFA} =  id:search_form_submit
${RESULTADO_PESQUISA_TAREFA} =  xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[3]/b/a[contains(., 'Solicitação de Integração Automática')]
${STATUS_TAREFA_ATIVA} =  xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[contains(., 'Ativo')]
${RESULTADO_PESQUISA_TAREFA_CONTRATO_SINC} =  xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[3]/b/a[contains(., '[CONTRATO] Sincronização')]
${MENU_PARAMETROS} =  id:grouptab_4
${SUBMENU_PARAMETROS_COMERCIAIS} =  xpath://a[@id = "grouptab_4"]/..//a[text()="Parâmetros Comerciais"]
${SUBMENU_PARAMETROS_COMERCIAIS} =  xpath://a[text()="Parâmetros Comerciais"]
${PARAM_COMERCIAIS_ABA_INTEGRACAO} =     xpath://div[@id='saude_CONFIGURACAO_detailview_tabs']//li//em[text()='Integração']

${STATUS_EDITAR_AGENDADOR} =  id:status
${SUBMENU_MOVIMENTACAO_EM_MASSA} =  xpath://a[text()="Movimentação em Massa"]
${MENU_TODOS} =  id:grouptab_8
${MENU_TODOS_EXPANDIDO} =  xpath://*[@id="bs-example-navbar-collapse-1"]/ul/li[10]/span[2]/ul
${SUBMENU_USER_CANAL_CONTRATANTE} =  xpath://a[contains(.,'Todos') and @class = 'dropdown-toggle']/following-sibling::ul/child::li/a[contains(., 'Usuários Canal Contratante')]
${SITUACAO_BASIC} =  xpath://*[@id="situacao_basic"]/option[2][contains(.,'Aguardando Validação')]
${PESQUISAR_BTN} =  id:search_form_submit
${SOLICITACAO_PORTABILIDADE} =  xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[3]/b/a
${SOLICITACAO_PORTABILIDADE_MENU} =  xpath://*[@id="bs-example-navbar-collapse-1"]/ul/li[2]/span[2]/ul/li[15][contains(.,'Solicitação de Portabilidade')]
${PESQUISAR_LIMPAR} =  id:search_form_clear
${SUBMENU_IMPORTACAO} =  xpath://a[contains(text(), "Operações")]/..//a[text()="Importação"]


*** Keywords ***
Colocar o mouse no Comercial
        Wait Until Page Contains Element    ${MENU_COMERCIAL}     timeout=${TIMEOUT}
		Mouse Over  ${MENU_COMERCIAL}

Clicar no submenu Pontecial Cliente
		Wait Until Page Contains Element   ${SUBMENU_POTENCIAL_CLIENTE}    timeout=${TIMEOUT}
		Click Element  ${SUBMENU_POTENCIAL_CLIENTE}

Clicar no submenu Importação
        Wait Until Element Is Visible    ${SUBMENU_IMPORTACAO} 
		Click Element            ${SUBMENU_IMPORTACAO} 
Clicar no submenu Contas
		Wait Until Element Is Visible  ${SUBMENU_CONTAS}  timeout=${TIMEOUT}
		Click Element  ${SUBMENU_CONTAS}

Clicar no submenu Oportunidades
		Wait Until Element Is Visible  ${SUBMENU_OPORTUNIDADE}  timeout=${TIMEOUT}
		Click Element  ${SUBMENU_OPORTUNIDADE}

Clicar no submenu Cotações
		Wait Until Element Is Visible  ${SUBMENU_COTACOES}  timeout=${TIMEOUT}
		Click Element  ${SUBMENU_COTACOES}

Clicar no submenu Planos
		Wait Until Element Is Visible  ${SUBMENU_PLANOS}  timeout=${TIMEOUT}
		Click Element   ${SUBMENU_PLANOS}

Clicar no submenu Convenio
		Wait Until Element Is Visible  ${SUBMENU_CONVENIO}  timeout=${TIMEOUT}
		Click Element   ${SUBMENU_CONVENIO}

Clicar no submenu Produtos
		Wait Until Element Is Visible  ${SUBMENU_PRODUTOS}  timeout=${TIMEOUT}
		Click Element   ${SUBMENU_PRODUTOS}
Clicar no submenu Alçada
		Wait Until Element Is Visible  ${SUBMENU_TODOS_ALCADA}  timeout=${TIMEOUT}
		Click Element   ${SUBMENU_TODOS_ALCADA}

Clicar no submenu Usuários Canal Contratante
		Wait Until Element Is Visible ${SUBMENU_USER_CANAL_CONTRATANTE}  timeout=${TIMEOUT}
		Click Element   ${SUBMENU_USER_CANAL_CONTRATANTE}
        
Colocar o mouse no Menu Produtos
		Mouse Over  	${MENU_PRODUTOS}

Colocar O mouse no Menu Todos
		Mouse Over  	${MENU_TODOS}

Clicar no submenu Contratos
		${e}  Run Keyword And Ignore Error  Wait Until Element Is Visible  ${SUBMENU_CONTRATOS}  timeout=${TIMEOUT}
		Run Keyword If  "${e[0]}" == "PASS"  Click Element  ${SUBMENU_CONTRATOS}
		Run Keyword If  "${e[0]}" == "FAIL"  Mouse Over  ${MENU_COMERCIAL}
		Run Keyword If  "${e[0]}" == "FAIL"  Sleep  5s
		Run Keyword If  "${e[0]}" == "FAIL"  Execute Javascript   document.getElementById("moduleTab_114_Contratos").click()


Clicar no submenu Solicitação de Portabilidade
		Wait Until Element Is Visible  ${SUBMENU_COTACOES}  timeout=${TIMEOUT}
		Set Focus To Element  ${SUBMENU_SOLICITACAO_PORTABILIDADE}
		Click Element  ${SUBMENU_SOLICITACAO_PORTABILIDADE}

Verificar se usuario logou
		[Arguments]     ${nome_usuario_logado}
		Page Should Contain  ${nome_usuario_logado}

Colocar o mouse no Operações
		Mouse Over  ${MENU_OPERACOES}

Clicar no submenu Conferencia
		${menu_conferencia}  Click Element  ${SUBMENU_CONFERENCIA}
		Run Keyword If  '${menu_conferencia}' == 'FAIL'  Mouse Over  ${MENU_OPERACOES}
		Run Keyword If  '${menu_conferencia}' == 'FAIL'  Sleep  3s
		Run Keyword If  '${menu_conferencia}' == 'FAIL'  Click Element  ${SUBMENU_CONFERENCIA}


Ativar o Agendador "Solicitação de Integração Automática"
		Mouse Over  ${MENU_PERFIL}
		Sleep  2s
		Click Element  ${SUBMENU_ADMINISTRADOR}
		Wait Until Page Contains  Administração  timeout=${TIMEOUT}
		Set Focus To Element  ${LINK_AGENDADORES}
		Click Element  ${LINK_AGENDADORES}
		Wait Until Page Contains  Agendador » Pesquisar » Pesquisar  timeout=${TIMEOUT}
		Clear Element Text   ${INPUT_NOME_DA_TAREFA}
		Input Text   ${INPUT_NOME_DA_TAREFA}  Solicitação de Integração Automática
		Sleep  3s
		Click Element  ${PESQUISAR_TAREFA}
		Wait Until Element Is Visible  ${RESULTADO_PESQUISA_TAREFA}    timeout=${TIMEOUT}
		${m}  Run Keyword And Ignore Error   Wait Until Element Is Visible  ${STATUS_TAREFA_ATIVA}    timeout=${TIMEOUT}
		Run Keyword If  '${m[0]}' == 'FAIL'  Editar o agendador "Solicitação de Integração Automática" para ATIVO


Editar o agendador "Solicitação de Integração Automática" para ATIVO
		Set Focus To Element  xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[3]
		Click Element  xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[3]
		Set Focus To Element  ${BTN_EDITAR}
		Click Element  ${BTN_EDITAR}
		Wait Until Page Contains  Agendador » Solicitação de Integração Automática»Editar  timeout=${TIMEOUT}
		Select From List By Label  ${STATUS_EDITAR_AGENDADOR}  Ativo
		Execute Javascript   document.getElementById("SAVE_HEADER").click()
		Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
		Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
		Wait Until Page Contains  Agendador » Solicitação de Integração Automática  timeout=${TIMEOUT}


Ativar o Agendador "CONTRATO Sincronização"
		Mouse Over  ${MENU_PERFIL}
		Sleep  2s
		Click Element  ${SUBMENU_ADMINISTRADOR}
		Wait Until Page Contains  Administração  timeout=${TIMEOUT}
		Set Focus To Element  ${LINK_AGENDADORES}
		Click Element  ${LINK_AGENDADORES}
		Wait Until Page Contains  Agendador » Pesquisar » Pesquisar  timeout=${TIMEOUT}
		Set Focus To Element  ${INPUT_NOME_DA_TAREFA}
		Input Text   ${INPUT_NOME_DA_TAREFA}  [CONTRATO] Sincronização  clear= True
		Sleep  3s
		Click Element  ${PESQUISAR_TAREFA}
		Wait Until Element Is Visible  ${RESULTADO_PESQUISA_TAREFA_CONTRATO_SINC}    timeout=${TIMEOUT}
		Wait Until Element Is Visible  ${STATUS_TAREFA_ATIVA}    timeout=${TIMEOUT}


Ativar o Agendador "Conferência - Realizar conferência automática"
		Mouse Over  ${MENU_PERFIL}
		Sleep  2s
		Click Element  ${SUBMENU_ADMINISTRADOR}
		Wait Until Page Contains  Administração  timeout=${TIMEOUT}
		Set Focus To Element  ${LINK_AGENDADORES}
		Click Element  ${LINK_AGENDADORES}
		Wait Until Page Contains  Agendador » Pesquisar » Pesquisar  timeout=${TIMEOUT}
		Clear Element Text   ${INPUT_NOME_DA_TAREFA}
		Input Text   ${INPUT_NOME_DA_TAREFA}   Conferência - Realizar conferência automática
		Sleep  3s
		Click Element  ${PESQUISAR_TAREFA}
		Wait Until Element Is Visible  ${RESULTADO_PESQUISA_TAREFA}    timeout=${TIMEOUT}
		${m}  Run Keyword And Ignore Error   Wait Until Element Is Visible  ${STATUS_TAREFA_ATIVA}    timeout=${TIMEOUT}
		Run Keyword If  '${m[0]}' == 'FAIL'  Editar o agendador "Conferência - Realizar conferência automática" para ATIVO


Editar o agendador "Conferência - Realizar conferência automática" para ATIVO
		Set Focus To Element  xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[3]
		Click Element  xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[3]
		Set Focus To Element  ${BTN_EDITAR}
		Click Element  ${BTN_EDITAR}
		Wait Until Page Contains  Agendador » Conferência - Realizar conferência automática » Editar  timeout=${TIMEOUT}
		Select From List By Label  ${STATUS_EDITAR_AGENDADOR}  Ativo
		Execute Javascript   document.getElementById("SAVE_HEADER").click()
		Run Keyword And Ignore Error   Wait Until Page Contains    Carregando página, por favor aguarde...    timeout=60
		Run Keyword And Ignore Error   Wait Until Page Does Not Contain    Carregando página, por favor aguarde...    timeout=60
		Wait Until Page Contains  Agendador » Conferência - Realizar conferência automática  timeout=${TIMEOUT}


Colocar o mouse no Parametros
		Mouse Over  ${MENU_PARAMETROS}


Clicar no submenu Parametros Comerciais
		Click Element  ${SUBMENU_PARAMETROS_COMERCIAIS}

Veficar aba Integração, URL consulta dados produto
    Wait Until Element Is Visible    ${PARAM_COMERCIAIS_ABA_INTEGRACAO}
    Click Element    ${PARAM_COMERCIAIS_ABA_INTEGRACAO}
	Sleep    2
    Element Text Should Not Be     xpath://table[@id='LBL_EDITVIEW_PANEL3']//tr[6]/td[1]        ${EMPTY}


Acessou o módulo Movimentação em Massa
		Wait Until Element Is Visible  ${SUBMENU_MOVIMENTACAO_EM_MASSA}  timeout=${TIMEOUT}
		Click Element  ${SUBMENU_MOVIMENTACAO_EM_MASSA}
		Wait Until Page Contains  Movimentação em Massa » Pesquisar  timeout=${TIMEOUT}


Acessar o menu Todos > Solicitação de Portabilidade
		Mouse Over  ${MENU_TODOS}
		Scroll Element Into View  ${SUBMENU_SOLICITACAO_PORTABILIDADE}
		Sleep  3s
		Set Focus To Element  ${SUBMENU_SOLICITACAO_PORTABILIDADE}
		Click Element  ${SUBMENU_SOLICITACAO_PORTABILIDADE}
		#Execute Javascript  document.getElementById("moduleTab_115_Solicitação de Portabilidade").click()


Acessou o módulo Todos > Usuário Canal do Contratante
		Mouse Over    ${MENU_TODOS}
		Scroll Element Into View  ${SUBMENU_USER_CANAL_CONTRATANTE}
		Sleep  3s
		Set Focus To Element  ${SUBMENU_USER_CANAL_CONTRATANTE}
		Click Element  ${SUBMENU_USER_CANAL_CONTRATANTE}
        Wait Until Page Contains  Usuários Canal do Contratante » Pesquisar  timeout=${TIMEOUT}

Acessou a Solicitação de Portabilidade pelo CRM
		Comum.Abrir Nav
        CRMUnimedPR.Usuário logou no sistema
        Colocar o mouse no Comercial
		Click Element  ${SOLICITACAO_PORTABILIDADE_MENU}
		Click Element  ${PESQUISAR_LIMPAR}
		Click Element  ${SITUACAO_BASIC}
		Click Element  ${PESQUISAR_BTN}
		Mouse Over  ${SOLICITACAO_PORTABILIDADE}
		Click Element  ${SOLICITACAO_PORTABILIDADE}