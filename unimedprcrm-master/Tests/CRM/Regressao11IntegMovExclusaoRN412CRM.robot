*** Settings ***
Resource    ../../main.resource

Suite Setup     Run Keywords     Executar as querys para Validar e Gerar Massa de Dados    AND   Instancia Variaveis   11
# Suite Setup     Instancia Variaveis   05
Test Setup      Abrir Nav
Test Teardown   Comum.Fechar Nav


*** Test Cases ***
Teste de Regressão 01 - INTEG MOV EXCLUSÃO RN412 CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 41, MANUALMENTE (CONTRATO PF)									
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR001: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 41, MANUALMENTE (CONTRATO PF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVEXCRN412PF01}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVEXCRN412PF01[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário RN412
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou um Telefone celular e e-mail  @{INTEGMOVEXCRN412PF01}   
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCRN412PF01}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    Quando   Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então    CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    E        Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO  @{INTEGMOVEXCRN412PF01}


Teste de Regressão 02 - INTEG MOV EXCLUSÃO RN412 CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 48, MANUALMENTE (CONTRATO PF)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR002: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 48, MANUALMENTE (CONTRATO PF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Situação" INTEGRADO (2 Vidas)  @{INTEGMOVEXCRN412PF02}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVEXCRN412PF02[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário RN412
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, telefone celular, e-mail, endereço  @{INTEGMOVEXCRN412PF02}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCRN412PF02}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    Quando   Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então    CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    E        Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO  @{INTEGMOVEXCRN412PF02}


Teste de Regressão 03 - INTEG MOV EXCLUSÃO RN412 CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 41, MANUALMENTE (CONTRATO PJ)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR003: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 41, MANUALMENTE (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (4 Vidas)  @{INTEGMOVEXCRN412PJ03}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCRN412PJ03[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário RN412
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou um Telefone e e-mail  @{INTEGMOVEXCRN412PJ03}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou um Telefone e e-mail  @{INTEGMOVEXCRN412PJ03}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCRN412PJ03}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    Quando   Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então    CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    E        Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO  @{INTEGMOVEXCRN412PJ03}


Teste de Regressão 04 - INTEG MOV EXCLUSÃO RN412 CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 48, MANUALMENTE (CONTRATO PJ)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR004: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 48, MANUALMENTE (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (4 Vidas)  @{INTEGMOVEXCRN412PJ04}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCRN412PJ04[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário RN412
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, telefone celular, e-mail, endereço  @{INTEGMOVEXCRN412PJ04}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, telefone celular, e-mail, endereço  @{INTEGMOVEXCRN412PJ04}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCRN412PJ04}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    Quando   Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então    CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    E        Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO  @{INTEGMOVEXCRN412PJ04}


Teste de Regressão 05 - INTEG MOV EXCLUSÃO RN412 CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 41, MANUALMENTE (CONTRATO CAEPF)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR005: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 41, MANUALMENTE (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO (4 Vidas)  @{INTEGMOVEXCRN412CAEPF05}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCRN412CAEPF05[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário RN412
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou um Telefone e e-mail  @{INTEGMOVEXCRN412CAEPF05}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, informou um Telefone e e-mail  @{INTEGMOVEXCRN412CAEPF05}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCRN412CAEPF05}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    Quando   Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então    CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    E        Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO  @{INTEGMOVEXCRN412CAEPF05}


Teste de Regressão 06 - INTEG MOV EXCLUSÃO RN412 CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 48, MANUALMENTE (CONTRATO CAEPF)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR006: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 48, MANUALMENTE (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO (4 Vidas)  @{INTEGMOVEXCRN412CAEPF06}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCRN412CAEPF06[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário RN412
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, telefone celular, e-mail, endereço  @{INTEGMOVEXCRN412CAEPF06}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, telefone celular, e-mail, endereço  @{INTEGMOVEXCRN412CAEPF06}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCRN412CAEPF06}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    Quando   Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então    CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    E        Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO  @{INTEGMOVEXCRN412CAEPF06}


Teste
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 2 Vidas)  @{INTEGMOVEXCRN412CAEPF05}
    Selecionar, validar e confirmar arquivo (Movimentação cadastral - 2 Vidas - teste)  @{INTEGMOVEXCRN412CAEPF06}
