*** Settings ***
#
Library     DebugLibrary
Resource    ../../utils/Comum.robot
Resource    PO/Login.robot
Resource    PO/MenuSuperior.robot
Resource    PO/PotencialClientePesquisa.robot
Resource    PO/PotencialClienteCadastro.robot
Resource    PO/PotencialClienteDetalhes.robot
Resource    PO/ContasPesquisa.robot
Resource    PO/ContasCadastro.robot
Resource    PO/ContasDetalhes.robot
Resource    PO/OportunidadesPesquisa.robot
Resource    PO/OportunidadesCadastro.robot
Resource    PO/PopupPesquisarNomeConta.robot
Resource    PO/OportunidadesDetalhes.robot
Resource    PO/ReservaMercadoDetalhes.robot
Resource    PO/CotacoesCadastro.robot
Resource    PO/CotacoesDetalhes.robot
Resource    PO/PopupPesquisarConvenios.robot
Resource    PO/CotacoesPesquisa.robot
Resource    PO/PortabilidadeCadastro.robot
Resource    PO/PortabilidadeDetalhes.robot
Resource    PO/ContratosCadastro.robot
Resource    PO/ContratosDetalhes.robot
Resource    PO/BeneficiariosCadastro.robot
Resource    PO/DeclaracaoSaudeDetalhes.robot
Resource    PO/DeclaracaoSaudeCadastro.robot
Resource    PO/ConferenciaPesquisa.robot
Resource    PO/ConferenciaDetalhes.robot
Resource    PO/MovimentacaoCadastral.robot
Resource    PO/ParametrosComerciais.robot
Resource    PO/MovimentacaoEmMassa.robot
Resource    PO/SolicitacaoPortabilidade.robot
Resource    PO/ServicoVendasAPI.robot
Resource    data/banco/DBCRMUnimed.robot
Resource    PO/PortabilidadeCanalContratante.robot
Resource    ../CanalContratante/CanalContratanteUnimedPR.robot
Resource    ../CanalContratante/PO/TransfGrupoFamiliarCanal.robot
Resource    PO/InclusaoBeneficiarioCanalContratante.robot
Resource    PO/ProdutosPlano.robot
Resource    PO/ProdutosConvenio.robot
Resource    PO/ProdutosAlcada.robot
Resource    PO/ProdutoAssistenciaisAcessorios.robot


*** Variables ***
${USER_VALIDO} =  ${CRM_USER}
${USER_PWD} =     ${CRM_PASSWORD}
${USER_NOME} =    ${CRM_USER_NAME}
${TIMEOUT} =      30

##user: Prime   SENHAS PARA O AMBIENTE DE HOMOLOGAÇÃO
##senha: Prime@187

*** Keywords ***
Usuário logou no sistema
    Login.Verificar se estou na pagina de login
    Login.Logar com usuario  ${USER_VALIDO}  ${USER_PWD}
    MenuSuperior.Verificar se usuario logou  ${USER_NOME}

Clicou na submenu <Potencial Cliente> do <Comercial>
    MenuSuperior.Colocar o mouse no Comercial
    MenuSuperior.Clicar no submenu Pontecial Cliente

Clicou na submenu <Contas> do <Comercial>
    MenuSuperior.Colocar o mouse no Comercial
    MenuSuperior.Clicar no submenu Contas

Clicou na submenu <Oportunidades> do <Comercial>
    MenuSuperior.Colocar o mouse no Comercial
    MenuSuperior.Clicar no submenu Oportunidades

Clicou na submenu <Cotações> do <Comercial>
    MenuSuperior.Colocar o mouse no Comercial
    MenuSuperior.Clicar no submenu Cotações

Clicou na submenu <Contratos> do <Comercial>
    MenuSuperior.Colocar o mouse no Comercial
    MenuSuperior.Clicar no submenu Contratos

### novossss ###### novossss ###### novossss ###### novossss ###### novossss ###### novossss ###### novossss ###### novossss ###### novossss ###
Acessar CRM e Logar
    Comum.Abrir Nav
    Usuário logou no sistema

T025 - CADASTRAR PLANO COLETIVO EMPRESARIAL
    Comum.Abrir Nav
    Usuário logou no sistema
    Clicou no submenu <Planos> do <Produtos>
    Realizar cadastro de um Novo Plano "Coletivo Empresarial"
    Validou no CRM a tela Plano com o Nome
    ${t}    Run Keyword And Ignore Error       Query - Consulta CRM Plano Coletivo Empresarial MYSQL     ${QUERY_PLANO[40][0]}
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco
    Run Keyword If     "${t[0]}" == "FAIL"     CADASTRAR UM SEGUNDO PLANO COLETIVO EMPRESARIAL
    Run Keyword If     "${t[0]}" == "FAIL"     Query - Consultar Produtos Assistenciais Coletivo Empresarial com Tabela de Preço SG         ${QUERY_PLANO[40][0]}
    Run Keyword If     "${t[0]}" == "FAIL"     T038 - CONSULTAR PRODUTO ASSISTENCIAL SEM TABELA DE PREÇO

CADASTRAR UM SEGUNDO PLANO COLETIVO EMPRESARIAL
    Clicou no submenu <Planos> do <Produtos>
    Realizar cadastro de um segundo Plano Coletivo Empresarial
    Validou no CRM a tela o segundo Plano com o Nome

T025.1 - CADASTRAR PLANO COLETIVO POR ADESÃO
    Comum.Abrir Nav
    Usuário logou no sistema
    Clicou no submenu <Planos> do <Produtos>
    Realizar cadastro de um Novo Plano "Coletivo Adesão"
    Validou no CRM a tela Plano com o Nome
    ${t}    Run Keyword And Ignore Error       Query - Consultar no CRM Plano Coletivo Adesão MYSQL     ${QUERY_PLANO[40][0]}
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco
    Run Keyword If     "${t[0]}" == "FAIL"     CADASTRAR UM SEGUNDO PLANO COLETIVO ADESÃO
    Run Keyword If     "${t[0]}" == "FAIL"     DBCRMUnimed.Consultar no CRM Produtos Assistenciais Coletivo Adesão com Tabela de Preço MYSQL para cenario 38     ${str_pla_cod}
    Run Keyword If     "${t[0]}" == "FAIL"     T038.1 - CONSULTAR PRODUTO ASSISTENCIAL SEM TABELA DE PREÇO
    

CADASTRAR UM SEGUNDO PLANO COLETIVO ADESÃO
    Clicou no submenu <Planos> do <Produtos>
    Realizar cadastro de um segundo Plano Coletivo Adesão
    Validou no CRM a tela o segundo Plano com o Nome

T025.2 - CADASTRAR PLANO INDIVIDUAL FAMILIAR
    Comum.Abrir Nav
    Usuário logou no sistema
    Clicou no submenu <Planos> do <Produtos>
    Realizar cadastro de um Novo Plano "Individual Familiar"
    Validou no CRM a tela Plano com o Nome
    Query - Consultar no CRM Plano Individual Familiar MYSQL     ${QUERY_PLANO[60][0]}
    CADASTRAR UM SEGUNDO PLANO INDIVIDUAL FAMILIAR
    Query - Consultar Produtos Assistenciais Individual Familiar com Tabela de Preço SG        ${SORT_LIST_PLA[0]}
    T038.2 - CONSULTAR PRODUTO ASSISTENCIAL SEM TABELA DE PREÇO

CADASTRAR UM SEGUNDO PLANO INDIVIDUAL FAMILIAR
    Clicou no submenu <Planos> do <Produtos>
    Realizar cadastro de um segundo Plano Individual
    Validou no CRM a tela o segundo Plano com o Nome

T026 - CADASTRAR ALÇADA DE PRODUTO
    Clicou no submenu <Alçada> de <Todos>
    Realizar cadastro de uma Nova Alçada de "Produto"

T027 - CADASTRAR ALÇADA DE CONVÊNIO
    Clicou no submenu <Alçada> de <Todos>
    Realizar cadastro de uma Nova Alçada de "Convenio"
    

T028 - CADASTRAR CONVÊNIO
    Clicou no submenu <Convenio> do <Produtos>
    Realizar cadastro de um Novo Convenio
    

T029 - CADASTRAR PRODUTO ACESSÓRIO
    Clicou no submenu <Produtos> do <Produtos>
    Realizar cadastro de um Produto Acessorio
    Validou no CRM a tela de Produto Cadastrado
    Cadastrar tabela de Preço


T031 - VINCULAR ALÇADA PARA PRODUTO ACESSÓRIO 
    Clicou no submenu <Alçada> de <Todos>
    Realizar cadastro de uma Nova Alçada de "Produto"
    Vincular uma Alçada em um produto acessorio
    CRM deve atualizar a tela Produtos com painel ALÇADA com um registros, painel PREÇO com um registros


T032 - CADASTRAR E SINCRONIZAR PRODUTO ASSISTENCIAL COLETIVO EMPRESARIAL
    Clicou no submenu <Produtos> do <Produtos>
    Realizar cadastro um Produto Assitencial Coletivo Empresarial
    CRM deve atualizar a tela Produtos com o Produto Assistencial "Coletivo Empresarial" Cadastrado
    Sincronizou o produto assistencial
    Importar Tabela de preço Produto Assitencial         ${QUERY_PLSQL_ASSIST[0][1]}

T032.1 - CADASTRAR E SINCRONIZAR PRODUTO ASSISTENCIAL COLETIVO ADESÃO
    Clicou no submenu <Produtos> do <Produtos>
    Realizar cadastro um Produto Assitencial Coletivo Adesão
    CRM deve atualizar a tela Produtos com o Produto Assistencial "Coletivo por Adesão" Cadastrado
    Sincronizou o produto assistencial
    Importar Tabela de preço Produto Assitencial         ${QUERY_PLSQL_ASSIST[0][1]}

T032.2 - CADASTRAR E SINCRONIZAR PRODUTO ASSISTENCIAL INDIVIDUAL FAMILIAR
    Clicou no submenu <Produtos> do <Produtos>
    Realizar cadastro um Produto Assitencial Individual Familiar
    CRM deve atualizar a tela Produtos com o Produto Assistencial "Individual Familiar" Cadastrado
    Sincronizou o produto assistencial
    Importar Tabela de preço Produto Assitencial         ${SORT_LIST_ASSIST[0]}

T034 - VINCULAR ALÇADA PARA PRODUTO ASSISTENCIAL COLETIVO EMPRESARIAL
    Clicou no submenu <Produtos> do <Produtos>
    Vincular uma Alçada em um produto Assistencial   
    O CRM deve atualizar com o Nome do Produto, com Preço, Alçada Preenchidos

T034.1 - VINCULAR ALÇADA PARA PRODUTO ASSISTENCIAL COLETIVO ADESÃO
    Clicou no submenu <Produtos> do <Produtos>
    Vincular uma Alçada em um produto Assistencial    
    O CRM deve atualizar com o Nome do Produto, com Preço, Alçada Preenchidos

T034.2 - VINCULAR ALÇADA PARA PRODUTO ASSISTENCIAL INDIVIDUAL FAMILIAR
    Clicou no submenu <Produtos> do <Produtos>
    Vincular uma Alçada em um produto Assistencial  
    O CRM deve atualizar com o Nome do Produto, com Preço, Alçada Preenchidos

T035 - VINCULAR CONVÊNIO PARA PRODUTO ASSISTENCIAL COLETIVO EMPRESARIAL
    Clicou no submenu <Convenio> do <Produtos>
    Realizar cadastro de um Novo Convenio
    Clicou no submenu <Produtos> do <Produtos>
    Vincular Convenio Cadastrado no Produto Assitencial     ${QUERY_PLSQL_ASSIST}

T035.1 - VINCULAR CONVÊNIO PARA PRODUTO ASSISTENCIAL COLETIVO ADESÃO
    Clicou no submenu <Convenio> do <Produtos>
    Realizar cadastro de um Novo Convenio
    Clicou no submenu <Produtos> do <Produtos>
    Vincular Convenio Cadastrado no Produto Assitencial     ${QUERY_PLSQL_ASSIST}

T035.2 - VINCULAR CONVÊNIO PARA PRODUTO ASSISTENCIAL INDIVIDUAL FAMILIAR
    Clicou no submenu <Convenio> do <Produtos>
    Realizar cadastro de um Novo Convenio
    Clicou no submenu <Produtos> do <Produtos>
    Vincular Convenio Cadastrado no Produto Assitencial     ${QUERY_PLSQL_ASSIST}

T036 - VINCULAR PRODUTO ACESSÓRIO PARA PRODUTO ASSISTENCIAL COLETIVO EMPRESARIAL
    Clicou no submenu <Produtos> do <Produtos>
    Pesquisar se Existe Produtos no CRM apos a Query    Coletivo Empresarial        Acessorio       ${QUERY_PLSQL_ASSIST}     ${QUERY_PLSQL_ACESSOR[0][2]}
    Pesquisar se Existe Produtos no CRM apos a Query    Coletivo Empresarial        Assistencial    ${QUERY_PLSQL_ASSIST}     ${QUERY_PLSQL_ACESSOR[0][2]}
    Vincular produto Acessorio do painel Produtos Acessório Permitidos no Produto Assistencial          ${QUERY_PLSQL_ACESSOR[0][2]}
    O CRM deve atualizar com o Nome do Produto, com Preço, Convenio, Alçada , Produto Acessorio Preenchidos

T036.1 - VINCULAR PRODUTO ACESSÓRIO PARA PRODUTO ASSISTENCIAL COLETIVO ADESÃO
    Clicou no submenu <Produtos> do <Produtos>
    Pesquisar se Existe Produtos no CRM apos a Query    Coletivo por Adesão        Acessorio        ${QUERY_PLSQL_ASSIST}      ${QUERY_PLSQL_ACESSOR[0][2]}
    Pesquisar se Existe Produtos no CRM apos a Query    Coletivo por Adesão        Assistencial     ${QUERY_PLSQL_ASSIST}      ${QUERY_PLSQL_ACESSOR[0][2]}
    Vincular produto Acessorio do painel Produtos Acessório Permitidos no Produto Assistencial          ${QUERY_PLSQL_ACESSOR[0][2]}
    O CRM deve atualizar com o Nome do Produto, com Preço, Convenio, Alçada , Produto Acessorio Preenchidos

T036.2 - VINCULAR PRODUTO ACESSÓRIO PARA PRODUTO ASSISTENCIAL INDIVIDUAL FAMILIAR 
    Clicou no submenu <Produtos> do <Produtos>
    Pesquisar se Existe Produtos no CRM apos a Query    Individual Familiar        Acessorio         ${QUERY_PLSQL_ASSIST}     ${QUERY_PLSQL_ACESSOR[1][2]}
    Pesquisar se Existe Produtos no CRM apos a Query    Individual Familiar        Assistencial      ${QUERY_PLSQL_ASSIST}     ${QUERY_PLSQL_ACESSOR[1][2]}
    Vincular produto Acessorio do painel Produtos Acessório Permitidos no Produto Assistencial          ${QUERY_PLSQL_ACESSOR[1][2]}
    O CRM deve atualizar com o Nome do Produto, com Preço, Convenio, Alçada , Produto Acessorio Preenchidos


T037 - VINCULAR ALÇADA AO CONVÊNIO
    Clicou no submenu <Convenio> do <Produtos>
    Realizar cadastro de um Novo Convenio
    Vincular uma Alçada em um Convenio   

T038 - CONSULTAR PRODUTO ASSISTENCIAL SEM TABELA DE PREÇO
    Clicou no submenu <Parametros comerciais> dos <Parametros> e validou a URL
    Clicou no submenu <Produtos> do <Produtos>
    Pesquisar Produto Assistencial no modulo Produto    Empresarial     ${QUERY_PLSQL_ASSIST}

T038.1 - CONSULTAR PRODUTO ASSISTENCIAL SEM TABELA DE PREÇO
    Clicou no submenu <Parametros comerciais> dos <Parametros> e validou a URL
    Clicou no submenu <Produtos> do <Produtos>
    Pesquisar Produto Assistencial no modulo Produto    Adesao          ${QUERY_PLSQL_ASSIST}

T038.2 - CONSULTAR PRODUTO ASSISTENCIAL SEM TABELA DE PREÇO
    Clicou no submenu <Parametros comerciais> dos <Parametros> e validou a URL
    Clicou no submenu <Produtos> do <Produtos>
    Pesquisar Produto Assistencial no modulo Produto    Individual          ${QUERY_PLSQL_ASSIST}

T041 - CONSULTAR PRODUTO ACESSORIO SEM TABELA DE PREÇO
    DBCRMUnimed.Query - Consulta no CRM Produtos Acessorios com tabela de preço MYSQL      ${str_pla_cod}
    Clicou no submenu <Parametros comerciais> dos <Parametros> e validou a URL
    Clicou no submenu <Produtos> do <Produtos>
    Pesquisar Produto Acessorio no modulo Produto        ${QUERY_PLSQL_ACESSOR[0][2]}
    # Validar se Produto tem tabela de preço Produto acessorio

T041.1 - CONSULTAR PRODUTO ACESSORIO SEM TABELA DE PREÇO
    DBCRMUnimed.Query - Consultar Produtos Acessorios Coletivo Adesão com Tabela de Preço SG         ${str_pla_cod}
    Clicou no submenu <Parametros comerciais> dos <Parametros> e validou a URL
    Clicou no submenu <Produtos> do <Produtos>
    Pesquisar Produto Acessorio no modulo Produto        ${QUERY_PLSQL_ACESSOR[1][2]}
    # Validar se Produto tem tabela de preço Produto acessorio

T041.2 - CONSULTAR PRODUTO ACESSORIO SEM TABELA DE PREÇO
    DBCRMUnimed.Query - Consultar Produtos Acessorios Individual Familiar com tabela de Preço SG      ${SORT_LIST_PLA[0]}
    Clicou no submenu <Parametros comerciais> dos <Parametros> e validou a URL
    Clicou no submenu <Produtos> do <Produtos>
    Pesquisar Produto Acessorio no modulo Produto        ${QUERY_PLSQL_ACESSOR[1][2]}
    # Validar se Produto tem tabela de preço Produto acessorio

#### FIM DOS NOVOS #### FIM DOS NOVOS #### FIM DOS NOVOS #### FIM DOS NOVOS #### FIM DOS NOVOS #### FIM DOS NOVOS #### FIM DOS NOVOS #### FIM DOS NOVOS #### FIM DOS NOVOS
Clicou no submenu <Convenio> do <Produtos>
    MenuSuperior.Colocar o mouse no Menu Produtos
    MenuSuperior.Clicar no submenu Convenio

Clicou no submenu <Alçada> de <Todos>
    MenuSuperior.Colocar O mouse no Menu Todos
    MenuSuperior.Clicar no submenu Alçada

Clicou no submenu <Produtos> do <Produtos>
    MenuSuperior.Colocar o mouse no Menu Produtos
    MenuSuperior.Clicar no submenu Produtos

Clicou no submenu <Importação> do <Operações>
    MenuSuperior.Colocar o mouse no Operações
    MenuSuperior.Clicar no submenu Importação

Clicou no submenu <Parametros comerciais> dos <Parametros> e validou a URL
    MenuSuperior.Colocar o mouse no Parametros
    MenuSuperior.Clicar no submenu Parametros Comerciais
    MenuSuperior.Veficar aba Integração, URL consulta dados produto

Clicou no submenu <Planos> do <Produtos>
    MenuSuperior.Colocar o mouse no Menu Produtos
    MenuSuperior.Clicar no submenu Planos

Realizar cadastro de um Novo Plano "Coletivo Empresarial"
    ProdutosPlano.Cadastrar um novo Plano "Coletivo Empresarial"

# Desenvolver e testar para replicar nos outros planos e produtos   ** NOVO
Realizar cadastro de um segundo Plano Coletivo Empresarial
    ProdutosPlano.Cadastrar um segundo Plano     Coletivo Empresarial    ${QUERY_PLANO[40][0]}
    
# Desenvolver e testar para replicar nos outros planos e produtos   ** NOVO
Realizar cadastro de um segundo Plano Coletivo Adesão
    ProdutosPlano.Cadastrar um segundo Plano     Coletivo Adesão    ${QUERY_PLANO[3][0]}

# Desenvolver e testar para replicar nos outros planos e produtos   ** NOVO
Realizar cadastro de um segundo Plano Individual
    ProdutosPlano.Cadastrar um segundo Plano     Individual Familiar    ${QUERY_PLANO[60][0]}

Realizar cadastro de um Novo Plano "Coletivo Adesão"
    ProdutosPlano.Cadastrar um novo Plano "Coletivo Adesão"

Realizar cadastro de um Novo Plano "Individual Familiar"
    ProdutosPlano.Cadastrar um novo Plano "Individual Familiar"


Realizar cadastro de um Novo Convenio
    ProdutosConvenio.Cadastrar um novo Convenio

Realizar cadastro de uma Nova Alçada de "Convenio"
    ProdutosAlcada.Cadastrar uma Alçada de "Convenio"

Realizar cadastro de uma Nova Alçada de "Produto"
    ProdutosAlcada.Cadastrar uma Alçada de "Produto"

Realizar cadastro de um Produto Acessorio
    ProdutoAssistenciaisAcessorios.Cadastrar Novo produto Acessorio     ${QUERY_PLSQL_ACESSOR[1][2]}



#### Cadastro de dois produtos  Coletivo Empresarial ####
Realizar cadastro um Produto Assitencial Coletivo Empresarial
    ProdutoAssistenciaisAcessorios.Cadastrar Novo produto Assistencial  Coletivo Empresarial       ${QUERY_PLSQL_ASSIST[0][1]}

Realizar cadastro de um segundo Produto Assitencial Coletivo Empresarial
    Clicou no submenu <Produtos> do <Produtos>
    ProdutoAssistenciaisAcessorios.Cadastrar um segundo Plano Assistencial   Coletivo Empresarial    ${QUERY_PLSQL_ASSIST[9][1]}    ${QUERY_PLANO[40][0]}

#### Cadastro de dois produtos  Coletivo Adesão ####
Realizar cadastro um Produto Assitencial Coletivo Adesão
    ProdutoAssistenciaisAcessorios.Cadastrar Novo produto Assistencial  Coletivo por Adesão        ${QUERY_PLSQL_ASSIST[0][1]}

Realizar cadastro de um segundo Produto Assitencial Coletivo Adesão
    Clicou no submenu <Produtos> do <Produtos>
    ProdutoAssistenciaisAcessorios.Cadastrar um segundo Plano Assistencial   Coletivo por Adesão     ${QUERY_PLSQL_ASSIST[1][3]}     ${QUERY_PLANO[0][0]}

#### Cadastro de dois produtos  Individual Familiar ####
Realizar cadastro um Produto Assitencial Individual Familiar
    ProdutoAssistenciaisAcessorios.Cadastrar Novo produto Assistencial      Individual Familiar        ${SORT_LIST_ASSIST[0]}

Realizar cadastro de um segundo Produto Assitencial Individual Familiar
    Clicou no submenu <Produtos> do <Produtos>
    ProdutoAssistenciaisAcessorios.Cadastrar um segundo Plano Assistencial    Individual Familiar      ${SORT_LIST_ASSIST[1]}     ${SORT_LIST_PLA[1]}



Vincular uma Alçada em um produto acessorio
    ProdutoAssistenciaisAcessorios.Vincular uma Alçada registrada, produto      Acessorio   ${QUERY_PLSQL_ACESSOR}

Vincular uma Alçada em um produto Assistencial
    ProdutoAssistenciaisAcessorios.Vincular uma Alçada registrada, produto      Assistencial    ${QUERY_PLSQL_ASSIST}
    
Validou no CRM a tela Plano com o Nome
    ProdutosPlano.CRM deve apresentar a tela Plano » Nome do Plano      ${GLOBAL_NAME_PLA}

Validou no CRM a tela o segundo Plano com o Nome
    ProdutosPlano.CRM deve apresentar a tela Plano » Nome do Plano      ${GLOBAL_NAME_PLA_2}

Validou no CRM a tela Convenio com o Nome
    ProdutosConvenio.CRM deve apresentar a tela Convênio » NOME DO CONVÊNIO

Validou no CRM a tela de Produto Cadastrado
    ProdutoAssistenciaisAcessorios.O CRM deve apresentar a tela Produtos » NOME DO PRODUTO       ${GLOBAL_NAME_PDT_ACESSORIO}

## repetir passos para cenarios 009 017
Executar as querys para Validar e Gerar Massa de Dados
    Executou a query Consultar Plano 1-25 Coletivo Empresarial
    Executou a query Consultar Plano 9-25 Coletivo Adesão
    Executou a query Consultar Plano 17-25 Individual Familiar

Executou a query Consultar Plano 1-25 Coletivo Empresarial
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consultar Plano Coletivo Empresarial SG
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Produto Assistencial 2-32 Coletivo Empresarial
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Plano Acessório 03-29 Coletivo Empresarial
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Vinculo Produto Assit/ Produto Acessorio 4-36 Coletivo Empresarial
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Vinculo Produto Assit/ Alçada 5-34 Coletivo Empresarial
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Vinculo Alçada/ Produto Acessorio 6-31 Coletivo Empresarial
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Vinculo Produto Convenio/ Alçada 7-28 Coletivo Empresarial
    Run Keyword If     "${t[0]}" == "PASS"     Comum.Fechar Nav
    Run Keyword If     "${t[0]}" == "FAIL"     T025 - CADASTRAR PLANO COLETIVO EMPRESARIAL
    Run Keyword If     "${t[0]}" == "FAIL"     T041 - CONSULTAR PRODUTO ACESSORIO SEM TABELA DE PREÇO
    Run Keyword If     "${t[0]}" == "FAIL"     T036 - VINCULAR PRODUTO ACESSÓRIO PARA PRODUTO ASSISTENCIAL COLETIVO EMPRESARIAL
    Run Keyword If     "${t[0]}" == "FAIL"     T026 - CADASTRAR ALÇADA DE PRODUTO
    Run Keyword If     "${t[0]}" == "FAIL"     T034 - VINCULAR ALÇADA PARA PRODUTO ASSISTENCIAL COLETIVO EMPRESARIAL
    Run Keyword If     "${t[0]}" == "FAIL"     T031 - VINCULAR ALÇADA PARA PRODUTO ACESSÓRIO 
    Run Keyword If     "${t[0]}" == "FAIL"     T028 - CADASTRAR CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T027 - CADASTRAR ALÇADA DE CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T037 - VINCULAR ALÇADA AO CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T035 - VINCULAR CONVÊNIO PARA PRODUTO ASSISTENCIAL COLETIVO EMPRESARIAL
    Run Keyword If     "${t[0]}" == "FAIL"     Comum.Fechar Nav



## repetir passos para cenarios 010 018
Executou a query Consultar Produto Assistencial 2-32 Coletivo Empresarial
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consultar Produtos Assistenciais Coletivo Empresarial com Tabela de Preço SG        ${str_pla_cod}
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 2
    Run Keyword If     "${t[0]}" == "FAIL"     Acessar CRM e Logar
    Run Keyword If     "${t[0]}" == "FAIL"     T038 - CONSULTAR PRODUTO ASSISTENCIAL SEM TABELA DE PREÇO
    Run Keyword If     "${t[0]}" == "FAIL"     T041 - CONSULTAR PRODUTO ACESSORIO SEM TABELA DE PREÇO
    Run Keyword If     "${t[0]}" == "FAIL"     T036 - VINCULAR PRODUTO ACESSÓRIO PARA PRODUTO ASSISTENCIAL COLETIVO EMPRESARIAL
    Run Keyword If     "${t[0]}" == "FAIL"     T026 - CADASTRAR ALÇADA DE PRODUTO
    Run Keyword If     "${t[0]}" == "FAIL"     T034 - VINCULAR ALÇADA PARA PRODUTO ASSISTENCIAL COLETIVO EMPRESARIAL
    Run Keyword If     "${t[0]}" == "FAIL"     T031 - VINCULAR ALÇADA PARA PRODUTO ACESSÓRIO 
    Run Keyword If     "${t[0]}" == "FAIL"     T028 - CADASTRAR CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T027 - CADASTRAR ALÇADA DE CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T037 - VINCULAR ALÇADA AO CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T035 - VINCULAR CONVÊNIO PARA PRODUTO ASSISTENCIAL COLETIVO EMPRESARIAL
    
Executou a query Consultar Plano Acessório 03-29 Coletivo Empresarial
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consultar Produtos Acessorios Coletivo Empresarial com tabela de preço SG         ${str_pla_cod}
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 3
    Run Keyword If     "${t[0]}" == "FAIL"     T041 - CONSULTAR PRODUTO ACESSORIO SEM TABELA DE PREÇO
    Run Keyword If     "${t[0]}" == "FAIL"     T029 - CADASTRAR PRODUTO ACESSÓRIO

Executou a query Consultar Vinculo Produto Assit/ Produto Acessorio 4-36 Coletivo Empresarial
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consulta no CRM Vinculo de Produtos Acessorios em Produtos Assistenciais Coletivo Empresarial MYSQL
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 4
    Run Keyword If     "${t[0]}" == "FAIL"     Acessar CRM e Logar
    Run Keyword If     "${t[0]}" == "FAIL"     T036 - VINCULAR PRODUTO ACESSÓRIO PARA PRODUTO ASSISTENCIAL COLETIVO EMPRESARIAL

Executou a query Consultar Vinculo Produto Assit/ Alçada 5-34 Coletivo Empresarial
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consultar no CRM Vinculo de alçada de produtos assistenciais MYSQL
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 5
    Run Keyword If     "${t[0]}" == "FAIL"     T026 - CADASTRAR ALÇADA DE PRODUTO
    Run Keyword If     "${t[0]}" == "FAIL"     T034 - VINCULAR ALÇADA PARA PRODUTO ASSISTENCIAL COLETIVO EMPRESARIAL

Executou a query Consultar Vinculo Alçada/ Produto Acessorio 6-31 Coletivo Empresarial
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consultar no CRM Vinculo de alçada de produtos acessorio MYSQL       ${QUERY_PLSQL_ACESSOR[0][2]}
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 6
    Run Keyword If     "${t[0]}" == "FAIL"     Acessar CRM e Logar
    Run Keyword If     "${t[0]}" == "FAIL"     T031 - VINCULAR ALÇADA PARA PRODUTO ACESSÓRIO 

Executou a query Consultar Vinculo Produto Convenio/ Alçada 7-28 Coletivo Empresarial
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - CONSULTAR VINCULO DE CONVÊNIO EM ALÇADA NO CRM
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 7
    Run Keyword If     "${t[0]}" == "FAIL"     Acessar CRM e Logar
    Run Keyword If     "${t[0]}" == "FAIL"     T028 - CADASTRAR CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T027 - CADASTRAR ALÇADA DE CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T037 - VINCULAR ALÇADA AO CONVÊNIO



Executou a query Consultar Plano 9-25 Coletivo Adesão
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consultar Plano Coletivo por Adesão SG
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 9
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Produto Assistencial 10-32 Coletivo Adesão
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Produto Acessorio 11-25 Coletivo Adesão
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Vinculo Produto Assit/ Produto Acessorio 12-36 Coletivo Adesão
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Vinculo Produto Assit/ Alçada 13-34 Coletivo Adesão
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Vinculo Alçada/ Produto Acessorio 14-31 Coletivo Adesão
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Vinculo Produto Convenio/ Alçada 15-28 Coletivo Adesão
    Run Keyword If     "${t[0]}" == "PASS"     Comum.Fechar Nav
    Run Keyword If     "${t[0]}" == "FAIL"     T025.1 - CADASTRAR PLANO COLETIVO POR ADESÃO
    Run Keyword If     "${t[0]}" == "FAIL"     T041.1 - CONSULTAR PRODUTO ACESSORIO SEM TABELA DE PREÇO
    Run Keyword If     "${t[0]}" == "FAIL"     T036.1 - VINCULAR PRODUTO ACESSÓRIO PARA PRODUTO ASSISTENCIAL COLETIVO ADESÃO
    Run Keyword If     "${t[0]}" == "FAIL"     T026 - CADASTRAR ALÇADA DE PRODUTO
    Run Keyword If     "${t[0]}" == "FAIL"     T034.1 - VINCULAR ALÇADA PARA PRODUTO ASSISTENCIAL COLETIVO ADESÃO
    Run Keyword If     "${t[0]}" == "FAIL"     T031 - VINCULAR ALÇADA PARA PRODUTO ACESSÓRIO 
    Run Keyword If     "${t[0]}" == "FAIL"     T028 - CADASTRAR CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T027 - CADASTRAR ALÇADA DE CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T037 - VINCULAR ALÇADA AO CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T035.1 - VINCULAR CONVÊNIO PARA PRODUTO ASSISTENCIAL COLETIVO ADESÃO


Executou a query Consultar Produto Assistencial 10-32 Coletivo Adesão
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consultar Produtos Assistenciais Coletivo Adesão com Tabela de Preço SG         ${str_pla_cod}
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 10
    Run Keyword If     "${t[0]}" == "FAIL"     Acessar CRM e Logar
    Run Keyword If     "${t[0]}" == "FAIL"     T038.1 - CONSULTAR PRODUTO ASSISTENCIAL SEM TABELA DE PREÇO
    Run Keyword If     "${t[0]}" == "FAIL"     T041.1 - CONSULTAR PRODUTO ACESSORIO SEM TABELA DE PREÇO
    Run Keyword If     "${t[0]}" == "FAIL"     T036.1 - VINCULAR PRODUTO ACESSÓRIO PARA PRODUTO ASSISTENCIAL COLETIVO ADESÃO
    Run Keyword If     "${t[0]}" == "FAIL"     T026 - CADASTRAR ALÇADA DE PRODUTO
    Run Keyword If     "${t[0]}" == "FAIL"     T034.1 - VINCULAR ALÇADA PARA PRODUTO ASSISTENCIAL COLETIVO ADESÃO
    Run Keyword If     "${t[0]}" == "FAIL"     T031 - VINCULAR ALÇADA PARA PRODUTO ACESSÓRIO 
    Run Keyword If     "${t[0]}" == "FAIL"     T028 - CADASTRAR CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T027 - CADASTRAR ALÇADA DE CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T037 - VINCULAR ALÇADA AO CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T035.1 - VINCULAR CONVÊNIO PARA PRODUTO ASSISTENCIAL COLETIVO ADESÃO


Executou a query Consultar Produto Acessorio 11-25 Coletivo Adesão
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consultar Produtos Acessorios Coletivo Adesão com Tabela de Preço SG         ${str_pla_cod}
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 11
    Run Keyword If     "${t[0]}" == "FAIL"     T029 - CADASTRAR PRODUTO ACESSÓRIO

Executou a query Consultar Vinculo Produto Assit/ Produto Acessorio 12-36 Coletivo Adesão
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consulta no CRM Vinculo de Produtos Acessorios em Produtos Assistenciais Coletivo Adesão MYSQL
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 12
    Run Keyword If     "${t[0]}" == "FAIL"     T036.1 - VINCULAR PRODUTO ACESSÓRIO PARA PRODUTO ASSISTENCIAL COLETIVO ADESÃO


Executou a query Consultar Vinculo Produto Assit/ Alçada 13-34 Coletivo Adesão
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consultar no CRM Vinculo de alçada de produtos assistenciais MYSQL
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 13
    Run Keyword If     "${t[0]}" == "FAIL"     T026 - CADASTRAR ALÇADA DE PRODUTO
    Run Keyword If     "${t[0]}" == "FAIL"     T034.1 - VINCULAR ALÇADA PARA PRODUTO ASSISTENCIAL COLETIVO ADESÃO



Executou a query Consultar Vinculo Alçada/ Produto Acessorio 14-31 Coletivo Adesão
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consultar no CRM Vinculo de alçada de produtos acessorio MYSQL       ${QUERY_PLSQL_ACESSOR[1][2]}
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 14
    Run Keyword If     "${t[0]}" == "FAIL"     Acessar CRM e Logar
    Run Keyword If     "${t[0]}" == "FAIL"     T031 - VINCULAR ALÇADA PARA PRODUTO ACESSÓRIO 

Executou a query Consultar Vinculo Produto Convenio/ Alçada 15-28 Coletivo Adesão
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - CONSULTAR VINCULO DE CONVÊNIO EM ALÇADA NO CRM
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 15
    Run Keyword If     "${t[0]}" == "FAIL"     T028 - CADASTRAR CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T027 - CADASTRAR ALÇADA DE CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T037 - VINCULAR ALÇADA AO CONVÊNIO

Executou a query Consultar Plano 17-25 Individual Familiar
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consultar Plano Individual Familiar SG
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 17
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Produto Assistencial 18-32 Individual Familiar
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Plano Acessório 19-29 Individual Familiar
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Vinculo Produto Assit/ Produto Acessorio 20-36 Individual Familiar
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Vinculo Produto Assit/ Alçada 21-34 Individual Familiar
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Vinculo Alçada/ Produto Acessorio 22-31 Individual Familiar
    Run Keyword If     "${t[0]}" == "PASS"     Executou a query Consultar Vinculo Produto Convenio/ Alçada 23-28 Individual Familiar
    Run Keyword If     "${t[0]}" == "PASS"     Comum.Fechar Nav
    Run Keyword If     "${t[0]}" == "FAIL"     T025.2 - CADASTRAR PLANO INDIVIDUAL FAMILIAR
    Run Keyword If     "${t[0]}" == "FAIL"     T041.2 - CONSULTAR PRODUTO ACESSORIO SEM TABELA DE PREÇO
    Run Keyword If     "${t[0]}" == "FAIL"     T036.2 - VINCULAR PRODUTO ACESSÓRIO PARA PRODUTO ASSISTENCIAL INDIVIDUAL FAMILIAR
    Run Keyword If     "${t[0]}" == "FAIL"     T026 - CADASTRAR ALÇADA DE PRODUTO
    Run Keyword If     "${t[0]}" == "FAIL"     T034.2 - VINCULAR ALÇADA PARA PRODUTO ASSISTENCIAL INDIVIDUAL FAMILIAR
    Run Keyword If     "${t[0]}" == "FAIL"     T031 - VINCULAR ALÇADA PARA PRODUTO ACESSÓRIO 
    Run Keyword If     "${t[0]}" == "FAIL"     T028 - CADASTRAR CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T027 - CADASTRAR ALÇADA DE CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T037 - VINCULAR ALÇADA AO CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T035.2 - VINCULAR CONVÊNIO PARA PRODUTO ASSISTENCIAL INDIVIDUAL FAMILIAR

Executou a query Consultar Produto Assistencial 18-32 Individual Familiar
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consultar Produtos Assistenciais Individual Familiar com tabela de preço SG       ${SORT_LIST_PLA[0]}
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 18
    Run Keyword If     "${t[0]}" == "FAIL"     Acessar CRM e Logar
    Run Keyword If     "${t[0]}" == "FAIL"     T038.2 - CONSULTAR PRODUTO ASSISTENCIAL SEM TABELA DE PREÇO
    Run Keyword If     "${t[0]}" == "FAIL"     T041.2 - CONSULTAR PRODUTO ACESSORIO SEM TABELA DE PREÇO
    Run Keyword If     "${t[0]}" == "FAIL"     T036.2 - VINCULAR PRODUTO ACESSÓRIO PARA PRODUTO ASSISTENCIAL INDIVIDUAL FAMILIAR
    Run Keyword If     "${t[0]}" == "FAIL"     T026 - CADASTRAR ALÇADA DE PRODUTO
    Run Keyword If     "${t[0]}" == "FAIL"     T034.2 - VINCULAR ALÇADA PARA PRODUTO ASSISTENCIAL INDIVIDUAL FAMILIAR
    Run Keyword If     "${t[0]}" == "FAIL"     T031 - VINCULAR ALÇADA PARA PRODUTO ACESSÓRIO 
    Run Keyword If     "${t[0]}" == "FAIL"     T028 - CADASTRAR CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T027 - CADASTRAR ALÇADA DE CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T037 - VINCULAR ALÇADA AO CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T035.2 - VINCULAR CONVÊNIO PARA PRODUTO ASSISTENCIAL INDIVIDUAL FAMILIAR

Executou a query Consultar Plano Acessório 19-29 Individual Familiar
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consultar Produtos Acessorios Individual Familiar com tabela de Preço SG       ${SORT_LIST_PLA[0]}
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 19
    Run Keyword If     "${t[0]}" == "FAIL"     T041.2 - CONSULTAR PRODUTO ACESSORIO SEM TABELA DE PREÇO
    Run Keyword If     "${t[0]}" == "FAIL"     T029 - CADASTRAR PRODUTO ACESSÓRIO


Executou a query Consultar Vinculo Produto Assit/ Produto Acessorio 20-36 Individual Familiar
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consulta no CRM Vinculo de Produtos Acessorios em Produtos Assistenciais Individual Familiar MYSQL
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 20
    Run Keyword If     "${t[0]}" == "FAIL"     T036.2 - VINCULAR PRODUTO ACESSÓRIO PARA PRODUTO ASSISTENCIAL INDIVIDUAL FAMILIAR

Executou a query Consultar Vinculo Produto Assit/ Alçada 21-34 Individual Familiar
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consultar no CRM Vinculo de alçada de produtos assistenciais MYSQL
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 21
    Run Keyword If     "${t[0]}" == "FAIL"     T026 - CADASTRAR ALÇADA DE PRODUTO
    Run Keyword If     "${t[0]}" == "FAIL"     T034.2 - VINCULAR ALÇADA PARA PRODUTO ASSISTENCIAL INDIVIDUAL FAMILIAR


Executou a query Consultar Vinculo Alçada/ Produto Acessorio 22-31 Individual Familiar
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - Consultar no CRM Vinculo de alçada de produtos acessorio MYSQL       ${QUERY_PLSQL_ACESSOR[0][2]}
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 22
    Run Keyword If     "${t[0]}" == "FAIL"     Acessar CRM e Logar
    Run Keyword If     "${t[0]}" == "FAIL"     T031 - VINCULAR ALÇADA PARA PRODUTO ACESSÓRIO 

Executou a query Consultar Vinculo Produto Convenio/ Alçada 23-28 Individual Familiar
    ${t}    Run Keyword And Ignore Error       DBCRMUnimed.Query - CONSULTAR VINCULO DE CONVÊNIO EM ALÇADA NO CRM
    Run Keyword If     "${t[0]}" == "PASS"     Log To Console        Passou no banco 23
    Run Keyword If     "${t[0]}" == "FAIL"     T028 - CADASTRAR CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T027 - CADASTRAR ALÇADA DE CONVÊNIO
    Run Keyword If     "${t[0]}" == "FAIL"     T037 - VINCULAR ALÇADA AO CONVÊNIO

#### KW de conexao com o banco mmassa de teste nova############

Clicou na submenu <Solicitação de Portabilidade> do <Comercial>
    MenuSuperior.Colocar o mouse no Comercial
    MenuSuperior.Clicar no submenu Solicitação de Portabilidade

Clicou na submenu <Usuários Canal Contratante> do <Todos>
    MenuSuperior.Colocar O mouse no Menu Todos
    MenuSuperior.Clicar no submenu Usuários Canal Contratante

Apresentar a Tela de Pesquisa Potencial Cliente
    PotencialClientePesquisa.Verificar Página Ponteciais Cliente Pesquisa

Apresentar a Tela de Pesquisa Oportunidades
    OportunidadesPesquisa.Verificar Página Oportunidades Pesquisa

Apresentar a Tela de Pesquisa Cotações
    CotacoesPesquisa.Verificar se está na Página Pesquisar Cotações

Preencher os Campos de Pesquisa com
    [Arguments]  @{arg1}
    PotencialClientePesquisa.Aperta Botão Limpar
    PotencialClientePesquisa.Preencher Campo CPF/CNPJ/CAEPF na Pesquisa  ${arg1[3]}
   # PotencialClientePesquisa.Preencher Campo Nome na Pesquisa  ${arg1[1]}

Apertar o Botão Pesquisar do Potencial Cliente
    PotencialClientePesquisa.Aperta Botão Pesquisar

Apresentar no resultado da pesquisa o nome do pontencial cliente
    [Arguments]  @{arg1}
    PotencialClientePesquisa.Resultado da Pesquisa de Potencial Cliente  @{arg1} 

Clicar no Resultado da Pesquisa Potencial Cliente
    PotencialClientePesquisa.Clicar no Resultado de Pesquisa Potencial Cliente

Apresentar a Tela de Detalhes do Potencial Cliente com os dados
    [Arguments]  @{arg1}
    PotencialClienteDetalhes.Verificar Dados de Potencial Cliente  @{arg1}

Apertar o Botão Criar do Pontecial Cliente
    PotencialClientePesquisa.Aperta Botão Criar Ponteciais Clientes

Apertar o Botão Criar do Cotações
    CotacoesPesquisa.Apertar Botão Criar Cotações

Apresentar a Tela de Cadastro Pontecial Cliente
    PotencialClienteCadastro.Verificar Tela de Cadastro Pontecial Cliente

Selecionar o Tipo Pessoa como Pessoa Física
    PotencialClienteCadastro.Colocar o tipo Pessoa como Pessoa Física

Selecionar o Tipo Pessoa como Pessoa Júridica (CNPJ)
    PotencialClienteCadastro.Colocar o tipo Pessoa como Pessoa Jurídica(CNPJ)

Selecionar o Tipo Pessoa como Pessoa Júridica (CAEPF)
    PotencialClienteCadastro.Colocar o tipo Pessoa como Pessoa Jurídica(CAEPF)

Preencher os campos "Nome da conta" e "Nome" com
    [Arguments]  @{arg1}
    #Instanciar Cliente PF TR001 Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" 
    PotencialClienteCadastro.Preencher Nome/Fantasia com   ${arg1[1]}
    PotencialClienteCadastro.Preencher Nome com  ${arg1[1]}

Preencher todos os campos de Pessoa Física
    [Arguments]  @{arg1}
    Log Many  @{arg1}
    #Instanciar Cliente PF TR002 Arg0:"Tipo de Pessoa" Arg1:"Nome"  Arg2:"Nome Conta" Arg3:"CPF" 
    #Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Celular"
    PotencialClienteCadastro.Preencher Nome/Fantasia com   ${arg1[1]}
    PotencialClienteCadastro.Preencher Nome com  ${arg1[1]}
    PotencialClienteCadastro.Preencher CPF/CNPJ/CAEPF com  ${arg1[3]}
    PotencialClienteCadastro.Preencher Número de Vidas com  ${arg1[4]}
    PotencialClienteCadastro.Preencher Email com  ${arg1[5]}
    PotencialClienteCadastro.Preencher Telefone Residencial com  ${arg1[6]}
    PotencialClienteCadastro.Preencher Telefone Celular com  ${arg1[7]}

Preencher todos os campos de Pessoa Jurídica CNPJ
    [Arguments]  @{arg1}
    #Instanciar Cliente PF TR004 Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    # Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    # Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica" 
    PotencialClienteCadastro.Preencher Nome/Fantasia com   ${arg1[1]}
    PotencialClienteCadastro.Preencher Nome com  ${arg1[1]}
    PotencialClienteCadastro.Preencher CPF/CNPJ/CAEPF com  ${arg1[3]}
    PotencialClienteCadastro.Preencher Número de Vidas com  ${arg1[4]}
    PotencialClienteCadastro.Preencher Email com  ${arg1[5]}
    PotencialClienteCadastro.Preencher Telefone Residencial com  ${arg1[6]}
    PotencialClienteCadastro.Preencher Telefone Comercial com  ${arg1[7]}
    PotencialClienteCadastro.Preencher Razão Social com  ${arg1[8]}
    PotencialClienteCadastro.Preencher Porte da Empresa com  ${arg1[9]}
    PotencialClienteCadastro.Preencher Tipo Estabelecimento com  ${arg1[10]}
    PotencialClienteCadastro.Preencher Natureza Jurídica com  ${arg1[11]}

Preencher todos os campos de Pessoa Jurídica CAEPF
    [Arguments]  @{arg1}
    #Log Many  @{arg1}
    #Instanciar Cliente CAEPF TR006 Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CAEPF" 
    # Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    # Arg8:"Razao Social"
    PotencialClienteCadastro.Preencher Nome/Fantasia com   ${arg1[2]}
    PotencialClienteCadastro.Preencher Nome com  ${arg1[1]}
    PotencialClienteCadastro.Preencher CPF/CNPJ/CAEPF com  ${arg1[3]}
    PotencialClienteCadastro.Preencher Número de Vidas com  ${arg1[4]}
    PotencialClienteCadastro.Preencher Email com  ${arg1[5]}
    PotencialClienteCadastro.Preencher Telefone Residencial com  ${arg1[6]}
    PotencialClienteCadastro.Preencher Telefone Comercial com  ${arg1[7]}
    PotencialClienteCadastro.Preencher Razão Social com  ${arg1[8]}

Clicar no botão Salvar Potencial Cliente
    PotencialClienteCadastro.Apertar Botão Salvar Pontecial Cliente

Apresentar a modal com a mensagem Nenhum endereço foi cadastrado, deseja cadastrar um novo endereço?
    PotencialClienteCadastro.Apresentar a Modal de Preencher Endereço

Clicar no Botão Não do Modal
    PotencialClienteCadastro.Apertar Botão Não do Modal

Apresentar a Tela Potencial Cliente » NOME
    [Arguments]  ${arg1}
    PotencialClienteDetalhes.Apresentar a Tela Detalhes do Potencial Cliente  ${arg1}

Clicar no subbotão Solicitar Reserva de Mercado
    PotencialClienteDetalhes.Apertar no DropMenu do Botão Editar e Selecionar Solicitar Reserva de Mercado

Apresentar a Mensagem de Sucesso com o Código de Reserva de Mercado e Conta do Cliente
    PotencialClienteDetalhes.Apresentar a Mensagem de Sucesso com o Código de Reserva de Mercado

Apresentar a Tela de Pesquisa Contas
    ContasPesquisa.Verificar Página Contas Pesquisa

Apertar o Botão Criar do Contas
    ContasPesquisa.Aperta Botão Criar Contas

Apresentar a Tela de Cadastro Contas
    ContasCadastro.Verificar Página Contas Criar

Selecionar o tipo como
    [Arguments]  ${arg1}
    ContasCadastro.Colocar o Tipo no Cadastro Conta com  ${arg1}

Preencher o Campo "Nome da Conta" com
    [Arguments]  ${arg1}
    ContasCadastro.Preencher Nome da Conta com  ${arg1}

Preencher Todos os Campos de Pessoa Físca com
    [Arguments]  @{arg1}
    #Log Many  @{arg1}
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta, Arg2 Nome Social, Arg3 Genero Social
    #         ...Arg4 CNPJ/CPF/CAEPF, Arg5 Email, Arg6 Data Nascimento, Arg7 Sexo
    #         ...Arg8 Nome Mae, Arg9 Nome do Pai, Arg10 Estado Civil, Arg11 Naturalidade
    #         ...Arg12 Tipo Telefone, Arg13 Numero Celular
    ContasCadastro.Colocar o Tipo no Cadastro Conta com  ${arg1[0]}
    ContasCadastro.Preencher Nome da Conta com           ${arg1[1]}
    ContasCadastro.Preencher Nome Social com             ${arg1[2]}
    ContasCadastro.Colocar o Genero Social com           ${arg1[3]}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com          ${arg1[4]}
    ContasCadastro.Preencher Email com                   ${arg1[5]}
    ContasCadastro.Preencher Data de Nascimento com      ${arg1[6]}
    ContasCadastro.Colocar o Sexo com                    ${arg1[7]}
    ContasCadastro.Preencher Nome da Mãe com             ${arg1[8]}
    ContasCadastro.Preencher Nome da Pai com             ${arg1[9]}
    ContasCadastro.Colocar o Estado Civil com            ${arg1[10]}
    ContasCadastro.Preencher Naturalidade com            ${arg1[11]}
    # ContasCadastro.Colocar o Tipo Telefone com           ${arg1[12]}
    # ContasCadastro.Preencher Número Telefone com         ${arg1[13]}
    # ContasCadastro.Colocar Classe Telefone com           ${arg1[14]}

Preencher os campos "Nome da conta" e "CNPJ/CPF/CAEPF" 
    [Arguments]  @{arg1}
    #Log Many  @{arg1}
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta, Arg3 CNPJ/CPF/CAEPF
    ContasCadastro.Colocar o Tipo no Cadastro Conta com  ${arg1[0]}
    ContasCadastro.Preencher Nome da Conta com           ${arg1[1]}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com          ${arg1[2]}


Preencher os campos "Nome da conta" e "CNPJ/CPF/CAEPF" (Beneficiario)
    [Arguments]  @{arg1}
    #Log Many  @{arg1}
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta, Arg3 CNPJ/CPF/CAEPF
    ContasCadastro.Colocar o Tipo no Cadastro Conta com  ${arg1[0]}
    ContasCadastro.Preencher Nome da Conta com           ${arg1[1]}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com          ${arg1[3]}

Preencher Todos os Campos de Pessoa Jurídica com
    [Arguments]  @{arg1}
    #Log Many  @{arg1}
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta, Arg3 Razao Social, Arg4 CNPJ/CPF/CAEPF, 
    #            Arg5 Porte da Empresa, Arg6 Natureza Jurídica, Arg7 Inscrição Estadual, Arg8 Inscrição Municipal
    #         ...Arg9 E-mail, Arg10 Tipo Telefone, Arg11 Numero Celular
    ContasCadastro.Colocar o Tipo no Cadastro Conta com  ${arg1[0]}
    ContasCadastro.Preencher Nome da Conta com           ${arg1[1]}
    ContasCadastro.Preencher Razão Social com            ${arg1[2]}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com          ${arg1[3]}
    ContasCadastro.Colocar Porte da Empresa com          ${arg1[4]}
    ContasCadastro.Colocar Natureza Jurídica com         ${arg1[5]}
    ContasCadastro.Preencher Inscrição Estadual com      ${arg1[6]}
    ContasCadastro.Preencher Inscrição Municipal com     ${arg1[7]}
    ContasCadastro.Preencher Email com                   ${arg1[8]}
    # ContasCadastro.Colocar o Tipo Telefone com           ${arg1[9]}
    # ContasCadastro.Preencher Número Telefone com         ${arg1[10]}
    # ContasCadastro.Colocar Classe Telefone com           ${arg1[11]}    

Preencher Todos os Campos de Pessoa CAEPF com
    [Arguments]  @{arg1}
    #Log Many  @{arg1}
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta, Arg2 Razao Social, Arg3 CNPJ/CPF/CAEPF, 
    #            Arg4 CPF Responsável (CAEPF), Arg5 Inscrição Estadual, Arg6 Inscrição Municipal
    #         ...Arg7 E-mail, Arg8 Tipo Telefone, Arg9 Numero Celular
    ContasCadastro.Colocar o Tipo no Cadastro Conta com  ${arg1[0]}
    ContasCadastro.Preencher Nome da Conta com           ${arg1[1]}
    ContasCadastro.Preencher Razão Social com            ${arg1[2]}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com          ${arg1[3]}
    ContasCadastro.Preencher CPF do Responsável com      ${arg1[4]}
    ContasCadastro.Preencher Inscrição Estadual com      ${arg1[5]}
    ContasCadastro.Preencher Inscrição Municipal com     ${arg1[6]}
    ContasCadastro.Preencher Email com                   ${arg1[7]}
   #  ContasCadastro.Colocar o Tipo Telefone com           ${arg1[8]}
    # ContasCadastro.Preencher Número Telefone com         ${arg1[9]}
    # ContasCadastro.Colocar Classe Telefone com           ${arg1[10]}

Preencher os Campos Obrigatórios para Cliente PJ com 
    [Arguments]  @{arg1}
    #Log Many  @{arg1}
    ContasCadastro.Colocar o Tipo no Cadastro Conta com  ${arg1[0]}
    ContasCadastro.Preencher Nome da Conta com           ${arg1[1]}
    ContasCadastro.Preencher Razão Social com            ${arg1[2]}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com          ${arg1[3]}

Preencher os Campos Obrigatórios para Cliente CAEPF com
    [Arguments]  @{arg1}
    #Log Many  @{arg1}
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta, Arg3 Razao Social, Arg4 CNPJ/CPF/CAEPF, 
    #            Arg5 CPF Responsável (CAEPF)
    ContasCadastro.Colocar o Tipo no Cadastro Conta com  ${arg1[0]}
    ContasCadastro.Preencher Nome da Conta com           ${arg1[1]}
    ContasCadastro.Preencher Razão Social com            ${arg1[2]}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com          ${arg1[3]}
    ContasCadastro.Preencher CPF do Responsável com      ${arg1[4]}

Clicar no botão <SALVAR>
    ContasCadastro.Apertar Botão Salvar Contas

Apresentar a Tela de Detalhes do Conta com os dados  
    [Arguments]  @{arg1}
    ContasDetalhes.Apresentar a Tela Detalhes da Conta  ${arg1[1]}

Apresentar a Tela de Detalhes da segunda Conta com os dados
    [Arguments]  ${arg1}
    ContasDetalhes.Apresentar a Tela Detalhes da Conta  ${arg1}

Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    ContasDetalhes.Apertar Botão Criar Oportunidade do Detalhes de Conta

Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    OportunidadesDetalhes.Apertar no botão <Criar> do painel Cotação do Detalhes de Oportunidade

Clicar botão Criar Oportunidades
    OportunidadesPesquisa.Aperta Botão Criar Oportunidades
    
Apresentar a Tela de Cadastro Oportunidades
    OportunidadesCadastro.Verificar Tela de Cadastro Oportunidades

Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos
    [Arguments]  ${arg1}
    OportunidadesCadastro.Verificar Tela de Cadastro Oportunidades
    OportunidadesCadastro.Verificar se o campo Nome Conta está preenchido com  ${arg1}
    OportunidadesCadastro.Verificar se o campo Nome Oportunidade está preenchido com  ${arg1}

Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos (Segunda Oportunidade)
    [Arguments]  @{arg1}
    OportunidadesCadastro.Verificar Tela de Cadastro Oportunidades
    OportunidadesCadastro.Verificar se o campo Nome Conta está preenchido com  ${arg1[32]}
    OportunidadesCadastro.Verificar se o campo Nome Oportunidade está preenchido com  ${arg1[32]}

Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos (Terceira Oportunidade)
    [Arguments]  @{arg1}
    OportunidadesCadastro.Verificar Tela de Cadastro Oportunidades
    OportunidadesCadastro.Verificar se o campo Nome Conta está preenchido com  ${arg1[72]}
    OportunidadesCadastro.Verificar se o campo Nome Oportunidade está preenchido com  ${arg1[72]}

Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos PJ
    [Arguments]  @{arg1}
    OportunidadesCadastro.Verificar Tela de Cadastro Oportunidades
    OportunidadesCadastro.Verificar se o compo Nome Conta Fantasia está preenchido com  ${arg1[2]}
    OportunidadesCadastro.Verificar se o campo Nome Oportunidade está preenchido com  ${arg1[2]}

Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente
    [Arguments]  @{arg1}
    OportunidadesCadastro.Verificar Tela de Cadastro Oportunidades
    OportunidadesCadastro.Verificar se o campo Nome Oportunidade está preenchido com  ${arg1[1]}

Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente CNPJ
    [Arguments]  ${arg1}
    OportunidadesCadastro.Verificar Tela de Cadastro Oportunidades
    OportunidadesCadastro.Verificar se o campo Nome Oportunidade CNPJ está preenchido com  ${arg1}

Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente CAEPF
    [Arguments]  @{arg1}
    OportunidadesCadastro.Verificar Tela de Cadastro Oportunidades
    OportunidadesCadastro.Verificar se o campo Nome Oportunidade está preenchido com  ${arg1}

Apresentar a Tela de Cadastro de Cotação
    CotacoesCadastro.Verificar Página Cotações Criar

Preencher apenas campos obrigatórios para Potencial Cliente PF com
    [Arguments]  @{arg1}
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta
    #Adicionando: Arg3 Nome Oportunidade, Arg4 Numero de Vida, Arg5 Tipo, Arg6 Data Prevista
    ${title} =  Get Title  
    OportunidadesCadastro.Preencher Nome Oportunidade com  ${arg1[2]}
    Preencher Nome da Conta Fazendo uma Pesquisa com  @{arg1}
    Switch Window  ${title}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[3]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[4]}
    OportunidadesCadastro.Preencher Data Prevista Com  ${arg1[5]}

Preencher apenas campos obrigatórios para Cliente PF com
    [Arguments]  @{arg1}
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta, Arg3 CNPJ/CPF/CAEPF
    #Adicionando: Arg4 Nome Oportunidade, Arg5 Numero de Vida, Arg6 Tipo, Arg7 Data prevista
    ${title} =  Get Title  
    OportunidadesCadastro.Preencher Nome Oportunidade com  ${arg1[3]}
    Preencher Nome da Conta Fazendo uma Pesquisa com  @{arg1}
    Switch Window  ${title}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[4]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[5]}
    OportunidadesCadastro.Preencher Data Prevista Com  ${arg1[6]}

Preencher o campo "Número de Vidas" e "Tipo" com  
    [Arguments]  @{arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[0]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[1]}

Preencher o campo Origem de Vida com  
    [Arguments]  ${arg1}
    OportunidadesCadastro.Colocar Origem de Vida    ${arg1}    

Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
    OportunidadesCadastro.Marcar a Opção Demonstrou interesse em produtos PF e PJ?

Seleciona o campo "Demonstrou interesse em produtos PF e PJ?" no Painel de Oportunidade
    CotacoesCadastro.Marcar a Opção Demonstrou interesse em produtos PF e PJ?
    CotacoesCadastro.Verificar se o alerta não aparece

Preencher o campo "Número de Vidas" e "Tipo" de Potencial Cliente PF com
    [Arguments]  @{arg1}
    #Instanciar POTENCIAL Cliente PF TR027 Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CPF" 
    # Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[4]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[8]}

Preencher o campo "Número de Vidas" e "Tipo" de Potencial Cliente PJ com  
    [Arguments]  @{arg1}
    #Instanciar POTENCIAL Cliente PF TR027 Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    # Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    # Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    #Adicionando: Arg12 Nome Oportunidade, Arg13 Tipo, Arg14 Data Prevista 
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[4]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[13]}

Preencher Nome da Conta Fazendo uma Pesquisa com
    [Arguments]  @{arg1}
    #Argumentos: Arg1 Tipo, Arg2 Nome Conta
    #Adicionando: Arg3 Nome Oportunidade, Arg4 Numero de Vida, Arg5 Tipo, Arg6 Data Prevista
    OportunidadesCadastro.Apertar no Botão Buscar Conta
    Switch Window  NEW
    PopupPesquisarNomeConta.Verificar se o Popup Pesquisa Conta Abriu
    PopupPesquisarNomeConta.Preencher Campo Nome Conta com  ${arg1[1]}
    PopupPesquisarNomeConta.Colocar Tipo Pessoa com  ${arg1[0]}
    PopupPesquisarNomeConta.Apertar Botão Pesquisar
    PopupPesquisarNomeConta.Verificar Resultado da Pesquisa Nome Conta com os dados  @{arg1}
    PopupPesquisarNomeConta.Clicar no Resultado de Pesquisa Nome Conta

Pesquisou Conta por  
    [Arguments]  @{arg1}
    ContasPesquisa.Aperta Botão Limpar Pesquisar Contas
    ContasPesquisa.Preencher Campo Nome da Conta / Razão Social na Pesquisa  ${arg1[1]}
    ContasPesquisa.Preencher Campo CPF/CNPJ/CAEPF na Pesquisa    ${arg1[2]}
    ContasPesquisa.Colocar Tipo Pessoa com  ${arg1[0]}
    ContasPesquisa.Aperta Botão Pesquisar Contas
    ContasPesquisa.Resultado da Pesquisa de Contas  @{arg1}

Pesquisou Conta por Nome Conta e Tipo 
    [Arguments]  @{arg1}
    ContasPesquisa.Aperta Botão Limpar Pesquisar Contas
    ContasPesquisa.Preencher Campo Nome da Conta / Razão Social na Pesquisa  ${arg1[1]}
    ContasPesquisa.Colocar Tipo Pessoa com  ${arg1[0]}
    ContasPesquisa.Aperta Botão Pesquisar Contas
    ContasPesquisa.Resultado da Pesquisa de Contas  @{arg1}

Pesquisou Potencial Conta por
    [Arguments]  @{arg1}
    #Instanciar Cliente PF TR004 Arg0:"Tipo de Pessoa" Arg1:"Nome" Arg2:"Nome Conta" Arg3:"CNPJ" 
    # Arg4:"Numero de Vidas" Arg5:"Email" Arg6:"Telefone Residencial" Arg7:"Telefone Comercial 
    # Arg8:"Razao Social" Arg9:"Porte da Empresa" Arg10:"Tipo Estabelecimento" Arg11:"Natureza Juridica"
    #Adicionando: Arg12 Tipo, Arg13 Data Prevista 
    PotencialClientePesquisa.Aperta Botão Limpar
    PotencialClientePesquisa.Preencher Campo Nome da Conta / Razão Social na Pesquisa  ${arg1[2]}
    PotencialClientePesquisa.Preencher Campo CPF/CNPJ/CAEPF na Pesquisa    ${arg1[3]}
    PotencialClientePesquisa.Preencher Campo Nome na Pesquisa  ${arg1[1]}
    PotencialClientePesquisa.Aperta Botão Pesquisar
    PotencialClientePesquisa.Resultado da Pesquisa de Potencial Cliente  @{arg1}


Pesquisou Potencial Conta por Campos Obrigatórios
    [Arguments]  @{arg1}
    #Argumentos: Arg0 Tipo, Arg1 Nome Conta
    #            Arg2 Numero de Vida, Arg3 Tipo, Arg4 Data prevista
    PotencialClientePesquisa.Aperta Botão Limpar
    PotencialClientePesquisa.Preencher Campo Nome da Conta / Razão Social na Pesquisa  ${arg1[1]}
    PotencialClientePesquisa.Preencher Campo Nome na Pesquisa  ${arg1[1]}
    PotencialClientePesquisa.Aperta Botão Pesquisar
    PotencialClientePesquisa.Resultado da Pesquisa de Potencial Cliente  @{arg1}

Clicar no Botão Salvar Oportunidade
    OportunidadesCadastro.Apertar Botão Salvar Oportunidade

Clicou no Resultado da Pesquisa de Contas
    ContasPesquisa.Apertar no Resultado da Pesquisa de Contas

Clicou no Resultado da Pesquisa de Potencial Contas
    PotencialClientePesquisa.Clicar no Resultado de Pesquisa Potencial Cliente

Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    PotencialClienteDetalhes.Apertar na Reserva de Mercado
    Switch Window  NEW

Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    ReservaMercadoDetalhes.Verificar se está na Tela Reserva de Mercado
    ReservaMercadoDetalhes.Apertar no Nome da Conta na tela Detalhes de Reserva de Mercado

Apresentar a tela Oportunidade »  
    [Arguments]  ${arg1}
    OportunidadesDetalhes.Apresentar a Tela Detalhes da Oportunidade  ${arg1}

Selecionar o Plano com 
    [Arguments]  ${arg1}
    CotacoesCadastro.Apertar Plano
    CotacoesCadastro.Preencher Nome do Plano na pesquisa  ${arg1}
    #CotacoesCadastro.Verificar se os Produtos Assistenciais estão apresentando em tela
    CotacoesCadastro.Selecionar o Plano  ${arg1}
    CotacoesCadastro.Apertar Plano
    CotacoesCadastro.Verificar se o alerta não aparece

Selecionar um Produto Assistencial com 
    [Arguments]  ${arg1}
    CotacoesCadastro.Apertar Produto Assistencial
    CotacoesCadastro.Preencher Nome do Produto Assistencial na pesquisa  ${arg1}
    #CotacoesCadastro.Verificar se os Produtos Assistenciais estão apresentando em tela
    CotacoesCadastro.Selecionar o Produto Assitencial  ${arg1}
    CotacoesCadastro.Apertar Produto Assistencial
    CotacoesCadastro.Verificar Se A Tabela Do Produto Assistencial Está Aparecendo  ${arg1}
    CotacoesCadastro.Atribuir Valor de referencia do Produto  ${arg1}

Selecionar um Produto Assistencial do Potencial PF com
    [Arguments]  ${arg1}
    CotacoesCadastro.Apertar Produto Assistencial
    Log To Console    ${arg1}
    CotacoesCadastro.Preencher Nome do Produto Assistencial na pesquisa  ${arg1}
    #CotacoesCadastro.Verificar se os Produtos Assistenciais estão apresentando em tela
    CotacoesCadastro.Selecionar o Produto Assitencial  ${arg1}
    CotacoesCadastro.Apertar Produto Assistencial
    CotacoesCadastro.Verificar Se A Tabela Do Produto Assistencial Está Aparecendo  ${arg1}
    CotacoesCadastro.Atribuir Valor de referencia do Produto    ${arg1}
   

Selecionar um Produto Assistencial do Potencial PJ com
    [Arguments]  ${arg1}
    CotacoesCadastro.Apertar Produto Assistencial
    CotacoesCadastro.Preencher Nome do Produto Assistencial na pesquisa  ${arg1}
    #CotacoesCadastro.Verificar se os Produtos Assistenciais estão apresentando em tela
    CotacoesCadastro.Selecionar o Produto Assitencial  ${arg1}
    CotacoesCadastro.Apertar Produto Assistencial
    CotacoesCadastro.Verificar Se A Tabela Do Produto Assistencial Está Aparecendo  ${arg1}
    CotacoesCadastro.Atribuir Valor de referencia do Produto    ${arg1}

Selecionar um Produto Assistencial Empresarial do Potencial PF com
    [Arguments]  ${arg1}
    CotacoesCadastro.Apertar Produto Assistencial
    CotacoesCadastro.Preencher Nome do Produto Assistencial na pesquisa  ${arg1}
    #CotacoesCadastro.Verificar se os Produtos Assistenciais estão apresentando em tela
    CotacoesCadastro.Selecionar o Produto Assitencial  ${arg1}
    CotacoesCadastro.Apertar Produto Assistencial
    CotacoesCadastro.Verificar Se A Tabela Do Produto Assistencial Está Aparecendo  ${arg1}
    CotacoesCadastro.Atribuir Valor de referencia do Produto    ${arg1}

Salvar a Tabela Completa com a faixa de vida
    CotacoesCadastro.Salvar Tabela Completa com a faixa de vida

Remover Acessórios do Produto Assistencial
    CotacoesCadastro.Deselecionar os Acessorios do Produto Assistencial

Preencher Negociação com  
    [Arguments]  @{arg1}
    CotacoesCadastro.Preencher o tipo de Negociação  ${arg1[0]}
    CotacoesCadastro.Preencher Valor da Negociação  ${arg1[0]}  ${arg1[1]}

Selecionar Um Convênio
    [Arguments]  ${arg1}
    ${excludes} =	Get Window Handles  
    ${tam} =  Get Length    ${excludes}
    CotacoesCadastro.Apertar Botão Consultar Convênio
    Switch Window  NEW
    PopupPesquisarConvenios.Verificar se o Popup Pesquisa Convênio Abriu
    PopupPesquisarConvenios.Preencher Campo Nome Convênio com  ${arg1}
    PopupPesquisarConvenios.Apertar Botão Pesquisar
    PopupPesquisarConvenios.Verificar Resultado da Pesquisa Nome Conta com os dados  ${arg1}
    PopupPesquisarConvenios.Clicar no Resultado de Pesquisa Nome Conta
    #Condição para pegar a tab do navegador quando vem pelo Potencial é tamanho 2 e pela Contas 1
    Run Keyword If  '${tam}' == '1'   Switch Window  MAIN
    Run Keyword If  '${tam}' == '2'   Switch Window  ${excludes[1]}
    CotacoesCadastro.Verificar se o alerta não aparece

Preencher os Campos de Faixa Etária com Número de Vidas
    [Arguments]  ${arg1}
    CotacoesCadastro.Preencher Faixa etária com  ${arg1}

Editar campo "Fase da Cotação" igual a 
    [Arguments]  ${arg1}
    CotacoesCadastro.Selecionar o campo Fase de Cotação com  ${arg1}

Preencher campo "Titulo" com  
    [Arguments]  ${arg1}
    CotacoesCadastro.Preencher Título  ${arg1}

Preencher campo Válido até
    [Arguments]  ${arg1}
    CotacoesCadastro.Preencher Valido Até  ${arg1}

Selecionar campo "Tipo de Contratação" com
    [Arguments]  ${arg1}
    CotacoesCadastro.Selecionar Tipo de Contratação com  ${arg1}

Selecionar campo "Base Quantidade Vidas Mensalidade" com
    [Arguments]  ${arg1}
    CotacoesCadastro.Selecionar Base Quantidade Vidas Mensalidade com  ${arg1}
    Sleep  5s

Selecionar campo "Fixar tabela de preço por faixa de vida" com
    [Arguments]  ${arg1}
    CotacoesCadastro.Selecionar Fixar tabela de preço por faixa de vida com  ${arg1}
    Sleep  3s

Clicou no botão "DEFINIR FAIXA DE VIDAS PARA FIXAR" e selecionou o segundo registro
    CotacoesCadastro.Clicar no botão "DEFINIR FAIXA DE VIDAS PARA FIXAR" e selecionou o segundo registro

Selecionar campo Tipo de Layout
    [Arguments]  ${arg1}
    CotacoesCadastro.Selecionar Tipo de Layout    ${arg1}
    Sleep  2s

Preencher o campo "Total de Familias" com
    [Arguments]  ${arg1}
    CotacoesCadastro.Preencher campo "Total de Familias" com  ${arg1}

Cadastrar dados obrigatórios de Conta na tela de Cotação com
    [Arguments]  @{arg1}
    CotacoesCadastro.Selecionar Tipo de Conta com  ${arg1[0]}
    CotacoesCadastro.Verificar se o alerta não aparece
    CotacoesCadastro.Preencher Nome da Conta  ${arg1[1]}

Cadastrar endereço de Conta na tela de Cotação com
    [Arguments]  @{arg1}
    CotacoesCadastro.Selecionar Tipo de Conta com  ${arg1[0]}
    CotacoesCadastro.Verificar se o alerta não aparece
    CotacoesCadastro.Preencher Nome da Conta  ${arg1[1]}

Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com
    [Arguments]  @{arg1}
    #Arg4 Numero de Vida, Arg3 Tipo, Arg5 Data prevista
    # CotacoesCadastro.Preencher Data Prevista da Oportunidade  ${arg1[5]}
    ${t}  Run Keyword And Ignore Error  CotacoesCadastro.Selecionar a Tipo da Oportunidade  ${arg1[4]}
    Run Keyword If  '${t[0]}' == 'FAIL'  CotacoesCadastro.Selecionar a Tipo da Oportunidade  ${arg1[3]}
    CotacoesCadastro.Preencher Número de Vidas da Oportunidade  ${arg1[2]}

Cadastrar dados obrigatórios PJ de Oportunidades na tela de Cotação com
    [Arguments]  @{arg1}
    #Arg4 Numero de Vida, Arg3 Tipo, Arg5 Data prevista
    # CotacoesCadastro.Preencher Data Prevista da Oportunidade  ${arg1[5]}
    CotacoesCadastro.Selecionar a Tipo da Oportunidade  ${arg1[5]}
    CotacoesCadastro.Preencher Número de Vidas da Oportunidade  ${arg1[4]}

Clicar em Aprovar a Cotação
    CotacoesCadastro.Apertar em Aprovar Cotação

Clicar em Salvar a Cotação
    CotacoesCadastro.Apertar Botão Salvar Cotação

Clicar Sim na Modal de Confirmação
    CotacoesCadastro.Apresenta a modal de confirmação
    CotacoesCadastro.Apertar o Botão Sim da Modal de Confirmação

Apresentar a tela Cotação » com  
    [Arguments]  ${arg1}
    CotacoesDetalhes.Verificar Página Detalhes de Cotacao com  ${arg1}

# Apresentar a tela Cotação PJ » com  
#     [Arguments]  ${arg1}
#     CotacoesDetalhes.Verificar Página Detalhes de Cotacao Portabilidade(PJ) com  ${arg1}


Usuário clicar no menu "Criar Portabilidade"
    OportunidadesDetalhes.Clicar no submenu "Criar Portabilidade"

Clicar no botão "Salvar"
    PortabilidadeCadastro.Clicar no botão <Salvar> portabilidade

CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL
    PortabilidadeDetalhes.Apresentar a Tela Solicitação de Portabilidade » Solicitação

Clicou no botão "Criar" painel Pessoa(Portabilidade)
    PortabilidadeDetalhes.Clicou no botão <Criar> painel Pessoa(Portabilidade)

Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem) PF
    [Arguments]  @{arg1}
    PortabilidadeCadastro.Preencher o campo Pessoa com             ${arg1[1]}
    PortabilidadeCadastro.Selecionar o tipo Titular
    PortabilidadeCadastro.Preencher o campo Telefone Celular com   ${arg1[27]}
    PortabilidadeCadastro.Preencher Email com
    PortabilidadeCadastro.Preencher Nº Reg. Operadora Origem
    PortabilidadeCadastro.Preencher Nº Reg. Plano Origem


Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)
    [Arguments]  @{arg1}
    PortabilidadeCadastro.Preencher o campo Pessoa (PJ/CAEPF) com          ${arg1[1]}
    PortabilidadeCadastro.Selecionar o tipo Titular
    PortabilidadeCadastro.Preencher o campo Telefone Celular (PJ/CAEPF) com
    PortabilidadeCadastro.Preencher Email com
    PortabilidadeCadastro.Preencher Nº Reg. Operadora Origem
    PortabilidadeCadastro.Preencher Nº Reg. Plano Origem

Clicar em "Salvar" a Portabilidade
    PortabilidadeCadastro.Clicar em Salvar a Portabilidade

CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada
    [Arguments]  @{arg1}
    PortabilidadeDetalhes.Apresentar a Tela Solicitação de Portabilidade » Solicitação, com pessoa cadastrada  ${arg1}

Cadastrou uma Pessoa "Titular"
    PortabilidadeDetalhes.Cadastrou uma Pessoa TITULAR
    
Anexou um arquivo no painel documento
    PortabilidadeDetalhes.Clicou no botão <Criar> Documentos

Clicou menu "Encaminhar para Validação"
    PortabilidadeDetalhes.Clicar no submenu "Encaminhar para Validação"

Confirmou o encaminhamento
    PortabilidadeDetalhes.Confirmar o encaminhamento

Clicou no botão "Validar"
    PortabilidadeDetalhes.Clicar no botão "Validar"

Clicou no botão "Validar" segundo Beneficiario
    PortabilidadeDetalhes.Clicar no botão "Validar" segundo Beneficiario

Clicou na aba "Checklist da Documentação"
    PortabilidadeCadastro.Clicar na aba "Checklist da Documentação"

Selecionou a opção "Presente" e clicou no botão "Salvar"
    PortabilidadeCadastro.Selecionar a opção "Presente" e clicar no botão "Salvar"

Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    PortabilidadeDetalhes.Clicar no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"

Confirmou a solicitação
    PortabilidadeDetalhes.Confirmar a solicitação

Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    PortabilidadeDetalhes.Clicar no menu "Emitir Proposta de Adesão de Portabilidade"

Voltou para aba da "Portabilidade"
    PortabilidadeDetalhes.Voltar para a aba da "Portabilidade"

Clicou no menu "Encaminhar para Análise"
    PortabilidadeDetalhes.Clicar no menu "Encaminhar para Análise"

Confirmou a validação do documento
    PortabilidadeDetalhes.Confirmar a validação do documento

Clicou no botão "Analisar"
    PortabilidadeDetalhes.Clicar no botão "Analisar"

Clicou no botão "Analisar" segundo beneficiario
    PortabilidadeDetalhes.Clicar no botão "Analisar" segundo beneficiario

Clicou na aba "Questionário Elegibilidade"
    PortabilidadeDetalhes.Clicar na aba "Questionário Elegibilidade"

Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, NÃO, SIM
    PortabilidadeDetalhes.Preencher o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, NÃO, SIM

Clicou no botão "Salvar"
    PortabilidadeDetalhes.Clicar botão "Salvar"

Usuário clicar no menu "Finalizar Protocolo"
    PortabilidadeDetalhes.Usuário clicar no menu Finalizar Protocolo

Confirmar a finalização
    PortabilidadeDetalhes.Clicar Confirmar a finalização

CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA
    PortabilidadeDetalhes.O CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA

CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a NEGADA
    PortabilidadeDetalhes.O CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a NEGADA

Cadastrou uma Pessoa "Dependente"
    PortabilidadeCadastro.Cadastrar uma Pessoa "Dependente"

Cadastrou Pessoa "Titular"
    PortabilidadeCadastro.Cadastrar uma Pessoa "Titular"  
    
Clicou o botão "Validar em Massa"
    PortabilidadeDetalhes.Clicar no botão "Validar em Massa"

Selecinou as pessoas e clicou no botão "Validar"
    PortabilidadeDetalhes.Selecinar as pessoas e clicou no botão "Validar"

Clicou no menu "Realizar upload de Proposta de Adesão de Portabilidade"
    PortabilidadeDetalhes.Clicar no menu "Realizar upload de Proposta de Adesão de Portabilidade"

Anexou e gravou o upload
    PortabilidadeDetalhes.Anexar e gravar o upload

Clicou no botão "Analisar em Massa"
    PortabilidadeDetalhes.Clicar no botão "Analisar em Massa"

Selecionou as pessoas e clicou no botão "Analisar"
    PortabilidadeDetalhes.Selecionar as pessoas e clicou no botão "Analisar"

Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM
    PortabilidadeDetalhes.Preencher o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM

Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios (PORTABILIDADE)
    [Arguments]  @{arg1}
    Clicou na submenu <Contas> do <Comercial>
    Apresentar a Tela de Pesquisa Contas
    Apertar o Botão Criar do Contas
    Apresentar a Tela de Cadastro Contas
    Selecionar o tipo como  ${arg1[0]}
    Preencher os campos "Nome da conta" e "CNPJ/CPF/CAEPF"  ${arg1[0]}  ${arg1[1]}  ${arg1[2]}
    Clicar no botão <SALVAR>
    Apresentar a Tela de Detalhes do Conta com os dados  @{arg1}



Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios
    [Arguments]  @{arg1}
    Clicou na submenu <Contas> do <Comercial>
    Apresentar a Tela de Pesquisa Contas
    Apertar o Botão Criar do Contas
    Apresentar a Tela de Cadastro Contas
    Selecionar o tipo como  ${arg1[0]}
    Preencher os campos "Nome da conta" e "CNPJ/CPF/CAEPF"  ${arg1[0]}  ${arg1[1]}  ${arg1[2]}
    Clicar no botão <SALVAR>
    Apresentar a Tela de Detalhes do Conta com os dados  @{arg1}


Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios
    [Arguments]  @{arg1}
    Clicou na submenu <Contas> do <Comercial>
    Apresentar a Tela de Pesquisa Contas
    Apertar o Botão Criar do Contas
    Apresentar a Tela de Cadastro Contas
    Selecionar o tipo como  ${arg1[0]}
    Preencher os campos "Nome da conta" e "CNPJ/CPF/CAEPF"  @{arg1}
    Clicar no botão <SALVAR>
    Apresentar a Tela de Detalhes do Conta com os dados  @{arg1}


Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios (Mov Cadastral)
    [Arguments]  @{arg1}
    Clicou na submenu <Contas> do <Comercial>
    Apresentar a Tela de Pesquisa Contas
    Apertar o Botão Criar do Contas
    Apresentar a Tela de Cadastro Contas
    ContasCadastro.Colocar o Tipo no Cadastro Conta com  ${arg1[0]}
    ContasCadastro.Preencher Nome da Conta com           ${arg1[1]}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com          ${arg1[2]}
    ContasCadastro.Preencher Email com                   ${arg1[27]}
    ContasCadastro.Colocar o Tipo Telefone com           ${arg1[25]}
    ContasCadastro.Preencher Número Telefone com         ${arg1[26]}
    ContasCadastro.Colocar Classe Telefone com           ${arg1[26]}
    Clicar no botão <SALVAR>
    Apresentar a Tela de Detalhes do Conta com os dados  @{arg1}

Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)
    [Arguments]  @{arg1}
    Clicou na submenu <Contas> do <Comercial>
    Apresentar a Tela de Pesquisa Contas
    Apertar o Botão Criar do Contas
    Apresentar a Tela de Cadastro Contas
    ContasCadastro.Colocar o Tipo no Cadastro Conta com  ${arg1[0]}
    ContasCadastro.Preencher Nome da Conta com           ${arg1[1]}
    ContasCadastro.Preencher Razão Social com            ${arg1[1]}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com          ${arg1[2]}
    ContasCadastro.Preencher Email com                   ${arg1[27]}
    ContasCadastro.Colocar o Tipo Telefone com           ${arg1[25]}
    ContasCadastro.Preencher Número Telefone com         ${arg1[26]}
    ContasCadastro.Colocar Classe Telefone com           ${arg1[27]}
    Clicar no botão <SALVAR>
    Apresentar a Tela de Detalhes do Conta com os dados  @{arg1}


Cadastrou uma segunda Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)
    [Arguments]  @{arg1}
    Clicou na submenu <Contas> do <Comercial>
    Apresentar a Tela de Pesquisa Contas
    Apertar o Botão Criar do Contas
    Apresentar a Tela de Cadastro Contas
    ContasCadastro.Colocar o Tipo no Cadastro Conta com  ${arg1[30]}
    ContasCadastro.Preencher Nome da Conta com           ${arg1[32]}
    ContasCadastro.Preencher Razão Social com            ${arg1[32]}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com          ${arg1[31]}
    ContasCadastro.Preencher Email com                   ${arg1[36]}
    ContasCadastro.Colocar o Tipo Telefone com           ${arg1[25]}
    ContasCadastro.Preencher Número Telefone com         ${arg1[26]}
    ContasCadastro.Colocar Classe Telefone com           ${arg1[27]}
    Clicar no botão <SALVAR>
    Apresentar a Tela de Detalhes da segunda Conta com os dados   ${arg1[32]}


Cadastrou uma terceira Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)
    [Arguments]  @{arg1}
    Clicou na submenu <Contas> do <Comercial>
    Apresentar a Tela de Pesquisa Contas
    Apertar o Botão Criar do Contas
    Apresentar a Tela de Cadastro Contas
    ContasCadastro.Colocar o Tipo no Cadastro Conta com  ${arg1[69]}
    ContasCadastro.Preencher Nome da Conta com           ${arg1[71]}
    ContasCadastro.Preencher Razão Social com            ${arg1[71]}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com          ${arg1[70]}
    ContasCadastro.Preencher Email com                   ${arg1[75]}
    ContasCadastro.Colocar o Tipo Telefone com           ${arg1[24]}
    ContasCadastro.Preencher Número Telefone com         ${arg1[25]}
    ContasCadastro.Colocar Classe Telefone com           ${arg1[26]}
    Clicar no botão <SALVAR>
    Apresentar a Tela de Detalhes da segunda Conta com os dados   ${arg1[71]}


Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)
    [Arguments]  @{arg1}
    Clicou na submenu <Contas> do <Comercial>
    Apresentar a Tela de Pesquisa Contas
    Apertar o Botão Criar do Contas
    Apresentar a Tela de Cadastro Contas
    ContasCadastro.Colocar o Tipo no Cadastro Conta com  ${arg1[0]}
    ContasCadastro.Preencher Nome da Conta com           ${arg1[1]}
    ContasCadastro.Preencher Razão Social com            ${arg1[1]}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com          ${arg1[2]}
    ContasCadastro.Preencher CPF do Responsável com      ${arg1[12]}
    ContasCadastro.Preencher Email com                   ${arg1[27]}
    ContasCadastro.Colocar o Tipo Telefone com           ${arg1[25]}
    ContasCadastro.Preencher Número Telefone com         ${arg1[26]}
    ContasCadastro.Colocar Classe Telefone com           ${arg1[27]}
    Clicar no botão <SALVAR>
    Apresentar a Tela de Detalhes do Conta com os dados  @{arg1}


Cadastrou uma segunda Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)
    [Arguments]  @{arg1}
    Clicou na submenu <Contas> do <Comercial>
    Apresentar a Tela de Pesquisa Contas
    Apertar o Botão Criar do Contas
    Apresentar a Tela de Cadastro Contas
    ContasCadastro.Colocar o Tipo no Cadastro Conta com  ${arg1[30]}
    ContasCadastro.Preencher Nome da Conta com           ${arg1[32]}
    ContasCadastro.Preencher Razão Social com            ${arg1[32]}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com          ${arg1[31]}
    ContasCadastro.Preencher CPF do Responsável com      ${arg1[12]}
    ContasCadastro.Preencher Email com                   ${arg1[36]}
    ContasCadastro.Colocar o Tipo Telefone com           ${arg1[25]}
    ContasCadastro.Preencher Número Telefone com         ${arg1[26]}
    ContasCadastro.Colocar Classe Telefone com           ${arg1[27]}
    Clicar no botão <SALVAR>
    Apresentar a Tela de Detalhes da segunda Conta com os dados  ${arg1[32]}


Cadastrou uma terceira Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)
    [Arguments]  @{arg1}
    Clicou na submenu <Contas> do <Comercial>
    Apresentar a Tela de Pesquisa Contas
    Apertar o Botão Criar do Contas
    Apresentar a Tela de Cadastro Contas
    ContasCadastro.Colocar o Tipo no Cadastro Conta com  ${arg1[69]}
    ContasCadastro.Preencher Nome da Conta com           ${arg1[71]}
    ContasCadastro.Preencher Razão Social com            ${arg1[71]}
    ContasCadastro.Preencher CNPJ/CPF/CAEPF com          ${arg1[70]}
    ContasCadastro.Preencher CPF do Responsável com      ${arg1[11]}
    ContasCadastro.Preencher Email com                   ${arg1[75]}
    ContasCadastro.Colocar o Tipo Telefone com           ${arg1[24]}
    ContasCadastro.Preencher Número Telefone com         ${arg1[25]}
    ContasCadastro.Colocar Classe Telefone com           ${arg1[26]}
    Clicar no botão <SALVAR>
    Apresentar a Tela de Detalhes da segunda Conta com os dados  ${arg1[71]}


Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)
    [Arguments]  @{arg1}
    Clicou na submenu <Contas> do <Comercial>
    Apresentar a Tela de Pesquisa Contas
    Apertar o Botão Criar do Contas
    Apresentar a Tela de Cadastro Contas
    Selecionar o tipo como  ${arg1[0]}
    Preencher os campos "Nome da conta" e "CNPJ/CPF/CAEPF" (Beneficiario)  @{arg1}
    Clicar no botão <SALVAR>
    Apresentar a Tela de Detalhes do Conta com os dados  @{arg1}


Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Beneficiário)
    [Arguments]  @{arg1}
    Clicou na submenu <Contas> do <Comercial>
    Apresentar a Tela de Pesquisa Contas
    Apertar o Botão Criar do Contas
    Apresentar a Tela de Cadastro Contas
    Selecionar o tipo como  ${arg1[0]}
    Preencher os campos "Nome da conta" e "CNPJ/CPF/CAEPF" (Beneficiario)  @{arg1}
    Clicar no botão <SALVAR>
    Apresentar a Tela de Detalhes do Conta com os dados  @{arg1}


Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios
    [Arguments]  @{arg1}
    Clicou na submenu <Contas> do <Comercial>
    Apresentar a Tela de Pesquisa Contas
    Apertar o Botão Criar do Contas
    Apresentar a Tela de Cadastro Contas
    Selecionar o tipo como  ${arg1[0]}
    Preencher os campos "Nome da conta" e "CNPJ/CPF/CAEPF"  @{arg1}
    Clicar no botão <SALVAR>
    Apresentar a Tela de Detalhes do Conta com os dados  @{arg1}


Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado
    [Arguments]  @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[3]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[4]}
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[1]}


Cadastrou uma Oportunidade PF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado
    [Arguments]  @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[3]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[4]}
    # OportunidadesCadastro.Preencher Origem do Potencial
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[1]}


Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado
    [Arguments]  @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos PJ  ${arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[4]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[5]}
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[2]}

Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado (Portabilidade)
    [Arguments]  @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos PJ  @{arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[4]}
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[2]}

Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado
    [Arguments]  @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos PJ  @{arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[4]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[5]}
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[2]}

Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado (Portabilidade)
    [Arguments]  @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos PJ  @{arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[4]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[5]}
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[2]}

Cadastrou uma Cotação
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Debug
    IF   $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}

Cadastrou uma Cotação PJ
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[9]}
    IF    $arg1[7] == ''
        Selecionar um Produto Assistencial Empresarial do Potencial PF com  ${arg1[8]}
    ELSE
        Selecionar um Produto Assistencial Empresarial do Potencial PF com  ${arg1[7]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[4]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}

Cadastrou uma Cotação CAEPF
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial Empresarial do Potencial PF com  ${arg1[7]}
        
    ELSE
        Selecionar um Produto Assistencial Empresarial do Potencial PF com  ${arg1[6]}
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[2]}


Cadastrou uma Cotação (CAEPF)
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial Empresarial do Potencial PF com  ${arg1[7]}
        
    ELSE
        Selecionar um Produto Assistencial Empresarial do Potencial PF com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}

Cadastrou uma Cotação (CAEPF) Portabilidade
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[9]}
    IF    $arg1[7] == ''
        Selecionar um Produto Assistencial Empresarial do Potencial PF com  ${arg1[8]}
    ELSE
        Selecionar um Produto Assistencial Empresarial do Potencial PF com  ${arg1[7]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[4]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[2]}

Preencheu o titulo da cotação
    [Arguments]  @{arg1}
    CotacoesCadastro.Preencher o titulo da cotação  ${arg1}


Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios
    [Arguments]  @{arg1}
    Clicou na submenu <Potencial Cliente> do <Comercial>  
    Apresentar a Tela de Pesquisa Potencial Cliente
    Apertar o Botão Criar do Pontecial Cliente
    Apresentar a Tela de Cadastro Pontecial Cliente
    Selecionar o Tipo Pessoa como Pessoa Física
    PotencialClienteCadastro.Preencher Nome/Fantasia com   ${arg1[1]}
    PotencialClienteCadastro.Preencher Nome com  ${arg1[1]}
    PotencialClienteCadastro.Preencher CPF/CNPJ/CAEPF com  ${arg1[2]}
    PotencialClienteCadastro.Preencher Número de Vidas com  ${arg1[3]}
    Clicar no botão Salvar Potencial Cliente
    Apresentar a modal com a mensagem Nenhum endereço foi cadastrado, deseja cadastrar um novo endereço?
    Clicar no Botão Não do Modal
    Apresentar a Tela Potencial Cliente » NOME  ${arg1[1]}


Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios
    [Arguments]  @{arg1}
    Clicou na submenu <Potencial Cliente> do <Comercial>  
    Apresentar a Tela de Pesquisa Potencial Cliente
    Apertar o Botão Criar do Pontecial Cliente
    Apresentar a Tela de Cadastro Pontecial Cliente
    Selecionar o Tipo Pessoa como Pessoa Júridica (CNPJ)
    Preencher os campos "Nome da conta" e "Nome" com  @{arg1}
    PotencialClienteCadastro.Preencher CPF/CNPJ/CAEPF com  ${arg1[3]}
    PotencialClienteCadastro.Preencher Número de Vidas com  ${arg1[4]}
    PotencialClienteCadastro.Preencher Razão Social com  ${arg1[1]}
    Clicar no botão Salvar Potencial Cliente
    Apresentar a modal com a mensagem Nenhum endereço foi cadastrado, deseja cadastrar um novo endereço?
    Clicar no Botão Não do Modal
    Apresentar a Tela Potencial Cliente » NOME  ${arg1[1]}


Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios (DEC DE SAUDE)
    [Arguments]  @{arg1}
    Clicou na submenu <Potencial Cliente> do <Comercial>  
    Apresentar a Tela de Pesquisa Potencial Cliente
    Apertar o Botão Criar do Pontecial Cliente
    Apresentar a Tela de Cadastro Pontecial Cliente
    Selecionar o Tipo Pessoa como Pessoa Júridica (CNPJ)
    PotencialClienteCadastro.Preencher Nome/Fantasia com   ${arg1[1]}
    PotencialClienteCadastro.Preencher Nome com  ${arg1[1]}
    PotencialClienteCadastro.Preencher CPF/CNPJ/CAEPF com  ${arg1[2]}
    PotencialClienteCadastro.Preencher Número de Vidas com  ${arg1[3]}
    PotencialClienteCadastro.Preencher Razão Social com  ${arg1[1]}
    Clicar no botão Salvar Potencial Cliente
    Apresentar a modal com a mensagem Nenhum endereço foi cadastrado, deseja cadastrar um novo endereço?
    Clicar no Botão Não do Modal
    Apresentar a Tela Potencial Cliente » NOME  ${arg1[1]}


Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios
    [Arguments]  @{arg1}
    Clicou na submenu <Potencial Cliente> do <Comercial>  
    Apresentar a Tela de Pesquisa Potencial Cliente
    Apertar o Botão Criar do Pontecial Cliente
    Apresentar a Tela de Cadastro Pontecial Cliente
    Selecionar o Tipo Pessoa como Pessoa Júridica (CAEPF)
    Preencher os campos "Nome da conta" e "Nome" com  @{arg1}
    PotencialClienteCadastro.Preencher CPF/CNPJ/CAEPF com  ${arg1[3]}
    PotencialClienteCadastro.Preencher Número de Vidas com  ${arg1[4]}
    PotencialClienteCadastro.Preencher Razão Social com  ${arg1[1]}
    Clicar no botão Salvar Potencial Cliente
    Apresentar a modal com a mensagem Nenhum endereço foi cadastrado, deseja cadastrar um novo endereço?
    Clicar no Botão Não do Modal
    Apresentar a Tela Potencial Cliente » NOME  ${arg1[1]}


Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (DEC DE SAUDE)
    [Arguments]  @{arg1}
    Clicou na submenu <Potencial Cliente> do <Comercial>  
    Apresentar a Tela de Pesquisa Potencial Cliente
    Apertar o Botão Criar do Pontecial Cliente
    Apresentar a Tela de Cadastro Pontecial Cliente
    Selecionar o Tipo Pessoa como Pessoa Júridica (CAEPF)
    PotencialClienteCadastro.Preencher Nome/Fantasia com   ${arg1[1]}
    PotencialClienteCadastro.Preencher Nome com  ${arg1[1]}
    PotencialClienteCadastro.Preencher CPF/CNPJ/CAEPF com  ${arg1[2]}
    PotencialClienteCadastro.Preencher Número de Vidas com  ${arg1[3]}
    PotencialClienteCadastro.Preencher Razão Social com  ${arg1[1]}
    Clicar no botão Salvar Potencial Cliente
    Apresentar a modal com a mensagem Nenhum endereço foi cadastrado, deseja cadastrar um novo endereço?
    Clicar no Botão Não do Modal
    Apresentar a Tela Potencial Cliente » NOME  ${arg1[1]}


Clicou no menu "Solicitar Reserva de Mercado"
    Sleep  5s
    Apertar no DropMenu do Botão Editar e Selecionar Solicitar Reserva de Mercado
    Apresentar a Mensagem de Sucesso com o Código de Reserva de Mercado e Conta do Cliente


Clicou no link "Nome da Conta"
    PotencialClienteDetalhes.Clicar no link "Nome da Conta"
    Switch Window  NEW

Cadastrou uma Conta PJ, Oportunidade e Cotação
    [Arguments]  @{arg1}
    Apresentar a Tela de Pesquisa Cotações
    Apertar o Botão Criar do Cotações
    Apresentar a Tela de Cadastro de Cotação
    Preencheu o titulo da cotação  ${arg1[1]}
    Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{arg1}
    Cadastrar dados obrigatórios PJ de Oportunidades na tela de Cotação com  @{arg1}
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    IF    $arg1[6] == ''
        ### nova validação dos dadas das massas
        Selecionar um Produto Assistencial do Potencial PJ com  ${arg1[7]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PJ com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[4]}
    Remover Acessórios do Produto Assistencial
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Conta PF, Oportunidade e Cotação (Contrato)
    [Arguments]  @{arg1}
    Apresentar a Tela de Pesquisa Cotações
    Apertar o Botão Criar do Cotações
    Apresentar a Tela de Cadastro de Cotação
    Preencheu o titulo da cotação  ${arg1[1]}
    Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{arg1}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[20]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[22]}
    CotacoesCadastro.Preencher Data Prevista da Oportunidade  ${arg1[5]}
    CotacoesCadastro.Selecionar a Tipo da Oportunidade  ${arg1[4]}
    CotacoesCadastro.Preencher Número de Vidas da Oportunidade  ${arg1[3]}
    Editar campo "Fase da Cotação" igual a  ${arg1[7]}
    Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Remover Acessórios do Produto Assistencial
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Conta PJ, Oportunidade e Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL
    [Arguments]  @{arg1}
    Apresentar a Tela de Pesquisa Cotações
    Apertar o Botão Criar do Cotações
    Apresentar a Tela de Cadastro de Cotação
    Preencheu o titulo da cotação  ${arg1[1]}
    Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{arg1}
    CotacoesCadastro.Preencher Data Prevista da Oportunidade  ${arg1[6]}
    CotacoesCadastro.Selecionar a Tipo da Oportunidade  ${arg1[5]}
    CotacoesCadastro.Preencher Número de Vidas da Oportunidade  ${arg1[4]}
    CotacoesCadastro.Preencher o tipo de Negociação com "Coletivo Empresarial"
    Editar campo "Fase da Cotação" igual a  ${arg1[9]}
    IF    $arg1[7] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[8]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[4]}
    Remover Acessórios do Produto Assistencial
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Conta CAEPF, Oportunidade e Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL
    [Arguments]  @{arg1}
    Apresentar a Tela de Pesquisa Cotações
    Apertar o Botão Criar do Cotações
    Apresentar a Tela de Cadastro de Cotação
    Preencheu o titulo da cotação  ${arg1[1]}
    Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{arg1}
    CotacoesCadastro.Preencher Data Prevista da Oportunidade  ${arg1[6]}
    CotacoesCadastro.Selecionar a Tipo da Oportunidade  ${arg1[5]}
    CotacoesCadastro.Preencher Número de Vidas da Oportunidade  ${arg1[4]}
    CotacoesCadastro.Preencher o tipo de Negociação com "Coletivo Empresarial"
    Editar campo "Fase da Cotação" igual a  ${arg1[9]}
    IF    $arg1[7] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[8]}

    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[4]}
    Remover Acessórios do Produto Assistencial
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Conta CAEPF, Oportunidade e Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO
    [Arguments]  @{arg1}
    Apresentar a Tela de Pesquisa Cotações
    Apertar o Botão Criar do Cotações
    Apresentar a Tela de Cadastro de Cotação
    Preencheu o titulo da cotação  ${arg1[1]}
    Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{arg1}
    CotacoesCadastro.Preencher Data Prevista da Oportunidade  ${arg1[6]}
    CotacoesCadastro.Selecionar a Tipo da Oportunidade  ${arg1[5]}
    CotacoesCadastro.Preencher Número de Vidas da Oportunidade  ${arg1[4]}
    CotacoesCadastro.Preencher o tipo de Negociação com "Coletivo por Adesão"
    Editar campo "Fase da Cotação" igual a  ${arg1[9]}
    IF    $arg1[7] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[8]}

    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[4]}
    Remover Acessórios do Produto Assistencial
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Conta PJ, Oportunidade e Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO
    [Arguments]  @{arg1}
    Apresentar a Tela de Pesquisa Cotações
    Apertar o Botão Criar do Cotações
    Apresentar a Tela de Cadastro de Cotação
    Preencheu o titulo da cotação  ${arg1[1]}
    Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{arg1}
    CotacoesCadastro.Preencher Data Prevista da Oportunidade  ${arg1[6]}
    CotacoesCadastro.Selecionar a Tipo da Oportunidade  ${arg1[5]}
    CotacoesCadastro.Preencher Número de Vidas da Oportunidade  ${arg1[4]}
    CotacoesCadastro.Preencher o tipo de Negociação com "Coletivo por Adesão"
    Editar campo "Fase da Cotação" igual a  ${arg1[9]}
    IF    $arg1[7] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[8]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[4]}
    Remover Acessórios do Produto Assistencial
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Conta PF, Oportunidade e Cotação
    [Arguments]  @{arg1}
    Apresentar a Tela de Pesquisa Cotações
    Apertar o Botão Criar do Cotações
    Apresentar a Tela de Cadastro de Cotação
    Preencheu o titulo da cotação  ${arg1[1]}
    Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{arg1}
    CotacoesCadastro.Preencher Data Prevista da Oportunidade  ${arg1[5]}
    CotacoesCadastro.Selecionar a Tipo da Oportunidade  ${arg1[4]}
    CotacoesCadastro.Preencher Número de Vidas da Oportunidade  ${arg1[3]}
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}

    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Remover Acessórios do Produto Assistencial
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Conta CAEPF, Oportunidade e Cotação
    [Arguments]  @{arg1}
    Apresentar a Tela de Pesquisa Cotações
    Apertar o Botão Criar do Cotações
    Apresentar a Tela de Cadastro de Cotação
    Preencheu o titulo da cotação  ${arg1[1]}
    Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{arg1}
    Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  @{arg1}
    Editar campo "Fase da Cotação" igual a  ${arg1[7]}
    IF    $arg1[5] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[5]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[2]}
    Remover Acessórios do Produto Assistencial
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou um Contrato, preenchendo campos obrigatórios
    [Arguments]  @{arg1}
    CotacoesDetalhes.Verificar "Titulo Contrato" na tela Cotações  ${arg1[1]}
    Sleep  10s
    ContratosCadastro.Verificar Tela de Cadastro Contratos
    ContratosCadastro.Verificar se o campo Titulo contrato está preenchido com    ${arg1[1]}
    ContratosCadastro.Verificar se o campo Conta contrato está preenchido com    ${arg1[1]}
    ContratosCadastro.Preencher o campo Data de Vigencia    ${arg1[9]}
    ContratosCadastro.Preencher o campo Codigo Agrupador    ${arg1[3]}
    ContratosCadastro.Preencher o campo Dia de Vencimento   ${arg1[10]}
    ContratosCadastro.Colocar Forma de Cobrança com    ${arg1[11]}
    ContratosCadastro.Clicar em Salvar Contrato
    ContratosCadastro.Apresentar a Modal de Preencher Endereço residencial
    ContratosDetalhes.Apresentar a tela Contratos » com  ${arg1[1]}


Cadastrou um segundo Contrato, preenchendo campos obrigatórios
    [Arguments]  @{arg1}
    CotacoesDetalhes.Verificar "Titulo Contrato" na tela Cotações  ${arg1[1]}
    ContratosCadastro.Verificar Tela de Cadastro Contratos
    ContratosCadastro.Verificar se o campo Titulo contrato está preenchido com    ${arg1[31]}
    ContratosCadastro.Verificar se o campo Conta contrato está preenchido com    ${arg1[31]}
    ContratosCadastro.Preencher o campo Data de Vigencia    ${arg1[8]}
    ContratosCadastro.Preencher o campo Codigo Agrupador    ${arg1[3]}
    ContratosCadastro.Preencher o campo Dia de Vencimento   ${arg1[9]}
    ContratosCadastro.Colocar Forma de Cobrança com    ${arg1[10]}
    ContratosCadastro.Clicar em Salvar Contrato
    ContratosCadastro.Apresentar a Modal de Preencher Endereço residencial
    ContratosDetalhes.Apresentar a tela Contratos » com  ${arg1[31]}


Cadastrou um terceiro Contrato, preenchendo campos obrigatórios
    [Arguments]  @{arg1}
    CotacoesDetalhes.Verificar "Titulo Contrato" na tela Cotações  ${arg1[1]}
    ContratosCadastro.Verificar Tela de Cadastro Contratos
    ContratosCadastro.Verificar se o campo Titulo contrato está preenchido com    ${arg1[71]}
    ContratosCadastro.Verificar se o campo Conta contrato está preenchido com    ${arg1[71]}
    ContratosCadastro.Preencher o campo Data de Vigencia    ${arg1[8]}
    ContratosCadastro.Preencher o campo Codigo Agrupador    ${arg1[3]}
    ContratosCadastro.Preencher o campo Dia de Vencimento   ${arg1[9]}
    ContratosCadastro.Colocar Forma de Cobrança com    ${arg1[10]}
    ContratosCadastro.Clicar em Salvar Contrato
    ContratosCadastro.Apresentar a Modal de Preencher Endereço residencial
    ContratosDetalhes.Apresentar a tela Contratos » com  ${arg1[71]}


Cadastrou um Contrato, preenchendo campos obrigatórios (PF)
    [Arguments]  @{arg1}
    CotacoesDetalhes.Verificar "Titulo Contrato" na tela Cotações  ${arg1[1]}
    ContratosCadastro.Verificar Tela de Cadastro Contratos
    ContratosCadastro.Verificar se o campo Titulo contrato está preenchido com    ${arg1[1]}
    ContratosCadastro.Verificar se o campo Conta contrato está preenchido com    ${arg1[1]}
    ContratosCadastro.Preencher o campo Data de Vigencia    ${arg1[8]}
    ContratosCadastro.Preencher o campo Codigo Agrupador    ${arg1[3]}
    ContratosCadastro.Colocar Forma de Cobrança com    ${arg1[10]}
    ContratosCadastro.Clicar em Salvar Contrato
    ContratosCadastro.Apresentar a Modal de Preencher Endereço residencial
    ContratosDetalhes.Apresentar a tela Contratos » com  ${arg1[1]}


Cadastrou um Contrato, preenchendo campos obrigatórios – Integração automática (Sim)
    [Arguments]  @{arg1}
    CotacoesDetalhes.Clicar no submenu "Criar Contrato"
    ContratosCadastro.Verificar Tela de Cadastro Contratos
    ContratosCadastro.Verificar se o campo Titulo contrato está preenchido com    ${arg1[1]}
    ContratosCadastro.Verificar se o campo Conta contrato está preenchido com    ${arg1[1]}
    ContratosCadastro.Preencher o campo Data de Vigencia    ${arg1[8]}
    ContratosCadastro.Preencher o campo Codigo Agrupador    ${arg1[3]}
    ContratosCadastro.Preencher o campo Dia de Vencimento   ${arg1[9]}
    ContratosCadastro.Colocar Forma de Cobrança com    ${arg1[10]}
    ContratosCadastro.Movimentação de Exclusão – Integração automática (Ativa)
    ContratosCadastro.Clicar em Salvar Contrato
    ContratosCadastro.Apresentar a Modal de Preencher Endereço residencial
    ContratosDetalhes.Apresentar a tela Contratos » com  ${arg1[1]}


Cadastrou um Contrato PJ, preenchendo campos obrigatórios
    [Arguments]  @{arg1}
    CotacoesDetalhes.Clicar no submenu "Criar Contrato"
    ContratosCadastro.Verificar Tela de Cadastro Contratos
    ContratosCadastro.Verificar se o campo Titulo contrato está preenchido com    ${arg1[2]}
    ContratosCadastro.Verificar se o campo Conta contrato está preenchido com    ${arg1[2]}
    ContratosCadastro.Preencher o campo Data de Vigencia    ${arg1[10]}
    ContratosCadastro.Preencher o campo Codigo Agrupador    ${arg1[4]}
    ContratosCadastro.Preencher o campo Dia de Vencimento   ${arg1[11]}
    ContratosCadastro.Colocar Forma de Cobrança com    ${arg1[12]}
    ContratosCadastro.Clicar em Salvar Contrato
    ContratosCadastro.Apresentar a Modal de Preencher Endereço comercial
    ContratosDetalhes.Apresentar a tela Contratos » com  ${arg1[2]}


Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)
    [Arguments]  @{arg1}
    CotacoesDetalhes.Verificar "Titulo Contrato" na tela Cotações  ${arg1[1]}
    ContratosCadastro.Verificar Tela de Cadastro Contratos
    ContratosCadastro.Verificar se o campo Titulo contrato está preenchido com    ${arg1[1]}
    ContratosCadastro.Verificar se o campo Conta contrato está preenchido com    ${arg1[1]}
    ContratosCadastro.Preencher o campo Data de Vigencia    ${arg1[8]}
    ContratosCadastro.Preencher o campo Codigo Agrupador    ${arg1[3]}
    ContratosCadastro.Preencher o campo Dia de Vencimento   ${arg1[9]}
    ContratosCadastro.Colocar Forma de Cobrança com    ${arg1[10]}
    ContratosCadastro.Clicar em Salvar Contrato
    ContratosCadastro.Apresentar a Modal de Preencher Endereço comercial
    ContratosDetalhes.Apresentar a tela Contratos » com  ${arg1[1]}


Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios
    [Arguments]  @{arg1}
    CotacoesDetalhes.Clicar no submenu "Criar Contrato"
    ContratosCadastro.Verificar Tela de Cadastro Contratos
    ContratosCadastro.Verificar se o campo Titulo contrato está preenchido com    ${arg1[2]}
    ContratosCadastro.Verificar se o campo Conta contrato está preenchido com    ${arg1[2]}
    ContratosCadastro.Preencher o campo Data de Vigencia    ${arg1[10]}
    ContratosCadastro.Preencher o campo Dia de Vencimento   ${arg1[11]}
    ContratosCadastro.Colocar Forma de Cobrança com    ${arg1[12]}
    ContratosCadastro.Clicar em Salvar Contrato
    #ContratosCadastro.Apresentar a Modal de Preencher Endereço comercial
    #Clicar no Botão Não do Modal
    ContratosDetalhes.Apresentar a tela Contratos » com  ${arg1[2]}


Usuário clicar no botão "Criar" do painel Beneficiários
    ContratosDetalhes.Usuário clicou no botão "Criar" do painel Beneficiários

CRM deve apresentar a tela Beneficiário » Criar
    ContratosDetalhes.CRM deve apresentar tela Beneficiário » Criar

Preencher os campos obrigatórios (Beneficiários)
    [Arguments]  @{arg1}
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[2]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[11]}
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[13]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}


Preencher os campos obrigatórios (Beneficiários - Titular)
    [Arguments]  @{arg1}
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[13]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[2]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[12]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}


Preencher os campos obrigatórios (Beneficiários PJ - Titular)
    [Arguments]  @{arg1}
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[15]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[13]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[31]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[14]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa    ${arg1[29]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[19]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[20]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[21]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[22]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[23]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[24]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[25]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[26]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[27]}

Preencher os campos obrigatórios (Beneficiários PJ - Segundo Titular)
    [Arguments]  @{arg1}
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[40]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[41]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[42]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[45]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa    ${arg1[29]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[46]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[19]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[43]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[21]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[22]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[23]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[24]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[25]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[26]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[27]}


Preencher os campos obrigatórios (Beneficiários CAEPF - Titular)
    [Arguments]  @{arg1}
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[14]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[12]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[13]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa    ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[16]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[17]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[18]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[19]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[21]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[23]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[24]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[25]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[26]}


Preencher os campos obrigatórios (Beneficiários CAEPF - Segundo Titular)
    [Arguments]  @{arg1}
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[39]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[40]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[41]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[44]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa    ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[45]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[17]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[18]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[42]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[21]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[23]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[24]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[25]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[26]}


Preencher os campos obrigatórios (Beneficiários - Dependente)
    [Arguments]  @{arg1}
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[26]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[27]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[12]}  
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[14]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[29]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Carregar endereço do Titular
    # BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[20]}
    # BeneficiariosCadastro.Preencher o campo CEP    ${arg1[21]}
    # BeneficiariosCadastro.Preencher o campo Numero    ${arg1[22]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}


Preencher os campos obrigatórios (Beneficiários PJ - Dependente)
    [Arguments]  @{arg1}
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[30]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[31]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[32]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[35]}  
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[34]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[19]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[33]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[21]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[22]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[23]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[24]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[25]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[26]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[27]}


Preencher os campos obrigatórios (Beneficiários PJ - Segundo Dependente)
    [Arguments]  @{arg1}
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[40]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[41]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[42]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[45]}  
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[44]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[46]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[19]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[43]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[21]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[22]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[23]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[24]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[25]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[26]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[27]}


Preencher os campos obrigatórios (Beneficiários CAEPF - Dependente)
    [Arguments]  @{arg1}
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[30]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[31]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[32]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[35]}  
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[34]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[19]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[33]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[21]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[22]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[23]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[24]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[25]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[26]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[27]}

Salvar o Beneficiário desejando incluir dependentes
    [Arguments]  @{arg1}
    BeneficiariosCadastro.Clicar em Salvar Beneficiários
    BeneficiariosCadastro.Validar mensagem Salvar Beneficiarios
    BeneficiariosCadastro.Nome diferente do sistema DATASUS
    BeneficiariosCadastro.Salvar Beneficiário desejando incluir dependentes

Salvar o Beneficiário desejando incluir Novo Titular
    [Arguments]  @{arg1}
    BeneficiariosCadastro.Clicar em Salvar Beneficiários
    BeneficiariosCadastro.Validar mensagem Salvar Beneficiarios
    BeneficiariosCadastro.Nome diferente do sistema DATASUS
    BeneficiariosCadastro.Salvar Beneficiário desejando incluir novo titular

Salvar o Beneficiário não desejando incluir dependentes
    [Arguments]  @{arg1}
    BeneficiariosCadastro.Clicar em Salvar Beneficiários
    BeneficiariosCadastro.Validar mensagem Salvar Beneficiarios
    BeneficiariosCadastro.Nome diferente do sistema DATASUS
    BeneficiariosCadastro.Salvar Beneficiário não desejando incluir dependentes

CRM deve apresentar a tela Contrato » TITULO, com Beneficiário incluido
    [Arguments]  @{arg1}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário incluido    ${arg1[1]}

CRM deve apresentar a tela Contrato » TITULO PJ, com Beneficiário incluido
    [Arguments]  @{arg1}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário incluido    ${arg1[2]}

CRM deve apresentar a tela Contrato » TITULO, com Beneficiário Titular e Dependente incluido
    [Arguments]  @{arg1}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[1]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Titular    ${arg1[1]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Dependente    ${arg1[27]}

CRM deve apresentar a tela Contrato » TITULO PJ, com Beneficiário Titular e Dependente incluido
    [Arguments]  @{arg1}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[2]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Titular   @{arg1}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Dependente    ${arg1[31]}

CRM deve apresentar a tela Contrato » TITULO CAEPF, com Beneficiário Titular e Dependente incluido
    [Arguments]  @{arg1}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[2]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Titular   ${arg1[1]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Dependente    ${arg1[31]}

CRM deve apresentar a tela Contrato » TITULO PJ, com Beneficiário Titular e Dependentes incluidos
    [Arguments]  @{arg1}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[2]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Titular   ${arg1[1]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Dependente    ${arg1[31]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Dependente    ${arg1[41]}

CRM deve apresentar a tela Contrato » TITULO CAEPF, com Beneficiário Titular e Dependentes incluidos
    [Arguments]  @{arg1}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[2]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Titular   ${arg1[1]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Dependente    ${arg1[31]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Dependente    ${arg1[41]}
    

Acessar menu IMPORTAR BENEFICIÁRIOS
    ContratosDetalhes.Acessando o menu IMPORTAR BENEFICIÁRIOS

Selecionar, validar e confirmar arquivo
    [Arguments]  @{arg1}
    ContratosDetalhes.Selecionando, validando e confirmando o arquivo    @{arg1}

Selecionar, validar e confirmar arquivo (Beneficiário PJ)
    [Arguments]  @{arg1}
    ContratosDetalhes.Selecionando, validando e confirmando o arquivo (Beneficiário PJ)    @{arg1}

Selecionar, validar e confirmar arquivo (Beneficiário CAEPF)
    [Arguments]  @{arg1}
    ContratosDetalhes.Selecionando, validando e confirmando o arquivo (Beneficiário CAEPF)    @{arg1}

Selecionar, validar e confirmar arquivo (Movimentação cadastral - 10 Vidas)
    [Arguments]  @{arg1}
    ContratosDetalhes.Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 10 Vidas)    @{arg1}

Selecionar, validar e confirmar arquivo (Movimentação cadastral - 6 Vidas)
    [Arguments]  @{arg1}
    ContratosDetalhes.Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 6 Vidas)    @{arg1}

Selecionar, validar e confirmar arquivo (Movimentação cadastral - 4 Vidas)
    [Arguments]  @{arg1}
    ContratosDetalhes.Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 4 Vidas)    @{arg1}

Selecionar, validar e confirmar arquivo (Movimentação cadastral - 4 Vidas - Segundo Contrato)
    [Arguments]  @{arg1}
    ContratosDetalhes.Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 4 Vidas - Segundo Contrato)    @{arg1}

Selecionar, validar e confirmar arquivo (Movimentação cadastral - 2 Vidas)
    [Arguments]  @{arg1}
    ContratosDetalhes.Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 2 Vidas)    @{arg1}

Selecionar, validar e confirmar arquivo (Movimentação cadastral - 2 Vidas - teste)
    [Arguments]  @{arg1}
    ContratosDetalhes.Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 2 Vidas - Teste)    @{arg1}


Selecionar, validar e confirmar arquivo (Movimentação cadastral - 2 Vidas - Tranf Grupo Familiar)
    [Arguments]  @{arg1}
    ContratosDetalhes.Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 2 Vidas - Tranf Grupo Familiar)    @{arg1}


Clicar no link "Nome Contrato"
    [Arguments]  @{arg1}
    ContratosDetalhes.Clicando no link "Nome Contrato"    ${arg1[1]}


Clicar no link "Nome Contrato" do segundo contrato
    [Arguments]  @{arg1}
    ContratosDetalhes.Clicando no link "Nome Contrato"    ${arg1}


Clicar no link "Nome Contrato PJ"
    [Arguments]  @{arg1}
    ContratosDetalhes.Clicando no link "Nome Contrato"    ${arg1[2]}

Clicar no link "Nome Contrato CAEPF"
    [Arguments]  @{arg1}
    ContratosDetalhes.Clicando no link "Nome Contrato"    ${arg1[2]}

CRM deve apresentar a tela Contrato » TITULO, com Beneficiários importados
    [Arguments]  @{arg1}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[1]}
    ContratosDetalhes.CRM deve apresentando a tela Contrato » TITULO, com Beneficiários importados    ${arg1[1]}

CRM deve apresentar a tela Contrato » TITULO, com Beneficiários PJ importados
    [Arguments]  @{arg1}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[2]}
    ContratosDetalhes.CRM deve apresentando a tela Contrato » TITULO, com Beneficiários importados    ${arg1[1]}

CRM deve apresentar a tela Contrato » TITULO, com Beneficiários CAEPF importados
    [Arguments]  @{arg1}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[2]}
    ContratosDetalhes.CRM deve apresentando a tela Contrato » TITULO, com Beneficiários importados    ${arg1[1]}


Cadastrou uma Pessoa
    [Arguments]  @{arg1}
    PortabilidadeCadastro.Cadastrar uma Pessoa    ${arg1[26]}

Aprovou a Portabilidade
    Anexou um arquivo no painel documento
    Clicou Menu "Encaminhar para Validação"
    Confirmou o encaminhamento
    Clicou no botão "Validar"
    Clicou na aba "Checklist da Documentação"
    Selecionou a opção "Presente" e clicou no botão "Salvar"
    Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    Confirmou a solicitação
    Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    Voltou para aba da "Portabilidade"
    Clicou no menu "Encaminhar para Análise"
    Confirmou a validação do documento
    Clicou no botão "Analisar"
    Clicou na aba "Questionário Elegibilidade"
    Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, NÃO, SIM
    Clicou no botão "Salvar"
    Usuário clicar no menu "Finalizar Protocolo"
    Confirmar a finalização
    CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA


Clicou no link "Nome Oportunidade" na tela Cotações
    [Arguments]  ${arg1}
    CotacoesDetalhes.Clicar no link "Nome Oportunidade" na tela Cotações    ${arg1}

Clicou no registro da Cotação
    [Arguments]  ${arg1}
    OportunidadesDetalhes.Clicar no registro da Cotação    ${arg1}

Usuário selecionar o beneficiário no campo "Pessoa da Portabilidade"
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Usuário selecionar beneficiário no campo "Pessoa da Portabilidade"

Preencher demais campos obrigatórios
    [Arguments]  @{arg1}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}

Preencher demais campos obrigatórios PJ
    [Arguments]  @{arg1}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa    ${arg1[29]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[19]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[20]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[21]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[22]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[23]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[24]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[25]}

Cadastrou um Beneficiário Titular
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[2]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[12]}
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[13]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    Salvar o Beneficiário não desejando incluir dependentes


Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[9]}
    IF    $arg1[7] == ''
        Selecionar um Produto Assistencial do Potencial PJ com  ${arg1[8]}
    ELSE
        
        Selecionar um Produto Assistencial do Potencial PJ com  ${arg1[7]}
    END
    Selecionar um Produto Assistencial do Potencial PJ com  ${arg1[28]}
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[4]}
    Remover Acessórios do Produto Assistencial
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[2]}


Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo (Importação)
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[9]}
    IF    $arg1[7] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[8]}
    ELSE
        
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[4]}
    Remover Acessórios do Produto Assistencial
    Clicar em Aprovar a Cotação

    Selecionar um Produto Assistencial do Potencial PF com  ${arg1[28]}
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[4]}
    Remover Acessórios do Produto Assistencial
    Clicar em Aprovar a Cotação

    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[2]}
    

Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[9]}
    IF    $arg1[7] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[8]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[4]}
    CotacoesCadastro.Preencher o tipo de Negociação  ${arg1[36]}
    CotacoesCadastro.Preencher Valor da Negociação  ${arg1[36]}  ${arg1[37]}
    Clicar em Aprovar a Cotação
    
    Selecionar um Produto Assistencial do Potencial PF com  ${arg1[28]}
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[4]}
    CotacoesCadastro.Preencher o tipo de Negociação  ${arg1[38]}
    CotacoesCadastro.Preencher Valor da Negociação  ${arg1[38]}  ${arg1[39]}

    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[2]}


Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo (Importação)
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[9]}
    IF    $arg1[7] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[8]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[4]}
    CotacoesCadastro.Preencher o tipo de Negociação  ${arg1[50]}
    CotacoesCadastro.Preencher Valor da Negociação  ${arg1[50]}  ${arg1[51]}
    Clicar em Aprovar a Cotação

    Selecionar um Produto Assistencial do Potencial PF com  ${arg1[28]}
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[4]}
    CotacoesCadastro.Preencher o tipo de Negociação  ${arg1[52]}
    CotacoesCadastro.Preencher Valor da Negociação  ${arg1[52]}  ${arg1[53]}

    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[2]}


Cadastrou uma Cotação, com DOIS Produtos Assistenciais, com Acessório e sem Desconto e Acréscimo
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[9]}
    IF    $arg1[7] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[8]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[4]}
    Clicar em Aprovar a Cotação

    Selecionar um Produto Assistencial do Potencial PF com  ${arg1[28]}
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[4]}
    Clicar em Aprovar a Cotação

    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[2]}

    
Usuário clicar no menu "Criar Contrato"
    CotacoesDetalhes.Clicar no submenu "Criar Contrato"


CRM deve apresentar a tela Contrato » Criar
    ContratosCadastro.Verificar Tela de Cadastro Contratos


Clicou no menu "Criar Contrato" do painel Beneficiários
    CotacoesDetalhes.Clicar no submenu "Criar Contrato"
    ContratosCadastro.Verificar Tela de Cadastro Contratos


Preencher os campos obrigatórios (Contrato)
    [Arguments]  @{arg1}
    ContratosCadastro.Verificar se o campo Titulo contrato está preenchido com    ${arg1[1]}
    ContratosCadastro.Verificar se o campo Conta contrato está preenchido com    ${arg1[1]}
    ContratosCadastro.Preencher o campo Data de Vigencia    ${arg1[9]}
    ContratosCadastro.Preencher o campo Dia de Vencimento   ${arg1[10]}
    ContratosCadastro.Colocar Forma de Cobrança com    ${arg1[11]}

Preencher os campos obrigatórios (Contrato PJ)
    [Arguments]  @{arg1}
    ContratosCadastro.Verificar se o campo Titulo contrato está preenchido com    ${arg1[1]}
    ContratosCadastro.Verificar se o campo Conta contrato está preenchido com    ${arg1[1]}
    ContratosCadastro.Preencher o campo Data de Vigencia    ${arg1[10]}
    ContratosCadastro.Preencher o campo Dia de Vencimento   ${arg1[11]}
    ContratosCadastro.Colocar Forma de Cobrança com    ${arg1[12]}

Salvar o Contrato
    ContratosCadastro.Clicar em Salvar Contrato
    ContratosCadastro.Apresentar a Modal de Preencher Endereço residencial

Salvar o Contrato PJ
    ContratosCadastro.Clicar em Salvar Contrato
    ContratosCadastro.Apresentar a Modal de Preencher Endereço comercial

CRM deve apresentar a tela Contrato » Titulo
    [Arguments]  @{arg1}
    ContratosDetalhes.Apresentar a tela Contratos » com  ${arg1[1]}

Cadastrou os Beneficiários
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    Preencher os campos obrigatórios (Beneficiários - Titular)    @{arg1}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Dependente
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[26]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[27]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[31]}  
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[30]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[29]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Carregar endereço do Titular
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}

    Salvar o Beneficiário não desejando incluir dependentes
    CRM deve apresentar a tela Contrato » TITULO, com Beneficiário Titular e Dependente incluido    @{arg1}


Cadastrou os Beneficiários PJ
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    Preencher os campos obrigatórios (Beneficiários PJ - Titular)    @{arg1}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Dependente
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[30]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[31]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[32]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[35]}  
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[34]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[19]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[33]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[21]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[22]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[23]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[24]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[25]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[26]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[27]}

    Salvar o Beneficiário não desejando incluir dependentes
    CRM deve apresentar a tela Contrato » TITULO PJ, com Beneficiário Titular e Dependente incluido    @{arg1}


Cadastrou os Beneficiários CAEPF
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    Preencher os campos obrigatórios (Beneficiários PJ - Titular)    @{arg1}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Dependente
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[30]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[31]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[32]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[35]}  
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[34]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[19]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[33]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[21]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[22]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[23]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[24]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[25]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[26]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[27]}

    Salvar o Beneficiário não desejando incluir dependentes
    CRM deve apresentar a tela Contrato » TITULO CAEPF, com Beneficiário Titular e Dependente incluido    @{arg1}


Validar Processo de Declaração de Saude
    [Arguments]  @{arg1}
    ${v}  Run Keyword And Ignore Error  Clicar no link "Processo de Declaração de Saúde"  ${arg1[1]}
    Run Keyword If  "${v[0]}" == "PASS"  Desmarcar Processo de Declaração de Saude    @{arg1}
    Run Keyword If  "${v[0]}" == "FAIL"  Cadastrou um Contrato, preenchendo campos obrigatórios    @{arg1}


Desmarcar Processo de Declaração de Saude
    [Arguments]  @{arg1}
    DeclaracaoSaudeDetalhes.Verificar Página Processo de Declaração de Saúde com   ${arg1[1]}
    DeclaracaoSaudeDetalhes.Clicar no Botão Editar Processo de Declaração de Saude
    DeclaracaoSaudeDetalhes.Selecionar Checkbox Dispensar Validação de Declaração de Saúde
    DeclaracaoSaudeDetalhes.Selecionar o Motivo Dispensa DS
    DeclaracaoSaudeDetalhes.Preencher o Complemento do Motivo
    DeclaracaoSaudeDetalhes.Clicar em SALVAR declaração de saude
    DeclaracaoSaudeDetalhes.Acessando o menu FINALIZAR DECLARACAO DE SAUDE
    DeclaracaoSaudeDetalhes.Validar Status Concluido
    DeclaracaoSaudeDetalhes.Clicar no link "Nome Cotação"    ${arg1[1]}
    ${c}  Run Keyword And Ignore Error   CotacoesDetalhes.Verificar Página Detalhes de Cotacao com    ${arg1[1]}
    # Run Keyword If  "${c[0]}" == "PASS"  CotacoesDetalhes.Verificar "Titulo Contrato" na tela Cotações    ${arg1}
    Run Keyword If  "${c[0]}" == "PASS"   Cadastrou um Contrato, preenchendo campos obrigatórios   @{arg1}
    Run Keyword If  "${c[0]}" == "PASS"  ContratosDetalhes.Apresentar a tela Contratos » com    ${arg1[1]}
    Run Keyword If  "${c[0]}" == "PASS"  DeclaracaoSaudeDetalhes.Validar checkbox necessita validar declaracao de saude esta desmarcado
    Run Keyword If  "${c[0]}" == "FAIL"  MovimentacaoCadastral.Apresentar a tela Movimentação Cadastral »


Validar Processo de Declaração de Saude (Segundo Contrato)
    [Arguments]  @{arg1}
    ${s}  Run Keyword And Ignore Error  Clicar no link "Processo de Declaração de Saúde"  ${arg1[31]}
    Run Keyword If  "${s[0]}" == "PASS"  Desmarcar Processo de Declaração de Saude (Segundo Contrato)   @{arg1}
    Run Keyword If  "${s[0]}" == "FAIL"  Cadastrou um segundo Contrato, preenchendo campos obrigatórios    @{arg1}

Desmarcar Processo de Declaração de Saude (Segundo Contrato)
    [Arguments]  @{arg1}
    DeclaracaoSaudeDetalhes.Verificar Página Processo de Declaração de Saúde com   ${arg1[31]}
    DeclaracaoSaudeDetalhes.Clicar no Botão Editar Processo de Declaração de Saude
    DeclaracaoSaudeDetalhes.Selecionar Checkbox Dispensar Validação de Declaração de Saúde
    DeclaracaoSaudeDetalhes.Selecionar o Motivo Dispensa DS
    DeclaracaoSaudeDetalhes.Preencher o Complemento do Motivo
    DeclaracaoSaudeDetalhes.Clicar em SALVAR declaração de saude
    DeclaracaoSaudeDetalhes.Acessando o menu FINALIZAR DECLARACAO DE SAUDE
    DeclaracaoSaudeDetalhes.Validar Status Concluido
    DeclaracaoSaudeDetalhes.Clicar no link "Nome Cotação"    ${arg1[31]}
    ${c}  Run Keyword And Ignore Error   CotacoesDetalhes.Verificar Página Detalhes de Cotacao com    ${arg1[31]}
    # Run Keyword If  "${c[0]}" == "PASS"  CotacoesDetalhes.Verificar "Titulo Contrato" na tela Cotações    ${arg1[31]}
    Run Keyword If  "${c[0]}" == "PASS"   Cadastrou um segundo Contrato, preenchendo campos obrigatórios     @{arg1}
    Run Keyword If  "${c[0]}" == "PASS"  ContratosDetalhes.Apresentar a tela Contratos » com    ${arg1[31]}
    Run Keyword If  "${c[0]}" == "PASS"  DeclaracaoSaudeDetalhes.Validar checkbox necessita validar declaracao de saude esta desmarcado
    Run Keyword If  "${c[0]}" == "FAIL"  MovimentacaoCadastral.Apresentar a tela Movimentação Cadastral »
    

Validar Processo de Declaração de Saude (Terceiro Contrato)
    [Arguments]  @{arg1}
    ${s}  Run Keyword And Ignore Error  Clicar no link "Processo de Declaração de Saúde"  ${arg1[71]}
    Run Keyword If  "${s[0]}" == "PASS"  Desmarcar Processo de Declaração de Saude (Terceiro Contrato)   @{arg1}
    Run Keyword If  "${s[0]}" == "FAIL"  Cadastrou um terceiro Contrato, preenchendo campos obrigatórios    @{arg1}

Desmarcar Processo de Declaração de Saude (Terceiro Contrato)
    [Arguments]  @{arg1}
    DeclaracaoSaudeDetalhes.Verificar Página Processo de Declaração de Saúde com   ${arg1[71]}
    DeclaracaoSaudeDetalhes.Clicar no Botão Editar Processo de Declaração de Saude
    DeclaracaoSaudeDetalhes.Selecionar Checkbox Dispensar Validação de Declaração de Saúde
    DeclaracaoSaudeDetalhes.Selecionar o Motivo Dispensa DS
    DeclaracaoSaudeDetalhes.Preencher o Complemento do Motivo
    DeclaracaoSaudeDetalhes.Clicar em SALVAR declaração de saude
    DeclaracaoSaudeDetalhes.Acessando o menu FINALIZAR DECLARACAO DE SAUDE
    DeclaracaoSaudeDetalhes.Validar Status Concluido
    DeclaracaoSaudeDetalhes.Clicar no link "Nome Cotação"    ${arg1[71]}
    ${c}  Run Keyword And Ignore Error   CotacoesDetalhes.Verificar Página Detalhes de Cotacao com    ${arg1[71]}
    # Run Keyword If  "${c[0]}" == "PASS"  CotacoesDetalhes.Verificar "Titulo Contrato" na tela Cotações    ${arg1[71]}
    Run Keyword If  "${c[0]}" == "PASS"   Cadastrou um terceiro Contrato, preenchendo campos obrigatórios     @{arg1}
    Run Keyword If  "${c[0]}" == "PASS"  ContratosDetalhes.Apresentar a tela Contratos » com    ${arg1[71]}
    Run Keyword If  "${c[0]}" == "PASS"  DeclaracaoSaudeDetalhes.Validar checkbox necessita validar declaracao de saude esta desmarcado
    Run Keyword If  "${c[0]}" == "FAIL"  MovimentacaoCadastral.Apresentar a tela Movimentação Cadastral »


Validar Processo de Declaração de Saude (Integração)
    [Arguments]  @{arg1}
    ${v}  Run Keyword And Ignore Error  Clicar no link "Processo de Declaração de Saúde"  ${arg1[1]}
    Run Keyword If  "${v[0]}" == "PASS"  Desmarcar Processo de Declaração de Saude (Integração)    @{arg1}
    Run Keyword If  "${v[0]}" == "FAIL"  Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)    @{arg1}


Desmarcar Processo de Declaração de Saude (Integração)
    [Arguments]  @{arg1}
    DeclaracaoSaudeDetalhes.Verificar Página Processo de Declaração de Saúde com   ${arg1[1]}
    DeclaracaoSaudeDetalhes.Clicar no Botão Editar Processo de Declaração de Saude
    DeclaracaoSaudeDetalhes.Selecionar Checkbox Dispensar Validação de Declaração de Saúde
    DeclaracaoSaudeDetalhes.Selecionar o Motivo Dispensa DS
    DeclaracaoSaudeDetalhes.Preencher o Complemento do Motivo
    DeclaracaoSaudeDetalhes.Clicar em SALVAR declaração de saude
    DeclaracaoSaudeDetalhes.Acessando o menu FINALIZAR DECLARACAO DE SAUDE
    DeclaracaoSaudeDetalhes.Validar Status Concluido
    DeclaracaoSaudeDetalhes.Clicar no link "Nome Cotação"    ${arg1[1]}
    ${c}  Run Keyword And Ignore Error   CotacoesDetalhes.Verificar Página Detalhes de Cotacao com    ${arg1[1]}
    # Run Keyword If  "${c[0]}" == "PASS"  CotacoesDetalhes.Verificar "Titulo Contrato" na tela Cotações    ${arg1}
    Run Keyword If  "${c[0]}" == "PASS"   Cadastrou um Contrato PJ, preenchendo campos obrigatórios (Integração)   @{arg1}
    Run Keyword If  "${c[0]}" == "PASS"  ContratosDetalhes.Apresentar a tela Contratos » com    ${arg1[1]}
    Run Keyword If  "${c[0]}" == "PASS"  DeclaracaoSaudeDetalhes.Validar checkbox necessita validar declaracao de saude esta desmarcado
    Run Keyword If  "${c[0]}" == "FAIL"  MovimentacaoCadastral.Apresentar a tela Movimentação Cadastral » 


Validar e Desmarcar Processo de Declaração de Saude
    [Arguments]  ${arg1}
    Clicar no link "Processo de Declaração de Saúde"  ${arg1}
    DeclaracaoSaudeDetalhes.Verificar Página Processo de Declaração de Saúde com   ${arg1}
    DeclaracaoSaudeDetalhes.Clicar no Botão Editar Processo de Declaração de Saude
    DeclaracaoSaudeDetalhes.Selecionar Checkbox Dispensar Validação de Declaração de Saúde
    DeclaracaoSaudeDetalhes.Selecionar o Motivo Dispensa DS
    DeclaracaoSaudeDetalhes.Preencher o Complemento do Motivo
    DeclaracaoSaudeDetalhes.Clicar em SALVAR declaração de saude
    DeclaracaoSaudeDetalhes.Acessando o menu FINALIZAR DECLARACAO DE SAUDE
    DeclaracaoSaudeDetalhes.Validar Status Concluido
    DeclaracaoSaudeDetalhes.Clicar no link "Nome Cotação"    ${arg1}
    CotacoesDetalhes.Verificar Página Detalhes de Cotacao com    ${arg1}
    CotacoesDetalhes.Verificar "Titulo Contrato" na tela Cotações    ${arg1}
    ContratosDetalhes.Apresentar a tela Contratos » com    ${arg1}
    # DeclaracaoSaudeDetalhes.Validar checkbox necessita validar declaracao de saude esta desmarcado


Clicar no menu "ENCAMINHAR PARA APROVAÇÃO"
    [Arguments]  @{arg1}
    ContratosDetalhes.Clicando no menu "ENCAMINHAR PARA APROVAÇÃO"
    ${e}  Run Keyword And Ignore Error     Wait Until Page Contains    O Contrante não possui um endereço cadastrado, clique    timeout=${TIMEOUT}
    Run Keyword If  "${e[0]}" == "PASS"    ContratosDetalhes.Validar mensagem "Contratante não possui endereço cadastrado"  @{arg1}
    
    ${f}  Run Keyword And Ignore Error     Wait Until Page Contains    Não foi possível encaminhar o contrato para aprovação, pois os seguintes campos: Razão Social, CNPJ/CPF/CAEPF não foram preenchidos no contratante deste contrato.    timeout=15
    Run Keyword If  "${f[0]}" == "PASS"    ContratosDetalhes.Validar mensagem "Contratante não possui CNPJ/CPF/CAEPF não foram preenchidos"   @{arg1}
    
    ${g}  Run Keyword And Ignore Error     Wait Until Page Contains    Não foi possível encaminhar o contrato para aprovação, pois os seguintes campos: Razão Social, CPF Responsável (CAEPF) não foram preenchidos no contratante deste contrato.    timeout=15
    Run Keyword If  "${g[0]}" == "PASS"    ContratosDetalhes.Validar mensagem "Razão Social, CPF Responsável (CAEPF) não foram preenchidos"    @{arg1}
    
    ${h}  Run Keyword And Ignore Error     Wait Until Page Contains    Não foi possível encaminhar o contrato para aprovação, pois os seguintes campos: Razão Social, CNPJ/CPF/CAEPF, CPF Responsável (CAEPF) não foram preenchidos no contratante deste contrato.    timeout=15
    Run Keyword If  "${h[0]}" == "PASS"    ContratosDetalhes.Validar mensagem "Razão Social, CNPJ/CPF/CAEPF, CPF Responsável (CAEPF) não foram preenchidos"  @{arg1}
    
    ${i}  Run Keyword And Ignore Error     Wait Until Page Contains    Não foi possível encaminhar o contrato para aprovação, pois os seguintes campos: Data de Nascimento, Sexo, Nome da Mãe, Estado Civil, Naturalidade não foram preenchidos    timeout=15
    Run Keyword If  "${i[0]}" == "PASS"    ContratosDetalhes.Validar mensagem "Data de Nascimento, Sexo, Nome da Mãe, Estado Civil, Naturalidade não foram preenchidosnão foram preenchidos no contratante"  @{arg1}
    ContratosDetalhes.Aprovar Encaminhar para Aprovação


CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO
    ContratosDetalhes.CRM deverá atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO


Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO EMPRESARIAL
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[9]}
    CotacoesCadastro.Preencher o tipo de Negociação com "Coletivo Empresarial"
    IF    $arg1[7] = ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[8]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[2]}


Cadastrou uma Cotação, com "Tipo Cotação" igual a COLETIVO POR ADESÃO
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[9]}
    CotacoesCadastro.Preencher o tipo de Negociação com "Coletivo por Adesão"
    IF    $arg1[7] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[8]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[2]}


Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA FISICA com os campos obrigatórios
    [Arguments]  @{arg1}
    Clicou na submenu <Potencial Cliente> do <Comercial>  
    Apresentar a Tela de Pesquisa Potencial Cliente
    Apertar o Botão Criar do Pontecial Cliente
    Apresentar a Tela de Cadastro Pontecial Cliente
    Selecionar o Tipo Pessoa como Pessoa Física
    PotencialClienteCadastro.Preencher Nome/Fantasia com   ${arg1[1]}
    PotencialClienteCadastro.Preencher Nome com  ${arg1[1]}
    PotencialClienteCadastro.Preencher CPF/CNPJ/CAEPF com  ${arg1[2]}
    PotencialClienteCadastro.Preencher Número de Vidas com  ${arg1[3]}
    Clicar no botão Salvar Potencial Cliente
    Apresentar a modal com a mensagem Nenhum endereço foi cadastrado, deseja cadastrar um novo endereço?
    Clicar no Botão Não do Modal
    Apresentar a Tela Potencial Cliente » NOME  ${arg1[1]}


Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CNPJ) com os campos obrigatórios
    [Arguments]  @{arg1}
    Clicou na submenu <Potencial Cliente> do <Comercial>  
    Apresentar a Tela de Pesquisa Potencial Cliente
    Apertar o Botão Criar do Pontecial Cliente
    Apresentar a Tela de Cadastro Pontecial Cliente
    Selecionar o Tipo Pessoa como Pessoa Júridica (CNPJ)
    PotencialClienteCadastro.Preencher Nome/Fantasia com   ${arg1[1]}
    PotencialClienteCadastro.Preencher Razão Social com    ${arg1[1]}
    PotencialClienteCadastro.Preencher Nome com  ${arg1[1]}
    PotencialClienteCadastro.Preencher CPF/CNPJ/CAEPF com  ${arg1[2]}
    PotencialClienteCadastro.Preencher Número de Vidas com  ${arg1[3]}
    Clicar no botão Salvar Potencial Cliente
    Apresentar a modal com a mensagem Nenhum endereço foi cadastrado, deseja cadastrar um novo endereço?
    Clicar no Botão Não do Modal
    Apresentar a Tela Potencial Cliente » NOME  ${arg1[1]}


Cadastrou um Potencial Cliente com "Tipo de Pessoa" PESSOA JURIDICA (CAEPF) com os campos obrigatórios
    [Arguments]  @{arg1}
    Clicou na submenu <Potencial Cliente> do <Comercial>  
    Apresentar a Tela de Pesquisa Potencial Cliente
    Apertar o Botão Criar do Pontecial Cliente
    Apresentar a Tela de Cadastro Pontecial Cliente
    Selecionar o Tipo Pessoa como Pessoa Júridica (CAEPF)
    PotencialClienteCadastro.Preencher Nome/Fantasia com   ${arg1[1]}
    PotencialClienteCadastro.Preencher Razão Social com    ${arg1[1]}
    PotencialClienteCadastro.Preencher Nome com  ${arg1[1]}
    PotencialClienteCadastro.Preencher CPF/CNPJ/CAEPF com  ${arg1[2]}
    PotencialClienteCadastro.Preencher Número de Vidas com  ${arg1[3]}
    Clicar no botão Salvar Potencial Cliente
    Apresentar a modal com a mensagem Nenhum endereço foi cadastrado, deseja cadastrar um novo endereço?
    Clicar no Botão Não do Modal
    Apresentar a Tela Potencial Cliente » NOME  ${arg1[1]}


Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29
    [Arguments]  @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  3
    OportunidadesCadastro.Colocar Tipo com  ${arg1[4]}
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[1]}
##${arg1[3]}

Cadastrou uma segunda Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29
    [Arguments]  @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos (Segunda Oportunidade)  @{arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[33]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[4]}
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[32]}


Cadastrou uma terceira Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29
    [Arguments]  @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos (Terceira Oportunidade)  @{arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[72]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[4]}
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[71]}


Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" maior que 29
    [Arguments]  @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[3]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[4]}
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[1]}


Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" igual a 29
    [Arguments]  @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[3]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[4]}
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[1]}



Cadastrou uma Cotação, com "Tipo de Contratação" INDIVIDUAL FAMILIAR, com 1 Produto Assistencial
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Individual Familiar
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Coletivo Empresarial
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}

    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Selecionar um Produto Assistencial do Potencial PF com  ${arg1[28]}
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma segunda Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Coletivo Empresarial
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}

    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Selecionar um Produto Assistencial do Potencial PF com  ${arg1[28]}
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[37]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[32]}


Cadastrou uma terceira Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[7]}
    Selecionar campo "Tipo de Contratação" com  Coletivo Empresarial
    Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Selecionar um Produto Assistencial do Potencial PF com  ${arg1[27]}
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[76]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[71]}


Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, com 2 Produto Assistencial
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Coletivo por Adesão
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Selecionar um Produto Assistencial do Potencial PF com  ${arg1[28]}
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO "Base Quantidade Vidas Mensalidade" FAMILIA, com 1 Produto Assistencial
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Coletivo por Adesão
    Selecionar campo "Base Quantidade Vidas Mensalidade" com  Família
    Preencher o campo "Total de Familias" com  1
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Tipo de Layout" DISTRIBUIÇÃO DE VIDAS, com 1 Produto Assistencial sem desconto e acréscimo
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Coletivo por Adesão
    Selecionar campo "Base Quantidade Vidas Mensalidade" com  Beneficiários
    Selecionar campo Tipo de Layout   Distribuição de vidas
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}

    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Tipo de Layout" TABELA COMPLETA, com 1 Produto Assistencial sem desconto e acréscimo
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Coletivo por Adesão
    Selecionar campo "Base Quantidade Vidas Mensalidade" com  Beneficiários
    Selecionar campo Tipo de Layout   Tabela Completa
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}

    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Salvar a Tabela Completa com a faixa de vida
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" FAMILIA, com 1 Produto Assistencial
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[7]}
    Selecionar campo "Tipo de Contratação" com  Coletivo Empresarial
    Selecionar campo "Base Quantidade Vidas Mensalidade" com  Família
    Preencher o campo "Total de Familias" com  1
    Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" FIXAR DE ACORDO COM A QUANTIDADE DE VIDAS NA COTAÇÃO, com 1 Produto Assistencial sem desconto e acréscimo
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Coletivo Empresarial
    Selecionar campo "Base Quantidade Vidas Mensalidade" com  Beneficiários
    Selecionar campo "Fixar tabela de preço por faixa de vida" com   Fixar de acordo com a quantidade de vidas na Cotação
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}

Cadastrou uma Cotação, "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" FIXAR DE ACORDO COM A NEGOCIAÇÃO, com 1 Produto Assistencial
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Coletivo Empresarial
    Selecionar campo "Base Quantidade Vidas Mensalidade" com  Beneficiários
    Selecionar campo "Fixar tabela de preço por faixa de vida" com   Fixar de acordo com a Negociação
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Clicou no botão "DEFINIR FAIXA DE VIDAS PARA FIXAR" e selecionou o segundo registro
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}

Cadastrou uma Cotação, "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" NÃO FIXAR, com 1 Produto Assistencial sem desconto e acréscimo
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Coletivo Empresarial
    Selecionar campo "Base Quantidade Vidas Mensalidade" com  Beneficiários
    Selecionar campo "Fixar tabela de preço por faixa de vida" com   Não Fixar
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}

    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" NÃO FIXAR, com CONVÊNIO, com 1 Produto Assistencial sem desconto e acréscimo
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Coletivo Empresarial
    Selecionar campo "Base Quantidade Vidas Mensalidade" com  Beneficiários
    Selecionar campo "Fixar tabela de preço por faixa de vida" com   Não Fixar
    IF    $arg1[38] == ''
        Selecionar Um Convênio  ${arg1[39]}
    ELSE
        
        Selecionar Um Convênio  ${arg1[38]}
    END
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" NÃO FIXAR, sem CONVÊNIO, com 1 Produto Assistencial com desconto e sem acréscimo
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Coletivo Empresarial
    Selecionar campo "Base Quantidade Vidas Mensalidade" com  Beneficiários
    Selecionar campo "Fixar tabela de preço por faixa de vida" com   Não Fixar
    IF    $arg1[38] == ''
        Selecionar Um Convênio  ${arg1[39]}
    ELSE
        Selecionar Um Convênio  ${arg1[38]}
        
    END
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}

    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    CotacoesCadastro.Preencher o tipo de Negociação  ${arg1[40]}
    CotacoesCadastro.Preencher Valor da Negociação  ${arg1[40]}  ${arg1[41]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" NÃO FIXAR, sem CONVÊNIO, com 1 Produto Assistencial sem desconto e com acréscimo
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Coletivo Empresarial
    Selecionar campo "Base Quantidade Vidas Mensalidade" com  Beneficiários
    Selecionar campo "Fixar tabela de preço por faixa de vida" com   Não Fixar
    IF    $arg1[38] == ''
        Selecionar Um Convênio  ${arg1[39]}
    ELSE
        Selecionar Um Convênio  ${arg1[38]}
        
    END
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    CotacoesCadastro.Preencher o tipo de Negociação  ${arg1[40]}
    CotacoesCadastro.Preencher Valor da Negociação  ${arg1[40]}  ${arg1[41]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" NÃO FIXAR, sem CONVÊNIO, com 1 Produto Assistencial selecionou no campo "Negociação" CALCULA VALOR, selecionou a opção Faixa Etária, preencheu o campo "Valor Final" igual a 150,00, clicou no botão "APLICAR"
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Coletivo Empresarial
    Selecionar campo "Base Quantidade Vidas Mensalidade" com  Beneficiários
    Selecionar campo "Fixar tabela de preço por faixa de vida" com   Não Fixar
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}

    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    CotacoesCadastro.Preencher o tipo de Negociação  ${arg1[40]}
    CotacoesCadastro.Preencher Valor da Negociação  ${arg1[40]}  ${arg1[41]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" NÃO FIXAR, sem convênio, com 1 Produto Assistencial sem desconto e sem acréscimo, 2 Produtos Acessórios com DESCONTO e com ACRÉSCIMO
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Coletivo Empresarial
    Selecionar campo "Base Quantidade Vidas Mensalidade" com  Beneficiários
    Selecionar campo "Fixar tabela de preço por faixa de vida" com   Não Fixar
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}

    ELSE
        
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    CotacoesCadastro.Preencher Desconto dos Acessorios do Produto Assistencial   100,00
    CotacoesCadastro.Preencher Acrescimo dos Acessorios do Produto Assistencial  20,00
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO, "Fixar tabela de preço por faixa de vida" NÃO FIXAR, com CONVÊNIO, com 1 Produto Assistencial sem desconto e com ACRÉSCIMO, 2 Produtos Acessórios com DESCONTO e com ACRÉSCIMO
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Coletivo Empresarial
    Selecionar campo "Base Quantidade Vidas Mensalidade" com  Beneficiários
    Selecionar campo "Fixar tabela de preço por faixa de vida" com   Não Fixar
    IF    $arg1[38]
        Selecionar Um Convênio  ${arg1[39]}
    
    ELSE
        Selecionar Um Convênio  ${arg1[38]}
        
    END
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
    ELSE
        
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    CotacoesCadastro.Preencher o tipo de Negociação  ${arg1[40]}
    CotacoesCadastro.Preencher Valor da Negociação  ${arg1[40]}  ${arg1[41]}
    CotacoesCadastro.Preencher Desconto dos Acessorios do Produto Assistencial   100,00
    CotacoesCadastro.Preencher Acrescimo dos Acessorios do Produto Assistencial  20,00
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}


Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, "Base Quantidade Vidas Mensalidade" BENEFICIÁRIO
    [Arguments]  @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[7]}
    Selecionar campo "Tipo de Contratação" com  Coletivo Empresarial
    Selecionar campo "Base Quantidade Vidas Mensalidade" com  Beneficiários
    Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}
    

Cadastrou Beneficiários que o CPF não exista no CADSUS, com e-mail
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    #Cadastro Titular
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[14]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[2]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[13]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[16]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[17]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[18]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[19]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[21]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[23]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[24]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[25]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[26]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[27]}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Dependente
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[30]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[31]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[32]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[35]}  
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[34]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[16]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[17]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[18]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[33]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[21]}
    BeneficiariosCadastro.Carregar endereço do Titular
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[25]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[26]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[36]}
    Salvar o Beneficiário não desejando incluir dependentes
    # Validação de Beneficiarios incluidos
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[1]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Titular    ${arg1[1]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Dependente    ${arg1[32]}

##gabriel 
Cadastrou mais de 1 um Beneficiários que o CPF não exista no CADSUS, com e-mail
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    #Cadastro Titular
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[13]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[2]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[12]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[26]}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Dependente 01
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[29]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[30]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[31]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[34]}  
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[33]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[32]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Carregar endereço do Titular
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[35]}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Dependente 02
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[45]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[46]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[47]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[50]}  
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[49]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[52]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[48]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Carregar endereço do Titular
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[51]}
    Salvar o Beneficiário não desejando incluir dependentes


    ${a}  Run Keyword And Ignore Error   Wait Until Page Contains  Idade maior ou igual a do titular.  timeout=15
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  10s
    Run Keyword If  "${a[0]}" == "PASS"   Input Text  id:data_nasc  09/08/2020
    Run Keyword If  "${a[0]}" == "PASS"   BeneficiariosCadastro.Carregar endereço do Titular
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${a[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar Telefone(s) do Titular')]
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${a[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar E-mail(s) do Titular')]
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${a[0]}" == "PASS"   Salvar o Beneficiário não desejando incluir dependentes

    ${b}  Run Keyword And Ignore Error   Wait Until Page Contains  A idade do beneficiário ultrapassa o limite configurado para esse Grau de Dependência. (21)  timeout=15
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  10s
    Run Keyword If  "${b[0]}" == "PASS"   Input Text  id:data_nasc  09/08/2020
    Run Keyword If  "${b[0]}" == "PASS"   BeneficiariosCadastro.Carregar endereço do Titular
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${b[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar Telefone(s) do Titular')]
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${b[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar E-mail(s) do Titular')]
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${b[0]}" == "PASS"   Salvar o Beneficiário não desejando incluir dependentes

    # Validação de Beneficiarios incluidos
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[1]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Titular    ${arg1[1]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Dependente    ${arg1[31]}

Cadastrou mais de 3 Beneficiarios Titulares CAEPF que o CPF não exista no CADSUS, com e-mail
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    #Cadastro Titular 01
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[13]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[38]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa  ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[39]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[12]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[26]}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Titular 02
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[37]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[62]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa  ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[63]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[12]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[68]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[67]}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Titular 03
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[37]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[54]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[55]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[50]}  
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[60]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[56]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[35]}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Titular 04
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[37]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[46]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[47]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[42]}  
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[52]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[48]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[51]}
    Salvar o Beneficiário não desejando incluir dependentes

    ${a}  Run Keyword And Ignore Error   Wait Until Page Contains  Idade maior ou igual a do titular.  timeout=15
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  10s
    Run Keyword If  "${a[0]}" == "PASS"   Input Text  id:data_nasc  09/08/2020
    Run Keyword If  "${a[0]}" == "PASS"   BeneficiariosCadastro.Carregar endereço do Titular
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${a[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar Telefone(s) do Titular')]
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${a[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar E-mail(s) do Titular')]
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${a[0]}" == "PASS"   Salvar o Beneficiário não desejando incluir dependentes

    ${b}  Run Keyword And Ignore Error   Wait Until Page Contains  A idade do beneficiário ultrapassa o limite configurado para esse Grau de Dependência. (21)  timeout=15
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  10s
    Run Keyword If  "${b[0]}" == "PASS"   Input Text  id:data_nasc  09/08/2020
    Run Keyword If  "${b[0]}" == "PASS"   BeneficiariosCadastro.Carregar endereço do Titular
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${b[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar Telefone(s) do Titular')]
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${b[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar E-mail(s) do Titular')]
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${b[0]}" == "PASS"   Salvar o Beneficiário não desejando incluir dependentes


Cadastrou mais de 1 um Beneficiários CAEPF que o CPF não exista no CADSUS, com e-mail
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    #Cadastro Titular 01
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[13]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[38]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa  ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[39]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[12]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[26]}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Titular 02
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[37]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[62]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa  ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[63]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[12]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[68]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[67]}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Dependente 01
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[54]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[55]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[50]}  
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[57]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[60]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[56]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Carregar endereço do Titular
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[35]}
    Salvar o Beneficiário desejando incluir dependentes
    
    #Cadastro Dependente 02
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[46]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[47]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[42]}  
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[49]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[52]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[48]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Carregar endereço do Titular
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[51]}
    Salvar o Beneficiário não desejando incluir dependentes

    ${a}  Run Keyword And Ignore Error   Wait Until Page Contains  Idade maior ou igual a do titular.  timeout=15
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  10s
    Run Keyword If  "${a[0]}" == "PASS"   Input Text  id:data_nasc  09/08/2020
    Run Keyword If  "${a[0]}" == "PASS"   BeneficiariosCadastro.Carregar endereço do Titular
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${a[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar Telefone(s) do Titular')]
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${a[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar E-mail(s) do Titular')]
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${a[0]}" == "PASS"   Salvar o Beneficiário não desejando incluir dependentes

    ${b}  Run Keyword And Ignore Error   Wait Until Page Contains  A idade do beneficiário ultrapassa o limite configurado para esse Grau de Dependência. (21)  timeout=15
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  10s
    Run Keyword If  "${b[0]}" == "PASS"   Input Text  id:data_nasc  09/08/2020
    Run Keyword If  "${b[0]}" == "PASS"   BeneficiariosCadastro.Carregar endereço do Titular
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${b[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar Telefone(s) do Titular')]
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${b[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar E-mail(s) do Titular')]
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${b[0]}" == "PASS"   Salvar o Beneficiário não desejando incluir dependentes

    # Validação de Beneficiarios incluidos
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[1]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Titular    ${arg1[39]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Dependente    ${arg1[47]}


# cadastro de mais de 2 beneficiarios PJ
Cadastrou mais de 1 Beneficiários PJ que o CPF não exista no CADSUS, com e-mail
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    #Cadastro Titular 01
    
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[37]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[38]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[39]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[42]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa  ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[44]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[26]}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Titular 02
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[37]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[62]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[63]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[66]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa  ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[68]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[64]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[67]}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Dependente 01
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[54]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[55]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[58]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa  ${arg1[28]}
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[57]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[60]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[56]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Carregar endereço do Titular
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[35]}
    Salvar o Beneficiário desejando incluir dependentes
     #Cadastro Dependente 02
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[46]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[47]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[50]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa  ${arg1[28]}
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[49]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[52]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[48]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Carregar endereço do Titular
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[35]}
    Salvar o Beneficiário não desejando incluir dependentes

    ${a}  Run Keyword And Ignore Error   Wait Until Page Contains  Idade maior ou igual a do titular.  timeout=15
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  10s
    Run Keyword If  "${a[0]}" == "PASS"   Input Text  id:data_nasc  09/08/2020
    Run Keyword If  "${a[0]}" == "PASS"   BeneficiariosCadastro.Carregar endereço do Titular
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${a[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar Telefone(s) do Titular')]
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${a[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar E-mail(s) do Titular')]
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${a[0]}" == "PASS"   Salvar o Beneficiário não desejando incluir dependentes

    ${b}  Run Keyword And Ignore Error   Wait Until Page Contains  A idade do beneficiário ultrapassa o limite configurado para esse Grau de Dependência. (21)  timeout=15
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  10s
    Run Keyword If  "${b[0]}" == "PASS"   Input Text  id:data_nasc  09/08/2020
    Run Keyword If  "${b[0]}" == "PASS"   BeneficiariosCadastro.Carregar endereço do Titular
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${b[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar Telefone(s) do Titular')]
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${b[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar E-mail(s) do Titular')]
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${b[0]}" == "PASS"   Salvar o Beneficiário não desejando incluir dependentes

    # Validação de Beneficiarios incluidos
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[1]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Titular    ${arg1[39]}
    ${c}  Run Keyword And Ignore Error   ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Dependente    ${arg1[47]}
    Run Keyword If  "${c[0]}" == "FAIL"   ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Dependente    ${arg1[55]} 

Cadastrou Beneficiários PJ que o CPF não exista no CADSUS, com e-mail
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    #Cadastro Titular
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[37]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[38]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[39]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[42]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa  ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[44]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[26]}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Dependente
    CRM deve apresentar a tela Beneficiário » Criar
    # BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[29]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[54]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[55]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[58]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa  ${arg1[28]}
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[57]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[60]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[56]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Carregar endereço do Titular
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[35]}
    Salvar o Beneficiário não desejando incluir dependentes

    ${a}  Run Keyword And Ignore Error   Wait Until Page Contains  Idade maior ou igual a do titular.  timeout=15
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  10s
    Run Keyword If  "${a[0]}" == "PASS"   Input Text  id:data_nasc  09/08/2020
    Run Keyword If  "${a[0]}" == "PASS"   BeneficiariosCadastro.Carregar endereço do Titular
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${a[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar Telefone(s) do Titular')]
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${a[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar E-mail(s) do Titular')]
    Run Keyword If  "${a[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${a[0]}" == "PASS"   Salvar o Beneficiário não desejando incluir dependentes

    ${b}  Run Keyword And Ignore Error   Wait Until Page Contains  A idade do beneficiário ultrapassa o limite configurado para esse Grau de Dependência. (21)  timeout=15
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  10s
    Run Keyword If  "${b[0]}" == "PASS"   Input Text  id:data_nasc  09/08/2020
    Run Keyword If  "${b[0]}" == "PASS"   BeneficiariosCadastro.Carregar endereço do Titular
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${b[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar Telefone(s) do Titular')]
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${b[0]}" == "PASS"   Click Element  xpath://button[contains(.,'Carregar E-mail(s) do Titular')]
    Run Keyword If  "${b[0]}" == "PASS"   Sleep  5s
    Run Keyword If  "${b[0]}" == "PASS"   Salvar o Beneficiário não desejando incluir dependentes

    # Validação de Beneficiarios incluidos
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[1]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Titular    ${arg1[39]}
    ${c}  Run Keyword And Ignore Error   ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Dependente    ${arg1[47]}
    Run Keyword If  "${c[0]}" == "FAIL"   ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Dependente    ${arg1[55]}
    


Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    [Arguments]  @{arg1}
    # ${LINK_PROCESSO_DECLARACAO_DE_SAUDE}  Get Text  xpath://*[@id="processo_declaracao"]
    # Run Keyword If  '${LINK_PROCESSO_DECLARACAO_DE_SAUDE}' == '${arg1[1]}'  Validar Processo de Declaração de Saude    @{arg1}
    ContratosDetalhes.Clicando no menu "ENCAMINHAR PARA APROVAÇÃO"
    ${e}  Run Keyword And Ignore Error     Wait Until Page Contains    O Contrante não possui um endereço cadastrado, clique    timeout=15
    Run Keyword If  "${e[0]}" == "PASS"    ContratosDetalhes.Validar mensagem "Contratante não possui endereço cadastrado" (Integração)  @{arg1}
    ${r}  Run Keyword And Ignore Error     Wait Until Page Contains    Não foi possível encaminhar o contrato para aprovação, pois os seguintes campos: Data de Nascimento, Sexo, Nome da Mãe, Estado Civil, Naturalidade não foram preenchidos    timeout=15
    Run Keyword If  "${r[0]}" == "PASS"    ContratosDetalhes.Validar mensagem "Data de Nascimento, Sexo, Nome da Mãe, Estado Civil, Naturalidade não foram preenchidosnão foram preenchidos no contratante"  #@{arg1}
    ${c}  Run Keyword And Ignore Error     Wait Until Page Contains    Não foi possível encaminhar o contrato para aprovação, pois os seguintes campos: Razão Social, CPF Responsável (CAEPF) não foram preenchidos no contratante deste contrato    timeout=${TIMEOUT}
    Run Keyword If  "${c[0]}" == "PASS"    ContratosDetalhes.Validar mensagem Razão Social, CPF Responsável (CAEPF) não foram preenchidosnão foram preenchidos no contratante" - Importação   @{arg1}
    ${s}  Run Keyword And Ignore Error     Wait Until Page Contains    Não foi possível encaminhar o contrato para aprovação, pois os seguintes campos: Razão Social não foram preenchidos no contratante deste contrato.
    Run Keyword If  "${s[0]}" == "PASS"    ContratosDetalhes.Validar mensagem Razão Social não foram preenchidos no contratante deste contrato  @{arg1}
    # ContratosDetalhes.Validar mensagem "Contratante não possui CNPJ/CPF/CAEPF não foram preenchidos"   @{arg1}
    #ContratosDetalhes.Validar mensagem "Razão Social, CPF Responsável (CAEPF) não foram preenchidos"    @{arg1}
    #ContratosDetalhes.Validar mensagem "Razão Social, CNPJ/CPF/CAEPF, CPF Responsável (CAEPF) não foram preenchidos"  @{arg1}
    ${p}  Run Keyword And Ignore Error     Wait Until Page Contains    O processo de Declaração de Saúde está incompleto, gentileza verifique.    timeout=15
    Run Keyword If  "${p[0]}" == "PASS"    ContratosDetalhes.Validar mensagem O processo de Declaração de Saúde está incompleto, gentileza verifique   @{arg1}
    ContratosDetalhes.Aprovar Encaminhar para Aprovação
    CRM deve atualizar a tela Contrato » Titulo, com situação igual a AGUARDANDO APROVAÇÃO


Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR" (IMPORTACAO BENEF)
    [Arguments]  @{arg1}
    ContratosDetalhes.Clicando no menu "ENCAMINHAR MOVIMENTAÇÕES PARA APROVAÇÃO"
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência  @{arg1}

Acessou o módulo Conferência
    MenuSuperior.Colocar o mouse no Operações
    MenuSuperior.Clicar no submenu Conferencia


Clicou no menu "CONFERIR PROCESSOS"
    ConferenciaPesquisa.Verificar Página Conferencia Pesquisar
    ConferenciaPesquisa.Clicar botão Conferir Processos

Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    ConferenciaPesquisa.Verificar Página Conferir Processos
    ConferenciaPesquisa.Preencher filtro Encaminhado para aprovação em (Data Atual)
    ConferenciaPesquisa.Selecionar o checkbox Meus Itens
    ConferenciaPesquisa.Clicar botão Pesquisar Processos

Clicou no botão "CONFERIR" do Contrato em Conferência
    [Arguments]  @{arg1}
    ConferenciaPesquisa.Clicar Encaminhado para aprovação - Decrescente
    ConferenciaPesquisa.Clicar em Conferir    ${arg1[1]}

Clicou no botão "CONFERIR" do Segundo Contrato em Conferência
    [Arguments]  ${arg1}
    Sleep  15s
    ConferenciaPesquisa.Clicar Encaminhado para aprovação - Decrescente
    ConferenciaPesquisa.Clicar em Conferir    ${arg1}

Clicou no botão "CONFERIR" do Terceiro Contrato em Conferência
    [Arguments]  ${arg1}
    ConferenciaPesquisa.Clicar Encaminhado para aprovação - Decrescente
    ConferenciaPesquisa.Clicar em Conferir    ${arg1}

Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência
    [Arguments]  @{arg1}
    ConferenciaPesquisa.Clicar Encaminhado para aprovação - Decrescente
    ConferenciaPesquisa.Clicar em Conferir exclusão de beneficiario    ${arg1[1]}

Clicou no botão "SIM" da modal de Confirmação
    ConferenciaPesquisa.Clicar em Sim em Conferencia

Clicou no menu "VALIDAR DADOS"
    [Arguments]  ${arg1}
    ConferenciaDetalhes.Clicar no menu "VALIDAR DADOS"    ${arg1}

Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    ConferenciaDetalhes.Clicar no menu "VALIDAR DADOS" (Mov Cadastral)

Clicou no botão "SIM" da modal de Confirmação (Validar Dados)
    ConferenciaDetalhes.Clicar no botão "SIM" da modal de Confirmação (Validar Dados)

CRM deve atualizar a tela Conferência » Titulo Contrato, aba "Resumo Conferência" com a situação "Validação Efetuada com Sucesso" na cor Azul
    [Arguments]  ${arg1}
    ConferenciaDetalhes.CRM deve atualizar tela Conferência » Titulo Contrato, aba "Resumo Conferência" com a situação "Validação Efetuada com Sucesso" na cor Azul   ${arg1}

Campos "Quantidade de Vidas (Inconsistência Cadastral)" e "Quantidade de Vidas (Advertência)" com resultado zerado
    ConferenciaDetalhes.Os Campos "Quantidade de Vidas (Inconsistência Cadastral)" e "Quantidade de Vidas (Advertência)" com resultado zerado

Campo "Quantidade de Vidas (Correto)" com resultado igual ao campo "Quantidade de Vidas"
    [Arguments]  ${arg1}
    ConferenciaDetalhes.Os Campo "Quantidade de Vidas (Correto)" com resultado igual ao campo "Quantidade de Vidas"    ${arg1}

Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"
    [Arguments]  ${arg1}
    ConferenciaDetalhes.Verificar Página Conferencia Detalhes  ${arg1}
    ConferenciaDetalhes.Clicar menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"

Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    ConferenciaDetalhes.Verificar Página Conferencia Detalhes (Mov Cadastral)
    ConferenciaDetalhes.Clicar menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"

Preencher o campo "Parecer" e clicar no botão "SALVAR"
    ConferenciaDetalhes.Preencher campo "Parecer" e clicar no botão "SALVAR"

CRM deve atualizar a tela Conferência » Titulo Contrato, aba "Visão Geral" com a situação "Aprovado"
    ConferenciaDetalhes.CRM deve atualizar tela Conferência » Titulo Contrato, aba "Visão Geral" com a situação "Aprovado"

Aba "Resumo Conferência" com o registro "Aprovado" no painel "Histórico de Revisões/Ajustes", com o "Parecer" e data e hora que foi realizada a ação
    ConferenciaDetalhes.Aba "Resumo Conferência" com registro "Aprovado" no painel "Histórico de Revisões/Ajustes", com o "Parecer" e data e hora que foi realizada a ação

Aba "Contrato" com a situação igual a "Aprovado"
    ConferenciaDetalhes.Aba "Contrato" com situação igual a "Aprovado"

Painel "Solicitações de Integração" com o registro "Integração Solicitada"
    ConferenciaDetalhes.Painel "Solicitações de Integração" com registro "Integração Solicitada"

Clicar no registro "Integração Solicitada"
    ConferenciaDetalhes.Painel "Solicitações de Integração" com registro "Integração Solicitada"
    ConferenciaDetalhes.Clicar registro "Integração Solicitada"

Clicar no botão "EFETUAR INTEGRAÇÃO"
    [Arguments]  ${arg1}
    #DBCRMUnimed.Query - Limpar Fila de Agendadores
    ConferenciaDetalhes.Clicar botão "EFETUAR INTEGRAÇÃO"  ${arg1}

CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    ConferenciaDetalhes.CRM deve atualizar tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"

No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"
    [Arguments]  @{arg1}
    ConferenciaDetalhes.No Contrato campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    ${arg1[1]}
    ConferenciaDetalhes.Salvar dados preenchidos na aba Conta, Contrato e Beneficiarios    @{arg1}

No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Importação Vidas
    [Arguments]  @{arg1}
    ConferenciaDetalhes.No Contrato campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    ${arg1[1]}

No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral
    [Arguments]  @{arg1}
    ConferenciaDetalhes.No Contrato campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão"    ${arg1[1]}
    ConferenciaDetalhes.Salvar dados preenchidos na aba Conta e Contrato   @{arg1}

Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje
    DBCRMUnimed.Query - Validação Conta e Contrato
    DBCRMUnimed.Query - Validação Endereço - Titular e Dependente
    # DBCRMUnimed.Query - Validação Beneficiario - Titular e Dependente
    DBCRMUnimed.Limpar Variaveis


Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - 1(UM) Beneficiário
    DBCRMUnimed.Query - Validação Conta e Contrato
    DBCRMUnimed.Query - Validação Endereço - Titular
    # DBCRMUnimed.Query - Validação Beneficiario - Titular
    # DBCRMUnimed.Query - Validação Documentos - Titular
    DBCRMUnimed.Limpar Variaveis

Validar dados CRM x Sistema de Gestão, Beneficiário sem Portabilidade deve gravar na carencia a data de hoje - Importação Vidas
    [Arguments]  @{arg1}
    ConferenciaDetalhes.Salvar dados preenchidos na aba Conta, Contrato e Beneficiarios - Importação Vidas   @{arg1}


Cadastrou 1(UM) Beneficiário que o CPF não exista no CADSUS, com e-mail
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    #Cadastro Titular
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[13]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[11]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[12]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[26]}
    Salvar o Beneficiário não desejando incluir dependentes    ${arg1[1]}
    # Validação de Beneficiarios incluidos
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[1]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Titular    ${arg1[1]}
    

Cadastrou 1(UM) Beneficiário PJ que o CPF não exista no CADSUS, com e-mail
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    #Cadastro Titular
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[14]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[12]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[13]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa    ${arg1[29]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[16]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[17]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[18]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[19]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[21]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[23]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[24]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[25]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[26]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[27]}
    Salvar o Beneficiário não desejando incluir dependentes    ${arg1[1]}
    # Validação de Beneficiarios incluidos
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[1]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO, com Beneficiário Titular    ${arg1[1]}


Cadastrou uma Portabilidade
    [Arguments]  @{arg1}
    Clicou no link "Nome Oportunidade" na tela Cotações  ${arg1[1]}
    Usuário clicar no menu "Criar Portabilidade"
    Clicar no botão "Salvar"
    CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL

Clicou no menu "Encaminhar para Validação"
    Clicar no menu "ENCAMINHAR PARA VALIDAÇÃO"
    
Realizou o processo de Portabilidade, com questionário APTO(A) AO EXERCÍCIO DA PORTABILIDADE
    [Arguments]  @{arg1}
    Clicou no botão "Criar" painel Pessoa(Portabilidade)
    Cadastrar uma Pessoa "Titular"
    CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada  @{arg1}
    Cadastrou uma Pessoa "Titular"
    Anexou um arquivo no painel documento
    Clicou no menu "Encaminhar para Validação"
    Confirmou o encaminhamento
    Clicou no botão "Validar"
    Clicou na aba "Checklist da Documentação"
    Selecionou a opção "Presente" e clicou no botão "Salvar"
    Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    Confirmou a solicitação
    Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    Voltou para aba da "Portabilidade"
    Clicou no menu "Encaminhar para Análise"
    Confirmou a validação do documento
    Clicou no botão "Analisar"
    Clicou na aba "Questionário Elegibilidade"
    Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, NÃO, SIM
    Clicou no botão "Salvar"
    Usuário clicar no menu "Finalizar Protocolo"
    Confirmar a finalização
    CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA


Realizou o processo de Portabilidade, com questionário APTO(A) PARCIAL AO EXERCÍCIO DA PORTABILIDADE
    [Arguments]  @{arg1}
    Clicou no link "Nome Oportunidade" na tela Cotações  ${arg1[1]}
    Usuário clicar no menu "Criar Portabilidade"
    Clicar no botão "Salvar"
    CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL
    Clicou no botão "Criar" painel Pessoa(Portabilidade)
    Cadastrar uma Pessoa "Titular"
    CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada  @{arg1}
    Cadastrou uma Pessoa "Titular"
    Anexou um arquivo no painel documento
    Clicou no menu "Encaminhar para Validação"
    Confirmou o encaminhamento
    Clicou no botão "Validar"
    Clicou na aba "Checklist da Documentação"
    Selecionou a opção "Presente" e clicou no botão "Salvar"
    Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    Confirmou a solicitação
    Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    Voltou para aba da "Portabilidade"
    Clicou no menu "Encaminhar para Análise"
    Confirmou a validação do documento
    Clicou no botão "Analisar"
    Clicou na aba "Questionário Elegibilidade"
    Preencher o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM
    Clicou no botão "Salvar"
    Usuário clicar no menu "Finalizar Protocolo"
    Confirmar a finalização
    CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA
  

Realizou o processo de Portabilidade, com questionário INAPTO(A) AO EXERCÍCIO DA PORTABILIDADE
    [Arguments]  @{arg1}
    Clicou no link "Nome Oportunidade" na tela Cotações  ${arg1[1]}
    Usuário clicar no menu "Criar Portabilidade"
    Clicar no botão "Salvar"
    CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL
    Clicou no botão "Criar" painel Pessoa(Portabilidade)
    Cadastrar uma Pessoa "Titular"
    CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada  @{arg1}
    Cadastrou uma Pessoa "Titular"
    Anexou um arquivo no painel documento
    Clicou no menu "Encaminhar para Validação"
    Confirmou o encaminhamento
    Clicou no botão "Validar"
    Clicou na aba "Checklist da Documentação"
    Selecionou a opção "Presente" e clicou no botão "Salvar"
    Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    Confirmou a solicitação
    Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    Voltou para aba da "Portabilidade"
    Clicou no menu "Encaminhar para Análise"
    Confirmou a validação do documento
    Clicou no botão "Analisar"
    Clicou na aba "Questionário Elegibilidade"
    PortabilidadeDetalhes.Preencher o formulario com as opções NÃO, NÃO, NÃO
    Clicou no botão "Salvar"
    Usuário clicar no menu "Finalizar Protocolo"
    Confirmar a finalização
    CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a NEGADA
    Clicar no link "Nome Oportunidade" na tela Solicitação de Portabilidade  ${arg1[1]}
    DeclaracaoSaudeDetalhes.Clicar no link "Nome Cotação"    ${arg1[1]}


Gerou um arquivo com 3 vidas
    [Arguments]  @{arg1}
    ContratosDetalhes.Acessando o menu IMPORTAR BENEFICIÁRIOS
    BeneficiariosCadastro.Gerar arquivo com 3 vidas  @{arg1}

# Importou o arquivo PF gerado
#     [Arguments]  @{arg1}
#     ContratosDetalhes.Importar o arquivo PF gerado
#     ContratosDetalhes.Clicando no link "Nome Contrato"    ${arg1[1]}
#     ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO    ${arg1[1]}

Importou o arquivo gerado 
    [Arguments]  @{arg1}
    ContratosDetalhes.Importar o arquivo gerado
    ContratosDetalhes.Clicando no link "Nome Contrato"    ${arg1[1]}
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO    ${arg1[1]}

Gerou um arquivo com 10 vidas
    [Arguments]  @{arg1}
    ContratosDetalhes.Acessando o menu IMPORTAR BENEFICIÁRIOS
    BeneficiariosCadastro.Gerar arquivo com 10 vidas  @{arg1}
    
Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Situação" INTEGRADO
    [Arguments]  @{arg1}
    Cadastrar Contrato PF (Movimentação Cadastral)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Situação" INTEGRADO (2 Vidas)
    [Arguments]  @{arg1}
    Cadastrar Contrato PF (Movimentação Cadastral - 2 Vidas)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (2 Vidas)
    [Arguments]  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - 2 Vidas)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO (2 Vidas)
    [Arguments]  @{arg1}
    Cadastrar Contrato CAEPF (Movimentação Cadastral - 2 Vidas)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO
    [Arguments]  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO
    [Arguments]  @{arg1}
    Cadastrar Contrato CAEPF (Movimentação Cadastral - 4 Vidas)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO (6 vidas)
    [Arguments]  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - 6 vidas - EXC INTEGRACAO AUTOMATICA)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (MOTIVO 42)
    [Arguments]  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - MOTIVO 42)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (4 Vidas)
    [Arguments]  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - 4 Vidas)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO (4 Vidas)
    [Arguments]  @{arg1}
    Cadastrar Contrato CAEPF (Movimentação Cadastral - 4 Vidas)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (4 Vidas - EXC INTEGRACAO AUTOMATICA)
    [Arguments]  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - 4 Vidas - EXC INTEGRACAO AUTOMATICA)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (10 vidas - EXC INTEGRACAO AUTOMATICA)
    [Arguments]  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - 10 vidas - EXC INTEGRACAO AUTOMATICA)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (6 vidas - EXC INTEGRACAO AUTOMATICA)
    [Arguments]  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - 6 vidas - EXC INTEGRACAO AUTOMATICA)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (6 vidas)
    [Arguments]  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - 6 vidas)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (10 vidas)
    [Arguments]  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - 10 vidas)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (10 vidas - Transferência de Grupo Familiar)
    [Arguments]  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - 10 vidas - Transferência de Grupo Familiar)  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - Transferência de Grupo Familiar)    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO (10 vidas - Transferência de Grupo Familiar)
    [Arguments]  @{arg1}
    Cadastrar Contrato CAEPF (Movimentação Cadastral - 10 vidas - Transferência de Grupo Familiar)  @{arg1}
    Cadastrar Contrato CAEPF (Movimentação Cadastral - Transferência de Grupo Familiar)    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO (10 vidas)
    [Arguments]  @{arg1}
    Cadastrar Contrato CAEPF (Movimentação Cadastral - 10 vidas)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}

Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos
    [Arguments]  ${arg1}
    ContratosDetalhes.Clicou em Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${arg1}

Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    ContratosDetalhes.Gerar uma Movimentação Cadastral de Exclusão de Beneficiário

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, com "Data de Exclusão" igual a DATA DE HOJE, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, com "Data de Exclusão" igual a DATA DE HOJE, informou um Telefone e e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 44 - ÓBITO, não alterou o campo "Data de Exclusão", "Data de Obito" igual a DATA DE ONTEM, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 44 - ÓBITO, não alterou o campo "Data de Exclusão", "Data de Obito" igual a DATA DE ONTEM, informou um Telefone e e-mail    @{arg1}
    
Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, com "Data de Exclusão" igual a DATA DE HOJE, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, com "Data de Exclusão" igual a DATA DE HOJE, informou um Telefone e e-mail    @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), não alterou o campo "Data de Exclusão", informou um Telefone e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), não alterou o campo "Data de Exclusão", informou um Telefone e e-mail    @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, não alterou o campo "Data de Exclusão", informou um Telefone e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, não alterou o campo "Data de Exclusão", informou um Telefone e e-mail    @{arg1}

CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    ConferenciaDetalhes.CRM deve atualizar tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"

Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO
    [Arguments]  @{arg1}
    ConferenciaDetalhes.Clicar no "Codigo/Identificar de Origem"
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    ContratosDetalhes.Clicou em Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${arg1[1]}
    ContratosDetalhes.Validar BENEFICIARIO excluido (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  ${arg1[32]}


Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual ATIVO
    [Arguments]  @{arg1}
    ConferenciaDetalhes.Clicar no "Codigo/Identificar de Origem"
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    ContratosDetalhes.Clicou em Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${arg1[1]}
    ContratosDetalhes.Validar BENEFICIARIO excluido (com Data de Exclusão igual a DATA ATUAL) e situação igual a ATIVO  ${arg1[32]}


Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO (Integrada Automaticamente)
    [Arguments]  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    ContratosDetalhes.Clicou em Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${arg1[1]}
    ContratosDetalhes.Validar BENEFICIARIO excluido (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  ${arg1[32]}


Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO
    [Arguments]  @{arg1}
    ConferenciaDetalhes.Clicar no "Codigo/Identificar de Origem"
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    ContratosDetalhes.Clicou em Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${arg1[1]}
    ContratosDetalhes.Validar BENEFICIARIO excluido (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  ${arg1[32]}


Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos
    [Arguments]  ${arg1}
    ContratosDetalhes.Clicar em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${arg1}

Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a SIM, que tenha Beneficiários Ativos
    [Arguments]  ${arg1}
    ContratosDetalhes.Clicar em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a SIM, que tenha Beneficiários Ativos  ${arg1}

Cadastrar Contrato PF (Movimentação Cadastral)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios   @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" INDIVIDUAL FAMILIAR, com 1 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Cadastrou Beneficiários que o CPF não exista no CADSUS, com e-mail    @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}


Cadastrar Contrato PF (Movimentação Cadastral) com 2 ou mais Beneficiarios
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios   @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" INDIVIDUAL FAMILIAR, com 1 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Cadastrou mais de 1 um Beneficiários que o CPF não exista no CADSUS, com e-mail    @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}



Cadastrar Contrato PF (Declaração de Saúde)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios   @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" INDIVIDUAL FAMILIAR, com 1 Produto Assistencial    @{arg1}
    Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Cadastrou Beneficiário Titular PF que o CPF não exista no CADSUS, com e-mail   @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}



Cadastrar Contrato PF (Movimentação Cadastral - 2 Vidas)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" INDIVIDUAL FAMILIAR, com 1 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um Contrato, preenchendo campos obrigatórios    @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 2 Vidas)    @{arg1}
    # Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 2 Vidas - Tranf Grupo Familiar)    @{arg1}
    # Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 2 Vidas - Teste)    @{arg1}
    Clicar no link "Nome Contrato"    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}

Cadastrar Contrato PJ (Movimentação Cadastral - 2 Vidas)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 2 Vidas)    @{arg1}
    Clicar no link "Nome Contrato"    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}


Cadastrar Contrato CAEPF (Movimentação Cadastral - 2 Vidas)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 2 Vidas)    @{arg1}
    Clicar no link "Nome Contrato"    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}


Cadastrar Contrato PJ (Movimentação Cadastral)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Cadastrou 3 Beneficiários PJ (1 Titular e 2 Dependentes) que o CPF não exista no CADSUS, com e-mail    @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}


Cadastrar Contrato PJ (Movimentação Cadastral - MOTIVO 42)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 10 Vidas)    @{arg1}
    Clicar no link "Nome Contrato"    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}


Cadastrar Contrato PJ (Movimentação Cadastral - 10 vidas)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 10 Vidas)    @{arg1}
    Clicar no link "Nome Contrato"    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}


Cadastrar Contrato PJ (Movimentação Cadastral - 10 vidas - Transferência de Grupo Familiar)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 10 Vidas)    @{arg1}
    Clicar no link "Nome Contrato"    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}



Cadastrar Contrato PJ (Movimentação Cadastral - Transferência de Grupo Familiar)
    [Arguments]  @{arg1}
    Cadastrou uma segunda Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma segunda Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma segunda Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude (Segundo Contrato)    @{arg1}
    # Cadastrou um segundo Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[32]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[32]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[32]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[32]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[32]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"

Cadastrar Contrato PF (Movimentação Cadastral - Transferência de Grupo Familiar)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 10 Vidas)    @{arg1}
    Clicar no link "Nome Contrato"    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}

Cadastrar Terceiro Contrato PJ (Movimentação Cadastral - Transferência de Grupo Familiar)
    [Arguments]  @{arg1}
    Cadastrou uma terceira Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma terceira Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma terceira Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude (Terceiro Contrato)    @{arg1}
    # Cadastrou um terceiro Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[71]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Terceiro Contrato em Conferência     ${arg1[71]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[71]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[71]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[71]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"


Cadastrar Contrato CAEPF (Movimentação Cadastral - 10 vidas - Transferência de Grupo Familiar)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 10 Vidas)    @{arg1}
    Clicar no link "Nome Contrato"    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}


Cadastrar Contrato CAEPF (Movimentação Cadastral - Transferência de Grupo Familiar)
    [Arguments]  @{arg1}
    Cadastrou uma segunda Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma segunda Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma segunda Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude (Segundo Contrato)    @{arg1}
    # Cadastrou um segundo Contrato, preenchendo campos obrigatórios     @{arg1}
    # Acessar menu IMPORTAR BENEFICIÁRIOS
    # Selecionar, validar e confirmar arquivo (Movimentação cadastral - 2 Vidas - Tranf Grupo Familiar)    @{arg1}
    # Clicar no link "Nome Contrato" do segundo contrato   ${arg1[31]}
    Apresentar a tela Contratos » com   ${arg1[32]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[32]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[32]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[32]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[32]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"


Cadastrar Terceiro Contrato CAEPF (Movimentação Cadastral - Transferência de Grupo Familiar)
    [Arguments]  @{arg1}
    Cadastrou uma terceira Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma terceira Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma terceira Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude (Terceiro Contrato)    @{arg1}
    # Cadastrou um terceiro Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[71]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Terceiro Contrato em Conferência     ${arg1[71]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[71]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[71]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[71]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"


Cadastrar Contrato PJ (Movimentação Cadastral - 10 vidas - EXC INTEGRACAO AUTOMATICA)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um Contrato, preenchendo campos obrigatórios – Integração automática (Sim)     @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 10 Vidas)    @{arg1}
    Clicar no link "Nome Contrato"    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}


Cadastrar Contrato PJ (Movimentação Cadastral - 6 vidas - EXC INTEGRACAO AUTOMATICA)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um Contrato, preenchendo campos obrigatórios – Integração automática (Sim)     @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 6 Vidas)    @{arg1}
    Clicar no link "Nome Contrato"    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}


Cadastrar Contrato PJ (Movimentação Cadastral - 6 vidas)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 6 Vidas)    @{arg1}
    Clicar no link "Nome Contrato"    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}


Cadastrar Contrato PJ (Movimentação Cadastral - 4 Vidas)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 4 Vidas)    @{arg1}
    Clicar no link "Nome Contrato"    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}


Cadastrar Segundo Contrato PJ (Movimentação Cadastral - 4 Vidas)
    [Arguments]  @{arg1}
    Cadastrou uma segunda Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma segunda Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma segunda Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um segundo Contrato, preenchendo campos obrigatórios     @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 4 Vidas - Segundo Contrato)    @{arg1}
    Clicar no link "Nome Contrato" do segundo contrato    ${arg1[31]}
    Apresentar a tela Contratos » com   ${arg1[31]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência  ${arg1[31]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[31]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[31]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[31]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  


Cadastrar Contrato CAEPF (Movimentação Cadastral - 4 Vidas)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 4 Vidas)    @{arg1}
    Clicar no link "Nome Contrato"    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}


Cadastrar Segundo Contrato CAEPF (Movimentação Cadastral - 4 Vidas)
    [Arguments]  @{arg1}
    Cadastrou uma segunda Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma segunda Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma segunda Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um segundo Contrato, preenchendo campos obrigatórios     @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 4 Vidas - Segundo Contrato)    @{arg1}
    Clicar no link "Nome Contrato" do segundo contrato    ${arg1[31]}
    Apresentar a tela Contratos » com   ${arg1[31]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência  ${arg1[31]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[31]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[31]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[31]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  


Cadastrar Contrato CAEPF (Movimentação Cadastral - 10 Vidas)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 10 Vidas)    @{arg1}
    Clicar no link "Nome Contrato"    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}


Cadastrar Contrato PJ (Movimentação Cadastral - 4 Vidas - EXC INTEGRACAO AUTOMATICA)
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um Contrato, preenchendo campos obrigatórios – Integração automática (Sim)     @{arg1}
    Acessar menu IMPORTAR BENEFICIÁRIOS
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 4 Vidas)    @{arg1}
    Clicar no link "Nome Contrato"    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Contrato em Conferência     @{arg1}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"  
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}



Cadastrou 3 Beneficiários PJ (1 Titular e 2 Dependentes) que o CPF não exista no CADSUS, com e-mail
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    #Cadastro Titular - Familia 1
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[13]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[11]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[12]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa  ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[26]}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Dependente - Familia 1
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[29]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[30]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[31]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[34]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa  ${arg1[28]}
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[33]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[32]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Carregar endereço do Titular
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[35]}
    Salvar o Beneficiário desejando incluir Novo Titular
    #Cadastro Titular - Familia 2
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[37]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[38]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[39]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[42]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa  ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[44]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[40]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[43]}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Dependente - Familia 2
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[45]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[46]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[47]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[50]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa  ${arg1[28]}
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[49]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[52]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[48]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Carregar endereço do Titular
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[51]}
    Salvar o Beneficiário não desejando incluir dependentes
    # Validação de Beneficiarios incluidos
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[1]}


Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, não alterou o campo "Data de Exclusão", informou um Telefone e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, não alterou o campo "Data de Exclusão", informou um Telefone e e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, com "Data de Exclusão" igual DATA ATUAL, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, com "Data de Exclusão" igual DATA DE HOJE, informou um Telefone e e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO, informou um Telefone e e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a PEDIDO DEMISSÃO, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a PEDIDO DEMISSÃO, informou um Telefone e e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?" igual a NÃO, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?" igual a NÃO, informou um Telefone e e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?" igual a SIM, "titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a NÃO, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?" igual a SIM, "titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a NÃO, informou um Telefone e e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a DEMISSÃO/EXONERAÇÃO SEM JUSTA CAUSA, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a NÃO, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a DEMISSÃO/EXONERAÇÃO SEM JUSTA CAUSA, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a NÃO, informou um Telefone e e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?" igual a SIM, "titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM, "Tempo de contribuição?" igual a 60, selecionou os Dependentes, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?" igual a SIM, "titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM, "Tempo de contribuição?" igual a 60, selecionou os Dependentes, telefone celular, e-mail, endereço    @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a DEMISSÃO/EXONERAÇÃO SEM JUSTA CAUSA, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM, "Tempo de contribuição?" igual a 60, selecionou os Dependentes, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a DEMISSÃO/EXONERAÇÃO SEM JUSTA CAUSA, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM, "Tempo de contribuição?" igual a 60, selecionou os Dependentes, telefone celular, e-mail, endereço    @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 44 - ÓBITO, "Data de Óbito" igual a DATA DE ONTEM, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 44 - ÓBITO, "Data de Óbito" igual a DATA DE ONTEM, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço    @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 44 - ÓBITO, "Data de Óbito" igual a DATA DE ONTEM, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 44 - ÓBITO, "Data de Óbito" igual a DATA DE ONTEM, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço    @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço    @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço    @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço    @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço    @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço    @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço    @{arg1}

Ativou o Agendador "Solicitação de Integração Automática"
    MenuSuperior.Ativar o Agendador "Conferência - Realizar conferência automática"
    MenuSuperior.Ativar o Agendador "Solicitação de Integração Automática"

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço    @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço    @{arg1}

Clicou no menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA"
    MovimentacaoCadastral.Clicar no menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA"

Atualizar a tela da Movimentação Cadastral, alterou a "Situação" para AGUARDANDO INTEGRAÇÃO AUTOMÁTICA
    MovimentacaoCadastral.Atualiza a tela da Movimentação Cadastral, alterou a "Situação" para AGUARDANDO INTEGRAÇÃO AUTOMÁTICA

Atualizar a tela da Movimentação Cadastral após 3 minutos"
    MovimentacaoCadastral.Atualiza a tela da Movimentação Cadastral após 3 minutos"
    MovimentacaoCadastral.Apresentar a tela Movimentação Cadastral »

CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado automaticamente"
    MovimentacaoCadastral.CRM atualiza a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado automaticamente"

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO, telefone celular, e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO, telefone celular, e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a PEDIDO DEMISSÃO, telefone celular, e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a PEDIDO DEMISSÃO, telefone celular, e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?" igual a NÃO, telefone celular, e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?" igual a NÃO, telefone celular, e-mail  @{arg1}


#### ERRRO AO ENCONTRAR KW CHAMDAS ####
Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, com "Data de Exclusão" de 1º dia do mês seguinte para DATA DE HOJE, telefone celular, e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, com "Data de Exclusão" de 1º dia do mês seguinte para DATA DE HOJE, telefone celular, e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, não alterou o campo "Data de Exclusão", telefone celular, e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, não alterou o campo "Data de Exclusão", telefone celular, e-mail  @{arg1}
#### ERRRO AO ENCONTRAR KW CHAMDAS ####

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), não alterou o campo "Data de Exclusão", telefone celular, e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), não alterou o campo "Data de Exclusão", telefone celular, e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail    @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail    @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, não alterou o campo "Data de Exclusão", telefone celular, e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, não alterou o campo "Data de Exclusão", telefone celular, e-mail    @{arg1}
 
Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, não alterou o campo "Data de Exclusão", informou um Telefone celular e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, não alterou o campo "Data de Exclusão", informou um Telefone celular e e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, com "Data de Exclusão" igual a DATA ATUAL, informou um Telefone celular e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, com "Data de Exclusão" igual a DATA ATUAL, informou um Telefone celular e e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", telefone celular, e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", telefone celular, e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 44 - ÓBITO, "Data de Óbito" igual a DATA DE ONTEM, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 44 - ÓBITO, "Data de Óbito" igual a DATA DE ONTEM, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 44 - ÓBITO, "Data de Óbito" igual a DATA DE ONTEM, não alterou o campo "Data de Exclusão", telefone celular, e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 44 - ÓBITO, "Data de Óbito" igual a DATA DE ONTEM, não alterou o campo "Data de Exclusão", telefone celular, e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, não alterou o campo "Data de Exclusão", telefone celular, e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, não alterou o campo "Data de Exclusão", telefone celular, e-mail     @{arg1}


Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail  @{arg1}

Gerou uma Movimentação Cadastral de Exclusão de Beneficiário RN412
    ContratosDetalhes.Gerar uma Movimentação Cadastral de Exclusão de Beneficiário RN412

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou um Telefone celular e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou um Telefone celular e e-mail    @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, telefone celular, e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, telefone celular, e-mail    @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou um Telefone e e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou um Telefone e e-mail
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou um Telefone e e-mail  @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, telefone celular, e-mail, endereço    @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, telefone celular, e-mail, endereço
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, telefone celular, e-mail, endereço    @{arg1}

CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    ConferenciaDetalhes.CRM deve atualizar tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"

Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    ConferenciaDetalhes.Painel "Solicitação de Integração" com registro "Integrada com Sucesso"

CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Integrado com sucesso"
    ConferenciaDetalhes.CRM deve atualizar tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Alteração" igual a EM 24 HORAS, selecionou novo produto
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Alteração" igual a EM 24 HORAS, selecionou novo produto    @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, informou "Alteração" igual a 1° DIA DO MÊS SEGUINTE, selecionou novo produto
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, informou "Alteração" igual a 1° DIA DO MÊS SEGUINTE, selecionou novo produto    @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Alteração" igual a EÚLTIMO DIA DO MÊS, selecionou novo produto
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Alteração" igual a EÚLTIMO DIA DO MÊS, selecionou novo produto    @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE, informou "Alteração" igual a ESPECIFICAR DATA, informar uma data diferente das citadas acima, selecionou novo produto
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE, informou "Alteração" igual a ESPECIFICAR DATA, informar uma data diferente das citadas acima, selecionou novo produto    @{arg1}

Gerou uma Movimentação Cadastral de Mudança de Produto
    ContratosDetalhes.Gerar uma Movimentação Cadastral de Mudança de Produto

CRM deve apresentar a mensagem de erro "A mudança de produto via movimentação cadastral é permitido apenas para Contratos Pessoa Jurídica."
    ContratosDetalhes.CRM apresenta a mensagem de erro "A mudança de produto via movimentação cadastral é permitido apenas para Contratos Pessoa Jurídica."
   
Contrato os BENEFICIÁRIO devem estar com produto alterado
    [Arguments]  @{arg1}
    ConferenciaDetalhes.Contrato BENEFICIÁRIO devem estar com produto alterado  @{arg1}

Gerou uma Movimentação Cadastral de Transferência de Grupo Familiar
    ContratosDetalhes.Gerar uma Movimentação Cadastral de Transferência de Grupo Familiar

Resultado query "SELECT EMP_MANTER_COD_BENEF FROM PARAMETRO_GERAL;" deve ser N
    DBCRMUnimed.Resultado da query "SELECT EMP_MANTER_COD_BENEF FROM PARAMETRO_GERAL;" deve ser N

Resultado query "SELECT EMP_MANTER_COD_BENEF FROM PARAMETRO_GERAL;" deve ser S
    DBCRMUnimed.Resultado da query "SELECT EMP_MANTER_COD_BENEF FROM PARAMETRO_GERAL;" deve ser S

CRM deve apresentar a mensagem de erro "A Transferência de Grupo Familiar via movimentação cadastral é permitida apenas para Contratos Pessoa Jurídica."
    ContratosDetalhes.CRM apresenta a mensagem de erro "A Transferência de Grupo Familiar via movimentação cadastral é permitida apenas para Contratos Pessoa Jurídica."

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a EM 24 HORAS, selecionou o Contrato Destino, selecionou produto Assistencial e Acessório
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a EM 24 HORAS, selecionou o Contrato Destino, selecionou produto Assistencial e Acessório    @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a 1° DIA DO MÊS SEGUINTE, selecionou o Contrato Destino, selecionou produto Assistencial
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a 1° DIA DO MÊS SEGUINTE, selecionou o Contrato Destino, selecionou produto Assistencial    @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a EÚLTIMO DIA DO MÊS, selecionou o Contrato Destino, selecionou produto Assistencial e Acessório
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a EÚLTIMO DIA DO MÊS, selecionou o Contrato Destino, selecionou produto Assistencial e Acessório    @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a ESPECIFICAR DATA, informar uma data diferente das citadas acima, selecionou o Contrato Destino, selecionou produto Assistencial
    [Arguments]  @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR (com Dependentes), informou "Transferência" igual a ESPECIFICAR DATA, informar uma data diferente das citadas acima, selecionou o Contrato Destino, selecionou produto Assistencial    @{arg1}

Clicou no botão "CONFERIR" da Movimentação Cadastral de Transferência de Grupo Familiar em Conferência
    [Arguments]  @{arg1}
    ConferenciaPesquisa.Clicar Encaminhado para aprovação - Decrescente
    ConferenciaPesquisa.Clicar em Conferir exclusão de beneficiario    ${arg1[1]}

Contrato Origem os BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO
    [Arguments]  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato Origem cadastrado  ${arg1[1]}
    ContratosDetalhes.Clicou em Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${arg1[1]}
    ContratosDetalhes.Validar Beneficiarios do Contrato Origem e Contrato Destino (10 Vidas)  @{arg1}
    ContratosDetalhes.Contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO  @{arg1}


Contrato Origem os BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO (Canal)
    [Arguments]  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato Origem cadastrado  ${arg1[1]}
    ContratosDetalhes.Clicou em Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${arg1[1]}
    ContratosDetalhes.Validar Beneficiarios do Contrato Origem e Contrato Destino (2 Vidas)  @{arg1}
    ContratosDetalhes.Contrato Origem BENEFICIÁRIO transferidos devem estar com a situação igual a CANCELADO (Canal)  @{arg1}


Contrato Destino os BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO
    [Arguments]  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato Destino cadastrado  ${arg1[31]}
    ContratosDetalhes.Clicou em Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${arg1[31]}
    ContratosDetalhes.Validar Beneficiarios do Contrato Origem e Contrato Destino (10 Vidas)  @{arg1}
    ContratosDetalhes.Contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO  @{arg1}

Contrato Destino os BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO (Canal)
    [Arguments]  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato Destino cadastrado  ${arg1[31]}
    ContratosDetalhes.Clicou em Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${arg1[31]}
    ContratosDetalhes.Validar Beneficiarios do Contrato Origem e Contrato Destino (2 Vidas)  @{arg1}
    ContratosDetalhes.Contrato Destino BENEFICIÁRIO transferidos devem existir e estar com a situação igual a ATIVO (Canal)  @{arg1}


Contrato Origem os BENEFICIÁRIO transferidos não devem ser apresentados
    [Arguments]  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato Origem cadastrado  ${arg1[1]}
    ContratosDetalhes.Clicou em Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${arg1[1]}
    ContratosDetalhes.Contrato Origem BENEFICIÁRIO transferidos não devem ser apresentados  @{arg1}

Gerou uma Movimentação Cadastral de Cancelamento de Contrato
    ContratosDetalhes.Gerar uma Movimentação Cadastral de Cancelamento de Contrato

Clicou no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    MovimentacaoCadastral.Clicar no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"

Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou "Data de Cancelamento" com data e hora atual
    MovimentacaoCadastral.Selecionar "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou "Data de Cancelamento" com data e hora atual

Contrato, o campo "Data de Exclusão" preenchido com a data informada, hora zerada, com a "situação" do Contrato e dos Beneficiários igual a CANCELADO
    [Arguments]  ${arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    ContratosDetalhes.Clicou em Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${arg1[1]}
    ContratosDetalhes.Contrato, campo "Data de Exclusão" preenchido com a data informada, hora zerada, com a "situação" do Contrato e dos Beneficiários igual a CANCELADO  ${arg1}
    ContratosDetalhes.Consulta por Codigo Contrato se a Conta, Contrato e Beneficiários estão excluidos

Ativou o Agendador "CONTRATO Sincronização"
    MenuSuperior.Ativar o Agendador "CONTRATO Sincronização"

Selecionou "Motivo" 44 - ÓBITO, informou "Data de Cancelamento" com data e hora de amanha, "Data de Obito" igual a DATA DE ONTEM
    MovimentacaoCadastral.Selecionar "Motivo" 44 - ÓBITO, informou "Data de Cancelamento" com data e hora de amanha, "Data de Obito" igual a DATA DE ONTEM

Contrato, o campo "Data de Exclusão" preenchido com a data informada, com a "situação" do Contrato igual a INTEGRADO e dos Beneficiários igual a ATIVO
    [Arguments]  ${arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    ContratosDetalhes.Clicou em Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${arg1[1]}
    ContratosDetalhes.Contrato, campo "Data de Exclusão" preenchido com a data informada, com a "situação" do Contrato igual a INTEGRADO e dos Beneficiários igual a ATIVO    ${arg1}
    ContratosDetalhes.Consulta por Codigo Contrato se a Conta, Contrato e Beneficiários estão excluidos

Clicou no botão "CONFERIR" da Movimentação Cadastral de Cancelamento de Contrato em Conferência
    [Arguments]  @{arg1}
    ConferenciaPesquisa.Clicar Encaminhado para aprovação - Decrescente
    ConferenciaPesquisa.Clicar em Conferir exclusão de beneficiario    ${arg1[1]}

# Clicou no botão "CONFERIR" do Contrato em Conferência
#     [Arguments]  @{arg1}
#     ConferenciaPesquisa.Clicar Encaminhado para aprovação - Decrescente
#     ConferenciaPesquisa.Clicar em Conferir exclusão de beneficiario    ${arg1[1]}

Selecionou "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, informou "Data de Cancelamento" com data e hora atual
    MovimentacaoCadastral.Selecionar "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, informou "Data de Cancelamento" com data e hora atual

Selecionou "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), informou "Data de Cancelamento" com data e hora atual
    MovimentacaoCadastral.Selecionar "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), informou "Data de Cancelamento" com data e hora atual

Selecionou "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, informou "Data de Cancelamento" com data e hora atual
    MovimentacaoCadastral.Selecionar "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, informou "Data de Cancelamento" com data e hora atual

Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), sem Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" INDIVIDUAL FAMILIAR, com 1 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    




Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    ContratosDetalhes.Gerar uma Movimentação Cadastral de Inclusão de Beneficiários

Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), sem Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}

Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), sem Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}

Gerou um arquivo com 3 vidas e Importar o arquivo gerado
    [Arguments]  @{arg1}
    Importar arquivo - Inclusão Beneficiario
    Selecionando, validando e confirmando o arquivo (Movimentação cadastral - 3 Vidas - Inclusão Beneficiario)  @{arg1}
    ContratosDetalhes.Clicar no Link "Movimentação Cadastral"

Gerou um arquivo com 10 vidas e Importar o arquivo gerado
    [Arguments]  @{arg1}
    Importar arquivo - Inclusão Beneficiario
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 10 Vidas)  @{arg1}
    ContratosDetalhes.Clicar no Link "Movimentação Cadastral"

No Contrato os BENEFICIÁRIO incluidos (Importação - 3 Vidas)
    [Arguments]  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    ContratosDetalhes.No Contrato BENEFICIÁRIO incluidos (Importação - 3 Vidas)  @{arg1}

No Contrato os BENEFICIÁRIO incluidos (Importação - 10 Vidas)
    [Arguments]  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    ContratosDetalhes.No Contrato BENEFICIÁRIO incluidos (Importação - 10 Vidas)  @{arg1}

No Contrato os BENEFICIÁRIO incluidos (Importação Sem Portabilidade - 4 Vidas)
    [Arguments]  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    ContratosDetalhes.No Contrato BENEFICIÁRIO incluidos (Importação - 4 Vidas)  @{arg1}

No Contrato os BENEFICIÁRIO incluidos (Importação Sem Portabilidade - 8 Vidas)
    [Arguments]  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    ContratosDetalhes.No Contrato BENEFICIÁRIO incluidos (Importação - 8 Vidas)  @{arg1}

No Contrato os BENEFICIÁRIO incluidos (Importação Sem Portabilidade - 9 Vidas)
    [Arguments]  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    ContratosDetalhes.No Contrato BENEFICIÁRIO incluidos (Importação - 9 Vidas)  @{arg1}

No Contrato os BENEFICIÁRIO incluidos (Importação Portabilidade - 4 Vidas)
    [Arguments]  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    ContratosDetalhes.No Contrato BENEFICIÁRIO incluidos (Importação Portabilidade - 4 Vidas)  @{arg1}

Desmarcar Processo de Declaração de Saude (Movimenta cadastral)
    [Arguments]  @{arg1}
    DeclaracaoSaudeDetalhes.Verificar Página Processo de Declaração de Saúde com   ${arg1[1]}
    DeclaracaoSaudeDetalhes.Clicar no Botão Editar Processo de Declaração de Saude
    DeclaracaoSaudeDetalhes.Selecionar Checkbox Dispensar Validação de Declaração de Saúde
    DeclaracaoSaudeDetalhes.Selecionar o Motivo Dispensa DS
    DeclaracaoSaudeDetalhes.Preencher o Complemento do Motivo
    DeclaracaoSaudeDetalhes.Clicar em SALVAR declaração de saude
    DeclaracaoSaudeDetalhes.Acessando o menu FINALIZAR DECLARACAO DE SAUDE
    DeclaracaoSaudeDetalhes.Validar Status Concluido
    DeclaracaoSaudeDetalhes.Clicar no link "Movimentação Cadastral" do processo de declaração de saude

Validar que a coluna "Data Base Carência" foi preenchido
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Validar que coluna "Data Base Carência" foi preenchido  ${arg1[0]}

Cadastrou 1 (UM) Beneficiário TITULAR, com "Início vigência" igual a EM 24 HORAS  
    [Arguments]    @{arg1}
    Importar arquivo - Inclusão Beneficiario
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR, com "Início vigência" igual a EM 24 HORAS  @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE
    [Arguments]    @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE Conjuge, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE  @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS
    [Arguments]    @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE Filho, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS  @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS
    [Arguments]    @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS  @{arg1}
    ContratosDetalhes.Escolher o arquivo para importar (INTEG MOV INCLUSÃO CRM)
    ContratosDetalhes.Clicar no Link "Movimentação Cadastral"

Cadastrou 1 (UM) Beneficiário TITULAR, com "Início vigência" igual a EM 24 HORAS (COLETIVO POR ADESÃO)
    [Arguments]    @{arg1}
    Importar arquivo - Inclusão Beneficiario
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR, com "Início vigência" igual a EM 24 HORAS  @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE (COLETIVO POR ADESÃO)
    [Arguments]    @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE Conjuge, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE  @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS (COLETIVO POR ADESÃO)
    [Arguments]    @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE Filho, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS  @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS (COLETIVO POR ADESÃO)
    [Arguments]    @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS  @{arg1}
    ContratosDetalhes.Escolher o arquivo para importar (INTEG MOV INCLUSÃO CRM - COLETIVO POR ADESÃO)
    ContratosDetalhes.Clicar no Link "Movimentação Cadastral"

Validar que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Validar que coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)  @{arg1}

Gerou uma Solicitação de Portabilidade
    [Arguments]    @{arg1}
    Clicar no link "Nome Oportunidade"    ${arg1[1]}
    Usuário clicar no menu "Criar Portabilidade"
    Clicar no botão "Salvar"

Cadastrou duas Pessoas Titular e Conjuge
    [Arguments]    @{arg1}
    Clicou no botão "Criar" painel Pessoa(Portabilidade)
    Cadastrar uma Pessoa "Titular" (INTEG MOV INCLUSÃO CRM)  @{arg1}
    Anexou um arquivo no painel documento
    CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL

    Clicou no botão "Criar" painel Pessoa(Portabilidade)
    Cadastrar uma Pessoa "Dependente" (INTEG MOV INCLUSÃO CRM)  @{arg1}
    Anexou um arquivo no painel documento
    CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL


Aprovou a Portabilidade APTO(A) (INTEG MOV INCLUSÃO CRM)
    Clicou no menu "Encaminhar para Validação"
    Confirmou o encaminhamento
    Clicou no botão "Validar"
    Clicou na aba "Checklist da Documentação"
    Selecionou a opção "Presente" e clicou no botão "Salvar"


Aprovou a Portabilidade APTO(A) PARCIAL (INTEG MOV INCLUSÃO CRM)
    Clicou no botão "Validar" segundo Beneficiario
    Clicou na aba "Checklist da Documentação"
    Selecionou a opção "Presente" e clicou no botão "Salvar"
    Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    Confirmou a solicitação
    Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    Voltou para aba da "Portabilidade"


Encaminhar para Analise Portabilidade APTO(A) (INTEG MOV INCLUSÃO CRM)
    Clicou no menu "Encaminhar para Análise"
    Confirmou a validação do documento
    Clicou no botão "Analisar"
    Clicou na aba "Questionário Elegibilidade"
    Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, NÃO, SIM
    Clicou no botão "Salvar"


Encaminhar para Analise Portabilidade APTO(A) PARCIAL (INTEG MOV INCLUSÃO CRM)
    Clicou no botão "Analisar" segundo beneficiario
    Clicou na aba "Questionário Elegibilidade"
    Preencher o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM
    Clicou no botão "Salvar"


Finalizou a Portabilidade com Titular Aprovado Total e Dependente Aprovado Parcial
    [Arguments]    @{arg1}
    Aprovou a Portabilidade APTO(A) (INTEG MOV INCLUSÃO CRM)
    Aprovou a Portabilidade APTO(A) PARCIAL (INTEG MOV INCLUSÃO CRM)
    Encaminhar para Analise Portabilidade APTO(A) (INTEG MOV INCLUSÃO CRM)
    Encaminhar para Analise Portabilidade APTO(A) PARCIAL (INTEG MOV INCLUSÃO CRM)
    Usuário clicar no menu "Finalizar Protocolo"
    Confirmar a finalização
    CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}


Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO POR ADESÃO, sem Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}

Cadastrou 1 (UM) Beneficiário TITULAR, com Portabilidade, com "Início vigência" igual a EM 24 HORAS
    [Arguments]    @{arg1}
    Importar arquivo - Inclusão Beneficiario
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR, com Portabilidade, com "Início vigência" igual a EM 24 HORAS    @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, com Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE
    [Arguments]    @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE Conjuge, com Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE   @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS
    [Arguments]    @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE Filho, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS   @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR, sem Portabilidade, com "Início vigência" igual a EM 24 HORAS
    [Arguments]    @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR, sem Portabilidade, com "Início vigência" igual a EM 24 HORAS   @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, sem Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE
    [Arguments]    @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE Conjuge, sem Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE  @{arg1}
 
Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS
    [Arguments]    @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS    @{arg1}
    ContratosDetalhes.Escolher o arquivo para importar (INTEG MOV INCLUSÃO CRM)
    ContratosDetalhes.Clicar no Link "Movimentação Cadastral"

Validar que a coluna "Data Base Carência" foi preenchida da seguinte forma: Titular foi preenchido com a "Data Inicio Vigência" - 301 dias, Conjuge com a coluna "Data Base Carência" vazia, Filhos (normal, estudante, especial, recem nato, adotivo) com a coluna "Data Base Carência" igual a "Data Inicio Vigência"
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Validar a coluna "Data Base Carência" foi preenchida da seguinte forma:  @{arg1}

Finalizou a Portabilidade com Titular Aprovado Parcial e Dependente Aprovado Total
    [Arguments]    @{arg1}
    Aprovou a Portabilidade APTO(A) (INTEG MOV INCLUSÃO CRM)
    Aprovou a Portabilidade APTO(A) PARCIAL (INTEG MOV INCLUSÃO CRM)
    Encaminhar para Analise Portabilidade APTO(A) (INTEG MOV INCLUSÃO CRM)
    Encaminhar para Analise Portabilidade APTO(A) PARCIAL (INTEG MOV INCLUSÃO CRM)
    Usuário clicar no menu "Finalizar Protocolo"
    Confirmar a finalização
    CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}

Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), "Tipo de Contratação" igual a COLETIVO POR ADESÃO, sem Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência  ${arg1[1]}
    # Clicou no botão "CONFERIR" do Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}

Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}

Editou o Contrato, desmarcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS)
    ContratosDetalhes.Editar o Contrato, desmarcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS)

Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}

Editou o Contrato, com campo "Beneficiários - Inclusões sem carência" igual a SIM
    ContratosDetalhes.Editou Contrato, com campo "Beneficiários - Inclusões sem carência" igual a SIM

Cadastrou 1 (UM) Beneficiário TITULAR, com Portabilidade, com "Início vigência" igual a EM 24 HORAS (Primeira Familia)
    [Arguments]    @{arg1}
    Importar arquivo - Inclusão Beneficiario
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR, com Portabilidade, com "Início vigência" igual a EM 24 HORAS (Primeira Familia)    @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, com Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE (Primeira Familia)
    [Arguments]    @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE Conjuge, com Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE (Primeira Familia)   @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS (Primeira Familia)
    [Arguments]    @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE Filho, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS (Primeira Familia)   @{arg1}

Cadastrou 1 (UM) Beneficiário TITULAR, sem Portabilidade, com "Início vigência" igual a EM 24 HORAS (Segunda Familia)
    [Arguments]    @{arg1}
    Importar segundo arquivo - Inclusão Beneficiario
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário TITULAR, sem Portabilidade, com "Início vigência" igual a EM 24 HORAS (Segunda Familia)    @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, sem Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE (Segunda Familia)
    [Arguments]    @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE Conjuge, sem Portabilidade, com "Início vigência" igual a 1º DIA DO MÊS SEGUINTE (Segunda Familia)   @{arg1}

Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS (Segunda Familia)
    [Arguments]    @{arg1}
    ContratosDetalhes.Cadastrar 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, sem Portabilidade, com "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS (Segunda Familia)    @{arg1}
    ContratosDetalhes.Escolher o arquivo para importar (INTEG MOV INCLUSÃO CRM - Segunda Familia)
    ContratosDetalhes.Clicar no Link "Movimentação Cadastral"

Validar que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" - 301 DIAS para todos os dependentes
    Log    Validação do preenchimento da coluna de carência ainda não foi implementada.  WARN
    No Operation

Editou o Contrato, com campo "Beneficiários - Inclusões sem carência" VAZIO, selecionando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS), preenchendo a coluna TITULAR com o valor 10 e DEPENDENTE com o valor 20
    ContratosDetalhes.Editar o Contrato, com campo "Beneficiários - Inclusões sem carência" VAZIO, selecionando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS), preenchendo a coluna TITULAR com o valor 10 e DEPENDENTE com o valor 20

Validar que a coluna "Data Base Carência" foi preenchida da seguinte forma:
    MovimentacaoCadastral.Validar que coluna "Data Base Carência" foi preenchida da seguinte forma

Beneficiário com Portabilidade Total deve gravar DATA DE VIGENCIA - 301 dias
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Validar Beneficiário com Portabilidade Total deve gravar DATA DE VIGENCIA - 301 dias

Beneficiário sem Portabilidade Total deve validar:
    MovimentacaoCadastral.Validar Beneficiário sem Portabilidade Total deve validar

Se DataMovimentação - DataAdmissão for menor ou igual a DiasParamTitular deve gravar DATA DE VIGENCIA - 301 dias
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Validar Se DataMovimentação - DataAdmissão for menor ou igual a DiasParamTitular deve gravar DATA DE VIGENCIA - 301 dias

Se DataMovimentação - DataAdmissão for maior que DiasParamTitular deve gravar DATA DE VIGENCIA
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Validar Se DataMovimentação - DataAdmissão for maior que DiasParamTitular deve gravar DATA DE VIGENCIA
 
Cadastrou os seguintes Beneficiários:
    Importar arquivo - Inclusão Beneficiario

Titular com "Data Admissão Empresa" menor que 10 dias da data atual
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Titular com a "Data Admissão Empresa" menor que 10 dias da data atual  @{arg1}

Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular menor que 10 dias da data atual
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Dependente Conjuge e Filho com a "Data Admissão Empresa" do Titular menor que 10 dias da data atual  @{arg1}

Titular com "Data Admissão Empresa" igual a 10 dias da data atual
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Titular com a "Data Admissão Empresa" igual a 10 dias da data atual  @{arg1}

Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular igual a 10 dias da data atual "Data Base de Carência" igual a Data Início Vigência – 301 Dias
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Dependente Conjuge e Filho com a "Data Admissão Empresa" do Titular igual a 10 dias da data atual "Data Base de Carência" igual a Data Início Vigência – 301 Dias  @{arg1}

Titular com "Data Admissão Empresa" maior que 10 dias da data atual
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Titular com a "Data Admissão Empresa" maior que 10 dias da data atual  @{arg1}

Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular maior que 10 dias da data atual
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Dependente Conjuge e Filho com a "Data Admissão Empresa" do Titular maior que 10 dias da data atual  @{arg1}
    ContratosDetalhes.Escolher o arquivo para importar (INTEG MOV INCLUSÃO CRM - 9 Vidas)
    ContratosDetalhes.Clicar no Link "Movimentação Cadastral"

Validar que a coluna "Data Base Carência" foi preenchido da seguinte forma: (9 Vidas)
    MovimentacaoCadastral.Validar que coluna "Data Base Carência" foi preenchido da seguinte forma: (9 Vidas)

Titular com "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA
    [Arguments]  @{arg1}
    MovimentacaoCadastral.Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA      @{arg1}

Dependente com "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA
    [Arguments]  @{arg1}
    MovimentacaoCadastral.Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) menor e igual a 10 dias --> SEM CARENCIA      @{arg1}

Titular com "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA
    [Arguments]  @{arg1}
    MovimentacaoCadastral.Titular com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA      @{arg1}

Dependente com "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA
    [Arguments]  @{arg1}
    MovimentacaoCadastral.Dependente com a "Data Admissão Empresa" igual data atual (Data Movimentação) maior que 10 dias --> COM CARENCIA      @{arg1}

Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, com um Beneficiário TITULAR
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Cadastrou Beneficiário Titular PJ que o CPF não exista no CADSUS, com e-mail   @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}

Cadastrou Beneficiário Titular PJ que o CPF não exista no CADSUS, com e-mail
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    #Cadastro Titular
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[13]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[38]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[12]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa  ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[26]}
    Salvar o Beneficiário não desejando incluir dependentes
    # Validação de Beneficiarios incluidos
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[1]}


Cadastrou Beneficiário Titular CAEPF que o CPF não exista no CADSUS, com e-mail
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    #Cadastro Titular
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[13]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[38]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[12]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa  ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[26]}
    Salvar o Beneficiário não desejando incluir dependentes
    # Validação de Beneficiarios incluidos
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[1]}



Cadastrou Beneficiário Titular PF que o CPF não exista no CADSUS, com e-mail
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    #Cadastro Titular
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[13]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[38]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[12]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[26]}
    Salvar o Beneficiário não desejando incluir dependentes
    # Validação de Beneficiarios incluidos
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1[1]}


Editou o Contrato, com campo "Beneficiários - Inclusões sem carência" igual a NÃO, selecionando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS), preenchendo a coluna TITULAR com o valor 10 e DEPENDENTE com o valor 20
    ContratosDetalhes.Editar o Contrato, com campo "Beneficiários - Inclusões sem carência" igual a NÃO, selecionando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS), preenchendo a coluna TITULAR com o valor 10 e DEPENDENTE com o valor 20

Dependente Conjuge com "Data Certidão de Casamento" maior que 10 dias da data atual
    [Arguments]  @{arg1}
    MovimentacaoCadastral.Dependente Conjuge com a "Data Certidão de Casamento" maior que 10 dias da data atual  @{arg1}

Dependente Filho com "Data de Nascimento" igual a 10 dias da data atual
    [Arguments]  @{arg1}
    MovimentacaoCadastral.Dependente Filho com a "Data de Nascimento" igual a 10 dias da data atual  @{arg1}

Dependente Filho Adotivo com "Data da Adoção" menor que 10 dias da data atual
    [Arguments]  @{arg1}
    MovimentacaoCadastral.Dependente Filho Adotivo com a "Data da Adoção" menor que 10 dias da data atual  @{arg1}
    ContratosDetalhes.Escolher o arquivo para importar (INTEG MOV INCLUSÃO CRM - 3 Vidas)
    ContratosDetalhes.Clicar no Link "Movimentação Cadastral"

Validar que a coluna "Data Base Carência" foi preenchido da seguinte forma: (3 Vidas)
    MovimentacaoCadastral.Validar que coluna "Data Base Carência" foi preenchido da seguinte forma: (3 Vidas)

Se "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for menor ou igual a 10, então a "Data Base de Carência" é igual a Data Início Vigência – 301 Dias
    [Arguments]  @{arg1}
    MovimentacaoCadastral.Se a "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for menor ou igual a 10, então a "Data Base de Carência" é igual a Data Início Vigência – 301 Dias  @{arg1}

Se "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for maior que 10, então a "Data Base de Carência" é igual a Data Início Vigência
    [Arguments]  @{arg1}
    MovimentacaoCadastral.Se a "Data Certidão de Casamento", "Data de Nascimento" ou "Data da Adoção" for maior que 10, então a "Data Base de Carência" é igual a Data Início Vigência  @{arg1}

Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, com um Beneficiário TITULAR
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Cadastrou Beneficiário Titular PJ que o CPF não exista no CADSUS, com e-mail   @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}


Realizou a integração de uma Movimentação Cadastral de Inclusão de Beneficiário, com um Titular
    [Arguments]    @{arg1}
    Gerou uma Movimentação Cadastral de Inclusão de Beneficiários
    Cadastrou os seguintes Beneficiários:
    MovimentacaoCadastral.Realizou integração de uma Movimentação Cadastral de Inclusão de Beneficiário, com um Titular  @{arg1}
    ContratosDetalhes.Clicar no Link "Movimentação Cadastral"
    MovimentacaoCadastral.Pegar ID da url de movimentação e do Titular  ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}

Executou as querys para alterar as datas de criação da Movimentação e Titular
    DBCRMUnimed.Executou querys para alterar as datas de criação da Movimentação e Titular

Dependente Filho com "Data Admissão Empresa" a menos 9 dias da data atual e "Data de Vinculo" igual a menos 31 dias da data atual
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Dependente Filho com a "Data Admissão Empresa" a menos 9 dias da data atual e "Data de Vinculo" igual a menos 31 dias da data atual  @{arg1}

Dependente Filho Adotivo com "Data Admissão Empresa" a menos 10 dias da data atual e "Data de Vinculo" igual a menos 30 dias da data atual
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Dependente Filho Adotivo com a "Data Admissão Empresa" a menos 10 dias da data atual e "Data de Vinculo" igual a menos 30 dias da data atual  @{arg1}

Dependente Conjuge com "Data Admissão Empresa" a menos 11 dias da data atual e "Data de Vinculo" igual a menos 30 dias da data atual
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Dependente Conjuge com a "Data Admissão Empresa" a menos 11 dias da data atual e "Data de Vinculo" igual a menos 30 dias da data atual   @{arg1}

Dependente Filho com "Data Admissão Empresa" a menos 10 dias da data atual e "Data de Vinculo" igual a menos 29 dias da data atual
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Dependente Filho com a "Data Admissão Empresa" a menos 10 dias da data atual e "Data de Vinculo" igual a menos 29 dias da data atual   @{arg1}

Dependente Conjuge com "Data Admissão Empresa" a menos 20 dias da data atual e "Data de Vinculo" igual a menos 29 dias da data atual
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Dependente Conjuge com a "Data Admissão Empresa" a menos 20 dias da data atual e "Data de Vinculo" igual a menos 29 dias da data atual   @{arg1}

Dependente Filho com "Data Admissão Empresa" a menos 21 dias da data atual e "Data de Vinculo" igual a menos 19 dias da data atual
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Dependente Filho com a "Data Admissão Empresa" a menos 21 dias da data atual e "Data de Vinculo" igual a menos 19 dias da data atual   @{arg1}

Dependente Filho Adotivo com "Data Admissão Empresa" a menos 21 dias da data atual e "Data de Vinculo" igual a menos 20 dias da data atual
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Dependente Filho Adotivo com a "Data Admissão Empresa" a menos 21 dias da data atual e "Data de Vinculo" igual a menos 20 dias da data atual   @{arg1}

Dependente Conjuge com "Data Admissão Empresa" a menos 21 dias da data atual e "Data de Vinculo" igual a menos 21 dias da data atual
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Dependente Conjuge com a "Data Admissão Empresa" a menos 21 dias da data atual e "Data de Vinculo" igual a menos 21 dias da data atual   @{arg1}
    ContratosDetalhes.Escolher o arquivo para importar (INTEG MOV INCLUSÃO CRM - 8 Dependentes)
    ContratosDetalhes.Clicar no Link "Movimentação Cadastral"

Validar que a coluna "Data Base Carência" foi preenchido da seguinte forma: (8 Vidas)
    MovimentacaoCadastral.Validar que coluna "Data Base Carência" foi preenchido da seguinte forma: (8 Vidas)

Dependente Filho com Data Base Carencia igual a Data de vigência - 301 dias
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Dependente Filho com a Data Base Carencia igual a Data de vigência - 301 dias  @{arg1}

Dependente Filho adotivo com Data Base Carencia igual a Data de vigência - 301 dias
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Dependente Filho adotivo com a Data Base Carencia igual a Data de vigência - 301 dias  @{arg1}

Dependente Conjuge com Data Base Carencia igual a Data de vigência
    [Arguments]    @{arg1}
    MovimentacaoCadastral.Dependente Conjuge com a Data Base Carencia igual a Data de vigência  @{arg1}

Selecionou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    MenuSuperior.Colocar o mouse no Parametros
    MenuSuperior.Clicar no submenu Parametros Comerciais
    ParametrosComerciais.Verificar Página Parametros Comerciais
    ParametrosComerciais.Clicar no menu Comercializacao
    ParametrosComerciais.Validar Checkbox "Criar automaticamente Processo de Declaração de Saúde"


Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 4 e demais campos obrigatórios
    [Arguments]    @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[3]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[4]}
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[1]}


Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 15 e demais campos obrigatórios
    [Arguments]    @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[3]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[4]}
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[1]}


Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 30 e demais campos obrigatórios
    [Arguments]    @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[3]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[4]}
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[1]}

Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 2 e demais campos obrigatórios
    [Arguments]    @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[3]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[4]}
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[1]}

Cadastrou uma Cotação, com "Tipo de Contratração" igual a INDIVIDUAL FAMILIAR
    [Arguments]    @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Individual Familiar
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
        
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}

Cadastrou uma Cotação, com "Tipo de Contratração" igual a COLETIVO EMPRESARIAL
    [Arguments]    @{arg1}
    Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Apresentar a Tela de Cadastro de Cotação
    Editar campo "Fase da Cotação" igual a  ${arg1[8]}
    Selecionar campo "Tipo de Contratação" com  Coletivo Empresarial
    IF    $arg1[6] == ''
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[7]}
    ELSE
        Selecionar um Produto Assistencial do Potencial PF com  ${arg1[6]}
        
    END
    Preencher os Campos de Faixa Etária com Número de Vidas  ${arg1[3]}
    Clicar em Aprovar a Cotação
    Clicar em Salvar a Cotação
    Clicar Sim na Modal de Confirmação
    Apresentar a tela Cotação » com  ${arg1[1]}

Preencheu automaticamente o campo "Processo de Declaração de Saúde"
    [Arguments]    ${arg1}
    CotacoesDetalhes.Preencher automaticamente o campo "Processo de Declaração de Saúde"  ${arg1}
                    
Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    ContratosDetalhes.Selecionou automaticamente campo "Necessita Validar Declaração de Saúde?"

Não Selecionou automaticamente o campo "Necessita Validar Declaração de Saúde?"
    ContratosDetalhes.Não Selecionou automaticamente campo "Necessita Validar Declaração de Saúde?"

Cadastrou um Beneficiário Titular, com mesmo CPF do Potencial Cliente
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[2]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[13]}
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[14]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[16]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[17]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[18]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[19]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[21]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[23]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[24]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[25]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[26]}

Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    BeneficiariosCadastro.Apresentou mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"

Salvou o Beneficiário não desejando incluir dependentes
    Salvar o Beneficiário não desejando incluir dependentes

Salvou o Beneficiário desejando incluir dependentes
    BeneficiariosCadastro.Clicar em Salvar Beneficiários
    BeneficiariosCadastro.Validar mensagem Salvar Beneficiarios
    Nome diferente do sistema DATASUS
    BeneficiariosCadastro.Salvar Beneficiário desejando incluir dependentes

Cadastrou dois Beneficiários Dependentes
    [Arguments]  @{arg1}
    #Cadastro Dependente - Familia 1
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[38]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[39]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[40]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[43]}
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[42]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[45]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[17]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[18]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[41]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[21]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[23]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[24]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[25]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[26]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[44]}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Dependente - Familia 1
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[46]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[47]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[48]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[51]}
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[50]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[53]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[17]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[18]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[49]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[21]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[23]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[24]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[25]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[26]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[52]}

Clicou no link "Cotação"
    [Arguments]    ${arg1}
    # Validação de Beneficiarios incluidos
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1}
    ContratosDetalhes.Clicar no link "Cotação"

Clicou no menu "INICIAR PROCESSO DE DECLARAÇÃO DE SAÚDE"
    CotacoesDetalhes.Clicar no menu "INICIAR PROCESSO DE DECLARAÇÃO DE SAÚDE"

Preencher o campo "Nome" e clicou no botão "SALVAR"
    [Arguments]    ${arg1}
    DeclaracaoSaudeDetalhes.Preencher campo "Nome" e clicou no botão "SALVAR"  ${arg1}

Clicou no link "Processo de Declaração de Saúde"
    [Arguments]    ${arg1}
    DeclaracaoSaudeDetalhes.Clicar no link "Processo de Declaração de Saúde"  ${arg1}

Clicou no botão "CRIAR", painel Declaração de Saúde
    DeclaracaoSaudeDetalhes.Clicar no botão "CRIAR", painel Declaração de Saúde

Selecionou a Pessoa Titular, preencheu os campos "Tipo" igual a TITULAR,"Altura","Peso","PA"
    [Arguments]    @{arg1}
    DeclaracaoSaudeCadastro.Selecionar uma Pessoa    ${arg1[1]}
    DeclaracaoSaudeCadastro.Preencher o campo "Tipo"  ${arg1[30]}
    DeclaracaoSaudeCadastro.Preencher o campo "Altura"  ${arg1[31]}  ${arg1[32]}
    DeclaracaoSaudeCadastro.Preencher o campo "Peso"  ${arg1[33]}
    DeclaracaoSaudeCadastro.Preencher o campo "PA"  ${arg1[34]}  ${arg1[35]}

Clicou no botão "ADICIONAR PESSOA", selecionou a Pessoa Dependente Conjuge, preencheu os campos "Tipo" igual a DEPENDENTE, "Grau Dependência" igual a 01 - CONJUGE,"Altura","Peso","PA"
    [Arguments]    @{arg1}
    DeclaracaoSaudeCadastro.Clicar no botão no Adicionar Pessoa
    DeclaracaoSaudeCadastro.Selecionar uma Pessoa Dependente    ${arg1[38]}
    DeclaracaoSaudeCadastro.Preencher o campo "Tipo" Dependente  ${arg1[39]}
    DeclaracaoSaudeCadastro.Preencher o campo "Grau Dependência" Dependente  01 - Cônjuge
    DeclaracaoSaudeCadastro.Preencher o campo "Altura" Dependente  ${arg1[31]}  ${arg1[32]}
    DeclaracaoSaudeCadastro.Preencher o campo "Peso" Dependente  ${arg1[33]}
    DeclaracaoSaudeCadastro.Preencher o campo "PA" Dependente  ${arg1[34]}  ${arg1[35]}

Selecionou a opção NÃO no painel "Identificação de Médico Orientador", selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    DeclaracaoSaudeCadastro.Selecionar a opção NÃO 
    DeclaracaoSaudeCadastro.Selecionar a opção "Preenchimento Eletrônico"
    DeclaracaoSaudeCadastro.Clicar no botão "SALVAR E CONTINUAR"

Selecionou uma Pessoa
    [Arguments]    ${arg1}
    DeclaracaoSaudeCadastro.Selecionar uma Pessoa    ${arg1}

Preencheu os campos "Tipo","Altura","Peso","PA", selecionou a opção NÃO, selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    [Arguments]  @{arg1}
    DeclaracaoSaudeCadastro.Preencher o campo "Tipo"  ${arg1[29]}
    DeclaracaoSaudeCadastro.Preencher o campo "Altura"  ${arg1[30]}  ${arg1[31]}
    DeclaracaoSaudeCadastro.Preencher o campo "Peso"  ${arg1[32]}
    DeclaracaoSaudeCadastro.Preencher o campo "PA"  ${arg1[33]}  ${arg1[34]}
    DeclaracaoSaudeCadastro.Selecionar a opção NÃO 
    DeclaracaoSaudeCadastro.Selecionar a opção "Preenchimento Eletrônico"
    DeclaracaoSaudeCadastro.Clicar no botão "SALVAR E CONTINUAR"
    
Selecionou a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"
    DeclaracaoSaudeCadastro.Selecionar a opção NÃO para as perguntas e clicou no botão "SALVAR E CONTINUAR"

Selecionou a pessoa, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID e clicou no botão "GRAVAR"
    [Arguments]  ${arg1}
    DeclaracaoSaudeCadastro.Selecionar a pessoa, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID e clicou no botão "GRAVAR"  ${arg1}

Selecionou a pessoa Titular, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID
    [Arguments]  ${arg1}
    DeclaracaoSaudeCadastro.Selecionar a pessoa Titular, no campo pericia selecionou a opção "Não é necessária a perícia médica", preencheu o prazo, CID    ${arg1}

Selecionou a pessoa Dependente, no campo pericia selecionou a opção "Não é necessária a perícia médica", não preencheu o prazo, CID
    [Arguments]  ${arg1}
    DeclaracaoSaudeCadastro.Selecionar pessoa Dependente, no campo pericia selecionou a opção "Não é necessária a perícia médica", não preencheu o prazo, CID    ${arg1}

Clicou no botão "GRAVAR" Analise Declaração
    DeclaracaoSaudeCadastro.Clicar no botão "GRAVAR" Analise Declaração

Clicar na aba Pessoa
    DeclaracaoSaudeCadastro.Clicou na aba Pessoa

Selecionar a Pessoa TITULAR, clicar no menu AÇÕES > APROVAR SELECIONADOS e clicar em SIM
    [Arguments]  ${arg1}
    DeclaracaoSaudeCadastro.Selecionou a Pessoa TITULAR, clicar no menu AÇÕES > APROVAR SELECIONADOS e clicar em SIM    ${arg1}

Selecionar a Pessoa DEPENDENTE Conjuge, clicar no menu AÇÕES > RECUSAR SELECIONADOS, preencher o "Motivo" e clicar em SALVAR
    [Arguments]  ${arg1}
    DeclaracaoSaudeCadastro.Selecionou a Pessoa DEPENDENTE Conjuge, clicar no menu AÇÕES > RECUSAR SELECIONADOS, preencher o "Motivo" e clicar em SALVAR    ${arg1}

Clicou na pessoa do painel "Questionário Pessoa"
    [Arguments]  ${arg1}
    DeclaracaoSaudeCadastro.Clicar na pessoa do painel "Questionário Pessoa"  ${arg1}

Clicou no botão "APROVAR QUESTIONÁRIO"
    DeclaracaoSaudeCadastro.Clicar no botão "APROVAR QUESTIONÁRIO"

CRM deve atualizar a tela de Questionário Pessoa, com campo "Status" igual a APROVADO
    DeclaracaoSaudeCadastro.O CRM deve atualizar a tela de Questionário Pessoa, com campo "Status" igual a APROVADO

Tela Declaração de Saúde com campo "Status" igual a APROVADO
    DeclaracaoSaudeCadastro.A Tela Declaração de Saúde com campo "Status" igual a APROVADO

Tela Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 4, "Quantidade de Pessoas" igual a 1 e "Quantidade de Pessoas com DS Aprovada" igual a 1
    DeclaracaoSaudeCadastro.A Tela Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 4, "Quantidade de Pessoas" igual a 1 e "Quantidade de Pessoas com DS Aprovada" igual a 1

Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" igual a APROVADO, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." e coluna "Dispensado" desmarcado
    DeclaracaoSaudeCadastro.A Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" igual a APROVADO, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." e coluna "Dispensado" desmarcado

Preencheu os campos "Tipo","Altura","Peso","PA", selecionou a opção NÃO, não selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    [Arguments]  @{arg1}
    DeclaracaoSaudeCadastro.Preencher o campo "Tipo"  ${arg1[30]}
    DeclaracaoSaudeCadastro.Preencher o campo "Altura"  ${arg1[31]}  ${arg1[32]}
    DeclaracaoSaudeCadastro.Preencher o campo "Peso"  ${arg1[33]}
    DeclaracaoSaudeCadastro.Preencher o campo "PA"  ${arg1[34]}  ${arg1[35]}
    DeclaracaoSaudeCadastro.Selecionar a opção NÃO 
    DeclaracaoSaudeCadastro.Não selecionar a opção "Preenchimento Eletrônico"
    DeclaracaoSaudeCadastro.Clicar no botão "SALVAR E CONTINUAR"

Clicou no botão "GRAVAR"
    DeclaracaoSaudeCadastro.Clicar no botão "GRAVAR"

Selecionou a pessoa, no campo pericia selecionou a opção "Não é necessária a perícia médica" e clicou no botão "GRAVAR"
    [Arguments]  ${arg1}
    DeclaracaoSaudeCadastro.Selecionar a pessoa, no campo pericia selecionou a opção "Não é necessária a perícia médica" e clicou no botão "GRAVAR"  ${arg1}

Clicar no botão "RECUSAR BENEFICIÁRIO"
    DeclaracaoSaudeCadastro.Clicou no botão "RECUSAR BENEFICIÁRIO"

Preencher o campo "Motivo" e clicar no botão "SALVAR"
    DeclaracaoSaudeCadastro.Preencheu o campo "Motivo" e clicar no botão "SALVAR"

CRM deve atualizar a tela de Questionário Pessoa, com campo "Status" igual a RECUSADO PELO BENEFICIÁRIO
    DeclaracaoSaudeCadastro.CRM deve atualizar tela de Questionário Pessoa, com campo "Status" igual a RECUSADO PELO BENEFICIÁRIO

Tela Declaração de Saúde com campo "Status" igual a RECUSADO PELO BENEFICIÁRIO
    DeclaracaoSaudeCadastro.A Tela Declaração de Saúde com campo "Status" igual a RECUSADO PELO BENEFICIÁRIO

Tela Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 4, "Quantidade de Pessoas" igual a 1 e "Quantidade de Pessoas com DS Recusada" igual a 1
    DeclaracaoSaudeCadastro.A Tela Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 4, "Quantidade de Pessoas" igual a 1 e "Quantidade de Pessoas com DS Recusada" igual a 1

Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" igual a RECUSADO PELO BENEFICIÁRIO, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." e coluna "Dispensado" desmarcado
    DeclaracaoSaudeCadastro.A Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" igual a RECUSADO PELO BENEFICIÁRIO, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." e coluna "Dispensado" desmarcado

Clicar no menu "DISPENSA EM MASSA"
    DeclaracaoSaudeCadastro.Clicar menu "DISPENSA EM MASSA"

Clicar no menu EDITAR > DISPENSAR EM MASSA, selecionar a Pessoa DEPENDENTE Filho, preencher o "Motivo" e clicar em SALVAR
    [Arguments]  ${arg1}
    DeclaracaoSaudeDetalhes.Clicar menu EDITAR > DISPENSAR EM MASSA, selecionar a Pessoa DEPENDENTE Filho, preencher o "Motivo" e clicar em SALVAR  ${arg1}
    
CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 3, "Quantidade de Pessoas" igual a 3, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" igual a 1, com campo "Status" igual a EM ANDAMENTO
    DeclaracaoSaudeCadastro.CRM deve atualizar tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 3, "Quantidade de Pessoas" igual a 3, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" igual a 1, com campo "Status" igual a EM ANDAMENTO

Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" APROVADO para o Titular, RECUSADO PELO BENEFICIÁRIO para o Conjuge, VAZIO para o Filho, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." para o Titular e Filho, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." para o Conjuge, coluna "Dispensado" desmarcada para o Titular e Conjuge e selecionada para o Filho
    DeclaracaoSaudeCadastro.A Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" APROVADO para o Titular, RECUSADO PELO BENEFICIÁRIO para o Conjuge, VAZIO para o Filho, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." para o Titular e Filho, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." para o Conjuge, coluna "Dispensado" desmarcada para o Titular e Conjuge e selecionada para o Filho

Com Declaração de Saúde, com a "status" FINALIZADO
    DeclaracaoSaudeCadastro.Com Declaração de Saúde, com "status" FINALIZADO

Selecionar a Pessoa, preencher o "Motivo" e clicar no botão "SALVAR"
    [Arguments]  ${arg1}
    DeclaracaoSaudeCadastro.Selecionar Pessoa, preencher o "Motivo" e clicar no botão "SALVAR"    ${arg1}

CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 4, "Quantidade de Pessoas" igual a 1 e "Quantidade de Pessoas dispensadas de DS" igual a 1, com campo "Status" igual a EM ANDAMENTO
    DeclaracaoSaudeCadastro.O CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 4, "Quantidade de Pessoas" igual a 1 e "Quantidade de Pessoas dispensadas de DS" igual a 1, com campo "Status" igual a EM ANDAMENTO

Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" VAZIO, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." e coluna "Dispensado" selecionada
    DeclaracaoSaudeCadastro.A Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" VAZIO, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." e coluna "Dispensado" selecionada

Sem Declaração de Saúde
    DeclaracaoSaudeCadastro.Sem a Declaração de Saúde

Desmarcou o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais
    MenuSuperior.Colocar o mouse no Parametros
    MenuSuperior.Clicar no submenu Parametros Comerciais
    ParametrosComerciais.Verificar Página Parametros Comerciais
    ParametrosComerciais.Clicar no menu Comercializacao
    ParametrosComerciais.Desmarcar o campo "Criar automaticamente Processo de Declaração de Saúde" no módulo Parâmetros Comerciais

Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 3 e demais campos obrigatórios
    [Arguments]    @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[3]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[4]}
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[1]}

Não preencheu automaticamente o campo "Processo de Declaração de Saúde"
    DeclaracaoSaudeCadastro.Não preencheu automaticamente campo "Processo de Declaração de Saúde"

Não selecionou o campo "Necessita Validar Declaração de Saúde?"
    DeclaracaoSaudeDetalhes.Validar checkbox necessita validar declaracao de saude esta desmarcado

Não apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    BeneficiariosCadastro.Não apresentou mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"

Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com Beneficiários TITULARES e DEPENDENTES (UMA FAMILIA)
    [Arguments]  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - 2 Vidas)  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - Transferência de Grupo Familiar)    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato Origem cadastrado  ${arg1[1]}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    ContratosDetalhes.Salvar valor ID SISTEMA DE GESTÃO

Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Tipo de Contratação" igual a INDIVIDUAL FAMILIAR, com Beneficiários
    [Arguments]  @{arg1}
    Cadastrar Contrato PF (Movimentação Cadastral)   @{arg1}
    # Cadastrar Contrato PF (Movimentação Cadastral - Transferência de Grupo Familiar)    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato Origem cadastrado  ${arg1[1]}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    ContratosDetalhes.Salvar valor ID SISTEMA DE GESTÃO

Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Tipo de Contratação" igual a INDIVIDUAL FAMILIAR, com 2 ou mais Beneficiários
    [Arguments]  @{arg1}
    Cadastrar Contrato PF (Movimentação Cadastral) com 2 ou mais Beneficiarios   @{arg1}
    # Cadastrar Contrato PF (Movimentação Cadastral - Transferência de Grupo Familiar)    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato Origem cadastrado  ${arg1[1]}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    ContratosDetalhes.Salvar valor ID SISTEMA DE GESTÃO


Acessou módulo Movimentação em Massa
    MenuSuperior.Colocar o mouse no Operações
    MenuSuperior.Acessou o módulo Movimentação em Massa

Gerou um registro, com campo "Tipo de Movimentação" igual a TRANSFERÊNCIA DE GRUPO FAMILIAR
    [Arguments]    ${arg1}
    MovimentacaoEmMassa.Clicar botão Criar Movimentação em Massa
    MovimentacaoEmMassa.Verificar Tela de Movimentação em Massa » Criar
    MovimentacaoEmMassa.Preencher campo Nome Movimentação em Massa    ${arg1}
    MovimentacaoEmMassa.Preencher campo Tipo de Movimentação   Transferência de Grupo Familiar
    MovimentacaoEmMassa.Clicar em salvar Movimentação em Massa

Clicou no botão "DEFINIR BENEFICIÁRIOS"
    MovimentacaoEmMassa.Clicar no botão "DEFINIR BENEFICIÁRIOS"

Clicou no botão "+ ADICIONAR BENEFICIÁRIOS"
    MovimentacaoEmMassa.Clicar no botão "+ ADICIONAR BENEFICIÁRIOS"

Clicou no botão "+ ADICIONAR BENEFICIÁRIOS" (MOV EXCLUSAO)
    MovimentacaoEmMassa.Clicar no botão "+ ADICIONAR BENEFICIÁRIOS" MOV EXCLUSAO

Preencher o campo "CPF" com a informação de um Beneficiário existente no CRM e clicou no botão "PESQUISAR"
    [Arguments]    ${arg1}
    MovimentacaoEmMassa.Preencheu o campo "CPF" com a informação de um Beneficiário existente no CRM e clicou no botão "PESQUISAR"   ${arg1}

Clicou no Beneficiário
    [Arguments]    ${arg1}
    MovimentacaoEmMassa.Clicar no Beneficiário    ${arg1}

Preencheu o campo "Contrato Destino" com um Contrato PJ existente no CRM
    [Arguments]  @{arg1}
    MovimentacaoEmMassa.Preencher o campo "Contrato Destino" com um Contrato PJ existente no CRM  ${arg1[32]}

Preencheu o campo "Contrato Destino" com um Contrato CAEPF existente no CRM
    [Arguments]  @{arg1}
    MovimentacaoEmMassa.Preencher o campo "Contrato Destino" com um Contrato PJ existente no CRM  ${arg1[31]}

Preencheu os campo "Transferência", "Produto Assistencial" e clicou no botão "SALVAR"
    [Arguments]  ${arg1}
    MovimentacaoEmMassa.Preencher os campo "Transferência", "Produto Assistencial" e clicou no botão "SALVAR"  ${arg1}

Apresentou a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (UMA FAMILIA)
    [Arguments]  @{arg1}
    MovimentacaoEmMassa.Apresentar a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (UMA FAMILIA)  ${arg1[40]}  ${arg1[48]}

Clicar no menu "GERAR MOVIMENTAÇÕES CADASTRAIS" e clicar no botão "SIM"
    MovimentacaoEmMassa.Clicou no menu "GERAR MOVIMENTAÇÕES CADASTRAIS" e clicar no botão "SIM"

CRM deve atualizar a tela de Movimentações Cadastrais com:
    MovimentacaoEmMassa.CRM deve atualizar tela de Movimentações Cadastrais com:

A mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação."
    MovimentacaoEmMassa.Mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação."

Com o botão "ENCAMINHAR MOVIMENTAÇÕES PARA APROVAÇÃO"
    MovimentacaoEmMassa.Com botão "ENCAMINHAR MOVIMENTAÇÕES PARA APROVAÇÃO"

A "situação" igual a CONCLUIDO
    MovimentacaoEmMassa.A "situação" igual CONCLUIDO

Sem o botão "DEFINIR BENEFICIÁRIOS"
    MovimentacaoEmMassa.Sem botão "DEFINIR BENEFICIÁRIOS"

Painel "Movimentações Cadastrais", com um registro na "situação" igual a EM ANDAMENTO
    MovimentacaoEmMassa.O Painel "Movimentações Cadastrais", com um registro na "situação" igual a EM ANDAMENTO

Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com Beneficiários TITULARES e DEPENDENTES (DUAS FAMILIAS)
    [Arguments]  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - 4 Vidas)  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - Transferência de Grupo Familiar)    @{arg1}
    Cadastrar Terceiro Contrato PJ (Movimentação Cadastral - Transferência de Grupo Familiar)    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato Origem cadastrado  ${arg1[1]}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    ContratosDetalhes.Salvar valor ID SISTEMA DE GESTÃO

Preencheu o campo "ID no Sistema de Gestão (Contrato)" com a informação de um Contrato existente no CRM e clicou no botão "PESQUISAR"
    [Arguments]    @{arg1}
    MovimentacaoEmMassa.Preencher o campo "ID no Sistema de Gestão (Contrato)" com a informação de um Contrato existente no CRM e clicou no botão "PESQUISAR"  @{arg1}
    
Selecionou dois Beneficiários e clicou no botão "SELECIONAR"
    MovimentacaoEmMassa.Selecionar dois Beneficiários e clicou no botão "SELECIONAR"

Preencheu para o primeiro Beneficiário o campo "Contrato Destino" com um Contrato PJ existente no CRM
    [Arguments]    @{arg1}
    MovimentacaoEmMassa.Preencheu para primeiro Beneficiário o campo "Contrato Destino" com um Contrato PJ existente no CRM  ${arg1[1]}

Preencheu para o segundo Beneficiário o campo "Contrato Destino" com um Contrato PJ existente no CRM (diferente do primeiro Contrato)
    [Arguments]    @{arg1}
    MovimentacaoEmMassa.Preencheu para segundo Beneficiário o campo "Contrato Destino" com um Contrato PJ existente no CRM (diferente do primeiro Contrato)  ${arg1[32]}

Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com Beneficiários TITULARES e DEPENDENTES (UMA FAMILIA)
    [Arguments]  @{arg1}
    Cadastrar Contrato CAEPF (Movimentação Cadastral - 2 Vidas)  @{arg1}
    Cadastrar Contrato CAEPF (Movimentação Cadastral - Transferência de Grupo Familiar)    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato Origem cadastrado  ${arg1[1]}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    ContratosDetalhes.Salvar valor ID SISTEMA DE GESTÃO

Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com Beneficiários TITULARES e DEPENDENTES (DUAS FAMILIAS)
    [Arguments]  @{arg1}
    Cadastrar Contrato CAEPF (Movimentação Cadastral - 4 Vidas)  @{arg1}
    Cadastrar Contrato CAEPF (Movimentação Cadastral - Transferência de Grupo Familiar)    @{arg1}
    Cadastrar Terceiro Contrato CAEPF (Movimentação Cadastral - Transferência de Grupo Familiar)    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato Origem cadastrado  ${arg1[1]}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    ContratosDetalhes.Salvar valor ID SISTEMA DE GESTÃO

Preencheu para o primeiro Beneficiário o campo "Contrato Destino" com um Contrato CAEPF existente no CRM
    [Arguments]    @{arg1}
    MovimentacaoEmMassa.Preencheu para primeiro Beneficiário o campo "Contrato Destino" com um Contrato PJ existente no CRM  @{arg1}

Preencheu para o segundo Beneficiário o campo "Contrato Destino" com um Contrato CAEPF existente no CRM (diferente do primeiro Contrato)
    [Arguments]    @{arg1}
    MovimentacaoEmMassa.Preencheu para segundo Beneficiário o campo "Contrato Destino" com um Contrato PJ existente no CRM (diferente do primeiro Contrato)  @{arg1}

Apresentou a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (DUAS FAMILIAS)
    [Arguments]  @{arg1}
    MovimentacaoEmMassa.Apresentar a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (DUAS FAMILIAS)  ${arg1[40]}  ${arg1[48]}  ${arg1[56]}  ${arg1[64]}

Integrou UM Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com Beneficiários TITULARES e DEPENDENTES
    [Arguments]  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - 4 Vidas)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato Origem cadastrado  ${arg1[1]}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    ContratosDetalhes.Salvar valor ID SISTEMA DE GESTÃO

Gerou um registro, com campo "Tipo de Movimentação" igual a EXCLUSÃO DE BENEFICIÁRIOS
    [Arguments]  ${arg1}
    MovimentacaoEmMassa.Clicar botão Criar Movimentação em Massa
    MovimentacaoEmMassa.Verificar Tela de Movimentação em Massa » Criar
    MovimentacaoEmMassa.Preencher campo Nome Movimentação em Massa    ${arg1}
    MovimentacaoEmMassa.Preencher campo Tipo de Movimentação   Exclusão de Beneficiário
    MovimentacaoEmMassa.Clicar em salvar Movimentação em Massa

Clicou na opção "LISTA DE CPF"
    MovimentacaoEmMassa.Clicar na opção "LISTA DE CPF"

Preencheu DOIS CPFs um Titular com Dependente, um Dependente do Contrato e clicou no botão "INSERIR"
    [Arguments]  @{arg1}
    MovimentacaoEmMassa.Preencher DOIS CPFs um Titular com Dependente, um Dependente do Contrato e clicou no botão "INSERIR"  ${arg1[39]}  ${arg1[47]}  ${arg1[63]}

Validou a apresentação dos Beneficiários selecionados e seus dependentes
    [Arguments]  @{arg1}
    MovimentacaoEmMassa.Validar a apresentação dos Beneficiários selecionados e seus dependentes  ${arg1[38]}  ${arg1[46]}  ${arg1[62]}

Preencheu os campos "Motivo", "Data de Exclusão", telefone e email de "Contato" e clicou no botão "SALVAR"
    [Arguments]  @{arg1}
    MovimentacaoEmMassa.Preencher os campos "Motivo", "Data de Exclusão", telefone e email de "Contato" e clicou no botão "SALVAR"  ${arg1[9]}  ${arg1[27]}  ${arg1[26]}

Preencheu os campos "Motivo", "Data de Exclusão", telefone e email de "Contato" e clicou no botão "SALVAR" (DOIS CONTRATOS)
    [Arguments]  @{arg1}
    MovimentacaoEmMassa.Preencher os campos "Motivo", "Data de Exclusão", telefone e email de "Contato" e clicou no botão "SALVAR" (DOIS CONTRATOS)   ${arg1[9]}  ${arg1[27]}  ${arg1[26]}

Apresentou a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (MOV EXCLUSAO)
    [Arguments]  @{arg1}
    MovimentacaoEmMassa.Apresentar a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (MOV EXCLUSAO)  ${arg1[38]}  ${arg1[46]}  ${arg1[62]}

Apresentou a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (DOIS CONTRATOS)
    [Arguments]  @{arg1}
    MovimentacaoEmMassa.Apresentar a tela de Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais (DOIS CONTRATOS)  ${arg1[40]}  ${arg1[48]}  ${arg1[64]}  ${arg1[72]}  ${arg1[80]}  ${arg1[96]}

Clicar no menu "GERAR MOVIMENTAÇÕES CADASTRAIS"
    MovimentacaoEmMassa.Clicou no menu "GERAR MOVIMENTAÇÕES CADASTRAIS"

Clicar no botão "SIM" na modal de Confirmação "Confirma geração das movimentações cadastrais?"
    MovimentacaoEmMassa.Clicou no botão "SIM" na modal de Confirmação "Confirma geração das movimentações cadastrais?"

Integrou DOIS Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com Beneficiários TITULARES e DEPENDENTES
    [Arguments]  @{arg1}
    Cadastrar Contrato PJ (Movimentação Cadastral - 4 Vidas)  @{arg1}
    Cadastrar Segundo Contrato PJ (Movimentação Cadastral - 4 Vidas)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato Origem cadastrado  ${arg1[1]}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    ContratosDetalhes.Salvar valor ID SISTEMA DE GESTÃO

Preencheu QUATRO CPFs um Titular com Dependente, um Dependente do Contrato 1, um Titular com Dependente, um Dependente do Contrato 2 e clicou no botão "INSERIR"
    [Arguments]  @{arg1}
    MovimentacaoEmMassa.Preencher um Titular com Dependente, um Dependente do Contrato 1  ${arg1[39]}  ${arg1[63]}
    MovimentacaoEmMassa.Preencher um Titular com Dependente, um Dependente do Contrato 2 e clicou no botão "INSERIR"  ${arg1[71]}  ${arg1[95]}

Integrou UM Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com Beneficiários TITULARES e DEPENDENTES
    [Arguments]  @{arg1}
    Cadastrar Contrato CAEPF (Movimentação Cadastral - 4 Vidas)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato Origem cadastrado  ${arg1[1]}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    ContratosDetalhes.Salvar valor ID SISTEMA DE GESTÃO

Integrou DOIS Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com Beneficiários TITULARES e DEPENDENTES
    [Arguments]  @{arg1}
    Cadastrar Contrato CAEPF (Movimentação Cadastral - 4 Vidas)  @{arg1}
    Cadastrar Segundo Contrato CAEPF (Movimentação Cadastral - 4 Vidas)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato Origem cadastrado  ${arg1[1]}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}
    ContratosDetalhes.Salvar valor ID SISTEMA DE GESTÃO


Integrou um Contrato com "Tipo" POTENCIAL PF, com um Beneficiário TITULAR
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" INDIVIDUAL FAMILIAR, com 1 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Cadastrou Beneficiário Titular PF que o CPF não exista no CADSUS, com e-mail   @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}

Acessou o menu Todos > Solicitação de Portabilidade
    MenuSuperior.Acessar o menu Todos > Solicitação de Portabilidade

Clicou no menu "Criar Solicitação de Portabilidade"
    SolicitacaoPortabilidade.Verificar se está na Tela de Solicitação de Portabilidade
    SolicitacaoPortabilidade.Clicar no menu "Criar Solicitação de Portabilidade"

Preencheu o campo "Contrato" e clicou no botão "SALVAR"
    [Arguments]  ${arg1}
    SolicitacaoPortabilidade.Preencher o campo "Contrato" e clicou no botão "SALVAR"  ${arg1}

Apresentou a tela de Solicitação de Portabilidade » Solicitação - data e hora atual, campo "Situação" igual a RASCUNHO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL
    SolicitacaoPortabilidade.Apresentar a tela de Solicitação de Portabilidade » Solicitação - data e hora atual, campo "Situação" igual a RASCUNHO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL

Cadastrou duas Pessoa DEPENDENTE
    [Arguments]  @{arg1}
    PortabilidadeCadastro.Cadastrou primeiro DEPENDENTE  @{arg1}
    Clicou no botão "CRIAR" painel Pessoa(Portabilidade)
    PortabilidadeCadastro.Cadastrou segundo DEPENDENTE  @{arg1}

Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja Encaminhar para Validação?"
    PortabilidadeDetalhes.Confirmar o encaminhamento

Apresentou a mensagem "Portabilidade encaminhada para validação." e alterou a "Situação" para AGUARDANDO VALIDAÇÃO
    SolicitacaoPortabilidade.Apresentou mensagem "Portabilidade encaminhada para validação." e alterou a "Situação" para AGUARDANDO VALIDAÇÃO

Selecionou pessoas e clicou no botão "VALIDAR"
    PortabilidadeDetalhes.Selecinar as pessoas e clicou no botão "Validar"

Clicar botão "SIM" da modal de Confirmação com a mensagem "Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?"
    SolicitacaoPortabilidade.Clicar no botão "SIM" da modal de Confirmação com a mensagem "Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?"

Apresentou a mensagem "Situação alterada para: Assinatura da Proposta de Adesão Pendente." e alterou a "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE
    SolicitacaoPortabilidade.Apresentar a mensagem "Situação alterada para: Assinatura da Proposta de Adesão Pendente." e alterou a "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE

Apresentou o campo "Data Emissão Proposta de Adesão de Portabilidade" preenchido a data e hora atual
    SolicitacaoPortabilidade.Apresentar o campo "Data Emissão Proposta de Adesão de Portabilidade" preenchido a data e hora atual

Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado."
    SolicitacaoPortabilidade.Clicar no botão "SIM" da modal de Confirmação com a mensagem "Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado."

Atualizou o titulo da tela para Solicitação de Portabilidade » Protocolo
    SolicitacaoPortabilidade.Atualizar o titulo da tela para Solicitação de Portabilidade » Protocolo

Apresentou a mensagem "Portabilidade encaminhada para análise.", preencheu o campo "Protocolo", alterou a "Situação" para AGUARDANDO ANÁLISE, preencheu o campo "Data Solicitação" com a data e hora atual, preencheu o campo "Prazo Resposta" com data atual + 10 dias
    SolicitacaoPortabilidade.Apresentar a mensagem "Portabilidade encaminhada para análise.", preencheu o campo "Protocolo", alterou a "Situação" para AGUARDANDO ANÁLISE, preencheu o campo "Data Solicitação" com a data e hora atual, preencheu o campo "Prazo Resposta" com data atual + 10 dias

Apresentar painel "Dados Envio Análise" com os campos "Data/Hora Envio para Análise" preenchido com a data e hora atual e "Responsável Envio para Análise" igual ao Usuário logado
    SolicitacaoPortabilidade.Apresentou painel "Dados Envio Análise" com os campos "Data/Hora Envio para Análise" preenchido com a data e hora atual e "Responsável Envio para Análise" igual ao Usuário logado

Clicou no botão "ANALISAR" da primeira pessoa
    Clicou no botão "Analisar"

Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, SIM, SIM e clicou no botão "SALVAR"
    SolicitacaoPortabilidade.Preencher o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, SIM, SIM e clicou no botão "SALVAR"
    Clicar botão "Salvar"

Validou o preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA
    SolicitacaoPortabilidade.Validar o preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA

Clicou no botão "ANALISAR" da segunda pessoa
    Clicou no botão "Analisar" segundo beneficiario

Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM e clicou no botão "SALVAR"
    SolicitacaoPortabilidade.Preencher o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM e clicou no botão "SALVAR"
    Clicar botão "Salvar"

Validou o preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA PARCIAL
    SolicitacaoPortabilidade.Validar o preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA PARCIAL

Clicar o botão "SIM" da modal de Confirmação com a mensagem "Deseja Finalizar Protocolo?"
    SolicitacaoPortabilidade.Clicou no botão "SIM" da modal de Confirmação com a mensagem "Deseja Finalizar Protocolo?"

Validar a apresentação da mensagem "Protocolo Finalizado.", a "Situação" para APROVADA e o campo "Data Encerramento Protocolo" com a data e hora atual
    SolicitacaoPortabilidade.Validou a apresentação da mensagem "Protocolo Finalizado.", a "Situação" para APROVADA e o campo "Data Encerramento Protocolo" com a data e hora atual

CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade, com situação igual a APROVADA
    SolicitacaoPortabilidade.O CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade, com situação igual a APROVADA

Integrou um Contrato com "Tipo" POTENCIAL PJ e "Tipo de Contratação" igual a COLETIVO POR ADESÃO, sem Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}

Cadastrar duas Pessoa TITULAR e DEPENDENTE
    [Arguments]  @{arg1}
    PortabilidadeCadastro.Cadastrou primeiro TITULAR  @{arg1}
    Clicou no botão "CRIAR" painel Pessoa(Portabilidade)
    PortabilidadeCadastro.Cadastrou segundo DEPENDENTE  @{arg1}

Integrou um Contrato com "Tipo" POTENCIAL PJ e "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}


Integrou um Contrato com "Tipo" POTENCIAL CAEPF e "Tipo de Contratação" igual a COLETIVO POR ADESÃO, sem Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}


Integrou um Contrato com "Tipo" POTENCIAL CAEPF e "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, sem Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    # Cadastrou um Contrato, preenchendo campos obrigatórios     @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}

Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO ADESÃO, com Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}



Usuario Conectar na Servico Vendas API
    ServicoVendasAPI.Conectar na Servico Vendas API

Criou o POST e no Body colocou o JSON
    [Arguments]  @{arg1}
    ServicoVendasAPI.Criar o POST e no Body colocou o JSON  @{arg1}

Deve apresentar "200 OK"
    ServicoVendasAPI.Conferir o status code  200

Validar o retorno
    ServicoVendasAPI.Validou o retorno

Clicar no botão "EDITAR"
    DeclaracaoSaudeDetalhes.Clicar botão "EDITAR"

Selecionar o campo "Dispensar Validação de Declaração de Saúde", clicar no botão "SIM", selecionar "Motivo" e clicar no botão "SALVAR"
    DeclaracaoSaudeDetalhes.Selecionar campo "Dispensar Validação de Declaração de Saúde", clicar no botão "SIM", selecionar "Motivo" e clicar no botão "SALVAR"

Clicar no menu "FINALIZAR" e clicar no botão "SIM"
    #DeclaracaoSaudeDetalhes.Validar Alerta "Selecione pelo menos uma pessoa"
    DeclaracaoSaudeDetalhes.Acessando o menu FINALIZAR DECLARACAO DE SAUDE
    
CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Status" igual a CONCLUIDO, "Dispensar Validação de Declaração de Saúde" selecionado, "Usuário que dispensou" preenchido, "Data da Dispensa" preenchido, "Motivo" preenchido, "Complemento" visivel, "Concluído Manualmente" selecionado, os campos "Quantidade de vidas Aprovadas na cotação", "Quantidade de Pessoas: 1 Quantidade de Pessoas dispensadas de DS", Quantidade de Pessoas com DS Aprovada", "Quantidade de Pessoas com DS Recusada" não devem ser apresentados
    DeclaracaoSaudeDetalhes.CRM deve atualizar tela de Processo de Declaração de Saúde, aba Básica com os campos "Status" igual a CONCLUIDO, "Dispensar Validação de Declaração de Saúde" selecionado, "Usuário que dispensou" preenchido, "Data da Dispensa" preenchido, "Motivo" preenchido, "Complemento" visivel, "Concluído Manualmente" selecionado, os campos "Quantidade de vidas Aprovadas na cotação", "Quantidade de Pessoas: 1 Quantidade de Pessoas dispensadas de DS", Quantidade de Pessoas com DS Aprovada", "Quantidade de Pessoas com DS Recusada" não devem ser apresentados

Aba Pessoa, com a mensagem "Não há Declarações de Saúde para a seleção."
    DeclaracaoSaudeDetalhes.Aba Pessoa, com mensagem "Não há Declarações de Saúde para a seleção."

Sem painel Declaração de Saúde
    DeclaracaoSaudeDetalhes.Sem o painel Declaração de Saúde

Criou a Declaração de Saúde, com uma Pessoa, preencheu os campos "Tipo","Altura","Peso","PA", selecionou a opção NÃO, selecionou a opção "Preenchimento Eletrônico" e clicou no botão "SALVAR E CONTINUAR"
    [Arguments]    @{arg1}
    Clicou no botão "CRIAR", painel Declaração de Saúde
    DeclaracaoSaudeCadastro.Selecionar uma Pessoa    ${arg1[1]}
    DeclaracaoSaudeCadastro.Preencher o campo "Tipo"  ${arg1[30]}
    DeclaracaoSaudeCadastro.Preencher o campo "Altura"  ${arg1[31]}  ${arg1[32]}
    DeclaracaoSaudeCadastro.Preencher o campo "Peso"  ${arg1[33]}
    DeclaracaoSaudeCadastro.Preencher o campo "PA"  ${arg1[34]}  ${arg1[35]}
    DeclaracaoSaudeCadastro.Selecionar a opção NÃO 
    DeclaracaoSaudeCadastro.Selecionar a opção "Preenchimento Eletrônico"
    DeclaracaoSaudeCadastro.Clicar no botão "SALVAR E CONTINUAR"

Clicou no Contrato
    [Arguments]  ${arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado pelo Titulo   ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1}

Realizou a integração
    [Arguments]  @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}

Acessar o Processo de Declaração de Saúde"
    [Arguments]  ${arg1}
    Clicar no link "Processo de Declaração de Saúde"  ${arg1}
    Validar Página Processo de Declaração de Saúde


CRM deve atualizar a tela Processo de Declaração de Saúde, com os campos "Status" igual a CONCLUIDO e "Concluído Manualmente" desmarcado
    DeclaracaoSaudeDetalhes.CRM deve atualizar tela Processo de Declaração de Saúde, com os campos "Status" igual a CONCLUIDO e "Concluído Manualmente" desmarcado


Cadastrou Beneficiários
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[11]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[12]}
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[13]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa    ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[18]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Dependente - Familia 1
    CRM deve apresentar a tela Beneficiário » Criar
    # BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[37]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[38]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[39]}
    # BeneficiariosCadastro.Preencher o campo Titular    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[42]}
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[41]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa    ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo Data Certidao de Casamento  ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[44]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[40]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[43]}
    Salvar o Beneficiário desejando incluir dependentes
    #Cadastro Dependente - Familia 1
    CRM deve apresentar a tela Beneficiário » Criar
    # BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[45]}
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[46]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[47]}
    # BeneficiariosCadastro.Preencher o campo Titular    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[50]}
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[49]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa    ${arg1[28]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[52]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[48]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[21]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[23]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[51]}

Criou um Declaração de Saúde, selecionou a Pessoa Titular, preencheu os campos "Tipo de Pessoa"igual a TITULAR,"Altura","Peso","PA"
    [Arguments]    @{arg1}
    Clicou no botão "CRIAR", painel Declaração de Saúde
    DeclaracaoSaudeCadastro.Selecionar uma Pessoa    ${arg1[1]}
    DeclaracaoSaudeCadastro.Preencher o campo "Tipo"  ${arg1[30]}
    DeclaracaoSaudeCadastro.Preencher o campo "Altura"  ${arg1[31]}  ${arg1[32]}
    DeclaracaoSaudeCadastro.Preencher o campo "Peso"  ${arg1[33]}
    DeclaracaoSaudeCadastro.Preencher o campo "PA"  ${arg1[34]}  ${arg1[35]}

Criou um Declaração de Saúde, selecionou a Pessoa Dependente, preencheu os campos "Tipo de Pessoa"igual a DEPENDENTE,"Altura","Peso","PA"
    [Arguments]    @{arg1}
    Clicou no botão "CRIAR", painel Declaração de Saúde
    DeclaracaoSaudeCadastro.Selecionar uma Pessoa    ${arg1[39]}
    DeclaracaoSaudeCadastro.Preencher o campo "Tipo"  ${arg1[38]}
    DeclaracaoSaudeCadastro.Preencher o campo "Grau Dependência"  ${arg1[42]}
    DeclaracaoSaudeCadastro.Selecionar Titular  ${arg1[1]}
    DeclaracaoSaudeCadastro.Preencher o campo "Altura"  ${arg1[31]}  ${arg1[32]}
    DeclaracaoSaudeCadastro.Preencher o campo "Peso"  ${arg1[33]}
    DeclaracaoSaudeCadastro.Preencher o campo "PA"  ${arg1[34]}  ${arg1[35]}

Selecionar a Pessoa TITULAR com DS, clicar no menu AÇÕES > APROVAR SELECIONADOS e clicar em SIM
    [Arguments]    ${arg1}
    DeclaracaoSaudeDetalhes.Selecionou a Pessoa TITULAR com DS, clicar no menu AÇÕES > APROVAR SELECIONADOS e clicar em SIM  ${arg1}

Selecionar a Pessoa DEPENDENTE com DS, clicar no menu AÇÕES > RECUSAR SELECIONADOS, preencher o "Motivo" e clicar em SALVAR
    [Arguments]    ${arg1}
    DeclaracaoSaudeDetalhes.Selecionou a Pessoa DEPENDENTE com DS, clicar no menu AÇÕES > RECUSAR SELECIONADOS, preencher o "Motivo" e clicar em SALVAR  ${arg1}

Clicar no menu EDITAR > DISPENSAR EM MASSA, selecionar as demais Pessoas, preencher o "Motivo" e clicar em SALVAR
    DeclaracaoSaudeDetalhes.Clicou no menu EDITAR > DISPENSAR EM MASSA, selecionar as demais Pessoas, preencher o "Motivo" e clicar em SALVAR

CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 15, "Quantidade de Pessoas" preenchido, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" preenchido, com campo "Status" igual a CONCLUIDO
    DeclaracaoSaudeDetalhes.CRM deve atualizar tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 15, "Quantidade de Pessoas" preenchido, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" preenchido, com campo "Status" igual a CONCLUIDO

CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 30, "Quantidade de Pessoas" preenchido, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" preenchido, com campo "Status" igual a CONCLUIDO
    DeclaracaoSaudeDetalhes.CRM deve atualizar tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 30, "Quantidade de Pessoas" preenchido, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" preenchido, com campo "Status" igual a CONCLUIDO

Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" APROVADO para um Beneficiário, RECUSADO PELO BENEFICIÁRIO para um Beneficiário, VAZIO para outros Beneficiários, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." para o Beneficiário Aprovado e Dispensado, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." para Beneficiário Recusado, coluna "Dispensado" desmarcada para Beneficiário Aprovado e Dispensado e selecionada para o Beneficiário Recusado
    DeclaracaoSaudeDetalhes.A Tela Processo de Declaração de Saúde, aba Pessoa com coluna "Situação" APROVADO para um Beneficiário, RECUSADO PELO BENEFICIÁRIO para um Beneficiário, VAZIO para outros Beneficiários, coluna "Status DS" igual a V, com tooltip "Declaração de Saúde aprovada ou dispensada." para o Beneficiário Aprovado e Dispensado, coluna "Status DS" igual a X, com tooltip "Recusado pelo Beneficiário." para Beneficiário Recusado, coluna "Dispensado" desmarcada para Beneficiário Aprovado e Dispensado e selecionada para o Beneficiário Recusado

Com uma Declaração de Saúde, com a "status" APROVADO e uma Declaração de Saúde, com a "status" RECUSADO PELO BENEFICIÁRIO
    DeclaracaoSaudeDetalhes.Com uma Declaração de Saúde, com "status" APROVADO e uma Declaração de Saúde, com a "status" RECUSADO PELO BENEFICIÁRIO

Cadastrou uma Oportunidade, com campo "Número de Vidas" igual a 10 e demais campos obrigatórios
    [Arguments]    @{arg1}
    Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  ${arg1}
    OportunidadesCadastro.Preencher Número de Vida Com  ${arg1[3]}
    OportunidadesCadastro.Colocar Tipo com  ${arg1[4]}
    Clicar no Botão Salvar Oportunidade
    Apresentar a tela Oportunidade »  ${arg1[1]}

CRM deve atualizar a tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 10, "Quantidade de Pessoas" preenchido, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" preenchido, com campo "Status" igual a CONCLUIDO
    DeclaracaoSaudeDetalhes.CRM deve atualizar tela de Processo de Declaração de Saúde, aba Básica com os campos "Quantidade de vidas Aprovadas na cotação" igual a 10, "Quantidade de Pessoas" preenchido, "Quantidade de Pessoas com DS Aprovada" igual a 1, "Quantidade de Pessoas com DS Recusada" igual a 1, "Quantidade de Pessoas dispensadas de DS" preenchido, com campo "Status" igual a CONCLUIDO


Cadastrou um Beneficiário Titular (DEC DE SAUDE)
    [Arguments]  @{arg1}
    Usuário clicar no botão "Criar" do painel Beneficiários
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1[12]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[1]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[13]}
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[14]}
    BeneficiariosCadastro.Preencher o campo Data Admissao Empresa    ${arg1[29]}
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[16]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[17]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[19]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[20]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[21]}
    BeneficiariosCadastro.Selecionar a Tipo de Endereço    ${arg1[22]}
    BeneficiariosCadastro.Preencher o campo CEP    ${arg1[23]}
    BeneficiariosCadastro.Preencher o campo Numero    ${arg1[24]}
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[25]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[26]}
    

Acessou um Contrato PF com "Situação" igual a INTEGRADO
    [Arguments]  @{arg1}
    Cadastrar Contrato PF (Declaração de Saúde)  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${arg1[1]}

Validou o preenchimento automaticamente do campo "Processo de Declaração de Saúde" com o ID da Movimentação
    MovimentacaoCadastral.Validar o preenchimento automaticamente do campo "Processo de Declaração de Saúde" com o ID da Movimentação
    
Clicou no botão "CRIAR" subpainel "Beneficiários - Inclusão"
    Usuário clicar no botão "Criar" do painel Beneficiários

Preencheu o campo "CPF" válido
    [Arguments]  ${arg1}
    CRM deve apresentar a tela Beneficiário » Criar
    BeneficiariosCadastro.Preencher o campo CPF    ${arg1}

Validou a apresentação da mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"
    Apresentou a mensagem de alerta "Beneficiário não possui uma Declaração de Saúde"

Preencheu demais campo obrigatórios, com "Tipo" igual a DEPENDENTE e clicou no botão "SALVAR"
    [Arguments]  @{arg1}
    #Cadastro Dependente
    BeneficiariosCadastro.Selecionar o Tipo do Beneficiário    ${arg1[29]}
    BeneficiariosCadastro.Preencher o campo Nome do Beneficiário    ${arg1[31]}
    BeneficiariosCadastro.Preencher o campo Data de Nascimento    ${arg1[34]}  
    BeneficiariosCadastro.Selecionar o Grau de Dependencia do Beneficiário    ${arg1[33]}
    BeneficiariosCadastro.Preencher o campo Data Inicio Vigencia
    BeneficiariosCadastro.Preencher o campo CNS    ${arg1[15]}
    BeneficiariosCadastro.Selecionar o Sexo    ${arg1[16]}
    BeneficiariosCadastro.Preencher o campo Nome da Mãe    ${arg1[17]}
    BeneficiariosCadastro.Selecionar o Estado Civil    ${arg1[32]}
    BeneficiariosCadastro.Preencher o campo Naturalidade    ${arg1[19]}
    BeneficiariosCadastro.Selecionar a Raça    ${arg1[20]}
    BeneficiariosCadastro.Carregar endereço do Titular
    BeneficiariosCadastro.Selecionar a Tipo Telefone   ${arg1[24]} 
    BeneficiariosCadastro.Preencher o campo Numero Telefone    ${arg1[25]}
    BeneficiariosCadastro.Preencher o campo Email    ${arg1[35]}

Salvou o Beneficiário DEPENDENTE não desejando incluir dependentes
    [Arguments]  ${arg1}
    Salvar o Beneficiário não desejando incluir dependentes
    # Validação de Beneficiarios incluidos
    ContratosDetalhes.CRM deve apresentar tela Contrato » TITULO  ${arg1}

Acessou módulo Todos > Usuário Canal do Contratante
    MenuSuperior.Acessou o módulo Todos > Usuário Canal do Contratante

Preencheu campo "Login" e clicou no botão "PESQUISAR"
    PortabilidadeCanalContratante.Preencheu o campo "Login" e clicou no botão "PESQUISAR"

Acessou usuário desejado
    PortabilidadeCanalContratante.Acessou o usuário desejado

Vinculou Contrato integrado no painel "Contrato"
    PortabilidadeCanalContratante.Vinculou o Contrato integrado no painel "Contrato"

Acessar Solicitação de Portabilidade pelo CRM
    Usuário logou no sistema
    MenuSuperior.Acessou a Solicitação de Portabilidade pelo CRM

Clicar no botão "VALIDAR EM MASSA"
    PortabilidadeCanalContratante.Clicou no botão "VALIDAR EM MASSA"

Selecionou as pessoas clicou no botão "VALIDAR"
    PortabilidadeCanalContratante.Selecionou as pessoas e clicou no botão "VALIDAR"

Clicar aba "${CHECKLIST_DOCUMENTACAO}"
    PortabilidadeCanalContratante.Clicou aba "${CHECKLIST_DOCUMENTACAO}"

Selecionar a opção "Presente" e clicou no botão "SALVAR"
    PortabilidadeCanalContratante.Selecionou opção "Presente" e clicou no botão "SALVAR"

Clicar no menu "SOLICITAR ASSINATURA DE PROPOSTA DE ADESÃO DE PORTABILIDADE"
    PortabilidadeCanalContratante.Clicou o menu "SOLICITAR ASSINATURA DE PROPOSTA DE ADESÃO DE PORTABILIDADE"

Clicar o botão "SIM" da modal de Confirmação com a mensagem "Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?"
    PortabilidadeCanalContratante.Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja Solicitar Assinatura de Proposta de Adesão de Portabilidade?"

Apresentar mensagem "Situação alterada para: Assinatura da Proposta de Adesão Pendente."
    PortabilidadeCanalContratante.Apresentou mensagem "Situação alterada para: Assinatura da Proposta de Adesão Pendente."

Alterar a "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE
    PortabilidadeCanalContratante.Alterou a "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE

Acessar a Solicitação de Portabilidade pelo CRM
    Usuário logou no sistema
    PortabilidadeCanalContratante.Acessou Solicitação de Portabilidade pelo CRM

Clicar no menu "ENCAMINHAR PARA ANÁLISE"
    PortabilidadeCanalContratante.Clicou o menu "ENCAMINHAR PARA ANÁLISE"

Clicar o botão "SIM" da modal de Confirmação com a mensagem "Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado."
    PortabilidadeCanalContratante.Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja validar a documentação e Encaminhar para Análise? Um número de protocolo será gerado."

Atualizar titulo da tela para Solicitação de Portabilidade » Protocolo
    PortabilidadeCanalContratante.Atualizou titulo da tela para Solicitação de Portabilidade » Protocolo

Apresentar mensagem "Portabilidade encaminhada para análise.", preencheu o campo "Protocolo", alterou a "Situação" para AGUARDANDO ANÁLISE, preencheu o campo "Data Solicitação" com a data e hora atual, preencheu o campo "Prazo Resposta" com data atual + 10 dias
    PortabilidadeCanalContratante.Apresentou mensagem "Portabilidade encaminhada para análise.", preencheu o campo "Protocolo", alterou a "Situação" para AGUARDANDO ANÁLISE, preencheu o campo "Data Solicitação" com a data e hora atual, preencheu o campo "Prazo Resposta" com data atual + 10 dias

Apresentar o painel "${DADOS_ANALISE}" com os campos "Data/Hora Envio para Análise" preenchido com a data e hora atual e "Responsável Envio para Análise" igual ao Usuário logado
    PortabilidadeCanalContratante.Apresentou o painel "${DADOS_ANALISE}" com os campos "Data/Hora Envio para Análise" preenchido com a data e hora atual e "Responsável Envio para Análise" igual ao Usuário logado

Clicar o botão "ANALISAR" da primeira pessoa
    PortabilidadeCanalContratante.Clicou o botão "ANALISAR" da primeira pessoa

Clicar a aba "Questionário Elegibilidade"
    PortabilidadeCanalContratante.Clicou a aba "Questionário Elegibilidade"

Preencher formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, SIM, SIM e clicou no botão "SALVAR"
    PortabilidadeCanalContratante.Preencheu formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, SIM, SIM e clicou no botão "SALVAR"

Validar preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA
    PortabilidadeCanalContratante.Validou preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA

Clicar o botão "ANALISAR" da segunda pessoa
    PortabilidadeCanalContratante.Clicou o botão "ANALISAR" da segunda pessoa

Preencher formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM e clicou no botão "SALVAR"
    PortabilidadeCanalContratante.Preencheu formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM e clicou no botão "SALVAR"

Validar preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA PARCIAL
    PortabilidadeCanalContratante.Validou preenchimento da "situação" da pessoa igual a PORTABILIDADE APROVADA PARCIAL

Clicar menu "FINALIZAR PROTOCOLO"
    PortabilidadeCanalContratante.Clicar o menu "FINALIZAR PROTOCOLO"

Clicar botão "SIM" da modal de Confirmação com a mensagem "Deseja Finalizar Protocolo?"
    PortabilidadeCanalContratante.Clicar botão "SIM" da modal Confirmação com a mensagem "Deseja Finalizar Protocolo?"

Validar apresentação da mensagem "Protocolo Finalizado.", "Situação" para APROVADA e o campo "Data Encerramento Protocolo" com a data e hora atual
    PortabilidadeCanalContratante.Validar apresentação da mensagem "Protocolo Finalizado.", a "Situação" para APROVADA e o campo "Data Encerramento Protocolo" com a data e hora atual

Selecionar no campo "Funções Permitidas" a opção "Transferência de Grupo Familiar"
    TranfGrupoFamiliarCanal.Selecionou no campo "Funções Permitidas" a opção "Transferência de Grupo Familiar"

Selecionar no campo "Funções Permitidas" a opção "Portabilidade"
    PortabilidadeCanalContratante.Selecionou no campo "Funções Permitidas" a opção "Portabilidade"

Selecionar no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    ExclusaoBeneficiariosMassa.Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"

Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Cadastrou Beneficiários PJ que o CPF não exista no CADSUS, com e-mail    @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}


# com mais de 2 beneficiarios
Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), mais de 2 Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Cadastrou mais de 1 Beneficiários PJ que o CPF não exista no CADSUS, com e-mail    @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}


Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), sem Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Cadastrou Beneficiário Titular PJ que o CPF não exista no CADSUS, com e-mail   @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}


Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Cadastrou Beneficiários PJ que o CPF não exista no CADSUS, com e-mail    @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}

# empresarial com mais de 1 beneficiario
Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com mais de 1 Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Cadastrou mais de 1 Beneficiários PJ que o CPF não exista no CADSUS, com e-mail    @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}



Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários e "Integração automática" igual a TRANSFERÊNCIA DE GRUPO FAMILIAR
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Integrarção automática igual a TRANSFERÊNCIA DE GRUPO FAMILIAR  ${arg1[1]}
    Cadastrou Beneficiários PJ que o CPF não exista no CADSUS, com e-mail    @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}    


Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), sem Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    # Cadastrou Beneficiário Titular PJ que o CPF não exista no CADSUS, com e-mail   @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral    @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}


Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Cadastrou Beneficiários PJ que o CPF não exista no CADSUS, com e-mail    @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}


Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), sem Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}


Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Cadastrou Beneficiários PJ que o CPF não exista no CADSUS, com e-mail    @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}


Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), sem Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Cadastrou Beneficiário Titular CAEPF que o CPF não exista no CADSUS, com e-mail   @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}

Acessou o sistema CRM
    Comum.Abrir Nav
    Usuário logou no sistema

Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência
    [Arguments]  ${arg1}
    ConferenciaPesquisa.Clicar Encaminhado para aprovação - Decrescente
    ConferenciaPesquisa.Clicar em Conferir    ${arg1[1]}

Validar que o campo "Usuário Canal do Contratante" está preenchido
    InclusaoBeneficiarioCanalContratante.Validou que o campo "Usuário Canal do Contratante" está preenchido

Validar a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)
    InclusaoBeneficiarioCanalContratante.Validou que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" somente dos Beneficiários Dependentes Filhos (normal, estudante, especial, recem nato, adotivo)

Clicar na aba "Movimentação Cadastral"
    InclusaoBeneficiarioCanalContratante.Clicou na aba "Movimentação Cadastral"

Contrato os Beneficiários incluidos
    InclusaoBeneficiarioCanalContratante.No Contrato os Beneficiários incluidos

Editou o Contrato, marcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS) e com campo "Beneficiários - Inclusões sem carência" diferente de SIM
    ContratosDetalhes.Editar o Contrato, marcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS)
    ContratosDetalhes.Editou Contrato, com campo "Beneficiários - Inclusões sem carência" diferente de SIM

Editou o Contrato, marcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS) e com campo "Beneficiários - Inclusões sem carência" igual a SIM
    ContratosDetalhes.Editar o Contrato, marcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS)
    ContratosDetalhes.Editou Contrato, com campo "Beneficiários - Inclusões sem carência" igual a SIM

Validar que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" - 301 DIAS para todos os beneficiários
    InclusaoBeneficiarioCanalContratante.Validou que a coluna "Data Base Carência" foi preenchido com a "Data Inicio Vigência" - 301 DIAS para todos os beneficiários

Data de Admissão for menor ou igual a 10, então a "Data Base de Carência" é igual a Data Início Vigência – 301 Dias
    InclusaoBeneficiarioCanalContratante.Se Data de Admissão for menor ou igual a 10, então a "Data Base de Carência" é igual a Data Início Vigência – 301 Dias

Data de Admissão for maior que 10, então a "Data Base de Carência" é igual a Data Início Vigência
    InclusaoBeneficiarioCanalContratante.Se Data de Admissão for maior que 10, então a "Data Base de Carência" é igual a Data Início Vigência

Editou o Contrato, marcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS)
    ContratosDetalhes.Editar o Contrato, marcando o campo "Habilitar" coluna PARÂMETROS PARA APLICAÇÃO DE CARÊNCIA (DIAS)

Validar que coluna "Data Base Carência" foi preenchido
    InclusaoBeneficiarioCanalContratante.Validou que a coluna "Data Base Carência" foi preenchido


Ativou os agendadores "Conferência - Realizar conferência automática" e "Solicitação de Integração Automática"
    Wait Until Page Contains   Usuários Canal do Contratante » prime1   timeout=${TIMEOUT}
    Mouse Over  id:usermenu
    Sleep       3s
    Click Element    xpath://div[@id='globalLinks']//ul/li[2]
    Wait Until Page Contains   Administração   timeout=${TIMEOUT}
    Click Element  id:scheduler

    Wait Until Page Contains   Agendador » Pesquisar » Pesquisar   timeout=${TIMEOUT}
    Click Element  id:search_form_clear
    Input Text  id:name_basic  Conferência - Realizar conferência automática
    Click Element  id:search_form_submit
    Click Element  xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[3]/b/a

    Wait Until Page Contains   Agendador » Conferência - Realizar conferência automática   timeout=${TIMEOUT}
    ${s}  Run Keyword And Ignore Error   Element Text Should Be  id:status  Ativo
    Run Keyword If  "${s[0]}" == "FAIL"   Click Element  id:edit_button
    Run Keyword If  "${s[0]}" == "FAIL"   Select From List By Label   id:status   Ativo
    Run Keyword If  "${s[0]}" == "FAIL"   Press Keys   None   ALT+A

    Wait Until Page Contains   Agendador » Conferência - Realizar conferência automática   timeout=${TIMEOUT}
    Mouse Over  id:usermenu
    Sleep       3s
    Click Element    xpath://div[@id='globalLinks']//ul/li[2]
    Wait Until Page Contains   Administração   timeout=${TIMEOUT}
    Click Element  id:scheduler

    Wait Until Page Contains   Agendador » Pesquisar » Pesquisar   timeout=${TIMEOUT}
    Click Element  id:search_form_clear
    Input Text  id:name_basic  Solicitação de Integração Automática
    Click Element  id:search_form_submit
    Click Element  xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[3]/b/a

    Wait Until Page Contains   Agendador » Solicitação de Integração Automática  timeout=${TIMEOUT}
    ${t}  Run Keyword And Ignore Error   Element Text Should Be  id:status  Ativo
    Run Keyword If  "${t[0]}" == "FAIL"   Click Element  id:edit_button
    Run Keyword If  "${t[0]}" == "FAIL"   Select From List By Label   id:status   Ativo
    Run Keyword If  "${t[0]}" == "FAIL"   Press Keys   None   ALT+A


Pesquisar Identificador de origem
    [Arguments]  @{arg1}
    Wait Until Page Contains   Conferência » Pesquisar   timeout=${TIMEOUT}
    Click Element  id:search_form_clear
    Input Text  id:name_basic  ${arg1[1]}
    Click Element  id:search_form_submit
    Sleep  3s
    Click Element  xpath://*[@id="MassUpdate"]/table/tbody/tr[1]/td[2]/b/a


# gabriel novo
Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com 2 ou mais Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO ADESÃO, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Cadastrou mais de 1 um Beneficiários CAEPF que o CPF não exista no CADSUS, com e-mail    @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}

Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, com 4 Titulares
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Cadastrou mais de 3 Beneficiarios Titulares CAEPF que o CPF não exista no CADSUS, com e-mail      @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}


Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, com 2 ou mais Beneficiários
    [Arguments]  @{arg1}
    Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Mov Cadastral)  @{arg1}
    Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado, campo "Número de Vidas" menor que 29    @{arg1}
    Cadastrou uma Cotação, com "Tipo de Contratação" COLETIVO EMPRESARIAL, com 2 Produto Assistencial    @{arg1}
    Validar Processo de Declaração de Saude    @{arg1}
    Apresentar a tela Contratos » com   ${arg1[1]}
    Cadastrou mais de 1 um Beneficiários CAEPF que o CPF não exista no CADSUS, com e-mail    @{arg1}
    Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{arg1}
    Acessou o módulo Conferência
    Clicou no menu "CONFERIR PROCESSOS"
    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    Clicou no botão "CONFERIR" do Segundo Contrato em Conferência     ${arg1[1]}
    Clicou no botão "SIM" da modal de Confirmação
    Clicar no menu "VALIDAR DADOS"    ${arg1[1]}
    Clicar no botão "SIM" da modal de Confirmação (Validar Dados)
    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS"    ${arg1[1]}
    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Clicar no registro "Integração Solicitada"
    Clicar no botão "EFETUAR INTEGRAÇÃO"  ${arg1[1]}
    CRM deve atualizar a tela Solicitação de Integração » Titulo Contrato, com a situação "Integrado com sucesso"
    No Contrato os campos serão preenchidos, "Situação" igual a INTEGRADO, "Id Contratante Sistema Gestão", "ID no Sistema de Gestão" - Mov Cadastral  @{arg1}
    Clicou na submenu <Contratos> do <Comercial>
    ContratosDetalhes.Pesquisar Contrato cadastrado  ${arg1}
    Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos    ${arg1[1]}


Apresenta painel "Dados Envio Análise" com os campos "Data/Hora Envio para Análise" preenchido com a data e hora atual e "Responsável Envio para Análise" igual ao Usuário logado
    SolicitacaoPortabilidade.Apresentar o painel "Dados Envio Análise" com os campos "Data/Hora Envio para Análise" preenchido com a data e hora atual e "Responsável Envio para Análise" igual ao Usuário logado