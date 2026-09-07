*** Settings ***
Library    SeleniumLibrary
Library    DebugLibrary


*** Variables ***
${TIMEOUT} =  30
${MENU_MOVIMENTACAO_BENEFICIARIO} =  xpath:(//div[contains(.,'Movimentação Cadastral')])[8]
${MENU_MOV_BENEFICIARIO} =  xpath://h5[@class='box-body-content'][contains(.,'Movimentar Beneficiários')]
${MENU_ACOES} =  xpath://button[1][contains(.,'AÇÕES')]
${SOLICITAR_MOVIMENTACAO_BENEFICIARIO} =  xpath://a[@href='/portal/qualidade/movimentacao/criar/'][contains(.,'Solicitar Movimentação')]
${PESQUISAR_CONTRATO} =  xpath://span[contains(@data-toggle,'modal')]
${BUTTON_PESQUISAR} =  xpath://input[@value='PESQUISAR']
${CONTRATO_BENEFICIARIO} =  xpath://*[@id="table_list_modal_contratos"]/tbody/tr[1]
${SALVAR_CONTRATO} =  xpath://input[contains(@value,'SALVAR')]
${ADICIONAR_BENEFICIARIO} =  xpath:(//a[contains(.,'ADICIONAR')])[1]
${CONTINUAR_PRODUTOS} =  xpath:(//a[contains(.,'CONTINUAR')])[3]
${SELECT_PRODUTOS} =  xpath:(//input[@type='radio'])[7]
${MENU_ENDERECO} =  xpath://a[contains(.,'Endereços e Telefones')]
${ENDERECO_TIPO} =  xpath:(//select[contains(@data-validation,'Tipo do Endereço')])[2]
${CEP} =  xpath:(//input[contains(@data-validation,'CEP do Endereço')])[2]
${NUMERO_RESIDENCIA} =  xpath:(//input[contains(@data-validation,'Número do Endereço')])[2]
${TELEFONE_TIPO} =  xpath:(//select[contains(@data-validation,'Tipo de Telefone')])[2]
${TELEFONE} =  xpath:(//input[contains(@data-validation,'Número de Telefone')])[2]
${CONTINUAR_DOCUMENTOS} =  xpath:(//a[contains(.,'CONTINUAR')])[4]
${SALVAR_BENEFICIARIO} =  xpath://a[contains(.,'SALVAR')]
${NOVO_TITULAR} =  xpath://button[contains(.,'Novo Titular')]
${NOVO_DEPENDENTE} =  xpath://button[contains(.,'Novo Dependente')]
${ENCERRAR_CADASTRO} =  xpath://button[contains(.,'Encerrar Cadastro')]
${CONTINUAR} =  xpath:(//a[contains(.,'CONTINUAR')])[1]
${CONTINUAR_MAIS_INFORMACOES} =  xpath:(//a[contains(.,'CONTINUAR')])[2]
${PREENCHER_AUTOMATICO} =  xpath:(//input[@data-validation='Logradouro do Endereço'])[2]
${IMPORTAR_DADOS} =  xpath:(//button[contains(@type,'button')])[5]
${ENCAMINHAR_PARA_APROVACAO} =  xpath://a[contains(.,'Encaminhar para Aprovação')]
${DESMARCAR_NASC} =  xpath:(//input[contains(@name,'nasc')])[3]
${EM_ANDAMENTO} =  xpath://*[@id="tab_1"]/div[1]/div[1]/h3/button

*** Keywords ***
Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    Wait Until Page Contains  Bem-vindo, Prime Automação  timeout=${TIMEOUT}
    Wait Until Element Is Enabled  ${MENU_MOVIMENTACAO}
    Mouse Over  ${MENU_MOVIMENTACAO}
    Sleep  5s
    Set Focus To Element  ${MENU_MOV_BENEFICIARIO}
    Click Element  ${MENU_MOV_BENEFICIARIO}

Clicou no menu Ações > Solicitar Movimentação
    Wait Until Page Contains  Movimentação Cadastral  timeout=${TIMEOUT}
    Set Focus To Element  ${MENU_ACOES}
    Click Element  ${MENU_ACOES}
    Set Focus To Element  ${SOLICITAR_MOVIMENTACAO_BENEFICIARIO}
    Click Element  ${SOLICITAR_MOVIMENTACAO_BENEFICIARIO}

Selecionou o Contrato, no campo "Tipo de Movimentação" a opção INCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"
    [Arguments]    ${arg1}
    Wait Until Page Contains  Nova Solicitação de Movimentação Cadastral  timeout=${TIMEOUT}
    Set Focus To Element  ${PESQUISAR_CONTRATO}
    Click Element  ${PESQUISAR_CONTRATO}
    Sleep  5s
    Input Text  id:conta_cnpj  ${arg1}
    Set Focus To Element  ${BUTTON_PESQUISAR}
    Click Element  ${BUTTON_PESQUISAR}
    Sleep   3s
    Click Element  ${CONTRATO_BENEFICIARIO}
    Select From List By Value  id:tipo_movimentacao  1
    Set Focus To Element  ${SALVAR_CONTRATO}
    Click Element  ${SALVAR_CONTRATO}

Adicionar Beneficiário (Inclusão Beneficiário)
    Wait Until Page Contains  Inclusão de Beneficiários  timeout=${TIMEOUT}
    Set Focus To Element  ${ADICIONAR_BENEFICIARIO}
    Click Element  ${ADICIONAR_BENEFICIARIO}


Preencher mais Informações, Produtos, Endereço e Documentos
    Wait Until Page Contains  Inclusão de Beneficiário  timeout=${TIMEOUT}
    Set Focus To Element  ${CONTINUAR_MAIS_INFORMACOES}
    Click Element  ${CONTINUAR_MAIS_INFORMACOES}
    Click Element  ${SELECT_PRODUTOS}
    Set Focus To Element  ${CONTINUAR_PRODUTOS}
    Click Element  ${CONTINUAR_PRODUTOS}

Cadastrou 1 (UM) Beneficiário TITULAR, "Início vigência" igual a EM 24 HORAS
    [Arguments]  @{arg1}
    Adicionar Beneficiário (Inclusão Beneficiário)
    Wait Until Page Contains  Dados Pessoais  timeout=${TIMEOUT}
    Input Text  id:cpf  ${arg1[38]}
    Click Element  id:buscarPorCPF
    Sleep  10s
    ${b}  Run Keyword And Ignore Error  Wait Until Page Contains  Selecione as informações que deseja importar:  timeout=${TIMEOUT}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${DESMARCAR_NASC}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${IMPORTAR_DADOS}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome  ${arg1[39]}
    Run Keyword If  "${b[0]}" == "FAIL"  Select From List By Value  id:sexo  M
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome_mae  ${arg1[17]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:cns  ${arg1[44]}
    Select From List By Value  id:inicio_vigencia  em_24_horas
    Select From List By Value  id:tipo  titular
    Input Text  id:data_admissao  ${arg1[28]}
    Input Text  id:data_nasc  ${arg1[42]}
    Press Keys  None  ESC
    Select From List By Value  id:estado_civil  casado
    Select From List By Value  id:raca  1
    Click Element  ${CONTINUAR}
    Preencher mais Informações, Produtos, Endereço e Documentos
    Select From List By Value  ${ENDERECO_TIPO}  residencial
    Input Text  ${CEP}  ${arg1[22]}
    Click Element  ${PREENCHER_AUTOMATICO}
    Sleep  10s
    Input Text  ${NUMERO_RESIDENCIA}  ${arg1[23]}
    Select From List By Value  ${TELEFONE_TIPO}  residencial
    Input Text  ${TELEFONE}  ${arg1[25]}
    Set Focus To Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${SALVAR_BENEFICIARIO}

Clicou no botão "NOVO TITULAR"
    Wait Until Page Contains  Deseja efetuar o cadastro de outro beneficiário?  timeout=${TIMEOUT}
    Set Focus To Element  ${NOVO_TITULAR}
    Click Element  ${NOVO_TITULAR}

Clicou no botão "NOVO DEPENDENTE"
    Wait Until Page Contains  Deseja efetuar o cadastro de outro beneficiário?  timeout=${TIMEOUT}
    Set Focus To Element  ${NOVO_DEPENDENTE}
    Click Element  ${NOVO_DEPENDENTE}

Clicou no botão "ENCERRAR CADASTRO"
    Wait Until Page Contains  Deseja efetuar o cadastro de outro beneficiário?  timeout=${TIMEOUT}
    Set Focus To Element  ${ENCERRAR_CADASTRO}
    Click Element  ${ENCERRAR_CADASTRO}

Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, "Início vigência" igual a 1º DIA DO MÊS SEGUINTE
    [Arguments]  @{arg1}
    Wait Until Page Contains  Dados Pessoais  timeout=${TIMEOUT}
    Input Text  id:cpf  ${arg1[46]}
    Click Element  id:buscarPorCPF
    Sleep  10s
    ${b}  Run Keyword And Ignore Error  Wait Until Page Contains  Selecione as informações que deseja importar:  timeout=${TIMEOUT}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${IMPORTAR_DADOS}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome  ${arg1[47]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:data_nasc  ${arg1[50]}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Select From List By Value  id:sexo  F
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:data_admissao  ${arg1[28]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome_mae  ${arg1[17]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:cns  ${arg1[52]}
    Select From List By Value  id:inicio_vigencia  1_dia_mes_seguinte
    Select From List By Value  id:grau_dependencia  01
    Input Text  id:data_vinculo_titular  07/01/2017
    Select From List By Value  id:raca  1
    Sleep  10s
    Click Element  ${CONTINUAR}
    Preencher mais Informações, Produtos, Endereço e Documentos
    Select From List By Value  ${ENDERECO_TIPO}  residencial
    Input Text  ${CEP}  ${arg1[22]}
    Click Element  ${PREENCHER_AUTOMATICO}
    Sleep  10s
    Input Text  ${NUMERO_RESIDENCIA}  ${arg1[23]}
    Select From List By Value  ${TELEFONE_TIPO}  residencial
    Input Text  ${TELEFONE}  ${arg1[25]}
    Set Focus To Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${SALVAR_BENEFICIARIO}

Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS
    [Arguments]  @{arg1}
    Wait Until Page Contains  Dados Pessoais  timeout=${TIMEOUT}
    Input Text  id:cpf  ${arg1[54]}
    Click Element  id:buscarPorCPF
    Sleep  10s
    ${b}  Run Keyword And Ignore Error  Wait Until Page Contains  Selecione as informações que deseja importar:  timeout=${TIMEOUT}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${DESMARCAR_NASC}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${IMPORTAR_DADOS}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome  ${arg1[55]}
    Run Keyword If  "${b[0]}" == "FAIL"  Select From List By Value  id:sexo  M
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:data_admissao  ${arg1[28]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome_mae  ${arg1[17]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:cns  ${arg1[60]}
    Select From List By Value  id:inicio_vigencia  especificar_data
    ${date}  Get Current Date
    ${date}  Add Time To Date  ${date}     3 days
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    ${DEPENDENTE_FILHO}  Set Global Variable  ${data_formatada}
    Input Text  id:data_vigencia  ${data_formatada}
    Select From List By Value  id:grau_dependencia  10
    Sleep  5s
    Input Text  id:data_nasc  ${arg1[58]}
    Press Keys  None  ESC
    Select From List By Value  id:estado_civil  solteiro
    Select From List By Value  id:raca  1
    Click Element  ${CONTINUAR}
    Preencher mais Informações, Produtos, Endereço e Documentos
    Select From List By Value  ${ENDERECO_TIPO}  residencial
    Input Text  ${CEP}  ${arg1[22]}
    Click Element  ${PREENCHER_AUTOMATICO}
    Sleep  10s
    Input Text  ${NUMERO_RESIDENCIA}  ${arg1[23]}
    Select From List By Value  ${TELEFONE_TIPO}  residencial
    Input Text  ${TELEFONE}  ${arg1[25]}
    Set Focus To Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${SALVAR_BENEFICIARIO}

Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS
    [Arguments]  @{arg1}
    Wait Until Page Contains  Dados Pessoais  timeout=${TIMEOUT}
    Input Text  id:cpf  ${arg1[62]}
    Click Element  id:buscarPorCPF
    Sleep  10s
    ${b}  Run Keyword And Ignore Error  Wait Until Page Contains  Selecione as informações que deseja importar:  timeout=${TIMEOUT}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${DESMARCAR_NASC}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${IMPORTAR_DADOS}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome  ${arg1[63]}
    Run Keyword If  "${b[0]}" == "FAIL"  Select From List By Value  id:sexo  F
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:data_admissao  ${arg1[28]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome_mae  ${arg1[17]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:cns  ${arg1[68]}
    Select From List By Value  id:inicio_vigencia  especificar_data
    ${date}  Get Current Date
    ${date}  Add Time To Date  ${date}     9 days
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    ${DEPENDENTE_FILHO_ADOTIVO}  Set Global Variable  ${data_formatada}
    Input Text  id:data_vigencia  ${data_formatada}
    Select From List By Value  id:grau_dependencia  70
    Input Text  id:data_vinculo_titular  ${arg1[66]}
    Input Text  id:data_nasc  ${arg1[66]}
    Press Keys  None  ESC
    Select From List By Value  id:estado_civil  solteiro
    Select From List By Value  id:raca  1
    Click Element  ${CONTINUAR}
    Preencher mais Informações, Produtos, Endereço e Documentos
    Select From List By Value  ${ENDERECO_TIPO}  residencial
    Input Text  ${CEP}  ${arg1[22]}
    Click Element  ${PREENCHER_AUTOMATICO}
    Sleep  10s
    Input Text  ${NUMERO_RESIDENCIA}  ${arg1[23]}
    Select From List By Value  ${TELEFONE_TIPO}  residencial
    Input Text  ${TELEFONE}  ${arg1[25]}
    Set Focus To Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${SALVAR_BENEFICIARIO}

Cadastrou Titular com "Data Admissão Empresa" menor que 10 dias da data atual
    [Arguments]  @{arg1}
    Adicionar Beneficiário (Inclusão Beneficiário)
    Wait Until Page Contains  Dados Pessoais  timeout=${TIMEOUT}
    Input Text  id:cpf  ${arg1[38]}
    Click Element  id:buscarPorCPF
    Sleep  10s
    ${b}  Run Keyword And Ignore Error  Wait Until Page Contains  Selecione as informações que deseja importar:  timeout=${TIMEOUT}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${DESMARCAR_NASC}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${IMPORTAR_DADOS}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome  ${arg1[39]}
    Run Keyword If  "${b[0]}" == "FAIL"  Select From List By Value  id:sexo  M
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome_mae  ${arg1[17]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:cns  ${arg1[44]}
    Select From List By Value  id:inicio_vigencia  em_24_horas
    Select From List By Value  id:tipo  titular
    ${date}  Get Current Date
    ${date}  Subtract Time From Date  ${date}     6 days
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Input Text  id:data_admissao  ${data_formatada}
    Input Text  id:data_nasc  ${arg1[42]}
    Press Keys  None  ESC
    Select From List By Value  id:estado_civil  casado
    Select From List By Value  id:raca  1
    Click Element  ${CONTINUAR}
    Preencher mais Informações, Produtos, Endereço e Documentos
    Select From List By Value  ${ENDERECO_TIPO}  residencial
    Input Text  ${CEP}  ${arg1[22]}
    Click Element  ${PREENCHER_AUTOMATICO}
    Sleep  10s
    Input Text  ${NUMERO_RESIDENCIA}  ${arg1[23]}
    Select From List By Value  ${TELEFONE_TIPO}  residencial
    Input Text  ${TELEFONE}  ${arg1[25]}
    Set Focus To Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${SALVAR_BENEFICIARIO}

Cadastrou Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular menor que 10 dias da data atual
    [Arguments]  @{arg1}
    #Filho
    Wait Until Page Contains  Dados Pessoais  timeout=${TIMEOUT}
    Input Text  id:cpf  ${arg1[54]}
    Click Element  id:buscarPorCPF
    Sleep  10s
    ${b}  Run Keyword And Ignore Error  Wait Until Page Contains  Selecione as informações que deseja importar:  timeout=${TIMEOUT}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${DESMARCAR_NASC}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${IMPORTAR_DADOS}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome  ${arg1[55]}
    Run Keyword If  "${b[0]}" == "FAIL"  Select From List By Value  id:sexo  M
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome_mae  ${arg1[17]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:cns  ${arg1[60]}
    Select From List By Value  id:inicio_vigencia  em_24_horas
    Select From List By Value  id:tipo  dependente
    ${date}  Get Current Date
    ${date}  Subtract Time From Date  ${date}     6 days
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Input Text  id:data_admissao  ${data_formatada}
    Select From List By Value  id:grau_dependencia  10
    Sleep  5s
    Input Text  id:data_nasc  ${arg1[58]}
    Press Keys  None  ESC
    Select From List By Value  id:estado_civil  solteiro
    Select From List By Value  id:raca  1
    Click Element  ${CONTINUAR}
    Preencher mais Informações, Produtos, Endereço e Documentos
    Select From List By Value  ${ENDERECO_TIPO}  residencial
    Input Text  ${CEP}  ${arg1[22]}
    Click Element  ${PREENCHER_AUTOMATICO}
    Sleep  10s
    Input Text  ${NUMERO_RESIDENCIA}  ${arg1[23]}
    Select From List By Value  ${TELEFONE_TIPO}  residencial
    Input Text  ${TELEFONE}  ${arg1[25]}
    Set Focus To Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${SALVAR_BENEFICIARIO}
    Clicou no botão "NOVO DEPENDENTE"
    #Conjuge
    Wait Until Page Contains  Dados Pessoais  timeout=${TIMEOUT}
    Input Text  id:cpf  ${arg1[46]}
    Click Element  id:buscarPorCPF
    Sleep  10s
    ${b}  Run Keyword And Ignore Error  Wait Until Page Contains  Selecione as informações que deseja importar:  timeout=${TIMEOUT}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${IMPORTAR_DADOS}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome  ${arg1[47]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:data_nasc  ${arg1[50]}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Select From List By Value  id:sexo  F
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome_mae  ${arg1[17]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:cns  ${arg1[52]}
    Select From List By Value  id:inicio_vigencia  em_24_horas
    Select From List By Value  id:tipo  dependente
    ${date}  Get Current Date
    ${date}  Subtract Time From Date  ${date}     6 days
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Input Text  id:data_admissao  ${data_formatada}
    Select From List By Value  id:grau_dependencia  01
    Input Text  id:data_vinculo_titular  07/01/2017
    Select From List By Value  id:raca  1
    Sleep  10s
    Click Element  ${CONTINUAR}
    Preencher mais Informações, Produtos, Endereço e Documentos
    Select From List By Value  ${ENDERECO_TIPO}  residencial
    Input Text  ${CEP}  ${arg1[22]}
    Click Element  ${PREENCHER_AUTOMATICO}
    Sleep  10s
    Input Text  ${NUMERO_RESIDENCIA}  ${arg1[23]}
    Select From List By Value  ${TELEFONE_TIPO}  residencial
    Input Text  ${TELEFONE}  ${arg1[25]}
    Set Focus To Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${SALVAR_BENEFICIARIO}


Cadastrou Titular com "Data Admissão Empresa" igual a 10 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains  Dados Pessoais  timeout=${TIMEOUT}
    Input Text  id:cpf  ${arg1[70]}
    Click Element  id:buscarPorCPF
    Sleep  10s
    ${b}  Run Keyword And Ignore Error  Wait Until Page Contains  Selecione as informações que deseja importar:  timeout=${TIMEOUT}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${DESMARCAR_NASC}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${IMPORTAR_DADOS}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome  ${arg1[71]}
    Run Keyword If  "${b[0]}" == "FAIL"  Select From List By Value  id:sexo  M
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome_mae  ${arg1[17]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:cns  ${arg1[76]}
    Select From List By Value  id:inicio_vigencia  1_dia_mes_seguinte
    Select From List By Value  id:tipo  titular
    ${date}  Get Current Date
    ${date}  Subtract Time From Date  ${date}     10 days
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Input Text  id:data_admissao  ${data_formatada}
    Input Text  id:data_nasc  09/08/1893
    Press Keys  None  ESC
    Select From List By Value  id:estado_civil  casado
    Select From List By Value  id:raca  1
    Click Element  ${CONTINUAR}
    Preencher mais Informações, Produtos, Endereço e Documentos
    Select From List By Value  ${ENDERECO_TIPO}  residencial
    Input Text  ${CEP}  ${arg1[22]}
    Click Element  ${PREENCHER_AUTOMATICO}
    Sleep  10s
    Input Text  ${NUMERO_RESIDENCIA}  ${arg1[23]}
    Select From List By Value  ${TELEFONE_TIPO}  residencial
    Input Text  ${TELEFONE}  ${arg1[25]}
    Set Focus To Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${SALVAR_BENEFICIARIO}

Cadastrou Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular igual a 10 dias da data atual "Data Base de Carência" igual a Data Início Vigência – 301 Dias
    [Arguments]  @{arg1}
    #Filho
    Wait Until Page Contains  Dados Pessoais  timeout=${TIMEOUT}
    Input Text  id:cpf  ${arg1[86]}
    Click Element  id:buscarPorCPF
    Sleep  10s
    ${b}  Run Keyword And Ignore Error  Wait Until Page Contains  Selecione as informações que deseja importar:  timeout=${TIMEOUT}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${DESMARCAR_NASC}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${IMPORTAR_DADOS}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome  ${arg1[87]}
    Run Keyword If  "${b[0]}" == "FAIL"  Select From List By Value  id:sexo  M
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome_mae  ${arg1[17]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:cns  ${arg1[92]}
    Select From List By Value  id:inicio_vigencia  1_dia_mes_seguinte
    Select From List By Value  id:tipo  dependente
    ${date}  Get Current Date
    ${date}  Subtract Time From Date  ${date}     10 days
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Input Text  id:data_admissao  ${data_formatada}
    Select From List By Value  id:grau_dependencia  10
    Sleep  5s
    Input Text  id:data_nasc  ${arg1[90]}
    Press Keys  None  ESC
    Select From List By Value  id:estado_civil  solteiro
    Select From List By Value  id:raca  1
    Click Element  ${CONTINUAR}
    Preencher mais Informações, Produtos, Endereço e Documentos
    Select From List By Value  ${ENDERECO_TIPO}  residencial
    Input Text  ${CEP}  ${arg1[22]}
    Click Element  ${PREENCHER_AUTOMATICO}
    Sleep  10s
    Input Text  ${NUMERO_RESIDENCIA}  ${arg1[23]}
    Select From List By Value  ${TELEFONE_TIPO}  residencial
    Input Text  ${TELEFONE}  ${arg1[25]}
    Set Focus To Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${SALVAR_BENEFICIARIO}
    Clicou no botão "NOVO DEPENDENTE"
    #Conjuge
    Wait Until Page Contains  Dados Pessoais  timeout=${TIMEOUT}
    Input Text  id:cpf  ${arg1[78]}
    Click Element  id:buscarPorCPF
    Sleep  10s
    ${b}  Run Keyword And Ignore Error  Wait Until Page Contains  Selecione as informações que deseja importar:  timeout=${TIMEOUT}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${IMPORTAR_DADOS}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome  ${arg1[79]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:data_nasc  ${arg1[82]}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Select From List By Value  id:sexo  F
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome_mae  ${arg1[17]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:cns  ${arg1[84]}
    Select From List By Value  id:inicio_vigencia  1_dia_mes_seguinte
    Select From List By Value  id:tipo  dependente
    ${date}  Get Current Date
    ${date}  Subtract Time From Date  ${date}     10 days
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Input Text  id:data_admissao  ${data_formatada}
    Select From List By Value  id:grau_dependencia  01
    Input Text  id:data_vinculo_titular  07/01/2017
    Select From List By Value  id:raca  1
    Sleep  10s
    Click Element  ${CONTINUAR}
    Preencher mais Informações, Produtos, Endereço e Documentos
    Select From List By Value  ${ENDERECO_TIPO}  residencial
    Input Text  ${CEP}  ${arg1[22]}
    Click Element  ${PREENCHER_AUTOMATICO}
    Sleep  10s
    Input Text  ${NUMERO_RESIDENCIA}  ${arg1[23]}
    Select From List By Value  ${TELEFONE_TIPO}  residencial
    Input Text  ${TELEFONE}  ${arg1[25]}
    Set Focus To Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${SALVAR_BENEFICIARIO}

Cadastrou Titular com "Data Admissão Empresa" maior que 10 dias da data atual
    [Arguments]  @{arg1}
    Wait Until Page Contains  Dados Pessoais  timeout=${TIMEOUT}
    Input Text  id:cpf  ${arg1[38]}
    Click Element  id:buscarPorCPF
    Sleep  10s
    ${b}  Run Keyword And Ignore Error  Wait Until Page Contains  Selecione as informações que deseja importar:  timeout=${TIMEOUT}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${DESMARCAR_NASC}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${IMPORTAR_DADOS}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome  ${arg1[39]}
    Run Keyword If  "${b[0]}" == "FAIL"  Select From List By Value  id:sexo  M
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome_mae  ${arg1[17]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:cns  ${arg1[44]}
    Select From List By Value  id:inicio_vigencia  1_dia_mes_seguinte
    Select From List By Value  id:tipo  titular
    ${date}  Get Current Date
    ${date}  Subtract Time From Date  ${date}     12 days
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Input Text  id:data_admissao  ${data_formatada}
    Input Text  id:data_nasc  ${arg1[42]}
    Press Keys  None  ESC
    Select From List By Value  id:estado_civil  casado
    Select From List By Value  id:raca  1
    Click Element  ${CONTINUAR}
    Preencher mais Informações, Produtos, Endereço e Documentos
    Select From List By Value  ${ENDERECO_TIPO}  residencial
    Input Text  ${CEP}  ${arg1[22]}
    Click Element  ${PREENCHER_AUTOMATICO}
    Sleep  10s
    Input Text  ${NUMERO_RESIDENCIA}  ${arg1[23]}
    Select From List By Value  ${TELEFONE_TIPO}  residencial
    Input Text  ${TELEFONE}  ${arg1[25]}
    Set Focus To Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${SALVAR_BENEFICIARIO}

Cadastrou Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular maior que 10 dias da data atual
    [Arguments]  @{arg1}
    #Filho
    Wait Until Page Contains  Dados Pessoais  timeout=${TIMEOUT}
    Input Text  id:cpf  ${arg1[54]}
    Click Element  id:buscarPorCPF
    Sleep  10s
    ${b}  Run Keyword And Ignore Error  Wait Until Page Contains  Selecione as informações que deseja importar:  timeout=${TIMEOUT}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${DESMARCAR_NASC}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${IMPORTAR_DADOS}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome  ${arg1[55]}
    Run Keyword If  "${b[0]}" == "FAIL"  Select From List By Value  id:sexo  M
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome_mae  ${arg1[17]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:cns  ${arg1[60]}
    Select From List By Value  id:inicio_vigencia  1_dia_mes_seguinte
    Select From List By Value  id:tipo  dependente
    ${date}  Get Current Date
    ${date}  Subtract Time From Date  ${date}     12 days
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Input Text  id:data_admissao  ${data_formatada}
    Select From List By Value  id:grau_dependencia  10
    Sleep  5s
    Input Text  id:data_nasc  ${arg1[58]}
    Press Keys  None  ESC
    Select From List By Value  id:estado_civil  solteiro
    Select From List By Value  id:raca  1
    Click Element  ${CONTINUAR}
    Preencher mais Informações, Produtos, Endereço e Documentos
    Select From List By Value  ${ENDERECO_TIPO}  residencial
    Input Text  ${CEP}  ${arg1[22]}
    Click Element  ${PREENCHER_AUTOMATICO}
    Sleep  10s
    Input Text  ${NUMERO_RESIDENCIA}  ${arg1[23]}
    Select From List By Value  ${TELEFONE_TIPO}  residencial
    Input Text  ${TELEFONE}  ${arg1[25]}
    Set Focus To Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${SALVAR_BENEFICIARIO}
    Clicou no botão "NOVO DEPENDENTE"
    #Conjuge
    Wait Until Page Contains  Dados Pessoais  timeout=${TIMEOUT}
    Input Text  id:cpf  ${arg1[46]}
    Click Element  id:buscarPorCPF
    Sleep  10s
    ${b}  Run Keyword And Ignore Error  Wait Until Page Contains  Selecione as informações que deseja importar:  timeout=${TIMEOUT}
    Run Keyword If  "${b[0]}" == "PASS"  Click Element  ${IMPORTAR_DADOS}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome  ${arg1[47]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:data_nasc  ${arg1[50]}
    Run Keyword If  "${b[0]}" == "FAIL"  Press Keys  None  ESC
    Run Keyword If  "${b[0]}" == "FAIL"  Select From List By Value  id:sexo  F
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:nome_mae  ${arg1[17]}
    Run Keyword If  "${b[0]}" == "FAIL"  Input Text  id:cns  ${arg1[52]}
    Select From List By Value  id:inicio_vigencia  1_dia_mes_seguinte
    Select From List By Value  id:tipo  dependente
    ${date}  Get Current Date
    ${date}  Subtract Time From Date  ${date}     12 days
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Input Text  id:data_admissao  ${data_formatada}
    Select From List By Value  id:grau_dependencia  01
    Input Text  id:data_vinculo_titular  07/01/2017
    Select From List By Value  id:raca  1
    Sleep  10s
    Click Element  ${CONTINUAR}
    Preencher mais Informações, Produtos, Endereço e Documentos
    Select From List By Value  ${ENDERECO_TIPO}  residencial
    Input Text  ${CEP}  ${arg1[22]}
    Click Element  ${PREENCHER_AUTOMATICO}
    Sleep  10s
    Input Text  ${NUMERO_RESIDENCIA}  ${arg1[23]}
    Select From List By Value  ${TELEFONE_TIPO}  residencial
    Input Text  ${TELEFONE}  ${arg1[25]}
    Set Focus To Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${CONTINUAR_DOCUMENTOS}
    Click Element  ${SALVAR_BENEFICIARIO}

Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    Wait Until Page Contains  Movimentação Cadastral  timeout=${TIMEOUT}
    Wait Until Element Is Visible  ${EM_ANDAMENTO}
    Set Focus To Element  ${MENU_ACOES}
    Click Element  ${MENU_ACOES}
    Set Focus To Element  ${ENCAMINHAR_PARA_APROVACAO}
    Click Element  ${ENCAMINHAR_PARA_APROVACAO}

Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    Wait Until Page Contains  Informações Adicionais  timeout=${TIMEOUT}
    Input Text  id:motivo_encaminhar_aprovacao  Teste Automação - Prime
    Set Focus To Element  id:salvar_encaminhar_aprovacao
    Click Element  id:salvar_encaminhar_aprovacao


