*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary
Library    OperatingSystem

Resource   ../CRMUnimedPR.robot
Resource   ../../../utils/Comum.robot

*** Variables ***
${INPUT_SEARCH_COD_PRODUTO} =        xpath://input[@id='part_number_advanced']
${BTN_SEARCH_ADVANCED} =             xpath://input[@id='search_form_submit_advanced']
${ITEM_LINK_SEARCH_PRODUTO} =       xpath://table[@class='list view table footable-loaded footable']//tr[@class='oddListRowS1']/td[3]/a
${SELECT_TIPO_PRODUTO} =           xpath://select[@id='tipo_c']
${SELECT_OPTION_ASSISTENCIAL} =    xpath://select[@id='tipo_c']/option[@label='Assistencial']
${SELECT_OPTION_ACESSORIO} =       xpath://select[@id='tipo_c']/option[@label='Acessório']
${INPUT_COD_PRODUTO} =             xpath://input[@id='part_number']
${INPUT_NAME_PRODUTO} =            xpath://input[@id='name']
${INPUT_NAME_COMERCIAL} =          xpath://input[@id='nome_comercializao_c']
${INPUT_NUM_REGISTRO_ANS} =        xpath://input[@id='numero_reg_ans_c']
${INPUT_NUM_TIPO_PLANO} =          xpath://input[@id='aos_product_category_name']
${INPUT_DT_INCIO_PRODUTO} =        xpath://input[@id='data_inicio_comerc_c']
${INPUT_DT_FIM_PRODUTO} =          xpath://input[@id='data_fim_comerc_c']
${SELECT_TIPO_TABELA} =            xpath://select[@id='tipo_tabela_c']
${SELECT_SEGMENTACAO_ASSIST} =    xpath://select[@id='segmentacao_assistencial_c']

#select abrangencia
${SELECT_ABRANGENCIA} =            xpath://select[@id='abrangencia_geografica_c']

 # select padrao acomodação 
${SELECT_PADRAO_ACOMODACAO} =      xpath://select[@id='padrao_acomodacao_c']

# TIPO CONTRATAÇÃO 3X
${SELECT_TIPO_COBRANCA} =          xpath://select[@id='pro_mod_cobranca_c']
${SELECT_PLANO_ADAPTADO} =         xpath://select[@id='plano_adaptado_c']
${SELECT_ETARIA_ANS} =             xpath://select[@id='faixa_etaria_ans_c']
${SELECT_ANS_OPTION_NAO} =         xpath://select[@id='faixa_etaria_ans_c']/option[@label='Não']

${BTN_SALVAR_PRODUTO} =            xpath://input[@id='SAVE_FOOTER']
${BTN_SALVAR_IMPORTACAO} =         xpath://input[@id='SAVE_HEADER'] 
${PRODUTO_BTN_EDITAR} =            xpath://a[@id='edit_button']
${PRODUTO_SETA_ABRIR_EDITAR} =     xpath://a[@id='edit_button']/following-sibling::span
${SUBMENU_SINCRONIZAR_EDITAR} =    xpath://ul[@class='subnav ddopen']//a[text()='Sincronizar']
${MODAL_CONFIRM_SINCRONIZAR} =     xpath://div[@id='modal_sugar_box']//div[text()='Sincronizar']
${MODAL_BTNSIN_SINCRONIZAR} =      xpath://div[@id='modal_sugar_box']/div[3]/span//button[text()='Sim']
${TABLE_BASICO_TXT_TIPO_PRODUTO} =    xpath://table[@id='DEFAULT']//tr[1]/td[2]
${TABLE_BASICO_TXT_COD_PRODUTO} =     xpath://table[@id='DEFAULT']//tr[1]/td[4]
${TABLE_BASICO_TXT_DT_INICIO} =       xpath://table[@id='DEFAULT']//tr[4]/td[4]
${TABLE_BASICO_TXT_NOME_COMERCIAL} =  xpath://table[@id='DEFAULT']//tr[3]/td[2]
${TABLE_BASICO_TXT_TIPO_CONTRATC} =   xpath://table[@id='DEFAULT']//tr[4]/td[2]      #Coletivo Empresarial
${TABLE_BASICO_TXT_NUM_PLANO} =    xpath://table[@id='DEFAULT']//tr[2]/td[2]
${MENU_FATOR_MODERADOR} =          xpath://a[@id='tab1']/em
${MENU_OUTRO} =                    xpath://a[@id='tab2']/em

${TABLE_PRECO_BTN_CRIAR} =      xpath://div[@id='list_subpanel_saude_preco_aos_products']//thead//a[text()='Criar']
${TABLE_ALCADA_BTN_SELECIONAR} =     xpath://a[@id='saude_alcada_aos_products_1_select_button']
${TABLE_INPUT_USER_LOGIN} =     xpath://input[@id='assigned_user_name']
${TABLE_PRECO_BTN_SALVAR} =     xpath:(//input[@id='saude_PRECO_subpanel_save_button'])[1]
${LINK_REGISTRO_TABLE_PRECO} =  xpath://div[@id='list_subpanel_saude_preco_aos_products']/table/tbody//tr[@class='oddListRowS1']/td[1]//a
${TABLE_FAIXA_ETARIA_BTN_CRIAR} =    xpath://a[@id='saude_FAIXA_ETARIAS_criar_button']
${INPUT_FAIXA_ETARIA_QTD_VIDAS} =    xpath://input[@id='qtd_depndentes']
${INPUT_FAIXA_ETARIA_VALOR} =        xpath://input[@id='valor']
${FAIXA_ETARIA_BTN_SALVAR} =    xpath://input[@id='SAVE_HEADER'] 

${PAINEL_PRODUTOS_NOME_VINCULADO} =     id:nome_comercializao_c

${IMPORTACAO_INPUT_NAME} =     xpath://input[@id='document_name']
${IMPORTACAO_SELECT_TIPO} =    xpath://select[@id='tipo_importacao_c']
${IMPORTACAO_BTN_SUBMIT_FILE} =     id:uploadfile_file

*** Variables ***
${NOME_PRODUTO} =    Ambulatorio Prime

*** Keywords ***
Pesquisar Produto Assistencial no modulo Produto
    [Arguments]     ${TYPE_PLANO}       ${PLN_INDEX_QUERY}   
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${plano}    Get text    ${PLANOS_TITLE_PAGE}
    Should Be Equal     ${plano}    Produtos » Pesquisar
    Execute Javascript       window.scrollTo(400,0)
    Click Element       xpath=//a[@id='advanced_search_link']
    Execute Javascript       window.scrollTo(0,400)    
    Click Element       xpath=//input[@title='Limpar']
    Sleep   2
    Execute Javascript       window.scrollTo(400,0)    
    Sleep   2
    Input Text    ${INPUT_SEARCH_COD_PRODUTO}     ${PLN_INDEX_QUERY[0][1]}    #${QUERY_PLSQL_ASSIST[0][1]}
    Scroll Element Into View      ${BTN_SEARCH_ADVANCED}
    Wait Until Element Is Visible    ${BTN_SEARCH_ADVANCED}
    Click Element    ${BTN_SEARCH_ADVANCED}
    Scroll Element Into View      xpath=//div[@id='links']
    Set Browser Implicit Wait    10 seconds
    ${STATUS_ASSIST}     Run Keyword And Return Status      Wait Until Page Contains Element    xpath=//a[contains(text(),"${PLN_INDEX_QUERY[0][1]}")]    timeout=10
    IF   $STATUS_ASSIST == True
        Click Element    xpath=//a[contains(text(),"${PLN_INDEX_QUERY[0][1]}")]
        Validar se Produto tem tabela de preço     ${TYPE_PLANO}   
    ELSE
        Element Text Should Be    xpath=//p[contains(text(),"Nenhum resultado encontrado.")]       Nenhum resultado encontrado.
        IF  $TYPE_PLANO == 'Empresarial'
                Log     Cadastrando produtoassistencial COLETIVO EMPRESARIAL        console=yes
            T032 - CADASTRAR E SINCRONIZAR PRODUTO ASSISTENCIAL COLETIVO EMPRESARIAL
            Realizar cadastro de um segundo Produto Assitencial Coletivo Empresarial    

        ELSE IF  $TYPE_PLANO == 'Adesao'
            Log     Cadastrando produtoassistencial COLETIVO ADESÃO        console=yes
            T032.1 - CADASTRAR E SINCRONIZAR PRODUTO ASSISTENCIAL COLETIVO ADESÃO  
            Realizar cadastro de um segundo Produto Assitencial Coletivo Adesão
        ELSE
            Log     Cadastrando produtoassistencial INDIVIDUAL FAMILIAR        console=yes
            T032.2 - CADASTRAR E SINCRONIZAR PRODUTO ASSISTENCIAL INDIVIDUAL FAMILIAR
            Realizar cadastro de um segundo Produto Assitencial Individual Familiar
        END

    END



Pesquisar Produto Acessorio no modulo Produto
    [Arguments]         ${PDT_INDEX_QUERY}
    Execute Javascript       window.scrollTo(0,400)    
    Click Element   xpath=//input[@title='Limpar']
    Sleep   2
    Execute Javascript       window.scrollTo(400,0)    
    Sleep   2
    Input Text    ${INPUT_SEARCH_COD_PRODUTO}     ${PDT_INDEX_QUERY}    #${QUERY_PLSQL_ACESSOR[0][2]}
    Sleep   1
    Scroll Element Into View      ${BTN_SEARCH_ADVANCED}
    Wait Until Element Is Visible    ${BTN_SEARCH_ADVANCED}
    Click Element    ${BTN_SEARCH_ADVANCED}
    Scroll Element Into View      xpath=//div[@id='links']
    Set Browser Implicit Wait    10 seconds
    ${STATUS_ACESSOR}     Run Keyword And Return Status      Wait Until Page Contains Element       xpath=//table//a[text()=${PDT_INDEX_QUERY}]    timeout=10
    Log To Console    ${STATUS_ACESSOR}
    IF   $STATUS_ACESSOR == True
        Sleep   2
        Click Element    xpath=//table//a[text()=${PDT_INDEX_QUERY}]
        Validar se Produto tem tabela de preço Produto acessorio

    ELSE
        Log    Nenhum Produto encontrado no CRM
        T029 - CADASTRAR PRODUTO ACESSÓRIO
    END

Pesquisar se Existe Produtos no CRM apos a Query
    [Arguments]        ${TYPE_PLANO}        ${TYPE_PRODUCT}     ${PLSQL_ASSIST}      ${QUERY_PLSQL_ACESSOR}
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${plano}    Get text    ${PLANOS_TITLE_PAGE}
    Should Contain     ${plano}    Produtos »
    Execute Javascript       window.scrollTo(400,0)    
    Click Element       xpath=//a[@id='advanced_search_link']
    IF    $TYPE_PRODUCT == "Assistencial"
        Execute Javascript       window.scrollTo(0,400)    
        Click Element   xpath=//input[@title='Limpar']
        Sleep   2
        Execute Javascript       window.scrollTo(400,0)    
        Sleep   2
        Input Text    ${INPUT_SEARCH_COD_PRODUTO}     ${PLSQL_ASSIST[0][1]}
        Scroll Element Into View      ${BTN_SEARCH_ADVANCED}
        Wait Until Element Is Visible    ${BTN_SEARCH_ADVANCED}
        Click Element    ${BTN_SEARCH_ADVANCED}
        Wait Until Page Contains Element    ${BTN_SEARCH_ADVANCED}
        Scroll Element Into View      xpath=//div[@id='links']
        Set Browser Implicit Wait    10 seconds
        ${ASSST}     Run Keyword And Return Status      Page Should Contain Element   xpath=//table//tbody/tr/td/a[text()=${PLSQL_ASSIST[0][1]}]   limit=1
        Log To Console    ${ASSST}
        IF   $ASSST == True
            Log To Console    Assistencial True
            Click Element     xpath=//table//tbody/tr/td/a[text()=${PLSQL_ASSIST[0][1]}]
            Vincular produto Acessorio do painel Produtos Acessório Permitidos no Produto Assistencial       ${QUERY_PLSQL_ACESSOR}
        ELSE
            Element Text Should Be    xpath=//div[@class='list view listViewEmpty footable-loaded footable']/p       Nenhum resultado encontrado.
            Colocar o mouse no Menu Produtos
            Clicar no submenu Produtos
            Cadastrar Novo produto Assitencial "${TYPE_PLANO}"
        END

    ELSE
        Execute Javascript       window.scrollTo(0,400)    
        Click Element   xpath=//input[@title='Limpar']
        Sleep   2
        Execute Javascript       window.scrollTo(400,0)    
        Sleep   2
        Input Text    ${INPUT_SEARCH_COD_PRODUTO}      ${QUERY_PLSQL_ACESSOR}       #${QUERY_PLSQL_ACESSOR[0][2]}
        Sleep    1
        Scroll Element Into View      ${BTN_SEARCH_ADVANCED}
        Wait Until Element Is Visible    ${BTN_SEARCH_ADVANCED}
        Click Element    ${BTN_SEARCH_ADVANCED}
        Wait Until Page Contains Element    ${BTN_SEARCH_ADVANCED}
        Scroll Element Into View      xpath=//div[@id='links']
        Set Browser Implicit Wait    10 seconds
        ${STATUS_2}     Run Keyword And Return Status      Wait Until Page Contains Element    xpath=//table//tbody/tr/td/a[text()=${QUERY_PLSQL_ACESSOR}]    timeout=10
        IF   $STATUS_2 == True
            Log To Console    Acessorio True
            Page Should Contain Element     xpath=//table//tbody/tr/td/a[text()=${QUERY_PLSQL_ACESSOR}]    limit=1
        ELSE
            Element Text Should Be    xpath=//div[@class='list view listViewEmpty footable-loaded footable']/p       Nenhum resultado encontrado.
            Colocar o mouse no Menu Produtos
            Clicar no submenu Produtos
            Cadastrar Novo produto Acessorio        ${QUERY_PLSQL_ACESSOR} 
        END
        
        
    END


Cadastrar Novo produto Acessorio
    [Arguments]     ${PDT_COD_QUERY}
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${plano}    Get text    ${PLANOS_TITLE_PAGE}
    Should Be Equal     ${plano}    Produtos » Pesquisar

    Click Element       ${BTN_CRIAR}
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${criar}    Get text    ${PLANOS_TITLE_PAGE}
    Should Be Equal     ${criar}    Produtos » Criar

    Click Element    ${SELECT_TIPO_PRODUTO}
    Click Element    ${SELECT_OPTION_ACESSORIO}
    Sleep    2
    Input Text    ${INPUT_COD_PRODUTO}        ${PDT_COD_QUERY}  #${QUERY_PLSQL_ACESSOR[0][2]}
    Input Text    ${INPUT_NAME_PRODUTO}       ${PDT_COD_QUERY} - ${NOME_PRODUTO} Acessorio
    Input Text    ${INPUT_NAME_COMERCIAL}      ${PDT_COD_QUERY} - ${NOME_PRODUTO} Acessorio
    ${GLOBAL_NAME_PDT_ACESSORIO} =    Catenate          ${PDT_COD_QUERY} - ${NOME_PRODUTO}    Acessorio
    Set Global Variable        ${GLOBAL_NAME_PDT_ACESSORIO}

    ${date}  Get Current Date
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${date}  Add Time To Date   ${date}  1 days    exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Sleep   1
    Execute Javascript      document.getElementById('data_inicio_comerc_c').value = "${data_formatada}";
    
    Select From List By Label    ${SELECT_PLANO_ADAPTADO}    Não
    Execute Javascript       window.scrollTo(0,300)    

    Click Element    ${SELECT_ETARIA_ANS}
    Click Element    ${SELECT_ANS_OPTION_NAO}
    Execute Javascript       window.scrollTo(0,1000)    
    Click Element    ${BTN_SALVAR_PRODUTO}

    Wait Until Page Contains Element     ${PRODUTO_BTN_EDITAR}
    Element Text Should Be    ${TABLE_BASICO_TXT_TIPO_PRODUTO}     Acessório
    Element Text Should Be    ${TABLE_BASICO_TXT_COD_PRODUTO}      ${PDT_COD_QUERY}
    Element Text Should Be    ${TABLE_BASICO_TXT_DT_INICIO}        ${data_formatada}
    Element Text Should Be    ${TABLE_BASICO_TXT_NOME_COMERCIAL}   ${GLOBAL_NAME_PDT_ACESSORIO}
    
    Click Element    ${MENU_FATOR_MODERADOR}
    Capture Page Screenshot
    Sleep    1
    Click Element    ${MENU_OUTRO}

Cadastrar Novo produto Assistencial
    [Arguments]     ${TYPE}     ${QUERY_PLSQL_ASSIST}
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${plano}    Get text    ${PLANOS_TITLE_PAGE}
    Should Be Equal     ${plano}    Produtos » Pesquisar

    Click Element       ${BTN_CRIAR}
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${criar}    Get text    ${PLANOS_TITLE_PAGE}
    Should Be Equal     ${criar}    Produtos » Criar
    
    Input Text    ${INPUT_NUM_TIPO_PLANO}     ${str_pla_cod}
    Input Text    ${INPUT_NUM_REGISTRO_ANS}   478
    Input Text    ${INPUT_SEARCH_COD_PRODUTO}     ${QUERY_PLSQL_ASSIST}
    Input Text    ${INPUT_COD_PRODUTO}        ${QUERY_PLSQL_ASSIST}
    Input Text    ${INPUT_NAME_PRODUTO}       ${QUERY_PLSQL_ASSIST} - ${NOME_PRODUTO}
    Input Text    ${INPUT_NAME_COMERCIAL}     ${QUERY_PLSQL_ASSIST} - ${NOME_PRODUTO}
    
    #Coletivo Adesão | Individual Familiar | Coletivo Empresarial
    Select From List By Label    xpath=//select[@id='tipo_contratacao_c']    ${TYPE}
    IF    $TYPE == 'Coletivo Empresarial'
        ${GLOBAL_ASSISTENCIAL_EMPRESARIAL} =    Catenate       ${QUERY_PLSQL_ASSIST}-     ${NOME_PRODUTO} 
        Set Global Variable       ${GLOBAL_ASSISTENCIAL_EMPRESARIAL}

    ELSE IF     $TYPE == 'Coletivo por Adesão'
        ${GLOBAL_ASSISTENCIAL_ADESAO} =    Catenate       ${QUERY_PLSQL_ASSIST}-     ${NOME_PRODUTO} 
        Set Global Variable       ${GLOBAL_ASSISTENCIAL_ADESAO}

    ELSE

        ${GLOBAL_ASSISTENCIAL_PF} =    Catenate       ${QUERY_PLSQL_ASSIST}-     ${NOME_PRODUTO} 
        Set Global Variable       ${GLOBAL_ASSISTENCIAL_PF}
    END
    #select tipo tabela
    Select From List By Label    ${SELECT_TIPO_TABELA}    Range de Vidas

    #select segmentação assistencial
    Select From List By Label    ${SELECT_SEGMENTACAO_ASSIST}    Ambulatorial 
    #MAPEAR AS OPÇÕES CERTAS NO MENU
    
    #select abrangencia 
    Select From List By Label    ${SELECT_ABRANGENCIA}    Nacional
    #MAPEAR AS OPÇÕES CERTAS NO MENU

    Select From List By Label    ${SELECT_PLANO_ADAPTADO}    Não
    # select padrao acomodação
    Select From List By Label    ${SELECT_PADRAO_ACOMODACAO}    Apartamento 
    #MAPEAR AS OPÇÕES CERTAS NO MENU

    Select From List By Label    ${SELECT_TIPO_COBRANCA}    Pré Pagamento

    ${date}  Get Current Date
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${date}  Add Time To Date   ${date}  1 days    exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Execute Javascript      document.getElementById('data_inicio_comerc_c').value = '${data_formatada}';
    Sleep       1
    Execute Javascript       window.scrollTo(0,1000)    
    Click Element    ${BTN_SALVAR_PRODUTO}



Cadastrar um segundo Plano Assistencial
    [Arguments]      ${TYPE_2}    ${QUERY_PLSQL_ASSIST}        ${QUERY_PLSQL_PLA}
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${plano}    Get text    ${PLANOS_TITLE_PAGE}
    Should Be Equal     ${plano}    Produtos » Pesquisar

    Click Element       ${BTN_CRIAR}
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${criar}    Get text    ${PLANOS_TITLE_PAGE}
    Should Be Equal     ${criar}    Produtos » Criar
    
    Input Text    ${INPUT_NUM_TIPO_PLANO}     ${QUERY_PLSQL_PLA}
    Input Text    ${INPUT_NUM_REGISTRO_ANS}   478
    Input Text    ${INPUT_COD_PRODUTO}         ${QUERY_PLSQL_ASSIST}
    Input Text    ${INPUT_NAME_PRODUTO}        ${QUERY_PLSQL_ASSIST} - ${NOME_PRODUTO}
    Input Text    ${INPUT_NAME_COMERCIAL}      ${QUERY_PLSQL_ASSIST} - ${NOME_PRODUTO}
    ${GLOBAL_NAME_PDT_ASSISTENCIAL_2} =    Catenate       ${QUERY_PLSQL_ASSIST} -     ${NOME_PRODUTO}
    Set Global Variable       ${GLOBAL_NAME_PDT_ASSISTENCIAL_2}

    #Coletivo Adesão | Individual Familiar | Coletivo Empresarial
    Select From List By Label    xpath=//select[@id='tipo_contratacao_c']    ${TYPE_2}
    IF    $TYPE_2 == 'Coletivo Empresarial'
        ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2} =    Catenate       ${QUERY_PLSQL_ASSIST}-     ${NOME_PRODUTO} 
        Set Global Variable       ${GLOBAL_ASSISTENCIAL_EMPRESARIAL_2}

    ELSE IF     $TYPE_2 == 'Coletivo por Adesão'
        ${GLOBAL_ASSISTENCIAL_ADESAO_2} =    Catenate       ${QUERY_PLSQL_ASSIST}-     ${NOME_PRODUTO} 
        Set Global Variable       ${GLOBAL_ASSISTENCIAL_ADESAO_2}

    ELSE
        ${GLOBAL_ASSISTENCIAL_PF_2} =    Catenate       ${QUERY_PLSQL_ASSIST}-     ${NOME_PRODUTO} 
        Set Global Variable       ${GLOBAL_ASSISTENCIAL_PF_2}
    END
    #select tipo tabela
    Select From List By Label    ${SELECT_TIPO_TABELA}    Range de Vidas

    #select segmentação assistencial
    Select From List By Label    ${SELECT_SEGMENTACAO_ASSIST}    Ambulatorial 
    #MAPEAR AS OPÇÕES CERTAS NO MENU
    
    #select abrangencia 
    Select From List By Label    ${SELECT_ABRANGENCIA}    Nacional
    #MAPEAR AS OPÇÕES CERTAS NO MENU

    Select From List By Label    ${SELECT_PLANO_ADAPTADO}    Não
    # select padrao acomodação
    Select From List By Label    ${SELECT_PADRAO_ACOMODACAO}    Apartamento 
    #MAPEAR AS OPÇÕES CERTAS NO MENU

    Select From List By Label    ${SELECT_TIPO_COBRANCA}    Pré Pagamento
    ${date}  Get Current Date
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${date}  Add Time To Date   ${date}  1 days    exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Execute Javascript      document.getElementById('data_inicio_comerc_c').value = '${data_formatada}';
    Sleep       1
    Execute Javascript       window.scrollTo(0,1000)    
    Click Element    ${BTN_SALVAR_PRODUTO}


CRM deve atualizar a tela Produtos com o Produto Assistencial "${VALUE}" Cadastrado
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${produt}    Get text    ${PLANOS_TITLE_PAGE}
    Should Contain     ${produt}    ${NOME_PRODUTO}

    Wait Until Page Contains Element    ${PRODUTO_BTN_EDITAR}    timeout=15
    ${tipo}    Get Text    ${TABLE_BASICO_TXT_TIPO_PRODUTO}
    Should Be Equal     ${tipo}    Assistencial

    ${conta}    Get Text    ${TABLE_BASICO_TXT_TIPO_CONTRATC}
    Should Contain     ${conta}    ${VALUE}



Vincular Convenio Cadastrado no Produto Assitencial
    [Arguments]     ${QUERY_PLSQL_ASSIST}
    Execute Javascript       window.scrollTo(400,0)
    Wait Until Page Contains Element         xpath=//a[@id='advanced_search_link']
    Click Element       xpath=//a[@id='advanced_search_link']
    Click Element   xpath=//input[@title='Limpar']
    Sleep   2
    Execute Javascript       window.scrollTo(400,0)    
    Sleep   2
    Input Text    ${INPUT_SEARCH_COD_PRODUTO}     ${QUERY_PLSQL_ASSIST[0][1]}
    Sleep    1
    Scroll Element Into View      ${BTN_SEARCH_ADVANCED}
    Wait Until Element Is Visible    ${BTN_SEARCH_ADVANCED}
    Click Element    ${BTN_SEARCH_ADVANCED}
    Wait Until Page Contains Element    ${BTN_SEARCH_ADVANCED}
    Scroll Element Into View      xpath=//div[@id='links']
    Set Browser Implicit Wait    10 seconds
    Wait Until Page Contains Element    xpath=//table//tbody/tr/td/a[text()=${QUERY_PLSQL_ASSIST[0][1]}]    timeout=10
    Click Element            xpath=//table//tbody/tr/td/a[text()=${QUERY_PLSQL_ASSIST[0][1]}]
    Wait Until Page Contains Element         ${PRODUTO_BTN_EDITAR}

    Execute Javascript       window.scrollTo(0,1200)
    Sleep      2
    Wait Until Element Is Visible    xpath=//a[@id='saude_convenio_aos_products_1_select_button']
    ${CONVENIO_STT}     Run Keyword And Return Status      Wait Until Page Contains Element    xpath=//a[@id='saude_convenio_aos_products_1_edit_1']
    IF      $CONVENIO_STT == True
        Log To Console      "Convenio já vinculado no produto asssitencial"
    ELSE
        Click Element    xpath=//a[@id='saude_convenio_aos_products_1_select_button']
        Switch Window    NEW
        Wait Until Page Contains Element    xpath=//span[text()='Pesquisar Convênio']
        Execute Javascript       window.scrollTo(0,1200)
        Wait Until Page Contains Element    xpath=//table[@class='list view']//tbody[2]//td[3]/a
        Click Element       xpath=//table[@class='list view']//tbody[2]//td[3]/a
        Sleep    2
        Switch Window    MAIN
        Wait Until Page Contains Element    xpath=//div[@id='list_subpanel_saude_convenio_aos_products_1']//table//tbody/tr[@class='oddListRowS1']//li[@class='sugar_action_button']

    END


Sincronizou o produto assistencial
    ${date}  Get Current Date
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_sincronizada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Log To Console        Data Sincronizada, ${data_sincronizada}
    Clicar em Sincronizar
    Wait Until Page Contains Element    xpath://li[@class='sugar_action_button']/a[@id='edit_button']       timeout=10
    Click Element   ${MENU_OUTRO}
    Sleep    2
    ${txt_dt_atual}    Get Text    xpath=//span[@id='date_modified']
    Should Contain    ${txt_dt_atual}     ${data_sincronizada}

Clicar em Sincronizar
    Click Element    ${PRODUTO_SETA_ABRIR_EDITAR}
    Sleep    2
    Click Element    ${SUBMENU_SINCRONIZAR_EDITAR}

    Wait Until Page Contains Element    ${MODAL_CONFIRM_SINCRONIZAR}
    Click Element    ${MODAL_BTNSIN_SINCRONIZAR}
    ${s}  Run Keyword And Ignore Error     Wait Until Page Contains Element           xpath://div[@id='modal_sugar_box']//div[text()='Erro']
    Run Keyword If  "${s[0]}" == "PASS"    Click Element                    xpath://div[@id='modal_sugar_box']/div[3]/span//button[text()='OK'] 
    Run Keyword If  "${s[0]}" == "FAIL"    Log To Console    Sincronizado com sucesso!!
    Sleep    3
    
Cadastrar tabela de Preço no Produto ja existente
    Wait Until Element Is Visible    ${TABLE_PRECO_BTN_CRIAR} 
    Click Element    ${TABLE_PRECO_BTN_CRIAR} 

    Wait Until Page Contains Element    ${TABLE_INPUT_USER_LOGIN}
    Click Element    ${TABLE_PRECO_BTN_SALVAR}
    Wait Until Page Does Not Contain Element     ${TABLE_INPUT_USER_LOGIN}
    Sleep    5
    Wait Until Page Contains Element    ${LINK_REGISTRO_TABLE_PRECO}    timeout=10
    
    Click Element    ${LINK_REGISTRO_TABLE_PRECO}
    Wait Until Page Contains Element    ${TABLE_FAIXA_ETARIA_BTN_CRIAR}    timeout=10
    Sleep   2
    Click Element    ${TABLE_FAIXA_ETARIA_BTN_CRIAR}
    Wait Until Page Contains Element    ${INPUT_FAIXA_ETARIA_QTD_VIDAS}    timeout=10
    Input Text    ${INPUT_FAIXA_ETARIA_QTD_VIDAS}    4
    Sleep    2
    Select From List By Value       xpath=//select[@id='faixa_ans']     19_23
    Input Text    ${INPUT_FAIXA_ETARIA_VALOR}    150,00
    Sleep    2
    Click Element    ${FAIXA_ETARIA_BTN_SALVAR}



Cadastrar tabela de Preço
    Execute Javascript       window.scrollTo(0,650)
    Wait Until Element Is Visible    ${TABLE_PRECO_BTN_CRIAR}       timeout=10
    Click Element    ${TABLE_PRECO_BTN_CRIAR} 

    Wait Until Page Contains Element    ${TABLE_INPUT_USER_LOGIN}
    Click Element    ${TABLE_PRECO_BTN_SALVAR}
    Wait Until Page Does Not Contain Element     ${TABLE_INPUT_USER_LOGIN}
    Sleep    5
    Wait Until Page Contains Element    ${LINK_REGISTRO_TABLE_PRECO}    timeout=10
    
    Click Element    ${LINK_REGISTRO_TABLE_PRECO}
    Wait Until Page Contains Element    ${TABLE_FAIXA_ETARIA_BTN_CRIAR}    timeout=10
    Click Element    ${TABLE_FAIXA_ETARIA_BTN_CRIAR}

    Wait Until Page Contains Element    ${INPUT_FAIXA_ETARIA_QTD_VIDAS}    timeout=10
    Input Text    ${INPUT_FAIXA_ETARIA_QTD_VIDAS}    4
    Input Text    ${INPUT_FAIXA_ETARIA_VALOR}    150,00
    Sleep    2
    Click Element    ${FAIXA_ETARIA_BTN_SALVAR}

Validar se Produto tem tabela de preço
    [Arguments]        ${TYPE_PLANO}
    Execute Javascript       window.scrollTo(0,1800)
    Sleep       3
    Wait Until Element Is Visible    ${TABLE_PRECO_BTN_CRIAR}       timeout=15
    ${s}  Run Keyword And Ignore Error     Wait Until Page Contains Element    ${LINK_REGISTRO_TABLE_PRECO}
    Run Keyword If  "${s[0]}" == "PASS"    Editar Produto e vincular plano      ${TYPE_PLANO}    ${str_pla_cod}
    Run Keyword If  "${s[0]}" == "FAIL"    Cadastrar tabela de Preço no Produto ja existente


Validar se Produto tem tabela de preço Produto acessorio
    Execute Javascript       window.scrollTo(0,1800)
    Sleep       3
    Wait Until Element Is Visible    ${TABLE_PRECO_BTN_CRIAR}       timeout=15
    ${s}  Run Keyword And Ignore Error     Wait Until Page Contains Element    ${LINK_REGISTRO_TABLE_PRECO}
    Run Keyword If  "${s[0]}" == "PASS"    Log    Produto já possui tabela de preço!  
    Run Keyword If  "${s[0]}" == "FAIL"    Cadastrar tabela de Preço no Produto ja existente
    

Editar Produto e vincular plano
    [Arguments]        ${TYPE_PRODUCT}    ${PLA_COD_QUERY}
    ${date}  Get Current Date
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${date}  Add Time To Date   ${date}  1 days    exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Execute Javascript       window.scrollTo(1800,0)
    Click Element    xpath://li[@class='sugar_action_button']/a[@id='edit_button']
    Wait Until Page Contains Element    ${BTN_SALVAR_PRODUTO}            timeout=10
    Wait Until Page Contains Element    ${INPUT_NUM_TIPO_PLANO}
    ${STT_PLANO}     Run Keyword And Return Status      Textfield Value Should Be      ${INPUT_NUM_TIPO_PLANO}        ${EMPTY}
    IF      $STT_PLANO == True

        Click Element    xpath://button[@id='btn_aos_product_category_name']
        Switch Window    NEW
        Wait Until Page Contains Element    xpath=//body[@class='popupBody']//table[1]//td//span[text()='Pesquisar Plano']
        Execute Javascript                  window.scrollTo(0,400)
        Click Element    xpath=//input[@id='search_form_clear']
        IF    $TYPE_PRODUCT == 'Empresarial'
            Log To Console    Editando coletivo empresarial
            Input Text            xpath=//input[@id='pla_cod_c_advanced']        ${PLA_COD_QUERY}
            Sleep    1
            Click Element    xpath=//input[@id='search_form_submit']
            Set Browser Implicit Wait    10 seconds
            Click Element                       xpath=//table/tbody[2]/tr[@class='oddListRowS1'][1]//a[text()=${PLA_COD_QUERY}]
            
        ELSE IF    $TYPE_PRODUCT == 'Adesao'
            Log To Console    Editando coletivo Adesao
            Input Text            xpath=//input[@id='pla_cod_c_advanced']        ${PLA_COD_QUERY}
            Sleep    1
            Click Element    xpath=//input[@id='search_form_submit']
            Set Browser Implicit Wait    10 seconds
            Click Element                       xpath=//table/tbody[2]/tr[@class='oddListRowS1'][1]//a[text()=${PLA_COD_QUERY}]
        ELSE
            Log To Console    Editando Individual familiar
            Debug
            Input Text            xpath=//input[@id='pla_cod_c_advanced']        ${PLA_COD_QUERY}
            Sleep    1
            Click Element    xpath=//input[@id='search_form_submit']
            Set Browser Implicit Wait    10 seconds
            Click Element                       xpath=//table/tbody[2]/tr[@class='oddListRowS1'][1]//a[text()=${PLA_COD_QUERY}]
            
        END
        Switch Window    MAIN
        #Execute Javascript      document.getElementById('data_inicio_comerc_c').value = '${data_formatada}';
        Sleep    2
        #Execute Javascript      document.getElementById('data_fim_comerc_c').value = '${data_formatada}';
        Select From List By Label    ${SELECT_TIPO_TABELA}    Range de Vidas
        Select From List By Label    ${SELECT_PADRAO_ACOMODACAO}    Apartamento 
        Select From List By Label    ${SELECT_TIPO_COBRANCA}    Pré Pagamento
        Execute Javascript       window.scrollTo(0,1000)
        Input Text      xpath://input[@id='valor_consulta_c']       110,00
        Input Text      xpath://input[@id='fator_porcentagem_c']       10,00
        Input Text      xpath://input[@id='valor_teto_coparticipacao_c']      200,00
        Input Text      xpath://input[@id='valor_teto_intercambio_c']      300,00
        Sleep    2
        Click Element    ${BTN_SALVAR_PRODUTO}
    ELSE
        Log To Console    Plano ja vinculado ao produto!
    END


Importar Tabela de preço Produto Assitencial
    [Arguments]     ${QUERY_PLSQL_ASSIST}
    Clicou no submenu <Importação> do <Operações>
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${plano}    Get text    ${PLANOS_TITLE_PAGE}
    Should Contain     ${plano}     Importação » Pesquisar 
    
    Click Element    ${BTN_CRIAR}
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}
    ${plano}    Get text    ${PLANOS_TITLE_PAGE}
    Should Contain     ${plano}     Importação » Criar 
    
    ${date}  Get Current Date
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${date}  Add Time To Date   ${date}  1 days    exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y

    Input Text        ${IMPORTACAO_INPUT_NAME}            Importação Assistencial,${QUERY_PLSQL_ASSIST}
    Select From List By Label   ${IMPORTACAO_SELECT_TIPO}    Importação de Tabela de preço
    Create File       ${EXECDIR}\\documents\\import_test_tabela_preco.csv     dataInicioComercializacao;codigoProduto;tipoProduto;quantidadeVidas;faixaInicial;faixaFinal;valor;pencentualVariacao
    Append To File    ${EXECDIR}\\documents\\import_test_tabela_preco.csv         \n${data_formatada};${QUERY_PLSQL_ASSIST};assistencial;2;0;150;250;5
    Choose File       ${IMPORTACAO_BTN_SUBMIT_FILE}     ${EXECDIR}\\documents\\import_test_tabela_preco.csv
    Sleep    1
    Click Element    ${BTN_SALVAR_IMPORTACAO}
    Validar na aba Resultado a importação com Sucesso
    Remove File      ${EXECDIR}\\documents\\import_test_tabela_preco.csv


Validar na aba Resultado a importação com Sucesso
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${plano}    Get text    ${PLANOS_TITLE_PAGE}
    Should Contain     ${plano}     Importação
    Wait Until Page Contains Element    xpath=//table[@id='LBL_DETAILVIEW_PANEL2']
    Page Should Contain Element    xpath=//li[@class='sugar_action_button']/a
    Click Element    xpath=//a[@id='tab1']
    Sleep    2
    Page Should Contain Element    xpath=//div[@id='list_subpanel_saude_importacao_saude_importacao_registro_podem']/table//tbody/tr[@class='oddListRowS1']//span[text()=2]
    Element Should Be Enabled    xpath=//li[@class='sugar_action_button']/a[text()='Confirmar Importação']
    Click Element    xpath=//li[@class='sugar_action_button']/a[text()='Confirmar Importação']

    Wait Until Page Contains Element    xpath=//div[@id='ConfirmarImportacao']        timeout=10
    Click Element    xpath=//div[@id='ConfirmarImportacao']//div[3]//span[@id='yui-gen0']
    Sleep    3
    Wait Until Page Contains Element    xpath=//table[@id='LBL_DETAILVIEW_PANEL2']//tr[2]//input[@value='importado_sucesso']


Vincular uma Alçada registrada, produto
    [Arguments]     ${TYPE}     ${QUERY_PLSQL_ASSIST}
    Clicou no submenu <Produtos> do <Produtos>
    IF    $TYPE == "Assistencial"
        Execute Javascript       window.scrollTo(0,240)    
        Click Element   xpath=//input[@title='Limpar']
        Sleep   2
        Execute Javascript       window.scrollTo(400,0)    
        Sleep   2
        Input Text    ${INPUT_SEARCH_COD_PRODUTO}     ${QUERY_PLSQL_ASSIST[0][1]}
        Scroll Element Into View      xpath=//div[@id='links']
        Wait Until Element Is Visible    ${BTN_SEARCH_ADVANCED}
        Click Element    ${BTN_SEARCH_ADVANCED}
        Scroll Element Into View      xpath=//div[@id='links']
        Set Browser Implicit Wait    10 seconds
        ${STATUS_ALCADA}     Run Keyword And Return Status      Wait Until Page Contains Element     xpath=//table//a[text()=${QUERY_PLSQL_ASSIST[0][1]}]     timeout=10
        Log To Console    ${STATUS_ALCADA}

        IF   $STATUS_ALCADA == True
            Click Element    xpath=//table//a[text()=${QUERY_PLSQL_ASSIST[0][1]}]
            Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
            
            Execute Javascript       window.scrollTo(0,800)
            Sleep    2
            Wait Until Page Contains Element    ${TABLE_ALCADA_BTN_SELECIONAR}
            Click Element    ${TABLE_ALCADA_BTN_SELECIONAR}
            Switch Window    NEW

            Wait Until Page Contains Element    xpath=//body[@class='popupBody']//table[1]//td//span[text()='Pesquisar Alçada']
            Execute Javascript                  window.scrollTo(0,400)
            Click Element                       xpath=//table/tbody[2]/tr[@class='oddListRowS1'][1]/td[1]
            Sleep    2
            Switch Window    MAIN
            Page Should Contain Element         xpath=//div[@id='list_subpanel_saude_alcada_aos_products_1']/table/tbody//td[1]    limit=1
            Execute Javascript       window.scrollTo(450,0)
            Clicar em Sincronizar
        ELSE
            
            Log    Nenhum Produto assistencial encontrado na pesquisa avançada no CRM       console=yes
        END

    ELSE
        Execute Javascript       window.scrollTo(0,200)    
        Click Element   xpath=//input[@title='Limpar']
        Sleep   2
        Execute Javascript       window.scrollTo(400,0)    
        Sleep   2
        Input Text     ${INPUT_SEARCH_COD_PRODUTO}       ${QUERY_PLSQL_ACESSOR[0][2]}
        Scroll Element Into View      ${BTN_SEARCH_ADVANCED}
        Click Element    ${BTN_SEARCH_ADVANCED}
        Set Browser Implicit Wait    8 seconds
        ${STATUS}     Run Keyword And Return Status      Wait Until Page Contains Element    xpath=//table//a[text()=${QUERY_PLSQL_ACESSOR[0][2]}]   timeout=10
        IF   $STATUS == True
            Click Element      xpath=//table//a[text()=${QUERY_PLSQL_ACESSOR[0][2]}]
            Wait Until Page Contains Element        ${PRODUTO_BTN_EDITAR}
            Execute Javascript       window.scrollTo(0,1000)
            ${STT_ALCADA}     Run Keyword And Return Status    Page Should Contain Element       xpath=//div[@id='list_subpanel_saude_alcada_aos_products_1']/table/tbody//td[1]/span[contains(text(),'Produto')]    limit=1
            IF      $STT_ALCADA == True
                Log    Produto acessorio já possui alçada registrada
                Log To Console    Produto acessorio já possui alçada registrada
            ELSE
                Wait Until Page Contains Element    ${TABLE_ALCADA_BTN_SELECIONAR}
                Click Element    ${TABLE_ALCADA_BTN_SELECIONAR}
                Switch Window    NEW
                Wait Until Page Contains Element    xpath=//body[@class='popupBody']//table[1]//td//span[text()='Pesquisar Alçada']
                Execute Javascript                  window.scrollTo(0,400)
                Click Element                       xpath=//table/tbody[2]/tr[@class='oddListRowS1'][1]/td[1]
                Sleep    2
                Switch Window    MAIN
                Page Should Contain Element         xpath=//div[@id='list_subpanel_saude_alcada_aos_products_1']/table/tbody//td[1]    limit=1
                Execute Javascript       window.scrollTo(450,0)
                Clicar em Sincronizar
            END
        ELSE
            Log    Nenhum Produto encontrado na pesquisa avançada no CRM
        END
    END



O CRM deve apresentar a tela Produtos » NOME DO PRODUTO
    [Arguments]     ${NOME_PRODUTO_ADD}
    Wait Until Page Contains Element   xpath=//div[@id='list_subpanel_aos_products_aos_products_1aos_products_ida']
    Click Element       xpath=//a[@id='tab0']
    Sleep       2
    Element Text Should Be       xpath=//div[@id='AOS_Products_detailview_tabs']//span[text()=${QUERY_PLSQL_ACESSOR[1][2]}]              ${QUERY_PLSQL_ACESSOR[1][2]}
    Element Text Should Be        ${PAINEL_PRODUTOS_NOME_VINCULADO}      ${NOME_PRODUTO_ADD}

Vincular produto Acessorio do painel Produtos Acessório Permitidos no Produto Assistencial
    [Arguments]     ${QUERY_PLSQL_ACESSOR}
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    Wait Until Page Contains Element        xpath://li[@class='sugar_action_button']/a[@id='edit_button']
    Execute Javascript       window.scrollTo(0,550)    
    Sleep    2
    ${STT_ACESSOR_PERMITIDO}     Run Keyword And Return Status    Wait Until Page Contains Element      xpath=//a[@id='aos_products_aos_products_2_remove_1']    timeout=10
    IF      $STT_ACESSOR_PERMITIDO == True
        Log To Console      "Produto acessorio já vinculado com o assistencial: ${QUERY_PLSQL_ACESSOR}"     #${QUERY_PLSQL_ACESSOR[0][2]}"
    ELSE
        Wait Until Element Is Visible    xpath=//div[@id='subpanel_title_aos_products_aos_products_2']
        Click Element    xpath=//a[@id='aos_products_aos_products_2_select_button']
        Switch Window    NEW
        Wait Until Page Contains Element    xpath=//div[@class='tabela_pesquisa']
        Input Text    xpath=//input[@id='part_number_advanced']    ${QUERY_PLSQL_ACESSOR}
        Click Element    xpath=//input[@id='search_form_submit']
        Execute Javascript       window.scrollTo(0,450)    
        Sleep    3
        Wait Until Page Contains Element    xpath=//table[@class='list view']//tbody[2]//td[3]/a
        Click Element    xpath=//table[@class='list view']//tbody[2]//td[3]/a

        Switch Window    MAIN
        Wait Until Page Contains Element    xpath=//div[@id='list_subpanel_aos_products_aos_products_2']//table/tbody/tr[@class='oddListRowS1']/td[1] 
        Page Should Contain Element         xpath=//div[@id='list_subpanel_aos_products_aos_products_2']//table/tbody/tr[@class='oddListRowS1']/td[1]        limit=1

    END


CRM deve atualizar a tela Produtos com painel ALÇADA com um registros, painel PREÇO com um registros
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    Execute Javascript       window.scrollTo(0,1000)
    #Element Text Should Be        # mapear elemento do painel alçada        Produto
    Execute Javascript       window.scrollTo(0,1300)
    
    Page Should Contain Element    xpath://div[@id='list_subpanel_saude_preco_aos_products']/table/tbody//td/span/a
    Page Should Contain Element    xpath://div[@id='list_subpanel_saude_preco_aos_products']/table/tbody//td/span/ul

O CRM deve atualizar com o Nome do Produto, com Preço, Convenio, Alçada , Produto Acessorio Preenchidos
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    ${plano}    Get text    ${PLANOS_TITLE_PAGE}
    Should Contain     ${plano}     Produtos
    Execute Javascript       window.scrollTo(0,1000)
    Wait Until Element Is Visible     xpath://div[@id='list_subpanel_saude_alcada_aos_products_1']/table/tbody//td[1]   timeout=10
    #painel alçada
    Page Should Contain Element    xpath://div[@id='list_subpanel_saude_alcada_aos_products_1']/table/tbody//td[1]
    # painel convenio
    Page Should Contain Element    xpath://div[@id='list_subpanel_saude_convenio_aos_products_1']/table/tbody//td[1]
    

O CRM deve atualizar com o Nome do Produto, com Preço, Alçada Preenchidos
    Wait Until Page Contains Element        ${PLANOS_TITLE_PAGE}    timeout=10
    #elemento do painel alçada
    Page Should Contain Element    xpath://div[@id='list_subpanel_saude_alcada_aos_products_1']/table/tbody/tr/td[1]/span
    #elemento do painel preço
    Execute Javascript       window.scrollTo(0,1700)
    Page Should Contain Element    xpath://div[@id='list_subpanel_saude_preco_aos_products']/table/tbody//td/span/a