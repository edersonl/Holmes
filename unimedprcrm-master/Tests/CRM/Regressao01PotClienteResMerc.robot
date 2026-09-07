*** Settings ***
Resource    ../../main.resource
Default Tags    Passed
Suite Setup     Instancia Variaveis  01
Test Setup      Comum.Abrir Nav
Test Teardown   Comum.Fechar Nav

*** Variables ***

*** Test Cases ***
Teste de Regressão 1 - Potencial Cliente - CADASTRAR UM POTENCIAL PF COM DADOS OBRIGATORIOS (NOME DA CONTA E NOME)									
    [Documentation]  Potencial Cliente - TR001: CADASTRAR UM POTENCIAL PF COM DADOS OBRIGATORIOS (NOME DA CONTA E NOME)								
    [Tags]    full    PF
    Dado         Usuário logou no sistema
        E        Clicou na submenu <Potencial Cliente> do <Comercial>  
        Então    Apresentar a Tela de Pesquisa Potencial Cliente
    Quando       Apertar o Botão Criar do Pontecial Cliente
        Então    Apresentar a Tela de Cadastro Pontecial Cliente
    Quando       Selecionar o Tipo Pessoa como Pessoa Física
        E        Preencher os campos "Nome da conta" e "Nome" com  @{CLIENTEPF1}
        E        Clicar no botão Salvar Potencial Cliente
    # Então        Apresentar a modal com a mensagem Nenhum endereço foi cadastrado, deseja cadastrar um novo endereço?
    # E            Clicar no Botão Não do Modal
    Então        Apresentar a Tela Potencial Cliente » NOME  ${CLIENTEPF1[1]}

Teste de Regressão 2 - Potencial Cliente - CADASTRAR UM POTENCIAL PF COM TODOS OS DADOS									
    [Documentation]  Potencial Cliente - TR002: CADASTRAR UM POTENCIAL PF COM TODOS OS DADOS			
    [Tags]    full    PF    OPOPOTENCIALPF24
    Dado         Usuário logou no sistema
        E        Clicou na submenu <Potencial Cliente> do <Comercial>  
        Então    Apresentar a Tela de Pesquisa Potencial Cliente
    Quando       Apertar o Botão Criar do Pontecial Cliente
        Então    Apresentar a Tela de Cadastro Pontecial Cliente
    Quando       Selecionar o Tipo Pessoa como Pessoa Física
        E        Preencher todos os campos de Pessoa Física  @{CLIENTEPF2}
        E        Clicar no botão Salvar Potencial Cliente
    # Então      Apresentar a modal com a mensagem Nenhum endereço foi cadastrado, deseja cadastrar um novo endereço?
    # E          Clicar no Botão Não do Modal
    Então        Apresentar a Tela Potencial Cliente » NOME  ${CLIENTEPF2[1]}

Teste de Regressão 3 - Potencial Cliente - CADASTRAR UM POTENCIAL PJ CPNJ COM DADOS OBRIGATORIOS								
    [Documentation]  Potencial Cliente - TR003: CADASTRAR UM POTENCIAL PJ CPNJ COM DADOS OBRIGATORIOS					
    [Tags]    full    PJ
    Dado            Usuário logou no sistema
        E           Clicou na submenu <Potencial Cliente> do <Comercial>  
        Então       Apresentar a Tela de Pesquisa Potencial Cliente
    Quando          Apertar o Botão Criar do Pontecial Cliente
        Então       Apresentar a Tela de Cadastro Pontecial Cliente
    Quando          Selecionar o Tipo Pessoa como Pessoa Júridica (CNPJ)
        E           Preencher os campos "Nome da conta" e "Nome" com  @{CLIENTECNPJ3}
        E           Clicar no botão Salvar Potencial Cliente
    # Então         Apresentar a modal com a mensagem Nenhum endereço foi cadastrado, deseja cadastrar um novo endereço?
    # E             Clicar no Botão Não do Modal
    Então           Apresentar a Tela Potencial Cliente » NOME  ${CLIENTECNPJ3[1]}

Teste de Regressão 4 - Potencial Cliente - CADASTRAR UM POTENCIAL PJ CPNJ COM TODOS OS DADOS								
    [Documentation]  Potencial Cliente - TR004: CADASTRAR UM POTENCIAL PJ CPNJ COM TODOS OS DADOS							
    [Tags]    full    PJ
    Dado            Usuário logou no sistema
        E           Clicou na submenu <Potencial Cliente> do <Comercial>  
        Então       Apresentar a Tela de Pesquisa Potencial Cliente
    Quando          Apertar o Botão Criar do Pontecial Cliente
        Então       Apresentar a Tela de Cadastro Pontecial Cliente
    Quando          Selecionar o Tipo Pessoa como Pessoa Júridica (CNPJ)
        E           Preencher todos os campos de Pessoa Jurídica CNPJ  @{CLIENTECNPJ4}
        E           Clicar no botão Salvar Potencial Cliente
    # Então         Apresentar a modal com a mensagem Nenhum endereço foi cadastrado, deseja cadastrar um novo endereço?
    # E             Clicar no Botão Não do Modal
    Então           Apresentar a Tela Potencial Cliente » NOME  ${CLIENTECNPJ4[1]}

Teste de Regressão 5 - Potencial Cliente - CADASTRAR UM POTENCIAL PJ CAEPF COM DADOS OBRIGATORIOS								
    [Documentation]  Potencial Cliente - TR005: CADASTRAR UM POTENCIAL PJ CAEPF COM DADOS OBRIGATORIOS								
    [Tags]    full    CAEPF
    Dado            Usuário logou no sistema
        E           Clicou na submenu <Potencial Cliente> do <Comercial>  
        Então       Apresentar a Tela de Pesquisa Potencial Cliente
    Quando          Apertar o Botão Criar do Pontecial Cliente
        Então       Apresentar a Tela de Cadastro Pontecial Cliente
    Quando          Selecionar o Tipo Pessoa como Pessoa Júridica (CAEPF)
        E           Preencher os campos "Nome da conta" e "Nome" com  @{CLIENTECAEPF5}
        E           Clicar no botão Salvar Potencial Cliente
    # Então         Apresentar a modal com a mensagem Nenhum endereço foi cadastrado, deseja cadastrar um novo endereço?
    # E             Clicar no Botão Não do Modal
    Então           Apresentar a Tela Potencial Cliente » NOME  ${CLIENTECAEPF5[1]}

Teste de Regressão 6 - Potencial Cliente - CADASTRAR UM POTENCIAL PJ CAEPF COM TODOS OS DADOS								
    [Documentation]  Potencial Cliente - TR006: CADASTRAR UM POTENCIAL PJ CAEPF COM TODOS OS DADOS					
    [Tags]    full    CAEPF
    Dado            Usuário logou no sistema
        E           Clicou na submenu <Potencial Cliente> do <Comercial>  
        Então       Apresentar a Tela de Pesquisa Potencial Cliente
    Quando          Apertar o Botão Criar do Pontecial Cliente
        Então       Apresentar a Tela de Cadastro Pontecial Cliente
    Quando          Selecionar o Tipo Pessoa como Pessoa Júridica (CAEPF)
        E           Preencher todos os campos de Pessoa Jurídica CAEPF  @{CLIENTECAEPF6}
        E           Clicar no botão Salvar Potencial Cliente
    # Então         Apresentar a modal com a mensagem Nenhum endereço foi cadastrado, deseja cadastrar um novo endereço?
    # E             Clicar no Botão Não do Modal
    Então           Apresentar a Tela Potencial Cliente » NOME  ${CLIENTECAEPF6[1]}


Teste de Regressão 7 - RESERVA DE MERCADO - GARANTIR RESERVA DE MERCADO PARA O POTENCIAL PF COM TODOS OS DADOS								
    [Documentation]  Potencial Cliente - TR007: GARANTIR RESERVA DE MERCADO PARA O POTENCIAL PF COM TODOS OS DADOS
    ...              Dependente do TR002
    [Tags]    full    PF    OPOPOTENCIALPF24
    Dado            Usuário logou no sistema
        E           Clicou na submenu <Potencial Cliente> do <Comercial>   
        Então       Apresentar a Tela de Pesquisa Potencial Cliente
    Quando          Preencher os Campos de Pesquisa com  @{CLIENTEPF2}
        E           Apertar o Botão Pesquisar do Potencial Cliente
        Então       Apresentar no resultado da pesquisa o nome do pontencial cliente  @{CLIENTEPF2}
    E               Clicou No Resultado Da Pesquisa De Potencial Contas
        Então       Apresentar A Tela De Detalhes Do Potencial Cliente Com Os Dados  @{CLIENTEPF2}
    E               Clicar no subbotão Solicitar Reserva de Mercado
        Então       Apresentar a Mensagem de Sucesso com o Código de Reserva de Mercado e Conta do Cliente

Teste de Regressão 8 - RESERVA DE MERCADO - GARANTIR RESERVA DE MERCADO PARA O POTENCIAL PJ CPNJ COM TODOS OS DADOS
    [Documentation]  Potencial Cliente - TR008: GARANTIR RESERVA DE MERCADO PARA O POTENCIAL PJ CPNJ COM TODOS OS DADOS
    ...              Dependente do TR004
    [Tags]    full    PJ
    Dado            Usuário logou no sistema
        E           Clicou na submenu <Potencial Cliente> do <Comercial>   
        Então       Apresentar a Tela de Pesquisa Potencial Cliente
    Quando          Preencher os Campos de Pesquisa com  @{CLIENTECNPJ4}
        E           Apertar o Botão Pesquisar do Potencial Cliente
        Então       Apresentar no resultado da pesquisa o nome do pontencial cliente  @{CLIENTECNPJ4}
    E               Clicou No Resultado Da Pesquisa De Potencial Contas
        Então       Apresentar A Tela De Detalhes Do Potencial Cliente Com Os Dados  @{CLIENTECNPJ4}
    E               Clicar no subbotão Solicitar Reserva de Mercado
        Então       Apresentar a Mensagem de Sucesso com o Código de Reserva de Mercado e Conta do Cliente

Teste de Regressão 9 - RESERVA DE MERCADO - GARANTIR RESERVA DE MERCADO PARA O POTENCIAL PJ CAEPF COM TODOS OS DADOS
    [Documentation]  Potencial Cliente - TR009: GARANTIR RESERVA DE MERCADO PARA O POTENCIAL PJ CAEPF COM TODOS OS DADOS
    ...              Dependente do TR006
    [Tags]    full    CAEPF
    Dado            Usuário logou no sistema
        E           Clicou na submenu <Potencial Cliente> do <Comercial>   
        Então       Apresentar a Tela de Pesquisa Potencial Cliente
    Quando          Preencher os Campos de Pesquisa com  @{CLIENTECAEPF6}
        E           Apertar o Botão Pesquisar do Potencial Cliente
        Então       Apresentar no resultado da pesquisa o nome do pontencial cliente  @{CLIENTECAEPF6}
    E               Clicou No Resultado Da Pesquisa De Potencial Contas
        Então       Apresentar A Tela De Detalhes Do Potencial Cliente Com Os Dados  @{CLIENTECAEPF6}
    E               Clicar no subbotão Solicitar Reserva de Mercado
        Então       Apresentar a Mensagem de Sucesso com o Código de Reserva de Mercado e Conta do Cliente