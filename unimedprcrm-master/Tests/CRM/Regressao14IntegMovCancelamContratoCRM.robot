*** Settings ***
Resource    ../../main.resource

Suite Setup     Run Keywords     Executar as querys para Validar e Gerar Massa de Dados    AND   Instancia Variaveis   14
Test Setup      Abrir Nav
Test Teardown   Comum.Fechar Nav


*** Test Cases ***
Teste de Regressão 01 - INTEG MOV CANCELAM CONTRATO CRM - INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 41, (CONTRATO PF)
    [Documentation]  INTEG MOV CANCELAM CONTRATO CRM - TR001: INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 41, (CONTRATO PF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Ativar o Agendador "CONTRATO Sincronização"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVCANCELAMCONTRATOCRMPF01}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVCANCELAMCONTRATOCRMPF01[1]}
    E        Gerou uma Movimentação Cadastral de Cancelamento de Contrato
    E        Clicou no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    E        Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou "Data de Cancelamento" com data e hora atual
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVCANCELAMCONTRATOCRMPF01}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Cancelamento de Contrato em Conferência	 @{INTEGMOVCANCELAMCONTRATOCRMPF01}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVCANCELAMCONTRATOCRMPF01[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato, o campo "Data de Exclusão" preenchido com a data informada, hora zerada, com a "situação" do Contrato e dos Beneficiários igual a CANCELADO  ${INTEGMOVCANCELAMCONTRATOCRMPF01[1]}


Teste de Regressão 03 - INTEG MOV CANCELAM CONTRATO CRM - INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 44, (CONTRATO PF)
    [Documentation]  INTEG MOV CANCELAM CONTRATO CRM - TR003: INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 44, (CONTRATO PF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Ativar o Agendador "CONTRATO Sincronização"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVCANCELAMCONTRATOCRMPF03}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVCANCELAMCONTRATOCRMPF03[1]}
    E        Gerou uma Movimentação Cadastral de Cancelamento de Contrato
    E        Clicou no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    E        Selecionou "Motivo" 44 - ÓBITO, informou "Data de Cancelamento" com data e hora de amanha, "Data de Obito" igual a DATA DE ONTEM
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVCANCELAMCONTRATOCRMPF03}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Cancelamento de Contrato em Conferência  @{INTEGMOVCANCELAMCONTRATOCRMPF03}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVCANCELAMCONTRATOCRMPF03[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato, o campo "Data de Exclusão" preenchido com a data informada, com a "situação" do Contrato igual a INTEGRADO e dos Beneficiários igual a ATIVO  DRA STEPHANY NOGUEIRA


Teste de Regressão 04 - INTEG MOV CANCELAM CONTRATO CRM - INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 46, (CONTRATO PF)
    [Documentation]  INTEG MOV CANCELAM CONTRATO CRM - TR004: INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 46, (CONTRATO PF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Ativar o Agendador "CONTRATO Sincronização"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVCANCELAMCONTRATOCRMPF04}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVCANCELAMCONTRATOCRMPF04[1]}
    E        Gerou uma Movimentação Cadastral de Cancelamento de Contrato
    E        Clicou no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    E        Selecionou "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, informou "Data de Cancelamento" com data e hora atual
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVCANCELAMCONTRATOCRMPF04}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Cancelamento de Contrato em Conferência  @{INTEGMOVCANCELAMCONTRATOCRMPF04}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVCANCELAMCONTRATOCRMPF04[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato, o campo "Data de Exclusão" preenchido com a data informada, hora zerada, com a "situação" do Contrato e dos Beneficiários igual a CANCELADO    ${INTEGMOVCANCELAMCONTRATOCRMPF04[1]}


Teste de Regressão 05 - INTEG MOV CANCELAM CONTRATO CRM - INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 47, (CONTRATO PF)
    [Documentation]  INTEG MOV CANCELAM CONTRATO CRM - TR005: INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 47, (CONTRATO PF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Ativar o Agendador "CONTRATO Sincronização"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVCANCELAMCONTRATOCRMPF05}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVCANCELAMCONTRATOCRMPF05[1]}
    E        Gerou uma Movimentação Cadastral de Cancelamento de Contrato
    E        Clicou no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    E        Selecionou "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), informou "Data de Cancelamento" com data e hora atual
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVCANCELAMCONTRATOCRMPF05}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Cancelamento de Contrato em Conferência  @{INTEGMOVCANCELAMCONTRATOCRMPF05}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVCANCELAMCONTRATOCRMPF05[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato, o campo "Data de Exclusão" preenchido com a data informada, hora zerada, com a "situação" do Contrato e dos Beneficiários igual a CANCELADO    ${INTEGMOVCANCELAMCONTRATOCRMPF05[1]}


Teste de Regressão 06 - INTEG MOV CANCELAM CONTRATO CRM - INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 48, (CONTRATO PF)
    [Documentation]  INTEG MOV CANCELAM CONTRATO CRM - TR006: INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 48, (CONTRATO PF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Ativar o Agendador "CONTRATO Sincronização"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVCANCELAMCONTRATOCRMPF06}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVCANCELAMCONTRATOCRMPF06[1]}
    E        Gerou uma Movimentação Cadastral de Cancelamento de Contrato
    E        Clicou no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    E        Selecionou "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, informou "Data de Cancelamento" com data e hora atual
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVCANCELAMCONTRATOCRMPF06}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Cancelamento de Contrato em Conferência  @{INTEGMOVCANCELAMCONTRATOCRMPF06}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVCANCELAMCONTRATOCRMPF06[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato, o campo "Data de Exclusão" preenchido com a data informada, hora zerada, com a "situação" do Contrato e dos Beneficiários igual a CANCELADO    ${INTEGMOVCANCELAMCONTRATOCRMPF06[1]}


Teste de Regressão 08 - INTEG MOV CANCELAM CONTRATO CRM - INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 41, (CONTRATO PJ)
    [Documentation]  INTEG MOV CANCELAM CONTRATO CRM - TR008: INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 41, (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Ativar o Agendador "CONTRATO Sincronização"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVCANCELAMCONTRATOCRMPJ08}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVCANCELAMCONTRATOCRMPJ08[1]}
    E        Gerou uma Movimentação Cadastral de Cancelamento de Contrato
    E        Clicou no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    E        Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou "Data de Cancelamento" com data e hora atual
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVCANCELAMCONTRATOCRMPJ08}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Cancelamento de Contrato em Conferência	 @{INTEGMOVCANCELAMCONTRATOCRMPJ08}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVCANCELAMCONTRATOCRMPJ08[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato, o campo "Data de Exclusão" preenchido com a data informada, hora zerada, com a "situação" do Contrato e dos Beneficiários igual a CANCELADO    ${INTEGMOVCANCELAMCONTRATOCRMPJ08[1]}


Teste de Regressão 09 - INTEG MOV CANCELAM CONTRATO CRM - INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 44, (CONTRATO PJ)
    [Documentation]  INTEG MOV CANCELAM CONTRATO CRM - TR009: INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 44, (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Ativar o Agendador "CONTRATO Sincronização"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVCANCELAMCONTRATOCRMPJ09}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVCANCELAMCONTRATOCRMPJ09[1]}
    E        Gerou uma Movimentação Cadastral de Cancelamento de Contrato
    E        Clicou no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    E        Selecionou "Motivo" 44 - ÓBITO, informou "Data de Cancelamento" com data e hora de amanha, "Data de Obito" igual a DATA DE ONTEM
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVCANCELAMCONTRATOCRMPJ09}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Cancelamento de Contrato em Conferência  @{INTEGMOVCANCELAMCONTRATOCRMPJ09}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVCANCELAMCONTRATOCRMPJ09[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato, o campo "Data de Exclusão" preenchido com a data informada, com a "situação" do Contrato igual a INTEGRADO e dos Beneficiários igual a ATIVO  ${INTEGMOVCANCELAMCONTRATOCRMPJ09[1]}


Teste de Regressão 10 - INTEG MOV CANCELAM CONTRATO CRM - INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 46, (CONTRATO PJ)
    [Documentation]  INTEG MOV CANCELAM CONTRATO CRM - TR010: INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 46, (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO 
    Dado     Usuário logou no sistema  
    E        Ativar o Agendador "CONTRATO Sincronização"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVCANCELAMCONTRATOCRMPJ10}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVCANCELAMCONTRATOCRMPJ10[1]}
    E        Gerou uma Movimentação Cadastral de Cancelamento de Contrato
    E        Clicou no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    E        Selecionou "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, informou "Data de Cancelamento" com data e hora atual
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVCANCELAMCONTRATOCRMPJ10}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Cancelamento de Contrato em Conferência  @{INTEGMOVCANCELAMCONTRATOCRMPJ10}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVCANCELAMCONTRATOCRMPJ10[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato, o campo "Data de Exclusão" preenchido com a data informada, hora zerada, com a "situação" do Contrato e dos Beneficiários igual a CANCELADO    ${INTEGMOVCANCELAMCONTRATOCRMPJ10[1]}


Teste de Regressão 11 - INTEG MOV CANCELAM CONTRATO CRM - INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 47, (CONTRATO PJ)
    [Documentation]  INTEG MOV CANCELAM CONTRATO CRM - TR011: INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 47, (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Ativar o Agendador "CONTRATO Sincronização"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVCANCELAMCONTRATOCRMPJ11}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVCANCELAMCONTRATOCRMPJ11[1]}
    E        Gerou uma Movimentação Cadastral de Cancelamento de Contrato
    E        Clicou no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    E        Selecionou "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), informou "Data de Cancelamento" com data e hora atual
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVCANCELAMCONTRATOCRMPJ11}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Cancelamento de Contrato em Conferência  @{INTEGMOVCANCELAMCONTRATOCRMPJ11}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVCANCELAMCONTRATOCRMPJ11[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato, o campo "Data de Exclusão" preenchido com a data informada, hora zerada, com a "situação" do Contrato e dos Beneficiários igual a CANCELADO    ${INTEGMOVCANCELAMCONTRATOCRMPJ11[1]}


Teste de Regressão 12 - INTEG MOV CANCELAM CONTRATO CRM - INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 48, (CONTRATO PJ)
    [Documentation]  INTEG MOV CANCELAM CONTRATO CRM - TR012: INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 48, (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Ativar o Agendador "CONTRATO Sincronização"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVCANCELAMCONTRATOCRMPJ12}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVCANCELAMCONTRATOCRMPJ12[1]}
    E        Gerou uma Movimentação Cadastral de Cancelamento de Contrato
    E        Clicou no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    E        Selecionou "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, informou "Data de Cancelamento" com data e hora atual
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVCANCELAMCONTRATOCRMPJ12}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Cancelamento de Contrato em Conferência  @{INTEGMOVCANCELAMCONTRATOCRMPJ12}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVCANCELAMCONTRATOCRMPJ12[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato, o campo "Data de Exclusão" preenchido com a data informada, hora zerada, com a "situação" do Contrato e dos Beneficiários igual a CANCELADO    ${INTEGMOVCANCELAMCONTRATOCRMPJ12[1]}


Teste de Regressão 13 - INTEG MOV CANCELAM CONTRATO CRM - INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 41, (CONTRATO CAEPF)
    [Documentation]  INTEG MOV CANCELAM CONTRATO CRM - TR013: INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 41, (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Ativar o Agendador "CONTRATO Sincronização"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVCANCELAMCONTRATOCRMCAEPF13}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13[1]}
    E        Gerou uma Movimentação Cadastral de Cancelamento de Contrato
    E        Clicou no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    E        Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou "Data de Cancelamento" com data e hora atual
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVCANCELAMCONTRATOCRMCAEPF13}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Cancelamento de Contrato em Conferência	 @{INTEGMOVCANCELAMCONTRATOCRMCAEPF13}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato, o campo "Data de Exclusão" preenchido com a data informada, hora zerada, com a "situação" do Contrato e dos Beneficiários igual a CANCELADO    ${INTEGMOVCANCELAMCONTRATOCRMCAEPF13[1]}


Teste de Regressão 14 - INTEG MOV CANCELAM CONTRATO CRM - INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 44, (CONTRATO CAEPF)
    [Documentation]  INTEG MOV CANCELAM CONTRATO CRM - TR014: INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 44, (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Ativar o Agendador "CONTRATO Sincronização"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVCANCELAMCONTRATOCRMCAEPF14}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14[1]}
    E        Gerou uma Movimentação Cadastral de Cancelamento de Contrato
    E        Clicou no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    E        Selecionou "Motivo" 44 - ÓBITO, informou "Data de Cancelamento" com data e hora de amanha, "Data de Obito" igual a DATA DE ONTEM
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVCANCELAMCONTRATOCRMCAEPF14}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Cancelamento de Contrato em Conferência  @{INTEGMOVCANCELAMCONTRATOCRMCAEPF14}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato, o campo "Data de Exclusão" preenchido com a data informada, com a "situação" do Contrato igual a INTEGRADO e dos Beneficiários igual a ATIVO  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF14[1]}


Teste de Regressão 15 - INTEG MOV CANCELAM CONTRATO CRM - INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 46, (CONTRATO CAEPF)
    [Documentation]  INTEG MOV CANCELAM CONTRATO CRM - TR015: INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 46, (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Ativar o Agendador "CONTRATO Sincronização"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVCANCELAMCONTRATOCRMCAEPF15}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15[1]}
    E        Gerou uma Movimentação Cadastral de Cancelamento de Contrato
    E        Clicou no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    E        Selecionou "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, informou "Data de Cancelamento" com data e hora atual
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVCANCELAMCONTRATOCRMCAEPF15}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Cancelamento de Contrato em Conferência  @{INTEGMOVCANCELAMCONTRATOCRMCAEPF15}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato, o campo "Data de Exclusão" preenchido com a data informada, hora zerada, com a "situação" do Contrato e dos Beneficiários igual a CANCELADO    ${INTEGMOVCANCELAMCONTRATOCRMCAEPF15[1]}


Teste de Regressão 16 - INTEG MOV CANCELAM CONTRATO CRM - INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 47, (CONTRATO CAEPF)
    [Documentation]  INTEG MOV CANCELAM CONTRATO CRM - TR016: INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 47, (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Ativar o Agendador "CONTRATO Sincronização"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVCANCELAMCONTRATOCRMCAEPF16}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16[1]}
    E        Gerou uma Movimentação Cadastral de Cancelamento de Contrato
    E        Clicou no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    E        Selecionou "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), informou "Data de Cancelamento" com data e hora atual
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVCANCELAMCONTRATOCRMCAEPF16}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Cancelamento de Contrato em Conferência  @{INTEGMOVCANCELAMCONTRATOCRMCAEPF16}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato, o campo "Data de Exclusão" preenchido com a data informada, hora zerada, com a "situação" do Contrato e dos Beneficiários igual a CANCELADO    ${INTEGMOVCANCELAMCONTRATOCRMCAEPF16[1]}


Teste de Regressão 17 - INTEG MOV CANCELAM CONTRATO CRM - INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 48, (CONTRATO CAEPF)
    [Documentation]  INTEG MOV CANCELAM CONTRATO CRM - TR017: INTEGRAR MOV CADASTRAL DE CANCELAMENTO DE CONTRATO - MOTIVO 48, (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Ativar o Agendador "CONTRATO Sincronização"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVCANCELAMCONTRATOCRMCAEPF17}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17[1]}
    E        Gerou uma Movimentação Cadastral de Cancelamento de Contrato
    E        Clicou no menu "REGISTRAR CANCELAMENTO DE CONTRATO" dentro do menu "EDITAR"
    E        Selecionou "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, informou "Data de Cancelamento" com data e hora atual
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"    @{INTEGMOVCANCELAMCONTRATOCRMCAEPF17}
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Cancelamento de Contrato em Conferência  @{INTEGMOVCANCELAMCONTRATOCRMCAEPF17}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato, o campo "Data de Exclusão" preenchido com a data informada, hora zerada, com a "situação" do Contrato e dos Beneficiários igual a CANCELADO    ${INTEGMOVCANCELAMCONTRATOCRMCAEPF17[1]}


