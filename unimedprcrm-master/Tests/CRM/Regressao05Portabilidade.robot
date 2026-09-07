*** Settings ***
Resource    ../../main.resource
# Default Tags    Passed
Suite Setup     Run Keywords     Executar as querys para Validar e Gerar Massa de Dados    AND   Instancia Variaveis   05
# Suite Setup     Instancia Variaveis   05
Test Setup      Comum.Abrir Nav
Test Teardown   Comum.Fechar Nav


*** Test Cases ***
Teste de Regressão 01 - PORTABILIDADE - CRIAR PORTABILIDADE VIA POTENCIAL PF
    [Documentation]  PORTABILIDADE - TR001: CRIAR PORTABILIDADE VIA POTENCIAL PF
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios  @{PORPOTENCIALPF01}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"	
    E        Cadastrou uma Oportunidade PF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{PORPOTENCIALPF01}
    E        Cadastrou uma Cotação  @{PORPOTENCIALPF01}
    E        Clicar no link "Nome Oportunidade"  ${PORPOTENCIALPF01[1]}
    Quando   Usuário clicar no menu "Criar Portabilidade"
    Então    CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL


Teste de Regressão 02 - PORTABILIDADE - CRIAR PESSOA TITULAR NA PORTABILIDADE VIA POTENCIAL PF
    [Documentation]  PORTABILIDADE - TR002: CRIAR PESSOA TITULAR NA PORTABILIDADE VIA POTENCIAL PF
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios  @{PORPOTENCIALPF02}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"	
    E        Cadastrou uma Oportunidade PF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{PORPOTENCIALPF02}
    E        Cadastrou uma Cotação  @{PORPOTENCIALPF02}
    E        Clicar no link "Nome Oportunidade"  ${PORPOTENCIALPF02[1]}
    E        Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    Quando       Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem) PF    @{PORPOTENCIALPF02}
    E        Clicar em "Salvar" a Portabilidade
    Então        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada    ${PORPOTENCIALPF02[0]}


Teste de Regressão 03 - PORTABILIDADE - APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA POTENCIAL PF
    [Documentation]  PORTABILIDADE - TR003: APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA POTENCIAL PF
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios  @{PORPOTENCIALPF03}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"	
    E        Cadastrou uma Oportunidade PF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{PORPOTENCIALPF03}
    E        Cadastrou uma Cotação  @{PORPOTENCIALPF03}
    E        Clicar no link "Nome Oportunidade"  ${PORPOTENCIALPF03[1]}
    E        Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem) PF    @{PORPOTENCIALPF03}
    E        Clicar em "Salvar" a Portabilidade
    E        Anexou um arquivo no painel documento
    E        Clicar no submenu "Encaminhar para Validação"
    E        Confirmou o encaminhamento
    E        Clicou no botão "Validar"
    E        Clicou na aba "Checklist da Documentação"
    E        Selecionou a opção "Presente" e clicou no botão "Salvar"
    E        Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E        Confirmou a solicitação
    E        Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E        Voltar para a aba da "Portabilidade"
    E        Clicou no menu "Encaminhar para Análise"
    E        Confirmou a validação do documento
    E        Clicou no botão "Analisar"
    E        Clicou na aba "Questionário Elegibilidade"
    E        Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, NÃO, SIM
    E        Clicou no botão "Salvar"
    Quando   Usuário clicar no menu "Finalizar Protocolo"
    E        Confirmar a finalização
    Então    CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA		


Teste de Regressão 04 - PORTABILIDADE - APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA POTENCIAL PF
    [Documentation]  PORTABILIDADE - TR004: APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA POTENCIAL PF
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios  @{PORPOTENCIALPF04}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"	
    E        Cadastrou uma Oportunidade PF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{PORPOTENCIALPF04}
    E        Cadastrou uma Cotação  @{PORPOTENCIALPF04}
    E        Clicar no link "Nome Oportunidade"  ${PORPOTENCIALPF04[1]}
    E        Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem) PF    @{PORPOTENCIALPF04}
    E        Clicar em "Salvar" a Portabilidade
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Cadastrou uma Pessoa "Dependente"  
    E        Anexou um arquivo no painel documento
    E        Clicar no submenu "Encaminhar para Validação"
    E        Confirmou o encaminhamento
    E        Clicou no botão "Validar em Massa"
    E        Selecinou as pessoas e clicou no botão "Validar"
    E        Clicou na aba "Checklist da Documentação"
    E        Selecionou a opção "Presente" e clicou no botão "Salvar"
    E        Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E        Confirmou a solicitação
    E        Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E        Voltar para a aba da "Portabilidade"
    E        Clicou no menu "Realizar upload de Proposta de Adesão de Portabilidade"
    E        Anexou e gravou o upload
    E        Clicou no menu "Encaminhar para Análise"
    E        Confirmou a validação do documento
    E        Clicou no botão "Analisar em Massa"
    E        Selecionou as pessoas e clicou no botão "Analisar"
    E        Clicou na aba "Questionário Elegibilidade"
    E        Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM
    E        Clicou no botão "Salvar"
    Quando   Usuário clicar no menu "Finalizar Protocolo"
    E        Confirmar a finalização
    Então    CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA


Teste de Regressão 05 - PORTABILIDADE - CRIAR PORTABILIDADE VIA CONTA PF
    [Documentation]  PORTABILIDADE - TR005: CRIAR PORTABILIDADE VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR044
    
    Dado         Usuário logou no sistema
    E            Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios (PORTABILIDADE)    @{COTPOTENCIALPF05}
    E            Cadastrou uma Oportunidade PF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{COTPOTENCIALPF05}
    E            Cadastrou uma Cotação    @{COTPOTENCIALPF05}
    E            Clicar no link "Nome Oportunidade"  ${COTPOTENCIALPF05[1]}
    Quando       Usuário clicar no menu "Criar Portabilidade"
    Então        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL


Teste de Regressão 06 - PORTABILIDADE - CRIAR PESSOA TITULAR NA PORTABILIDADE VIA CONTA PF
    [Documentation]  PORTABILIDADE - TR006: CRIAR PESSOA TITULAR NA PORTABILIDADE VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR044
    
    Dado         Usuário logou no sistema
    E            Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios (PORTABILIDADE)    @{COTPOTENCIALPF06}
    E            Cadastrou uma Oportunidade PF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{COTPOTENCIALPF06}
    E            Cadastrou uma Cotação    @{COTPOTENCIALPF06}
    E            Clicar no link "Nome Oportunidade"  ${COTPOTENCIALPF06[1]}
    Quando       Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    Quando       Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem) PF    @{COTPOTENCIALPF06}
    E            Clicar em "Salvar" a Portabilidade
    Então        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${COTPOTENCIALPF06[1]}


Teste de Regressão 07 - PORTABILIDADE - APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA CONTA PF
    [Documentation]  PORTABILIDADE - TR007: APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR044
    
    Dado         Usuário logou no sistema
    E            Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios (PORTABILIDADE)    @{COTPOTENCIALPF07}
    E            Cadastrou uma Oportunidade PF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{COTPOTENCIALPF07}
    E            Cadastrou uma Cotação    @{COTPOTENCIALPF07}
    E            Clicar no link "Nome Oportunidade"  ${COTPOTENCIALPF07[1]}
    E            Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem) PF    @{COTPOTENCIALPF07}
    E            Clicar em "Salvar" a Portabilidade
    E            Cadastrou uma Pessoa "Titular"
    E            Anexou um arquivo no painel documento
    E            Clicar no submenu "Encaminhar para Validação"
    E            Confirmou o encaminhamento
    E            Clicou no botão "Validar"
    E            Clicou na aba "Checklist da Documentação"
    E            Selecionou a opção "Presente" e clicou no botão "Salvar"
    E            Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E            Confirmou a solicitação
    E            Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E            Voltar para a aba da "Portabilidade"
    E            Clicou no menu "Encaminhar para Análise"
    E            Confirmou a validação do documento
    E            Clicou no botão "Analisar"
    E            Clicou na aba "Questionário Elegibilidade"
    E            Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, NÃO, SIM
    E            Clicou no botão "Salvar"
    Quando       Usuário clicar no menu "Finalizar Protocolo"
    E            Confirmar a finalização
    Então        CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA		


Teste de Regressão 08 - PORTABILIDADE - APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA CONTA PF
    [Documentation]  PORTABILIDADE - TR008: APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR044
    
    Dado         Usuário logou no sistema
    E            Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios (PORTABILIDADE)    @{COTPOTENCIALPF08}
    E            Cadastrou uma Oportunidade PF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{COTPOTENCIALPF08}
    E            Cadastrou uma Cotação    @{COTPOTENCIALPF08}
    E            Clicar no link "Nome Oportunidade"  ${COTPOTENCIALPF08[1]}
    E            Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem) PF    @{COTPOTENCIALPF08}
    E            Clicar em "Salvar" a Portabilidade
    E            Cadastrou uma Pessoa "Titular"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Cadastrou uma Pessoa "Dependente"  
    E            Anexou um arquivo no painel documento
    E            Clicar no submenu "Encaminhar para Validação"
    E            Confirmou o encaminhamento
    E            Clicou no botão "Validar em Massa"
    E            Selecinou as pessoas e clicou no botão "Validar"
    E            Clicou na aba "Checklist da Documentação"
    E            Selecionou a opção "Presente" e clicou no botão "Salvar"
    E            Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E            Confirmou a solicitação
    E            Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E            Voltar para a aba da "Portabilidade"
    E            Clicou no menu "Realizar upload de Proposta de Adesão de Portabilidade"
    E            Anexou e gravou o upload
    E            Clicou no menu "Encaminhar para Análise"
    E            Confirmou a validação do documento
    E            Clicou no botão "Analisar em Massa"
    E            Selecionou as pessoas e clicou no botão "Analisar"
    E            Clicou na aba "Questionário Elegibilidade"
    E            Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM
    E            Clicou no botão "Salvar"
    Quando       Usuário clicar no menu "Finalizar Protocolo"
    E            Confirmar a finalização
    Então        CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA


Teste de Regressão 09 - PORTABILIDADE - CRIAR PORTABILIDADE VIA COTAÇÃO PF
    [Documentation]  PORTABILIDADE - TR009: CRIAR PORTABILIDADE VIA COTAÇÃO PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    [Tags]    test
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    E            Preencheu o titulo da cotação  ${COTPOTENCIALPF09[1]}
    Quando       Cadastrar dados obrigatórios de Conta na tela de Cotação com      @{COTPOTENCIALPF09}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  @{COTPOTENCIALPF09}
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF09[8]}
    E            Selecionar um Produto Assistencial do Potencial PF com  @{COTPOTENCIALPF09}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF09[3]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    E            Apresentar a tela Cotação » com  ${COTPOTENCIALPF09[1]}
    E            Clicar no link "Nome Oportunidade"  ${COTPOTENCIALPF09[1]}
    Quando       Usuário clicar no menu "Criar Portabilidade"
    Então        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL


Teste de Regressão 10 - PORTABILIDADE - CRIAR PESSOA TITULAR NA PORTABILIDADE VIA COTAÇÃO PF
    [Documentation]  PORTABILIDADE - TR010: CRIAR PESSOA TITULAR NA PORTABILIDADE VIA COTAÇÃO PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    E            Preencheu o titulo da cotação  ${COTPOTENCIALPF10[1]}
    E            Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{COTPOTENCIALPF10}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  @{COTPOTENCIALPF10}
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF10[8]}
    E            Selecionar um Produto Assistencial do Potencial PF com  @{COTPOTENCIALPF10}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF10[3]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    E            Apresentar a tela Cotação » com  ${COTPOTENCIALPF10[1]}
    E            Clicar no link "Nome Oportunidade"  ${COTPOTENCIALPF10[1]}
    E            Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem) PF    @{COTPOTENCIALPF10}
    E            Clicar em "Salvar" a Portabilidade
    Então        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${COTPOTENCIALPF10[1]}


Teste de Regressão 11 - PORTABILIDADE - APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA COTAÇÃO PF
    [Documentation]  PORTABILIDADE - TR011: APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA COTAÇÃO PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    E            Preencheu o titulo da cotação  ${COTPOTENCIALPF11[1]}
    E            Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{COTPOTENCIALPF11}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  @{COTPOTENCIALPF11}
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF11[8]}
    E            Selecionar um Produto Assistencial do Potencial PF com  @{COTPOTENCIALPF11}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF11[3]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    E            Apresentar a tela Cotação » com  ${COTPOTENCIALPF11[1]}
    E            Clicar no link "Nome Oportunidade"  ${COTPOTENCIALPF11[1]}
    E            Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem) PF    @{COTPOTENCIALPF11}
    E            Clicar em "Salvar" a Portabilidade
    E            CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${COTPOTENCIALPF11[1]}
    E            Cadastrou uma Pessoa "Titular"
    E            Anexou um arquivo no painel documento
    E            Clicar no submenu "Encaminhar para Validação"
    E            Confirmou o encaminhamento
    E            Clicou no botão "Validar"
    E            Clicou na aba "Checklist da Documentação"
    E            Selecionou a opção "Presente" e clicou no botão "Salvar"
    E            Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E            Confirmou a solicitação
    E            Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E            Voltar para a aba da "Portabilidade"
    E            Clicou no menu "Encaminhar para Análise"
    E            Confirmou a validação do documento
    E            Clicou no botão "Analisar"
    E            Clicou na aba "Questionário Elegibilidade"
    E            Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, NÃO, SIM
    E            Clicou no botão "Salvar"
    Quando       Usuário clicar no menu "Finalizar Protocolo"
    E            Confirmar a finalização
    Então        CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA		


Teste de Regressão 12 - PORTABILIDADE - APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA COTAÇÃO PF
    [Documentation]  PORTABILIDADE - TR012: APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA COTAÇÃO PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Apresentar a Tela de Pesquisa Cotações
    E            Apertar o Botão Criar do Cotações
    E            Apresentar a Tela de Cadastro de Cotação
    E            Preencheu o titulo da cotação  ${COTPOTENCIALPF12[1]}
    E            Cadastrar dados obrigatórios de Conta na tela de Cotação com  @{COTPOTENCIALPF12}
    E            Cadastrar dados obrigatórios de Oportunidades na tela de Cotação com  @{COTPOTENCIALPF12}
    E            Editar campo "Fase da Cotação" igual a  ${COTPOTENCIALPF12[8]}
    E            Selecionar um Produto Assistencial do Potencial PF com  @{COTPOTENCIALPF12}
    E            Preencher os Campos de Faixa Etária com Número de Vidas  ${COTPOTENCIALPF12[3]}
    E            Remover Acessórios do Produto Assistencial
    E            Clicar em Aprovar a Cotação
    E            Clicar em Salvar a Cotação
    E            Clicar Sim na Modal de Confirmação
    E            Apresentar a tela Cotação » com  ${COTPOTENCIALPF12[1]}
    E            Clicar no link "Nome Oportunidade"  ${COTPOTENCIALPF12[1]}
    E            Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem) PF    @{COTPOTENCIALPF12}
    E            Clicar em "Salvar" a Portabilidade
    E            Cadastrou uma Pessoa "Titular"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Cadastrou uma Pessoa "Dependente"  
    E            Anexou um arquivo no painel documento
    E            Clicar no submenu "Encaminhar para Validação"
    E            Confirmou o encaminhamento
    E            Clicou no botão "Validar em Massa"
    E            Selecinou as pessoas e clicou no botão "Validar"
    E            Clicou na aba "Checklist da Documentação"
    E            Selecionou a opção "Presente" e clicou no botão "Salvar"
    E            Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E            Confirmou a solicitação
    E            Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E            Voltar para a aba da "Portabilidade"
    E            Clicou no menu "Realizar upload de Proposta de Adesão de Portabilidade"
    E            Anexou e gravou o upload
    E            Clicou no menu "Encaminhar para Análise"
    E            Confirmou a validação do documento
    E            Clicou no botão "Analisar em Massa"
    E            Selecionou as pessoas e clicou no botão "Analisar"
    E            Clicou na aba "Questionário Elegibilidade"
    E            Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM
    E            Clicou no botão "Salvar"
    Quando       Usuário clicar no menu "Finalizar Protocolo"
    E            Confirmar a finalização
    Então        CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA


Teste de Regressão 13 - PORTABILIDADE - CRIAR PORTABILIDADE VIA POTENCIAL PJ
    [Documentation]  PORTABILIDADE - TR013: CRIAR PORTABILIDADE VIA POTENCIAL PJ
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{COTPOTENCIALPJ13}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado (Portabilidade)    @{COTPOTENCIALPJ13}
    E        Cadastrou uma Cotação PJ   @{COTPOTENCIALPJ13}
    E        Clicar no link "Nome Oportunidade"    ${COTPOTENCIALPJ13[1]}
    Quando   Usuário clicar no menu "Criar Portabilidade"
    Então    CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL


Teste de Regressão 14 - PORTABILIDADE - CRIAR PESSOA TITULAR NA PORTABILIDADE VIA POTENCIAL PJ
    [Documentation]  PORTABILIDADE - TR014: CRIAR PESSOA TITULAR NA PORTABILIDADE VIA POTENCIAL PJ
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{COTPOTENCIALPJ14}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado (Portabilidade)    @{COTPOTENCIALPJ14}
    E        Cadastrou uma Cotação PJ   @{COTPOTENCIALPJ14}
    E        Clicar no link "Nome Oportunidade"    ${COTPOTENCIALPJ14[1]}
    Quando   Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{COTPOTENCIALPJ14}
    E        Clicar em "Salvar" a Portabilidade
    Então    CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${COTPOTENCIALPJ14[1]}


Teste de Regressão 15 - PORTABILIDADE - APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA POTENCIAL PJ
    [Documentation]  PORTABILIDADE - TR015: APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA POTENCIAL PJ
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{COTPOTENCIALPJ15}
    E            Clicou no menu "Solicitar Reserva de Mercado"
    E            Clicou no link "Nome da Conta"
    E            Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado (Portabilidade)    @{COTPOTENCIALPJ15}
    E            Cadastrou uma Cotação PJ   @{COTPOTENCIALPJ15}
    E            Clicar no link "Nome Oportunidade"    ${COTPOTENCIALPJ15[1]}
    Quando       Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{COTPOTENCIALPJ15}
    E            Clicar em "Salvar" a Portabilidade
    E            CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${COTPOTENCIALPJ15[1]}
    E            Cadastrou uma Pessoa "Titular"
    E            Anexou um arquivo no painel documento
    E            Clicar no submenu "Encaminhar para Validação"
    E            Confirmou o encaminhamento
    E            Clicou no botão "Validar"
    E            Clicou na aba "Checklist da Documentação"
    E            Selecionou a opção "Presente" e clicou no botão "Salvar"
    E            Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E            Confirmou a solicitação
    E            Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E            Voltar para a aba da "Portabilidade"
    E            Clicou no menu "Encaminhar para Análise"
    E            Confirmou a validação do documento
    E            Clicou no botão "Analisar"
    E            Clicou na aba "Questionário Elegibilidade"
    E            Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, NÃO, SIM
    E            Clicou no botão "Salvar"
    Quando       Usuário clicar no menu "Finalizar Protocolo"
    E            Confirmar a finalização
    Então        CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA	


Teste de Regressão 16 - PORTABILIDADE - APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA POTENCIAL PJ
    [Documentation]  PORTABILIDADE - TR016: APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA POTENCIAL PJ
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{COTPOTENCIALPJ16}
    E            Clicou no menu "Solicitar Reserva de Mercado"
    E            Clicou no link "Nome da Conta"
    E            Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado (Portabilidade)    @{COTPOTENCIALPJ16}
    E            Cadastrou uma Cotação PJ   @{COTPOTENCIALPJ16}
    E            Clicar no link "Nome Oportunidade"    ${COTPOTENCIALPJ16[1]}
    Quando       Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{COTPOTENCIALPJ16}
    E            Clicar em "Salvar" a Portabilidade
    E            CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${COTPOTENCIALPJ16[1]}
    E            Cadastrou uma Pessoa "Titular"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Cadastrou uma Pessoa "Dependente"  
    E            Anexou um arquivo no painel documento
    E            Clicar no submenu "Encaminhar para Validação"
    E            Confirmou o encaminhamento
    E            Clicou no botão "Validar em Massa"
    E            Selecinou as pessoas e clicou no botão "Validar"
    E            Clicou na aba "Checklist da Documentação"
    E            Selecionou a opção "Presente" e clicou no botão "Salvar"
    E            Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E            Confirmou a solicitação
    E            Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E            Voltar para a aba da "Portabilidade"
    E            Clicou no menu "Realizar upload de Proposta de Adesão de Portabilidade"
    E            Anexou e gravou o upload
    E            Clicou no menu "Encaminhar para Análise"
    E            Confirmou a validação do documento
    E            Clicou no botão "Analisar em Massa"
    E            Selecionou as pessoas e clicou no botão "Analisar"
    E            Clicou na aba "Questionário Elegibilidade"
    E            Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM
    E            Clicou no botão "Salvar"
    Quando       Usuário clicar no menu "Finalizar Protocolo"
    E            Confirmar a finalização
    Então        CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA


Teste de Regressão 17 - PORTABILIDADE - CRIAR PORTABILIDADE VIA CONTA PJ
    [Documentation]  PORTABILIDADE - TR017: CRIAR PORTABILIDADE VIA CONTA PJ
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{COTPOTENCIALPJ17}
    E            Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{COTPOTENCIALPJ17}
    E            Cadastrou uma Cotação PJ   @{COTPOTENCIALPJ17}
    E            Clicar no link "Nome Oportunidade"  ${COTPOTENCIALPJ17[1]}
    Quando       Usuário clicar no menu "Criar Portabilidade"
    Então        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL


Teste de Regressão 18 - PORTABILIDADE - CRIAR PESSOA TITULAR NA PORTABILIDADE VIA CONTA PJ
    [Documentation]  PORTABILIDADE - TR018: CRIAR PESSOA TITULAR NA PORTABILIDADE VIA CONTA PJ
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{COTPOTENCIALPJ18}
    E            Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{COTPOTENCIALPJ18}
    E            Cadastrou uma Cotação PJ   @{COTPOTENCIALPJ18}
    E            Clicar no link "Nome Oportunidade"  ${COTPOTENCIALPJ18[1]}
    E            Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    Quando       Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{COTPOTENCIALPJ18}
    E            Clicar em "Salvar" a Portabilidade
    Então        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${COTPOTENCIALPJ18[1]}


Teste de Regressão 19 - PORTABILIDADE - APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA CONTA PJ
    [Documentation]  PORTABILIDADE - TR019: APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA CONTA PJ
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{COTPOTENCIALPJ19}
    E            Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{COTPOTENCIALPJ19}
    E            Cadastrou uma Cotação PJ   @{COTPOTENCIALPJ19}
    E            Clicar no link "Nome Oportunidade"    ${COTPOTENCIALPJ19[1]}
    Quando       Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{COTPOTENCIALPJ19}
    E            Clicar em "Salvar" a Portabilidade
    E            CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${COTPOTENCIALPJ19[1]}
    E            Cadastrou uma Pessoa "Titular"
    E            Anexou um arquivo no painel documento
    E            Clicar no submenu "Encaminhar para Validação"
    E            Confirmou o encaminhamento
    E            Clicou no botão "Validar"
    E            Clicou na aba "Checklist da Documentação"
    E            Selecionou a opção "Presente" e clicou no botão "Salvar"
    E            Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E            Confirmou a solicitação
    E            Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E            Voltar para a aba da "Portabilidade"
    E            Clicou no menu "Encaminhar para Análise"
    E            Confirmou a validação do documento
    E            Clicou no botão "Analisar"
    E            Clicou na aba "Questionário Elegibilidade"
    E            Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, NÃO, SIM
    E            Clicou no botão "Salvar"
    Quando       Usuário clicar no menu "Finalizar Protocolo"
    E            Confirmar a finalização
    Então        CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA	


Teste de Regressão 20 - PORTABILIDADE - APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA CONTA PJ
    [Documentation]  PORTABILIDADE - TR020: APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA CONTA PJ
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{COTPOTENCIALPJ20}
    E            Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{COTPOTENCIALPJ20}
    E            Cadastrou uma Cotação PJ   @{COTPOTENCIALPJ20}
    E            Clicar no link "Nome Oportunidade"    ${COTPOTENCIALPJ20[1]}
    Quando       Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{COTPOTENCIALPJ20}
    E            Clicar em "Salvar" a Portabilidade
    E            CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${COTPOTENCIALPJ20[1]}
    E            Cadastrou uma Pessoa "Titular"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Cadastrou uma Pessoa "Dependente"  
    E            Anexou um arquivo no painel documento
    E            Clicar no submenu "Encaminhar para Validação"
    E            Confirmou o encaminhamento
    E            Clicou no botão "Validar em Massa"
    E            Selecinou as pessoas e clicou no botão "Validar"
    E            Clicou na aba "Checklist da Documentação"
    E            Selecionou a opção "Presente" e clicou no botão "Salvar"
    E            Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E            Confirmou a solicitação
    E            Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E            Voltar para a aba da "Portabilidade"
    E            Clicou no menu "Realizar upload de Proposta de Adesão de Portabilidade"
    E            Anexou e gravou o upload
    E            Clicou no menu "Encaminhar para Análise"
    E            Confirmou a validação do documento
    E            Clicou no botão "Analisar em Massa"
    E            Selecionou as pessoas e clicou no botão "Analisar"
    E            Clicou na aba "Questionário Elegibilidade"
    E            Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM
    E            Clicou no botão "Salvar"
    Quando       Usuário clicar no menu "Finalizar Protocolo"
    E            Confirmar a finalização
    Então        CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA


Teste de Regressão 21 - PORTABILIDADE - CRIAR PORTABILIDADE VIA COTAÇÃO PJ
    [Documentation]  PORTABILIDADE - TR021: CRIAR PORTABILIDADE VIA COTAÇÃO PJ
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Cadastrou uma Conta PJ, Oportunidade e Cotação  @{PORTABILIDADECOTPJ21}
    E            Clicar no link "Nome Oportunidade"  ${PORTABILIDADECOTPJ21[1]}
    Quando       Usuário clicar no menu "Criar Portabilidade"
    Então        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL


Teste de Regressão 22 - PORTABILIDADE - CRIAR PESSOA TITULAR NA PORTABILIDADE VIA COTAÇÃO PJ
    [Documentation]  PORTABILIDADE - TR022: CRIAR PESSOA TITULAR NA PORTABILIDADE VIA COTAÇÃO PJ
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Cadastrou uma Conta PJ, Oportunidade e Cotação  @{PORTABILIDADECOTPJ22}
    E            Clicar no link "Nome Oportunidade"  ${PORTABILIDADECOTPJ22[1]}
    E            Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    Quando       Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{PORTABILIDADECOTPJ22}
    E            Clicar em "Salvar" a Portabilidade
    Então        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${PORTABILIDADECOTPJ22[1]}


Teste de Regressão 23 - PORTABILIDADE - APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA COTAÇÃO PJ
    [Documentation]  PORTABILIDADE - TR023: APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA COTAÇÃO PJ
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Cadastrou uma Conta PJ, Oportunidade e Cotação  @{PORTABILIDADECOTPJ23}
    E            Clicar no link "Nome Oportunidade"  ${PORTABILIDADECOTPJ23[1]}
    E            Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    Quando       Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{PORTABILIDADECOTPJ23}
    E            Clicar em "Salvar" a Portabilidade
    E            CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${PORTABILIDADECOTPJ23[1]}
    E            Cadastrou uma Pessoa "Titular"
    E            Anexou um arquivo no painel documento
    E            Clicar no submenu "Encaminhar para Validação"
    E            Confirmou o encaminhamento
    E            Clicou no botão "Validar"
    E            Clicou na aba "Checklist da Documentação"
    E            Selecionou a opção "Presente" e clicou no botão "Salvar"
    E            Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E            Confirmou a solicitação
    E            Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E            Voltar para a aba da "Portabilidade"
    E            Clicou no menu "Encaminhar para Análise"
    E            Confirmou a validação do documento
    E            Clicou no botão "Analisar"
    E            Clicou na aba "Questionário Elegibilidade"
    E            Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, NÃO, SIM
    E            Clicou no botão "Salvar"
    Quando       Usuário clicar no menu "Finalizar Protocolo"
    E            Confirmar a finalização
    Então        CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA	


Teste de Regressão 24 - PORTABILIDADE - APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA COTAÇÃO PJ
    [Documentation]  PORTABILIDADE - TR024: APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA COTAÇÃO PJ
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Cadastrou uma Conta PJ, Oportunidade e Cotação  @{PORTABILIDADECOTPJ24}
    E            Clicar no link "Nome Oportunidade"  ${PORTABILIDADECOTPJ24[1]}
    E            Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{PORTABILIDADECOTPJ24}
    E            Clicar em "Salvar" a Portabilidade
    E            CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${PORTABILIDADECOTPJ24[1]}
    E            Cadastrou uma Pessoa "Titular"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Cadastrou uma Pessoa "Dependente"  
    E            Anexou um arquivo no painel documento
    E            Clicar no submenu "Encaminhar para Validação"
    E            Confirmou o encaminhamento
    E            Clicou no botão "Validar em Massa"
    E            Selecinou as pessoas e clicou no botão "Validar"
    E            Clicou na aba "Checklist da Documentação"
    E            Selecionou a opção "Presente" e clicou no botão "Salvar"
    E            Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E            Confirmou a solicitação
    E            Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E            Voltar para a aba da "Portabilidade"
    E            Clicou no menu "Realizar upload de Proposta de Adesão de Portabilidade"
    E            Anexou e gravou o upload
    E            Clicou no menu "Encaminhar para Análise"
    E            Confirmou a validação do documento
    E            Clicou no botão "Analisar em Massa"
    E            Selecionou as pessoas e clicou no botão "Analisar"
    E            Clicou na aba "Questionário Elegibilidade"
    E            Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM
    E            Clicou no botão "Salvar"
    Quando       Usuário clicar no menu "Finalizar Protocolo"
    E            Confirmar a finalização
    Então        CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA


Teste de Regressão 25 - PORTABILIDADE - CRIAR PORTABILIDADE VIA POTENCIAL CAEPF
    [Documentation]  PORTABILIDADE - TR025: CRIAR PORTABILIDADE VIA POTENCIAL CAEPF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{PORTPOTCLCAEPF25}
    E            Clicou no menu "Solicitar Reserva de Mercado"
    E            Clicou no link "Nome da Conta"
    E            Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado (Portabilidade)    @{PORTPOTCLCAEPF25}
    E            Cadastrou uma Cotação CAEPF   @{PORTPOTCLCAEPF25}
    E            Clicar no link "Nome Oportunidade"    ${PORTPOTCLCAEPF25[2]}
    Quando       Usuário clicar no menu "Criar Portabilidade"
    Então        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL


Teste de Regressão 26 - PORTABILIDADE - CRIAR PESSOA TITULAR NA PORTABILIDADE VIA POTENCIAL CAEPF
    [Documentation]  PORTABILIDADE - TR026: CRIAR PESSOA TITULAR NA PORTABILIDADE VIA POTENCIAL CAEPF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{PORTPOTCLCAEPF26}
    E            Clicou no menu "Solicitar Reserva de Mercado"
    E            Clicou no link "Nome da Conta"
    E            Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado (Portabilidade)    @{PORTPOTCLCAEPF26}
    E            Cadastrou uma Cotação (CAEPF) Portabilidade   @{PORTPOTCLCAEPF26}
    E            Clicar no link "Nome Oportunidade"    ${PORTPOTCLCAEPF26[2]}
    E            Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    Quando       Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{PORTPOTCLCAEPF26}
    E            Clicar em "Salvar" a Portabilidade
    Então        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${PORTPOTCLCAEPF26[2]}


Teste de Regressão 27 - PORTABILIDADE - APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA POTENCIAL CAEPF
    [Documentation]  PORTABILIDADE - TR027: APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA POTENCIAL CAEPF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{PORTPOTCLCAEPF27}
    E            Clicou no menu "Solicitar Reserva de Mercado"
    E            Clicou no link "Nome da Conta"
    E            Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado (Portabilidade)    @{PORTPOTCLCAEPF27}
    E            Cadastrou uma Cotação (CAEPF) Portabilidade   @{PORTPOTCLCAEPF27}
    E            Clicar no link "Nome Oportunidade"    ${PORTPOTCLCAEPF27[2]}
    E            Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{PORTPOTCLCAEPF27}
    E            Clicar em "Salvar" a Portabilidade
    E            CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${PORTPOTCLCAEPF27[2]}
    E            Cadastrou uma Pessoa "Titular"
    E            Anexou um arquivo no painel documento
    E            Clicar no submenu "Encaminhar para Validação"
    E            Confirmou o encaminhamento
    E            Clicou no botão "Validar"
    E            Clicou na aba "Checklist da Documentação"
    E            Selecionou a opção "Presente" e clicou no botão "Salvar"
    E            Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E            Confirmou a solicitação
    E            Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E            Voltar para a aba da "Portabilidade"
    E            Clicou no menu "Encaminhar para Análise"
    E            Confirmou a validação do documento
    E            Clicou no botão "Analisar"
    E            Clicou na aba "Questionário Elegibilidade"
    E            Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, NÃO, SIM
    E            Clicou no botão "Salvar"
    Quando       Usuário clicar no menu "Finalizar Protocolo"
    E            Confirmar a finalização
    Então        CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA


Teste de Regressão 28 - PORTABILIDADE - APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA POTENCIAL CAEPF
    [Documentation]  PORTABILIDADE - TR028: APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA POTENCIAL CAEPF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{PORTPOTCLCAEPF28}
    E            Clicou no menu "Solicitar Reserva de Mercado"
    E            Clicou no link "Nome da Conta"
    E            Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado (Portabilidade)    @{PORTPOTCLCAEPF28}
    E            Cadastrou uma Cotação (CAEPF) Portabilidade   @{PORTPOTCLCAEPF28}
    E            Clicar no link "Nome Oportunidade"    ${PORTPOTCLCAEPF28[2]}
    E            Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{PORTPOTCLCAEPF28}
    E            Clicar em "Salvar" a Portabilidade
    E            CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${PORTPOTCLCAEPF28[1]}
    E            Cadastrou uma Pessoa "Titular"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Cadastrou uma Pessoa "Dependente"  
    E            Anexou um arquivo no painel documento
    E            Clicar no submenu "Encaminhar para Validação"
    E            Confirmou o encaminhamento
    E            Clicou no botão "Validar em Massa"
    E            Selecinou as pessoas e clicou no botão "Validar"
    E            Clicou na aba "Checklist da Documentação"
    E            Selecionou a opção "Presente" e clicou no botão "Salvar"
    E            Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E            Confirmou a solicitação
    E            Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E            Voltar para a aba da "Portabilidade"
    E            Clicou no menu "Realizar upload de Proposta de Adesão de Portabilidade"
    E            Anexou e gravou o upload
    E            Clicou no menu "Encaminhar para Análise"
    E            Confirmou a validação do documento
    E            Clicou no botão "Analisar em Massa"
    E            Selecionou as pessoas e clicou no botão "Analisar"
    E            Clicou na aba "Questionário Elegibilidade"
    E            Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM
    E            Clicou no botão "Salvar"
    Quando       Usuário clicar no menu "Finalizar Protocolo"
    E            Confirmar a finalização
    Então        CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA


Teste de Regressão 29 - PORTABILIDADE - CRIAR PORTABILIDADE VIA CONTA CAEPF
    [Documentation]  PORTABILIDADE - TR029: CRIAR PORTABILIDADE VIA CONTA CAEPF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{PORTCONTACAEPF29}
    E            Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{PORTCONTACAEPF29}
    E            Cadastrou uma Cotação (CAEPF) Portabilidade   @{PORTCONTACAEPF29}
    E            Clicar no link "Nome Oportunidade"  ${PORTCONTACAEPF29[1]}
    Quando       Usuário clicar no menu "Criar Portabilidade"
    Então        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL


Teste de Regressão 30 - PORTABILIDADE - CRIAR PESSOA TITULAR NA PORTABILIDADE VIA CONTA CAEPF
    [Documentation]  PORTABILIDADE - TR030: CRIAR PESSOA TITULAR NA PORTABILIDADE VIA CONTA CAEPF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{PORTCONTACAEPF30}
    E            Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{PORTCONTACAEPF30}
    E            Cadastrou uma Cotação (CAEPF) Portabilidade   @{PORTCONTACAEPF30}
    E            Clicar no link "Nome Oportunidade"  ${PORTCONTACAEPF30[1]}
    E            Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    Quando       Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{PORTCONTACAEPF30}
    E            Clicar em "Salvar" a Portabilidade
    Então        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${PORTCONTACAEPF30[1]}


Teste de Regressão 31 - PORTABILIDADE - APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA CONTA CAEPF
    [Documentation]  PORTABILIDADE - TR031: APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA CONTA CAEPF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{PORTCONTACAEPF31}
    E            Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{PORTCONTACAEPF31}
    E            Cadastrou uma Cotação (CAEPF) Portabilidade   @{PORTCONTACAEPF31}
    E            Clicar no link "Nome Oportunidade"    ${PORTCONTACAEPF31[1]}
    Quando       Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{PORTCONTACAEPF31}
    E            Clicar em "Salvar" a Portabilidade
    E            CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${PORTCONTACAEPF31[1]}
    E            Cadastrou uma Pessoa "Titular"
    E            Anexou um arquivo no painel documento
    E            Clicar no submenu "Encaminhar para Validação"
    E            Confirmou o encaminhamento
    E            Clicou no botão "Validar"
    E            Clicou na aba "Checklist da Documentação"
    E            Selecionou a opção "Presente" e clicou no botão "Salvar"
    E            Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E            Confirmou a solicitação
    E            Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E            Voltar para a aba da "Portabilidade"
    E            Clicou no menu "Encaminhar para Análise"
    E            Confirmou a validação do documento
    E            Clicou no botão "Analisar"
    E            Clicou na aba "Questionário Elegibilidade"
    E            Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, NÃO, SIM
    E            Clicou no botão "Salvar"
    Quando       Usuário clicar no menu "Finalizar Protocolo"
    E            Confirmar a finalização
    Então        CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA	


Teste de Regressão 32 - PORTABILIDADE - APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA CONTA CAEPF
    [Documentation]  PORTABILIDADE - TR032: APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA CONTA CAEPF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{PORTCONTACAEPF32}
    E            Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{PORTCONTACAEPF32}
    E            Cadastrou uma Cotação (CAEPF) Portabilidade   @{PORTCONTACAEPF32}
    E            Clicar no link "Nome Oportunidade"    ${PORTCONTACAEPF32[1]}
    Quando       Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{PORTCONTACAEPF32}
    E            Clicar em "Salvar" a Portabilidade
    E            CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${PORTCONTACAEPF32[1]}
    E            Cadastrou uma Pessoa "Titular"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Cadastrou uma Pessoa "Dependente"  
    E            Anexou um arquivo no painel documento
    E            Clicar no submenu "Encaminhar para Validação"
    E            Confirmou o encaminhamento
    E            Clicou no botão "Validar em Massa"
    E            Selecinou as pessoas e clicou no botão "Validar"
    E            Clicou na aba "Checklist da Documentação"
    E            Selecionou a opção "Presente" e clicou no botão "Salvar"
    E            Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E            Confirmou a solicitação
    E            Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E            Voltar para a aba da "Portabilidade"
    E            Clicou no menu "Realizar upload de Proposta de Adesão de Portabilidade"
    E            Anexou e gravou o upload
    E            Clicou no menu "Encaminhar para Análise"
    E            Confirmou a validação do documento
    E            Clicou no botão "Analisar em Massa"
    E            Selecionou as pessoas e clicou no botão "Analisar"
    E            Clicou na aba "Questionário Elegibilidade"
    E            Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM
    E            Clicou no botão "Salvar"
    Quando       Usuário clicar no menu "Finalizar Protocolo"
    E            Confirmar a finalização
    Então        CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA


Teste de Regressão 33 - PORTABILIDADE - CRIAR PORTABILIDADE VIA COTAÇÃO CAEPF
    [Documentation]  PORTABILIDADE - TR033: CRIAR PORTABILIDADE VIA COTAÇÃO CAEPF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema 
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Cadastrou uma Conta CAEPF, Oportunidade e Cotação  @{PORTABCOTCAEPF33}
    E            Clicar no link "Nome Oportunidade"  ${PORTABCOTCAEPF33[1]}
    Quando       Usuário clicar no menu "Criar Portabilidade"
    Então        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL


Teste de Regressão 34 - PORTABILIDADE - CRIAR PESSOA TITULAR NA PORTABILIDADE VIA COTAÇÃO CAEPF
    [Documentation]  PORTABILIDADE - TR034: CRIAR PESSOA TITULAR NA PORTABILIDADE VIA COTAÇÃO CAEPF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Cadastrou uma Conta CAEPF, Oportunidade e Cotação  @{PORTABCOTCAEPF34}
    E            Clicar no link "Nome Oportunidade"  ${PORTABCOTCAEPF34[1]}
    E            Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    Quando       Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{PORTABCOTCAEPF34}
    E            Clicar em "Salvar" a Portabilidade
    Então        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${PORTABCOTCAEPF34[1]}


Teste de Regressão 35 - PORTABILIDADE - APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA COTAÇÃO CAEPF
    [Documentation]  PORTABILIDADE - TR035: APROVAR PORTABILIDADE TOTAL, COM SOMENTE O TITULAR VIA COTAÇÃO CAEPF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Cadastrou uma Conta CAEPF, Oportunidade e Cotação  @{PORTABCOTCAEPF35}
    E            Clicar no link "Nome Oportunidade"  ${PORTABCOTCAEPF35[1]}
    E            Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    Quando       Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{PORTABCOTCAEPF35}
    E            Clicar em "Salvar" a Portabilidade
    E            CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${PORTABCOTCAEPF35[1]}
    E            Cadastrou uma Pessoa "Titular"
    E            Anexou um arquivo no painel documento
    E            Clicar no submenu "Encaminhar para Validação"
    E            Confirmou o encaminhamento
    E            Clicou no botão "Validar"
    E            Clicou na aba "Checklist da Documentação"
    E            Selecionou a opção "Presente" e clicou no botão "Salvar"
    E            Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E            Confirmou a solicitação
    E            Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E            Voltar para a aba da "Portabilidade"
    E            Clicou no menu "Encaminhar para Análise"
    E            Confirmou a validação do documento
    E            Clicou no botão "Analisar"
    E            Clicou na aba "Questionário Elegibilidade"
    E            Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, NÃO, NÃO, NÃO, SIM
    E            Clicou no botão "Salvar"
    Quando       Usuário clicar no menu "Finalizar Protocolo"
    E            Confirmar a finalização
    Então        CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA	



Teste de Regressão 36 - PORTABILIDADE - APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA COTAÇÃO CAEPF
    [Documentation]  PORTABILIDADE - TR036: APROVAR PORTABILIDADE PARCIAL, COM TITULAR E DEPENDENTE VIA COTAÇÃO CAEPF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado         Usuário logou no sistema
    E            Clicou na submenu <Cotações> do <Comercial>
    E            Cadastrou uma Conta CAEPF, Oportunidade e Cotação  @{PORTABCOTCAEPF36}
    E            Clicar no link "Nome Oportunidade"  ${PORTABCOTCAEPF36[1]}
    E            Usuário clicar no menu "Criar Portabilidade"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Preencher os campos obrigatórios (Pessoa, Tipo, Telefone Celular, Nº Reg. Operadora Origem, Nº Reg. Plano Origem)    @{PORTABCOTCAEPF36}
    E            Clicar em "Salvar" a Portabilidade
    E            CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL, com pessoa cadastrada     ${PORTABCOTCAEPF36[1]}
    E            Cadastrou uma Pessoa "Titular"
    E            Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E            Cadastrou uma Pessoa "Dependente"  
    E            Anexou um arquivo no painel documento
    E            Clicar no submenu "Encaminhar para Validação"
    E            Confirmou o encaminhamento
    E            Clicou no botão "Validar em Massa"
    E            Selecinou as pessoas e clicou no botão "Validar"
    E            Clicou na aba "Checklist da Documentação"
    E            Selecionou a opção "Presente" e clicou no botão "Salvar"
    E            Clicou no menu "Solicitar Assinatura de Proposta de Adesão de Portabilidade"
    E            Confirmou a solicitação
    E            Clicou no menu "Emitir Proposta de Adesão de Portabilidade"
    E            Voltar para a aba da "Portabilidade"
    E            Clicou no menu "Realizar upload de Proposta de Adesão de Portabilidade"
    E            Anexou e gravou o upload
    E            Clicou no menu "Encaminhar para Análise"
    E            Confirmou a validação do documento
    E            Clicou no botão "Analisar em Massa"
    E            Selecionou as pessoas e clicou no botão "Analisar"
    E            Clicou na aba "Questionário Elegibilidade"
    E            Preencheu o formulario com as opções SIM, SIM, SIM, SIM, SIM, SIM, NÃO, SIM, SIM, SIM
    E            Clicou no botão "Salvar"
    Quando       Usuário clicar no menu "Finalizar Protocolo"
    E            Confirmar a finalização
    Então        CRM deve atualizar a tela Solicitação de Portabilidade » Solicitação - Protocolo portabilidade e situação igual a APROVADA