*** Settings ***
Resource    ../../main.resource
# Default Tags    Passed
Suite Setup     Run Keywords     Executar as querys para Validar e Gerar Massa de Dados    AND    Instancia Variaveis   04
Test Setup      Abrir Nav
Test Teardown   Comum.Fechar Nav

*** Variables ***

*** Test Cases ***
Teste de Regressão 43 - COTAÇÃO - APRESENTAR A TELA DE COTAÇÃO VIA POTENCIAL PF
    [Documentation]  COTAÇÃO - TR043: APRESENTAR A TELA DE COTAÇÃO VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR024
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{COTPOTENCIALPF43}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPF43}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPF43}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPF43[4]}  ${COTPOTENCIALPF43[8]}
        E        Preencher o campo Origem de Vida com  ${COTPOTENCIALPF43[10]}
        E        Clicar no Botão Salvar Oportunidade
        E        Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Então        Apresentar a Tela de Cadastro de Cotação

Teste de Regressão 44 - COTAÇÃO - SALVAR UMA COTAÇÃO VIA POTENCIAL PF
    [Documentation]  COTAÇÃO - TR044: SALVAR UMA COTAÇÃO VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR024
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{COTPOTENCIALPF44}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPF44}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPF44}
    E            Preencher o campo "Número de Vidas" e "Tipo" com   ${COTPOTENCIALPF44[4]}  ${COTPOTENCIALPF44[8]}
    E            Preencher o campo Origem de Vida com  ${COTPOTENCIALPF44[10]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF44[12]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF44[11]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF44[4]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF44[2]}


Teste de Regressão 45 - COTAÇÃO - SALVAR UMA COTAÇÃO COM CONVENIO VIA POTENCIAL PF
    [Documentation]  COTAÇÃO - TR045: SALVAR UMA COTAÇÃO COM CONVENIO VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR024
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{COTPOTENCIALPF45}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPF45}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPF45}
    E            Preencher o campo "Número de Vidas" e "Tipo" com   ${COTPOTENCIALPF45[4]}  ${COTPOTENCIALPF45[8]}
    E            Preencher o campo Origem de Vida com  ${COTPOTENCIALPF45[10]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF45[12]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPF45[13]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF45[11]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF45[4]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF45[2]}


Teste de Regressão 46 - COTAÇÃO - SALVAR UMA COTAÇÃO SEM ACESSORIO VIA POTENCIAL PF
    [Documentation]  COTAÇÃO - TR046: SALVAR UMA COTAÇÃO SEM ACESSORIO VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR024
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{COTPOTENCIALPF46}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPF46}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPF46}
    E            Preencher o campo "Número de Vidas" e "Tipo" com   ${COTPOTENCIALPF46[4]}  ${COTPOTENCIALPF46[8]}
    E            Preencher o campo Origem de Vida com  ${COTPOTENCIALPF46[10]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF46[12]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF46[11]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF46[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF46[2]}

Teste de Regressão 47 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM DESCONTO VIA POTENCIAL PF
    [Documentation]  COTAÇÃO - TR047: SALVAR UMA COTAÇÃO, COM DESCONTO VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR024
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{COTPOTENCIALPF47}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPF47}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPF47}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPF47[4]}  ${COTPOTENCIALPF47[8]}
    E            Preencher o campo Origem de Vida com  ${COTPOTENCIALPF47[10]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF47[12]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF47[11]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF47[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Preencher Negociação com  ${COTPOTENCIALPF47[13]}  ${COTPOTENCIALPF47[14]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF47[2]}

Teste de Regressão 48 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM ACRÉSCIMO VIA POTENCIAL PF
    [Documentation]  COTAÇÃO - TR048: SALVAR UMA COTAÇÃO, COM ACRÉSCIMO VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR024
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{COTPOTENCIALPF48}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPF48}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPF48}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPF48[4]}  ${COTPOTENCIALPF48[8]}
    E            Preencher o campo Origem de Vida com  ${COTPOTENCIALPF48[10]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF48[12]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF48[11]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF48[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Preencher Negociação com  ${COTPOTENCIALPF48[13]}  ${COTPOTENCIALPF48[14]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF48[2]}

Teste de Regressão 49 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E DESCONTO VIA POTENCIAL PF
    [Documentation]  COTAÇÃO - TR049: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E DESCONTO VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR024
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{COTPOTENCIALPF49}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPF49}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPF49}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPF49[4]}  ${COTPOTENCIALPF49[8]}
    E            Preencher o campo Origem de Vida com  ${COTPOTENCIALPF49[10]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF49[12]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPF49[13]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF49[11]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF49[4]}
    E            Preencher Negociação com  ${COTPOTENCIALPF49[14]}  ${COTPOTENCIALPF49[15]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF49[2]}

Teste de Regressão 50 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E ACRESCIMO VIA POTENCIAL PF
    [Documentation]  COTAÇÃO - TR050: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E ACRESCIMO VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR024
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{COTPOTENCIALPF50}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPF50}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPF50}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPF50[4]}  ${COTPOTENCIALPF50[8]}
    E            Preencher o campo Origem de Vida com  ${COTPOTENCIALPF50[10]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF50[12]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPF50[13]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF50[11]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF50[4]}
    E            Preencher Negociação com  ${COTPOTENCIALPF50[14]}  ${COTPOTENCIALPF50[15]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF50[2]}

Teste de Regressão 51 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PJ VIA POTENCIAL PF
    [Documentation]  COTAÇÃO - TR051: SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PJ VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR024
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Potencial Cliente> do <Comercial>
        E        Pesquisou Potencial Conta por  @{COTPOTENCIALPF51}
        E        Clicou no Resultado da Pesquisa de Potencial Contas	
        Então    Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPF51}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    Então        Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPF51}
    E            Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPF51[4]}  ${COTPOTENCIALPF51[8]}
    E            Preencher o campo Origem de Vida com  ${COTPOTENCIALPF51[10]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF51[12]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF51[11]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF51[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF51[2]}

Teste de Regressão 52 - COTAÇÃO - CRIAR UMA COTAÇÃO VIA CONTA PF
    [Documentation]  COTAÇÃO - TR052: CRIAR UMA COTAÇÃO VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por Nome Conta e Tipo   @{COTPOTENCIALPF52}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPF52}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPF52}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPF52[2]}  ${COTPOTENCIALPF52[3]}
    E            Preencher o campo Origem de Vida com  ${COTPOTENCIALPF52[5]} 
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPF52[1]}
    Quando       Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Então        Apresentar a Tela de Cadastro de Cotação

Teste de Regressão 53 - COTAÇÃO - SALVAR UMA COTAÇÃO VIA CONTA PF COM PRODUTO
    [Documentation]  COTAÇÃO - TR053: SALVAR UMA COTAÇÃO VIA CONTA PF COM PRODUTO
    ...              DEPENDENCIA DO CONTAS - TR022
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPF53}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPF53}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPF53}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPF53[2]}  ${COTPOTENCIALPF53[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPF53[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPF53[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF53[7]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF53[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF53[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF53[1]}

Teste de Regressão 54 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO VIA CONTA PF
    [Documentation]  COTAÇÃO - TR054: SALVAR UMA COTAÇÃO, COM CONVÊNIO VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPF54}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPF54}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPF54}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPF54[2]}  ${COTPOTENCIALPF54[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPF54[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPF54[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF54[7]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPF54[8]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF54[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF54[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF54[1]}

Teste de Regressão 55 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM ACESSÓRIO VIA CONTA PF
    [Documentation]  COTAÇÃO - TR055: SALVAR UMA COTAÇÃO, COM ACESSÓRIO VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPF55}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPF55}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPF55}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPF55[2]}  ${COTPOTENCIALPF55[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPF55[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPF55[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF55[7]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF55[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF55[2]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF54[1]}

Teste de Regressão 56 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM DESCONTO VIA CONTA PF
    [Documentation]  COTAÇÃO - TR056: SALVAR UMA COTAÇÃO, COM DESCONTO VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPF56}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPF56}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPF56}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPF56[2]}  ${COTPOTENCIALPF56[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPF56[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPF56[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF56[6]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF56[5]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF56[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Preencher Negociação com  ${COTPOTENCIALPF56[7]}  ${COTPOTENCIALPF56[8]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF56[1]}

Teste de Regressão 57 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM ACRÉSCIMO VIA CONTA PF
    [Documentation]  COTAÇÃO - TR057: SALVAR UMA COTAÇÃO, COM ACRÉSCIMO VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPF57}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPF57}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPF57}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPF57[2]}  ${COTPOTENCIALPF57[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPF57[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPF57[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF57[7]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF57[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF57[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Preencher Negociação com  ${COTPOTENCIALPF57[8]}  ${COTPOTENCIALPF57[9]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF57[1]}

Teste de Regressão 58 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E DESCONTO VIA CONTA PF
    [Documentation]  COTAÇÃO - TR058: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E DESCONTO VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPF58}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPF58}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPF58}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPF58[2]}  ${COTPOTENCIALPF58[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPF58[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPF58[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF58[7]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPF58[8]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF58[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF58[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPF58[9]}  ${COTPOTENCIALPF58[10]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF58[1]}

Teste de Regressão 59 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E ACRESCIMO VIA CONTA PF
    [Documentation]  COTAÇÃO - TR059: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E ACRESCIMO VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPF59}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPF59}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPF59}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPF59[2]}  ${COTPOTENCIALPF59[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPF59[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPF59[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF59[7]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPF59[8]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF59[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF59[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPF59[9]}  ${COTPOTENCIALPF59[10]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF59[1]}

Teste de Regressão 60 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PJ VIA CONTA PF
    [Documentation]  COTAÇÃO - TR060: SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PJ VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPF60}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPF60}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPF60}
    E            Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPF60[2]}  ${COTPOTENCIALPF60[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPF60[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPF60[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF60[7]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF60[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF60[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF60[1]}

Teste de Regressão 61 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, DESCONTO E ACRÉSCIMO VIA COTAÇÃO PF
    [Documentation]  COTAÇÃO - TR061: SALVAR UMA COTAÇÃO, COM CONVÊNIO, DESCONTO E ACRÉSCIMO VIA COTAÇÃO PF
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{COTPOTENCIALPF61}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  ${COTPOTENCIALPF61[2]}  ${COTPOTENCIALPF61[3]}  ${COTPOTENCIALPF61[4]}
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF61[7]}
    E            Preencher campo "Titulo" com  ${COTPOTENCIALPF61[11]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPF61[8]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF61[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF61[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPF61[9]}  ${COTPOTENCIALPF61[10]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF61[11]}

Teste de Regressão 62 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E ACRÉSCIMO VIA COTAÇÃO PF
    [Documentation]  COTAÇÃO - TR062: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E ACRÉSCIMO VIA COTAÇÃO PF
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{COTPOTENCIALPF62}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  ${COTPOTENCIALPF62[2]}  ${COTPOTENCIALPF61[3]}  ${COTPOTENCIALPF61[4]}
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF62[7]}
    E            Preencher campo "Titulo" com  ${COTPOTENCIALPF62[11]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPF62[8]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF62[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF62[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPF62[9]}  ${COTPOTENCIALPF62[10]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF62[11]}

Teste de Regressão 63 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PJ VIA COTAÇÃO PF
    [Documentation]  COTAÇÃO - TR063: SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PJ VIA COTAÇÃO PF
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{COTPOTENCIALPF63}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  ${COTPOTENCIALPF63[2]}  ${COTPOTENCIALPF61[3]}  ${COTPOTENCIALPF61[4]}
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF63[7]}
    E            Preencher campo "Titulo" com  ${COTPOTENCIALPF63[11]}
    E            Seleciona o campo "Demonstrou interesse em produtos PF e PJ?" no Painel de Oportunidade
    E            Selecionar Um Convênio  ${COTPOTENCIALPF63[8]}
    E            Selecionar campo "Tipo de Contratação" com  ${COTPOTENCIALPF63[12]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPF63[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF63[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPF63[9]}  ${COTPOTENCIALPF63[10]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPF63[11]}

Teste de Regressão 64 - COTAÇÃO - CRIAR UMA COTAÇÃO VIA POTENCIAL PJ
    [Documentation]  COTAÇÃO - TR043: CRIAR UMA COTAÇÃO VIA POTENCIAL PJ
    ...              DEPENDENCIA DO CONTAS - TR033
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALPJ64}
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPJ64}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPJ64}
    Quando       Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ64[4]}  ${COTPOTENCIALPJ64[13]}
        E        Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ64[15]}
        E        Clicar no Botão Salvar Oportunidade
        E        Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Então        Apresentar a Tela de Cadastro de Cotação

Teste de Regressão 65 - COTAÇÃO - SALVAR UMA COTAÇÃO VIA POTENCIAL PJ
    [Documentation]  COTAÇÃO - TR065: SALVAR UMA COTAÇÃO VIA POTENCIAL PJ
    ...              DEPENDENCIA DO CONTAS - TR033
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALPJ65}
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPJ65}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPJ65}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ65[4]}  ${COTPOTENCIALPJ65[13]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ65[15]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ65[17]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ65[16]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ65[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ65[2]}

Teste de Regressão 66 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO VIA POTENCIAL PJ, COM UM PRODUTO
    [Documentation]  COTAÇÃO - TR066: SALVAR UMA COTAÇÃO, COM CONVÊNIO VIA POTENCIAL PJ, COM UM PRODUTO
    ...              DEPENDENCIA DO CONTAS - TR033
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALPJ66}
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPJ66}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPJ66}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ66[4]}  ${COTPOTENCIALPJ66[13]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ66[15]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ66[17]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ66[18]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ66[16]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ66[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ66[2]}

Teste de Regressão 67 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM ACESSORIO VIA POTENCIAL PJ, COM UM PRODUTO
    [Documentation]  COTAÇÃO - TR067: SALVAR UMA COTAÇÃO, COM ACESSORIO VIA POTENCIAL PJ, COM UM PRODUTO
    ...              DEPENDENCIA DO CONTAS - TR033
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALPJ67}
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPJ67}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPJ67}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ67[4]}  ${COTPOTENCIALPJ67[13]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ67[15]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ67[17]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ67[16]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ67[4]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ67[2]}

Teste de Regressão 68 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM DESCONTO VIA POTENCIAL PJ, COM UM PRODUTO
    [Documentation]  COTAÇÃO - TR068: SALVAR UMA COTAÇÃO, COM DESCONTO VIA POTENCIAL PJ, COM UM PRODUTO
    ...              DEPENDENCIA DO CONTAS - TR033
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALPJ68}
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPJ68}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPJ68}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ68[4]}  ${COTPOTENCIALPJ68[13]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ68[15]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ68[17]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ68[16]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ68[4]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ68[18]}  ${COTPOTENCIALPJ68[19]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ68[2]}

Teste de Regressão 69 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM ACRESCIMO VIA POTENCIAL PJ, COM UM PRODUTO
    [Documentation]  COTAÇÃO - TR069: SALVAR UMA COTAÇÃO, COM ACRESCIMO VIA POTENCIAL PJ, COM UM PRODUTO
    ...              DEPENDENCIA DO CONTAS - TR033
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALPJ69}
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPJ69}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPJ69}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ69[4]}  ${COTPOTENCIALPJ69[13]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ69[15]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ69[17]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ69[16]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ69[4]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ69[18]}  ${COTPOTENCIALPJ69[19]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ69[2]}

Teste de Regressão 70 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E DESCONTO VIA CONTA PJ, COM UM PRODUTO
    [Documentation]  COTAÇÃO - TR070: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E DESCONTO VIA CONTA PJ, COM UM PRODUTO
    ...              DEPENDENCIA DO CONTAS - TR033
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALPJ70}
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPJ70}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPJ70}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ70[4]}  ${COTPOTENCIALPJ70[13]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ70[15]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ70[17]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ70[18]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ70[16]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ70[4]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ70[19]}  ${COTPOTENCIALPJ70[20]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ70[2]}

Teste de Regressão 71 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E ACRESCIMO VIA CONTA PJ, COM UM PRODUTO
    [Documentation]  COTAÇÃO - TR071: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E ACRESCIMO VIA CONTA PJ, COM UM PRODUTO
    ...              DEPENDENCIA DO CONTAS - TR033
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALPJ71}
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPJ71}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPJ71}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ71[4]}  ${COTPOTENCIALPJ71[13]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ71[15]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ71[17]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ71[18]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ71[16]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ71[4]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ71[19]}  ${COTPOTENCIALPJ71[20]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ71[2]}

Teste de Regressão 72 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA CONTA PJ, COM UM PRODUTO
    [Documentation]  COTAÇÃO - TR072: SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA CONTA PJ, COM UM PRODUTO
    ...              DEPENDENCIA DO CONTAS - TR033
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALPJ72}
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPJ72}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPJ72}
    E            Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ72[4]}  ${COTPOTENCIALPJ72[13]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ72[15]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ72[17]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ72[16]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ72[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ72[2]}

Teste de Regressão 73 - COTAÇÃO - CRIAR UMA COTAÇÃO VIA CONTA PJ
    [Documentation]  COTAÇÃO - TR073: CRIAR UMA COTAÇÃO VIA CONTA PJ
    ...              DEPENDENCIA DO CONTAS - TR039
    [Tags]    full
    Dado         Usuário logou no sistema 
        E        Clicou na submenu <Contas> do <Comercial>
        E        Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPJ73}
        E        Clicou no Resultado da Pesquisa de Contas	
        Então    Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPJ73}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPJ73}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ73[2]}  ${COTPOTENCIALPJ73[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ73[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPJ73[1]}
    Quando       Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    Então        Apresentar a Tela de Cadastro de Cotação

Teste de Regressão 74 - COTAÇÃO - SALVAR UMA COTAÇÃO VIA CONTA PJ
    [Documentation]  COTAÇÃO - TR074: SALVAR UMA COTAÇÃO VIA CONTA PJ
    ...              DEPENDENCIA DO CONTAS - TR039
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPJ74}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPJ74}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPJ74}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ74[2]}  ${COTPOTENCIALPJ74[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ74[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPJ74[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ74[7]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ74[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ74[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ74[1]}

Teste de Regressão 75 - COTAÇÃO - SALVAR UMA COTAÇÃO COM CONVENIO VIA CONTA PJ COM PRODUTO
    [Documentation]  COTAÇÃO - TR075: SALVAR UMA COTAÇÃO COM CONVENIO VIA CONTA PJ COM PRODUTO
    ...              DEPENDENCIA DO CONTAS - TR039
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPJ75}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPJ75}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPJ75}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ75[2]}  ${COTPOTENCIALPJ75[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ75[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPJ75[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ75[7]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ75[8]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ75[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ75[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ75[1]}

Teste de Regressão 76 - COTAÇÃO - SALVAR UMA COTAÇÃO COM ACESSORIO VIA CONTA PJ COM PRODUTO
    [Documentation]  COTAÇÃO - TR076: SALVAR UMA COTAÇÃO COM ACESSORIO VIA CONTA PJ COM PRODUTO
    ...              DEPENDENCIA DO CONTAS - TR039
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPJ76}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPJ76}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPJ76}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ76[2]}  ${COTPOTENCIALPJ76[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ76[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPJ76[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ76[7]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ76[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ76[2]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ76[1]}

Teste de Regressão 77 - COTAÇÃO - SALVAR UMA COTAÇÃO COM DESCONTO VIA CONTA PJ COM PRODUTO
    [Documentation]  COTAÇÃO - TR077: SALVAR UMA COTAÇÃO COM DESCONTO VIA CONTA PJ COM PRODUTO
    ...              DEPENDENCIA DO CONTAS - TR039
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPJ77}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPJ77}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPJ77}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ77[2]}  ${COTPOTENCIALPJ77[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ77[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPJ77[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ77[7]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ77[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ77[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ77[8]}  ${COTPOTENCIALPJ77[9]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ77[1]}

Teste de Regressão 78 - COTAÇÃO - SALVAR UMA COTAÇÃO COM ACRESCIMO VIA CONTA PJ COM PRODUTO
    [Documentation]  COTAÇÃO - TR078: SALVAR UMA COTAÇÃO COM ACRESCIMO VIA CONTA PJ COM PRODUTO
    ...              DEPENDENCIA DO CONTAS - TR039
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPJ78}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPJ78}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPJ78}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ78[2]}  ${COTPOTENCIALPJ78[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ78[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPJ78[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ78[7]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ78[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ78[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ78[8]}  ${COTPOTENCIALPJ78[9]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ78[1]}

Teste de Regressão 79 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E DESCONTO VIA CONTA PJ, COM UM PRODUTO
    [Documentation]  COTAÇÃO - TR079: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E DESCONTO VIA CONTA PJ, COM UM PRODUTO
    ...              DEPENDENCIA DO CONTAS - TR039
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPJ79}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPJ79}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPJ79}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ79[2]}  ${COTPOTENCIALPJ79[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ79[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPJ79[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ79[7]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ79[8]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ79[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ79[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ79[9]}  ${COTPOTENCIALPJ79[10]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ79[1]}

Teste de Regressão 80 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E ACRESCIMO VIA CONTA PJ, COM UM PRODUTO
    [Documentation]  COTAÇÃO - TR080: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E ACRESCIMO VIA CONTA PJ, COM UM PRODUTO
    ...              DEPENDENCIA DO CONTAS - TR039
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPJ80}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPJ80}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPJ80}
    E            Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ80[2]}  ${COTPOTENCIALPJ80[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ80[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPJ80[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ80[7]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ80[8]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ80[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ80[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ80[9]}  ${COTPOTENCIALPJ80[10]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ80[1]}

Teste de Regressão 81 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E ACRESCIMO VIA CONTA PJ, COM UM PRODUTO
    [Documentation]  COTAÇÃO - TR081: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E ACRESCIMO VIA CONTA PJ, COM UM PRODUTO
    ...              DEPENDENCIA DO CONTAS - TR039
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPJ81}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPJ81}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPJ81}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ81[2]}  ${COTPOTENCIALPJ81[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ81[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPJ81[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ81[7]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ81[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ81[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ81[1]}

Teste de Regressão 82 - COTAÇÃO - SALVAR UMA COTAÇÃO COLETIVO POR ADESÃO, COM CONVÊNIO, ACESSÓRIO E DESCONTO VIA COTAÇÃO PJ, COM UM PRODUTO
    [Documentation]  COTAÇÃO - TR082: SALVAR UMA COTAÇÃO COLETIVO POR ADESÃO, COM CONVÊNIO, ACESSÓRIO E DESCONTO VIA COTAÇÃO PJ, COM UM PRODUTO
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{COTPOTENCIALPJ82}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  ${COTPOTENCIALPJ82[2]}  ${COTPOTENCIALPJ82[3]}  ${COTPOTENCIALPJ82[4]}
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ82[6]}
    E            Preencher campo "Titulo" com  ${COTPOTENCIALPJ82[11]}
    E            Selecionar campo "Tipo de Contratação" com    "Coletivo por Adesão"
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ82[8]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ82[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ82[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ82[9]}  ${COTPOTENCIALPJ82[10]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ82[11]}

Teste de Regressão 83 - COTAÇÃO - SALVAR UMA COTAÇÃO COLETIVO POR ADESÃO, COM CONVÊNIO, ACESSÓRIO E ACRESCIMO VIA COTAÇÃO PJ, COM UM PRODUTO
    [Documentation]  COTAÇÃO - TR083: SALVAR UMA COTAÇÃO COLETIVO POR ADESÃO, COM CONVÊNIO, ACESSÓRIO E ACRESCIMO VIA COTAÇÃO PJ, COM UM PRODUTO
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{COTPOTENCIALPJ83}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  ${COTPOTENCIALPJ83[2]}  ${COTPOTENCIALPJ83[3]}  ${COTPOTENCIALPJ83[4]}
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ83[7]}
    E            Preencher campo "Titulo" com  ${COTPOTENCIALPJ83[11]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ83[8]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ83[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ83[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ83[9]}  ${COTPOTENCIALPJ83[10]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ83[11]}

Teste de Regressão 84 - COTAÇÃO - SALVAR UMA COTAÇÃO COLETIVO POR ADESÃO, COM CONVÊNIO, ACESSÓRIO E ACRESCIMO VIA COTAÇÃO PJ, COM UM PRODUTO
    [Documentation]  COTAÇÃO - TR084: SALVAR UMA COTAÇÃO COLETIVO POR ADESÃO, COM CONVÊNIO, ACESSÓRIO E ACRESCIMO VIA COTAÇÃO PJ, COM UM PRODUTO
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{COTPOTENCIALPJ84}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  ${COTPOTENCIALPJ84[2]}  ${COTPOTENCIALPJ84[3]}  ${COTPOTENCIALPJ84[4]}
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ84[7]}
    E            Preencher campo "Titulo" com  ${COTPOTENCIALPJ84[11]}
    E            Selecionar campo "Tipo de Contratação" com    "Coletivo por Adesão"
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ84[8]}
    E            Seleciona o campo "Demonstrou interesse em produtos PF e PJ?" no Painel de Oportunidade
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ84[6]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ84[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ84[9]}  ${COTPOTENCIALPJ84[10]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ84[11]}

Teste de Regressão 85 - COTAÇÃO - SALVAR UMA COTAÇÃO VIA POTENCIAL PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    [Documentation]  COTAÇÃO - TR085: SALVAR UMA COTAÇÃO VIA POTENCIAL PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    ...              DEPENDENCIA DO CONTAS - TR033
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALPJ85}
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPJ85}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPJ85}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ85[4]}  ${COTPOTENCIALPJ85[13]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ85[15]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ85[19]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ85[16]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ85[17]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ85[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ85[18]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ85[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ85[2]}

Teste de Regressão 86 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO, DESCONTO E ACRÉSCIMO VIA POTENCIAL PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    [Documentation]  COTAÇÃO - TR086: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO, DESCONTO E ACRÉSCIMO VIA POTENCIAL PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    ...              DEPENDENCIA DO CONTAS - TR033
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALPJ86}
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPJ86}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPJ86}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ86[4]}  ${COTPOTENCIALPJ86[13]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ86[15]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ86[24]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ86[17]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ86[16]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ86[18]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ86[4]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ86[19]}  ${COTPOTENCIALPJ86[20]}
    E            Clicar em Aprovar a Cotação
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ86[21]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ86[4]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ86[22]}  ${COTPOTENCIALPJ86[23]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ86[2]}

Teste de Regressão 87 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA POTENCIAL PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    [Documentation]  COTAÇÃO - TR087: SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA POTENCIAL PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    ...              DEPENDENCIA DO CONTAS - TR033
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALPJ87}
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPJ87}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPJ87}
    E            Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ87[4]}  ${COTPOTENCIALPJ87[13]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ87[15]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ87[19]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ87[16]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ87[15]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ87[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ87[16]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ87[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ87[2]}

Teste de Regressão 88 - COTAÇÃO - SALVAR UMA COTAÇÃO VIA CONTA PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    [Documentation]  COTAÇÃO - TR088: SALVAR UMA COTAÇÃO VIA CONTA PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    ...              DEPENDENCIA DO CONTAS - TR039
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPJ88}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPJ88}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPJ88}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ88[2]}  ${COTPOTENCIALPJ88[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ88[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPJ88[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ88[9]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ88[6]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ88[7]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ88[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ88[8]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ88[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ88[1]}

Teste de Regressão 89 - COTAÇÃO - SALVAR UMA COTAÇÃO VIA CONTA PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    [Documentation]  COTAÇÃO - TR089: SALVAR UMA COTAÇÃO VIA CONTA PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    ...              DEPENDENCIA DO CONTAS - TR039
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPJ89}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPJ89}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPJ89}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ89[2]}  ${COTPOTENCIALPJ89[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ89[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPJ89[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ89[14]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ89[7]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ89[6]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ89[8]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ89[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ89[9]}  ${COTPOTENCIALPJ89[10]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ89[11]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ89[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ89[12]}  ${COTPOTENCIALPJ89[13]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ89[1]}

Teste de Regressão 90 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA CONTA PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    [Documentation]  COTAÇÃO - TR090: SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA CONTA PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    ...              DEPENDENCIA DO CONTAS - TR039
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPJ90}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPJ90}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPJ90}
    E            Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ90[2]}  ${COTPOTENCIALPJ90[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ90[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPJ90[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ90[14]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ90[7]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ90[6]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ90[8]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ90[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ90[9]}  ${COTPOTENCIALPJ90[10]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ90[11]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ90[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ90[12]}  ${COTPOTENCIALPJ90[13]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ90[1]}

Teste de Regressão 91 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO, DESCONTO E ACRÉSCIMO VIA COTAÇÃO PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    [Documentation]  COTAÇÃO - TR092: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO, DESCONTO E ACRÉSCIMO VIA COTAÇÃO PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{COTPOTENCIALPJ92}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  ${COTPOTENCIALPJ92[2]}  ${COTPOTENCIALPJ92[3]}  ${COTPOTENCIALPJ92[4]}
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ92[6]}
    E            Preencher campo "Titulo" com  ${COTPOTENCIALPJ92[8]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ92[7]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ92[9]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ92[10]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ92[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ92[11]}  ${COTPOTENCIALPJ92[12]}
    E            Clicar em Aprovar a Cotação
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ92[13]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ92[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ92[14]}  ${COTPOTENCIALPJ92[15]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ92[7]}

Teste de Regressão 92 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E ACRÉSCIMO VIA COTAÇÃO PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    [Documentation]  COTAÇÃO - TR093: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E ACRÉSCIMO VIA COTAÇÃO PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{COTPOTENCIALPJ92}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  ${COTPOTENCIALPJ92[2]}  ${COTPOTENCIALPJ92[3]}  ${COTPOTENCIALPJ92[4]}
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ92[6]}
    E            Preencher campo "Titulo" com  ${COTPOTENCIALPJ92[8]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ92[7]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ92[9]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ92[10]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ92[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ92[11]}  ${COTPOTENCIALPJ92[12]}
    E            Clicar em Aprovar a Cotação
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ92[13]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ92[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ92[14]}  ${COTPOTENCIALPJ92[15]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ92[8]}

Teste de Regressão 93 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA COTAÇÃO PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    [Documentation]  COTAÇÃO - TR093: SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA COTAÇÃO PJ, COM DOIS PRODUTOS DE PLANOS IGUAIS
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{COTPOTENCIALPJ93}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  ${COTPOTENCIALPJ93[2]}  ${COTPOTENCIALPJ93[3]}  ${COTPOTENCIALPJ93[4]}
    E            Seleciona o campo "Demonstrou interesse em produtos PF e PJ?" no Painel de Oportunidade
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ93[6]}
    E            Preencher campo "Titulo" com  ${COTPOTENCIALPJ93[8]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ93[7]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ93[9]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ93[10]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ93[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ93[11]}  ${COTPOTENCIALPJ93[12]}
    E            Clicar em Aprovar a Cotação
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ93[13]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ93[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ93[14]}  ${COTPOTENCIALPJ93[15]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ93[8]}

Teste de Regressão 94 - COTAÇÃO - SALVAR UMA COTAÇÃO VIA POTENCIAL PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTES
    [Documentation]  COTAÇÃO - TR094: SALVAR UMA COTAÇÃO VIA POTENCIAL PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTES
    ...              DEPENDENCIA DO CONTAS - TR022
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALPJ94}
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPJ94}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPJ94}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ94[4]}  ${COTPOTENCIALPJ94[13]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ94[15]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ94[16]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ94[17]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ94[18]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ94[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Selecionar o Plano com  ${COTPOTENCIALPJ94[19]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ94[20]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ94[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ94[2]}

Teste de Regressão 95 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO, DESCONTO E ACRÉSCIMO VIA POTENCIAL PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTES
    [Documentation]  COTAÇÃO - TR095: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO, DESCONTO E ACRÉSCIMO VIA POTENCIAL PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTES
    ...              DEPENDENCIA DO CONTAS - TR022
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALPJ95}
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPJ95}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPJ95}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ95[4]}  ${COTPOTENCIALPJ95[13]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ95[15]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ95[16]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ95[17]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ95[18]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ95[19]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ95[4]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ95[20]}  ${COTPOTENCIALPJ95[21]}
    E            Clicar em Aprovar a Cotação
    E            Selecionar o Plano com  ${COTPOTENCIALPJ95[22]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ95[23]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ95[4]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ95[24]}  ${COTPOTENCIALPJ95[25]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ95[2]}

Teste de Regressão 96 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA POTENCIAL PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    [Documentation]  COTAÇÃO - TR096: SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA POTENCIAL PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    ...              DEPENDENCIA DO CONTAS - TR022
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALPJ96}
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALPJ96}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALPJ96}
    E            Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ96[4]}  ${COTPOTENCIALPJ96[13]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ96[15]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ96[16]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ96[17]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ96[18]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ96[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Selecionar o Plano com  ${COTPOTENCIALPJ96[19]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ96[20]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ96[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ96[2]}

Teste de Regressão 97 - COTAÇÃO - SALVAR UMA COTAÇÃO VIA CONTA PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    [Documentation]  COTAÇÃO - TR097: SALVAR UMA COTAÇÃO VIA CONTA PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    ...              DEPENDENCIA DO CONTAS - TR039
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPJ97}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPJ97}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPJ97}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ97[2]}  ${COTPOTENCIALPJ97[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ97[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPJ97[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ97[6]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ97[7]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ97[8]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ97[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Selecionar o Plano com  ${COTPOTENCIALPJ97[9]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ97[10]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ97[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ97[1]}

Teste de Regressão 98 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO, DESCONTO E ACRÉSCIMO VIA CONTA PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    [Documentation]  COTAÇÃO - TR098: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO, DESCONTO E ACRÉSCIMO VIA CONTA PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    ...              DEPENDENCIA DO CONTAS - TR039
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPJ98}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPJ98}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPJ98}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ98[2]}  ${COTPOTENCIALPJ98[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ98[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPJ98[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ98[6]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ98[7]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ98[8]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ98[9]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ98[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ98[10]}  ${COTPOTENCIALPJ98[11]}
    E            Clicar em Aprovar a Cotação
    E            Selecionar o Plano com  ${COTPOTENCIALPJ98[12]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ98[13]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ98[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ98[14]}  ${COTPOTENCIALPJ98[15]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ98[1]}
    
Teste de Regressão 99 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA CONTA PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    [Documentation]  COTAÇÃO - TR099: SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA CONTA PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    ...              DEPENDENCIA DO CONTAS - TR039
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALPJ99}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALPJ99}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALPJ99}
    E            Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALPJ99[2]}  ${COTPOTENCIALPJ99[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALPJ99[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALPJ99[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ99[6]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ99[7]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ99[8]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ99[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Selecionar o Plano com  ${COTPOTENCIALPJ99[9]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ99[10]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ99[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ99[1]}

Teste de Regressão 100 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO, DESCONTO E ACRÉSCIMO VIA COTAÇÃO PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    [Documentation]  COTAÇÃO - TR100: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO, DESCONTO E ACRÉSCIMO VIA COTAÇÃO PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{COTPOTENCIALPJ100}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  ${COTPOTENCIALPJ100[2]}  ${COTPOTENCIALPJ100[3]}  ${COTPOTENCIALPJ100[4]}
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ100[6]}
    E            Preencher campo "Titulo" com  ${COTPOTENCIALPJ100[8]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ100[7]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ100[9]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ100[10]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ100[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ100[11]}  ${COTPOTENCIALPJ100[12]}
    E            Clicar em Aprovar a Cotação
    E            Selecionar o Plano com  ${COTPOTENCIALPJ100[13]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ100[14]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ100[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ100[15]}  ${COTPOTENCIALPJ100[16]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ100[8]}

Teste de Regressão 101 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E ACRÉSCIMO VIA COTAÇÃO PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    [Documentation]  COTAÇÃO - TR101: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO E ACRÉSCIMO VIA COTAÇÃO PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{COTPOTENCIALPJ101}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  ${COTPOTENCIALPJ101[2]}  ${COTPOTENCIALPJ101[3]}  ${COTPOTENCIALPJ101[4]}
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ101[6]}
    E            Preencher campo "Titulo" com  ${COTPOTENCIALPJ101[8]}
    E            Selecionar Um Convênio  ${COTPOTENCIALPJ101[7]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ101[9]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ101[10]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ101[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ101[11]}  ${COTPOTENCIALPJ101[12]}
    E            Clicar em Aprovar a Cotação
    E            Selecionar o Plano com  ${COTPOTENCIALPJ101[13]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ101[14]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ101[2]}
    E            Preencher Negociação com  ${COTPOTENCIALPJ101[15]}  ${COTPOTENCIALPJ101[16]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ101[8]}

Teste de Regressão 102 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA COTAÇÃO PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    [Documentation]  COTAÇÃO - TR102: SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA COTAÇÃO PJ, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{COTPOTENCIALPJ102}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  ${COTPOTENCIALPJ102[2]}  ${COTPOTENCIALPJ102[3]}  ${COTPOTENCIALPJ102[4]}
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPJ102[6]}
    E            Preencher campo "Titulo" com  ${COTPOTENCIALPJ102[7]}
    E            Selecionar o Plano com  ${COTPOTENCIALPJ102[8]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ102[9]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ102[2]}
    E            Clicar em Aprovar a Cotação
    E            Selecionar o Plano com  ${COTPOTENCIALPJ102[10]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALPJ102[11]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPJ102[2]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALPJ102[7]}

Teste de Regressão 103 - COTAÇÃO - SALVAR UMA COTAÇÃO VIA POTENCIAL CAEPF, COM DOIS PRODUTOS DE PLANOS DIFERENTES
    [Documentation]  COTAÇÃO - TR103: SALVAR UMA COTAÇÃO VIA POTENCIAL CAEPF, COM DOIS PRODUTOS DE PLANOS DIFERENTES
    ...              DEPENDENCIA DO CONTAS - TR042
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALCAEPF103}  
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALCAEPF103}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALCAEPF103}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALCAEPF103[4]}  ${COTPOTENCIALCAEPF103[9]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALCAEPF103[11]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALCAEPF103[12]}
    E            Selecionar o Plano com  ${COTPOTENCIALCAEPF103[13]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALCAEPF103[14]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALCAEPF103[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Selecionar o Plano com  ${COTPOTENCIALCAEPF103[15]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALCAEPF103[16]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALCAEPF103[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALCAEPF103[2]}

Teste de Regressão 104 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO, DESCONTO E ACRÉSCIMO VIA POTENCIAL CAEPF, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    [Documentation]  COTAÇÃO - TR104: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO, DESCONTO E ACRÉSCIMO VIA POTENCIAL CAEPF, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    ...              DEPENDENCIA DO CONTAS - TR042
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALCAEPF104}  
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALCAEPF104}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALCAEPF104}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALCAEPF104[4]}  ${COTPOTENCIALCAEPF104[9]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALCAEPF104[11]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALCAEPF104[12]}
    E            Selecionar Um Convênio  ${COTPOTENCIALCAEPF104[13]}
    E            Selecionar o Plano com  ${COTPOTENCIALCAEPF104[14]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALCAEPF104[15]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALCAEPF104[4]}
    E            Preencher Negociação com  ${COTPOTENCIALCAEPF104[16]}  ${COTPOTENCIALCAEPF104[17]}
    E            Clicar em Aprovar a Cotação
    E            Selecionar o Plano com  ${COTPOTENCIALCAEPF104[18]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALCAEPF104[19]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALCAEPF104[4]}
    E            Preencher Negociação com  ${COTPOTENCIALCAEPF104[20]}  ${COTPOTENCIALCAEPF104[21]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALCAEPF104[2]}

Teste de Regressão 105 - COTAÇÃO - SALVAR UMA COTAÇÃO VIA POTENCIAL CAEPF, COM DOIS PRODUTOS DE PLANOS DIFERENTES
    [Documentation]  COTAÇÃO - TR105: SALVAR UMA COTAÇÃO VIA POTENCIAL CAEPF, COM DOIS PRODUTOS DE PLANOS DIFERENTES
    ...              DEPENDENCIA DO CONTAS - TR042
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Potencial Cliente> do <Comercial>
    E            Pesquisou Potencial Conta por  @{COTPOTENCIALCAEPF105}  
    E            Clicou no Resultado da Pesquisa de Potencial Contas	
    E            Apresentar a Tela de Detalhes do Potencial Cliente com os dados  @{COTPOTENCIALCAEPF105}
    E            Clicou na Reserva de Mercado da Tela Detalhes de Potencial Cliente
    E            Clicou no Nome Conta da tela Detalhes de Reserva Mercado
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos do Potencial Cliente  @{COTPOTENCIALCAEPF105}
    E            Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALCAEPF105[4]}  ${COTPOTENCIALCAEPF105[9]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALCAEPF105[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALCAEPF105[12]}
    E            Selecionar o Plano com  ${COTPOTENCIALCAEPF105[13]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALCAEPF105[14]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALCAEPF105[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Selecionar o Plano com  ${COTPOTENCIALCAEPF105[15]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALCAEPF105[16]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALCAEPF105[4]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALCAEPF105[2]}

Teste de Regressão 106 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA POTENCIAL CAEPF, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    [Documentation]  COTAÇÃO - TR106: SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA POTENCIAL CAEPF, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    ...              DEPENDENCIA DO CONTAS - TR034
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALCAEPF106}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALCAEPF106}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALCAEPF106}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALCAEPF106[2]}  ${COTPOTENCIALCAEPF106[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALCAEPF106[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALCAEPF106[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALCAEPF106[6]}
    E            Selecionar o Plano com  ${COTPOTENCIALCAEPF106[7]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALCAEPF106[8]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALCAEPF106[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Selecionar o Plano com  ${COTPOTENCIALCAEPF106[9]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALCAEPF106[10]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALCAEPF106[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALCAEPF106[1]}

Teste de Regressão 107 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO, DESCONTO E ACRÉSCIMO VIA CONTA CAEPF, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    [Documentation]  COTAÇÃO - TR107: SALVAR UMA COTAÇÃO, COM CONVÊNIO, ACESSÓRIO, DESCONTO E ACRÉSCIMO VIA CONTA CAEPF, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    ...              DEPENDENCIA DO CONTAS - TR034
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALCAEPF107}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALCAEPF107}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALCAEPF107}
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALCAEPF107[2]}  ${COTPOTENCIALCAEPF107[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALCAEPF107[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALCAEPF107[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALCAEPF107[5]}
    E            Selecionar Um Convênio  ${COTPOTENCIALCAEPF107[7]}
    E            Selecionar o Plano com  ${COTPOTENCIALCAEPF107[8]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALCAEPF107[9]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALCAEPF107[2]}
    E            Preencher Negociação com  ${COTPOTENCIALCAEPF107[10]}  ${COTPOTENCIALCAEPF107[11]}
    E            Clicar em Aprovar a Cotação
    E            Selecionar o Plano com  ${COTPOTENCIALCAEPF107[12]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALCAEPF107[13]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALCAEPF107[2]}
    E            Preencher Negociação com  ${COTPOTENCIALCAEPF107[14]}  ${COTPOTENCIALCAEPF107[15]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALCAEPF107[1]}

Teste de Regressão 108 - COTAÇÃO - SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA CONTA CAEPF, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    [Documentation]  COTAÇÃO - TR108: SALVAR UMA COTAÇÃO, COM INTERESSE EM PRODUTOS PF VIA CONTA CAEPF, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    ...              DEPENDENCIA DO CONTAS - TR034
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Contas> do <Comercial>
    E            Pesquisou Conta por Nome Conta e Tipo  @{COTPOTENCIALCAEPF108}
    E            Clicou no Resultado da Pesquisa de Contas	
    E            Apresentar a Tela de Detalhes do Conta com os dados  @{COTPOTENCIALCAEPF108}
    E            Clicou no botão <Criar> do painel Oportunidade do Detalhes de Conta	
    E            Apresentar a Tela de Cadastro Oportunidades com Dados preenchidos  @{COTPOTENCIALCAEPF108}
    E            Seleciona o campo "Demonstrou interesse em produtos PF e PJ?"
    E            Preencher o campo "Número de Vidas" e "Tipo" com  ${COTPOTENCIALCAEPF108[2]}  ${COTPOTENCIALCAEPF108[3]}
    E            Preencher o campo Origem de Vida com   ${COTPOTENCIALCAEPF108[5]}
    E            Clicar no Botão Salvar Oportunidade
    E            Apresentar a tela Oportunidade »  ${COTPOTENCIALCAEPF108[1]}
    E            Clicar no botão <Criar> do painel Cotação do Detalhes de Oportunidade
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALCAEPF108[6]}
    E            Selecionar o Plano com  ${COTPOTENCIALCAEPF108[7]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALCAEPF108[8]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALCAEPF108[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Selecionar o Plano com  ${COTPOTENCIALCAEPF108[9]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALCAEPF108[10]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALCAEPF108[2]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALCAEPF108[1]}

Teste de Regressão 109 - COTAÇÃO - SALVAR UMA COTAÇÃO COLETIVO POR ADESÃO, COM CONVÊNIO, ACESSÓRIO, DESCONTO E ACRÉSCIMO VIA COTAÇÃO CAEPF, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    [Documentation]  COTAÇÃO - TR109: SALVAR UMA COTAÇÃO COLETIVO POR ADESÃO, COM CONVÊNIO, ACESSÓRIO, DESCONTO E ACRÉSCIMO VIA COTAÇÃO CAEPF, COM DOIS PRODUTOS DE PLANOS DIFERENTE
    [Tags]    full
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    Quando       Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{COTPOTENCIALCAEPF109}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  ${COTPOTENCIALCAEPF109[2]}  ${COTPOTENCIALCAEPF109[3]}  ${COTPOTENCIALCAEPF109[4]}
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALCAEPF109[6]}
    E            Preencher campo "Titulo" com  ${COTPOTENCIALCAEPF109[7]}
    E            Selecionar campo "Tipo de Contratação" com    "Coletivo por Adesão"
    E            Selecionar o Plano com  ${COTPOTENCIALCAEPF109[8]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALCAEPF109[9]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALCAEPF109[2]}
    E            Clicar em Aprovar a Cotação
    E            Selecionar o Plano com  ${COTPOTENCIALCAEPF109[10]}
    E            Selecionar um Produto Assistencial com  ${COTPOTENCIALCAEPF109[11]}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALCAEPF109[2]}
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    Então        Apresentar a tela Cotação » com  ${COTPOTENCIALCAEPF109[7]}