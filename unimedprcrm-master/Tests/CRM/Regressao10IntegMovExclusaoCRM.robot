*** Settings ***
Resource    ../../main.resource

Suite Setup     Run Keywords     Executar as querys para Validar e Gerar Massa de Dados    AND   Instancia Variaveis   10
# Suite Setup     Instancia Variaveis   05
Test Setup      Abrir Nav
Test Teardown   Comum.Fechar Nav


*** Test Cases ***
Teste de Regressão 01 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41, MANUALMENTE (CONTRATO PF)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR001: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41, MANUALMENTE (CONTRATO PF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Situação" INTEGRADO  @{INTEGMOVEXCPF01}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVEXCPF01[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, com "Data de Exclusão" igual a DATA DE HOJE, informou um Telefone e e-mail  @{INTEGMOVEXCPF01} 
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCPF01}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"	${INTEGMOVEXCPF01[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCPF01}


Teste de Regressão 02 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 44, MANUALMENTE (CONTRATO PF)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR002: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 44, MANUALMENTE (CONTRATO PF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Situação" INTEGRADO  @{INTEGMOVEXCPF02}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVEXCPF02[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário  
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 44 - ÓBITO, não alterou o campo "Data de Exclusão", "Data de Obito" igual a DATA DE ONTEM, informou um Telefone e e-mail  @{INTEGMOVEXCPF02} 
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCPF02}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"  ${INTEGMOVEXCPF02[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCPF02}


Teste de Regressão 03 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 46, MANUALMENTE (CONTRATO PF)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR003: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 46,  MANUALMENTE (CONTRATO PF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Situação" INTEGRADO  @{INTEGMOVEXCPF03}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVEXCPF03[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário  
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, com "Data de Exclusão" igual a DATA DE HOJE, informou um Telefone e e-mail  @{INTEGMOVEXCPF03} 
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCPF03}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"	${INTEGMOVEXCPF03[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCPF03}


Teste de Regressão 04 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 47, MANUALMENTE (CONTRATO PF)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR004: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 47, MANUALMENTE (CONTRATO PF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Situação" INTEGRADO  @{INTEGMOVEXCPF04}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVEXCPF04[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário  
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), não alterou o campo "Data de Exclusão", informou um Telefone e e-mail  @{INTEGMOVEXCPF04} 
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCPF04}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVEXCPF04[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCPF04}


Teste de Regressão 05 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 48, MANUALMENTE (CONTRATO PF)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR005: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 48, MANUALMENTE (CONTRATO PF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Situação" INTEGRADO  @{INTEGMOVEXCPF05}
    E        Clicou em um Contrato, que tenha Beneficiários DEPENDENTES Ativos  ${INTEGMOVEXCPF05[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário  
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, não alterou o campo "Data de Exclusão", informou um Telefone e e-mail  @{INTEGMOVEXCPF05} 
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCPF05}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVEXCPF05[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCPF05}


Teste de Regressão 06 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41, MANUALMENTE (CONTRATO PJ)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR006: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41, MANUALMENTE (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO  @{INTEGMOVEXCPJ06}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCPJ06[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, não alterou o campo "Data de Exclusão", informou um Telefone e e-mail  @{INTEGMOVEXCPJ06}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, com "Data de Exclusão" igual DATA ATUAL, informou um Telefone e e-mail  @{INTEGMOVEXCPJ06}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCPJ06}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVEXCPJ06[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCPJ06}


Teste de Regressão 07 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42 (SEM CONTRATO INATIVO), MANUALMENTE (CONTRATO PJ)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR007: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42 (SEM CONTRATO INATIVO), MANUALMENTE (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (MOTIVO 42)  @{INTEGMOVEXCPJ07}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCPJ07[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO, informou um Telefone e e-mail  @{INTEGMOVEXCPJ07}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a PEDIDO DEMISSÃO, informou um Telefone e e-mail  @{INTEGMOVEXCPJ07}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?" igual a NÃO, informou um Telefone e e-mail  @{INTEGMOVEXCPJ07}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?" igual a SIM, "titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a NÃO, informou um Telefone e e-mail  @{INTEGMOVEXCPJ07}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a DEMISSÃO/EXONERAÇÃO SEM JUSTA CAUSA, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a NÃO, informou um Telefone e e-mail  @{INTEGMOVEXCPJ07}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCPJ07}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVEXCPJ07[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCPJ07}


Teste de Regressão 08 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42 (COM CONTRATO INATIVO), MANUALMENTE (CONTRATO PJ)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR008: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42 (COM CONTRATO INATIVO), MANUALMENTE (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (4 Vidas)  @{INTEGMOVEXCPJ08}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCPJ08[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?" igual a SIM, "titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM, "Tempo de contribuição?" igual a 60, selecionou os Dependentes, telefone celular, e-mail, endereço  @{INTEGMOVEXCPJ08}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a DEMISSÃO/EXONERAÇÃO SEM JUSTA CAUSA, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM, "Tempo de contribuição?" igual a 60, selecionou os Dependentes, telefone celular, e-mail, endereço  @{INTEGMOVEXCPJ08}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCPJ08}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVEXCPJ08[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCPJ08}


Teste de Regressão 09 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 44, MANUALMENTE (CONTRATO PJ)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR009: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 44, MANUALMENTE (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (4 Vidas)  @{INTEGMOVEXCPJ09}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCPJ09[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 44 - ÓBITO, "Data de Óbito" igual a DATA DE ONTEM, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço  @{INTEGMOVEXCPJ09}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 44 - ÓBITO, "Data de Óbito" igual a DATA DE ONTEM, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço  @{INTEGMOVEXCPJ09}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCPJ09}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVEXCPJ09[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCPJ09}


Teste de Regressão 10 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 46, MANUALMENTE (CONTRATO PJ)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR010: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 46, MANUALMENTE (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (4 Vidas)  @{INTEGMOVEXCPJ10}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCPJ10[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço  @{INTEGMOVEXCPJ10}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço  @{INTEGMOVEXCPJ10}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCPJ10}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVEXCPJ10[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCPJ10}

    
Teste de Regressão 11 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 47, MANUALMENTE (CONTRATO PJ)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR011: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 47, MANUALMENTE (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (4 Vidas)  @{INTEGMOVEXCPJ11}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCPJ11[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço  @{INTEGMOVEXCPJ11}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço  @{INTEGMOVEXCPJ11}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCPJ11}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVEXCPJ11[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCPJ11}


Teste de Regressão 12 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 48, MANUALMENTE (CONTRATO PJ)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR012: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 48, MANUALMENTE (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (4 Vidas)  @{INTEGMOVEXCPJ12}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCPJ12[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço  @{INTEGMOVEXCPJ12}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço  @{INTEGMOVEXCPJ12}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCPJ12}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVEXCPJ12[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCPJ12}


Teste de Regressão 13 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41, AUTOMATICAMENTE (CONTRATO PJ)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR013: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41, AUTOMATICAMENTE (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema
    E        Ativou o Agendador "Solicitação de Integração Automática"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (4 Vidas - EXC INTEGRACAO AUTOMATICA)  @{INTEGMOVEXCPJ13}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a SIM, que tenha Beneficiários Ativos  ${INTEGMOVEXCPJ13[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço  @{INTEGMOVEXCPJ13}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail, endereço  @{INTEGMOVEXCPJ13}
    Quando   Clicou no menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA"
    E        Atualizar a tela da Movimentação Cadastral, alterou a "Situação" para AGUARDANDO INTEGRAÇÃO AUTOMÁTICA
    E        Atualizar a tela da Movimentação Cadastral após 3 minutos"	
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado automaticamente"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO (Integrada Automaticamente)  @{INTEGMOVEXCPJ13}


Teste de Regressão 14 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42 (SEM CONTRATO INATIVO), AUTOMATICAMENTE (CONTRATO PJ)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR014: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42 (SEM CONTRATO INATIVO), AUTOMATICAMENTE (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (6 vidas - EXC INTEGRACAO AUTOMATICA)  @{INTEGMOVEXCPJ14}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCPJ14[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO, telefone celular, e-mail  @{INTEGMOVEXCPJ14}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a PEDIDO DEMISSÃO, telefone celular, e-mail  @{INTEGMOVEXCPJ14}
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, com "Data de Exclusão" igual a DATA ATUAL, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "O titular aposentado continuou trabalhando na mesma empresa após aposentadoria, contribuindo para o plano de saúde?" igual a NÃO, telefone celular, e-mail  @{INTEGMOVEXCPJ14}  
    Quando   Clicou no menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA"
    E        Atualizar a tela da Movimentação Cadastral, alterou a "Situação" para AGUARDANDO INTEGRAÇÃO AUTOMÁTICA
    E        Atualizar a tela da Movimentação Cadastral após 3 minutos"	
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado automaticamente"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO (Integrada Automaticamente)  @{INTEGMOVEXCPJ13}


### KEYWORDS DE CADASTRO COM ERROS
Teste de Regressão 15 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 46, AUTOMATICAMENTE (CONTRATO PJ)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR015: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 46, AUTOMATICAMENTE (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema
    E        Ativou o Agendador "Solicitação de Integração Automática"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (4 Vidas - EXC INTEGRACAO AUTOMATICA)  @{INTEGMOVEXCPJ15}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a SIM, que tenha Beneficiários Ativos  ${INTEGMOVEXCPJ15[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, com "Data de Exclusão" de 1º dia do mês seguinte para DATA DE HOJE, telefone celular, e-mail    @{INTEGMOVEXCPJ15}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, não alterou o campo "Data de Exclusão", telefone celular, e-mail    @{INTEGMOVEXCPJ15}
    Quando   Clicou no menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA"
    E        Atualizar a tela da Movimentação Cadastral, alterou a "Situação" para AGUARDANDO INTEGRAÇÃO AUTOMÁTICA
    E        Atualizar a tela da Movimentação Cadastral após 3 minutos"	
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado automaticamente"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO (Integrada Automaticamente)  @{INTEGMOVEXCPJ15}


Teste de Regressão 16 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 47, AUTOMATICAMENTE (CONTRATO PJ)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR016: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 47, AUTOMATICAMENTE (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema
    E        Ativou o Agendador "Solicitação de Integração Automática"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (4 Vidas - EXC INTEGRACAO AUTOMATICA)  @{INTEGMOVEXCPJ16}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a SIM, que tenha Beneficiários Ativos  ${INTEGMOVEXCPJ16[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), não alterou o campo "Data de Exclusão", telefone celular, e-mail  @{INTEGMOVEXCPJ16}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail  @{INTEGMOVEXCPJ16}
    Quando   Clicou no menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA"
    E        Atualizar a tela da Movimentação Cadastral, alterou a "Situação" para AGUARDANDO INTEGRAÇÃO AUTOMÁTICA
    E        Atualizar a tela da Movimentação Cadastral após 3 minutos"	
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado automaticamente"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO (Integrada Automaticamente)  @{INTEGMOVEXCPJ16}


Teste de Regressão 17 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 48, AUTOMATICAMENTE (CONTRATO PJ)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR017: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 48, AUTOMATICAMENTE (CONTRATO PJ)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema
    E        Ativou o Agendador "Solicitação de Integração Automática"
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (PJ), com "Situação" INTEGRADO (4 Vidas - EXC INTEGRACAO AUTOMATICA)  @{INTEGMOVEXCPJ17}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a SIM, que tenha Beneficiários Ativos  ${INTEGMOVEXCPJ17[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail    @{INTEGMOVEXCPJ17}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, não alterou o campo "Data de Exclusão", telefone celular, e-mail    @{INTEGMOVEXCPJ17}
    Quando   Clicou no menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA"
    E        Atualizar a tela da Movimentação Cadastral, alterou a "Situação" para AGUARDANDO INTEGRAÇÃO AUTOMÁTICA
    E        Atualizar a tela da Movimentação Cadastral após 3 minutos"	
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado automaticamente"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO (Integrada Automaticamente)  @{INTEGMOVEXCPJ17}


Teste de Regressão 18 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41, MANUALMENTE (CONTRATO CAEPF)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR018: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41, MANUALMENTE (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO  @{INTEGMOVEXCCAEPF18}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCCAEPF18[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, não alterou o campo "Data de Exclusão", informou um Telefone celular e e-mail  @{INTEGMOVEXCCAEPF18}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, com "Data de Exclusão" igual a DATA ATUAL, informou um Telefone celular e e-mail  @{INTEGMOVEXCCAEPF18}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCCAEPF18}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVEXCCAEPF18[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCCAEPF18}


Teste de Regressão 19 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42, MANUALMENTE (CONTRATO CAEPF)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR019: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42, MANUALMENTE (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO  @{INTEGMOVEXCCAEPF19}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCCAEPF19[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 42 - DESLIGAMENTO DA EMPRESA, não alterou o campo "Data de Exclusão", telefone celular, e-mail  @{INTEGMOVEXCCAEPF19}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCCAEPF19}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVEXCCAEPF19[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCCAEPF19}


Teste de Regressão 20 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 44, MANUALMENTE (CONTRATO CAEPF)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR020: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 44, MANUALMENTE (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO  @{INTEGMOVEXCCAEPF20}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCCAEPF20[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 44 - ÓBITO, "Data de Óbito" igual a DATA DE ONTEM, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail    @{INTEGMOVEXCCAEPF20}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 44 - ÓBITO, "Data de Óbito" igual a DATA DE ONTEM, não alterou o campo "Data de Exclusão", telefone celular, e-mail    @{INTEGMOVEXCCAEPF20}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCCAEPF20}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVEXCCAEPF20[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCCAEPF20}


Teste de Regressão 21 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 46, MANUALMENTE (CONTRATO CAEPF)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR021: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 46, MANUALMENTE (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO  @{INTEGMOVEXCCAEPF21}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCCAEPF21[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, não alterou o campo "Data de Exclusão", telefone celular, e-mail    @{INTEGMOVEXCCAEPF21}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 46 - INCLUSÃO INDEVIDA DE BENEFICIÁRIO, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail    @{INTEGMOVEXCCAEPF21}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCCAEPF21}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVEXCCAEPF21[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCCAEPF21}


Teste de Regressão 22 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 47, MANUALMENTE (CONTRATO CAEPF)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR022: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 47, MANUALMENTE (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO  @{INTEGMOVEXCCAEPF22}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCCAEPF22[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), não alterou o campo "Data de Exclusão", telefone celular, e-mail    @{INTEGMOVEXCCAEPF22}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 47 - FRAUDE (art. 13 da Lei 9.656/98), com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail    @{INTEGMOVEXCCAEPF22}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCCAEPF22}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVEXCCAEPF22[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCCAEPF22}


Teste de Regressão 23 - INTEG MOV EXCLUSÃO CRM - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 48, MANUALMENTE (CONTRATO CAEPF)
    [Documentation]  INTEG MOV EXCLUSÃO CRM - TR023: INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 48, MANUALMENTE (CONTRATO CAEPF)
    ...              DEPENDENCIA DO POTENCIAL CLIENTE, COTAÇÃO, OPORTUNIDADE, BENEFICIARIO, CONTRATO
    Dado     Usuário logou no sistema  
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Pesquisou um Contrato, com "Tipo da Conta" igual a CLIENTE (CAEPF), com "Situação" INTEGRADO  @{INTEGMOVEXCCAEPF23}
    E        Clicou em um Contrato, com parâmetro "Movimentação de Exclusão – Integração automática" igual a NÃO, que tenha Beneficiários Ativos  ${INTEGMOVEXCCAEPF23[1]}
    E        Gerou uma Movimentação Cadastral de Exclusão de Beneficiário
    E        Cadastrou 1 (UM) Beneficiário TITULAR (com Dependentes), com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, não alterou o campo "Data de Exclusão", telefone celular, e-mail, endereço  @{INTEGMOVEXCCAEPF23}
    E        Cadastrou 1 (UM) Beneficiário DEPENDENTE, com "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA, com "Data de Exclusão" igual a DATA ATUAL, telefone celular, e-mail  @{INTEGMOVEXCCAEPF23}
    E        Clicou no menu "ENCAMINHAR PARA APROVAÇÃO", preencheu o campo "Informações Adicionais", clicou no botão "SALVAR"
    E        Acessou o módulo Conferência
    E        Clicou no menu "CONFERIR PROCESSOS"
    E        Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E        Clicou no botão "CONFERIR" da Movimentação Cadastral de Exclusão de Beneficiário em Conferência  @{INTEGMOVEXCCAEPF23}
    E        Clicou no botão "SIM" da modal de Confirmação
    E        Clicou no menu "VALIDAR DADOS" (Mov Cadastral)
    E        Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E        Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Quando   Clicar no registro "Integração Solicitada"
    E        Clicar no botão "EFETUAR INTEGRAÇÃO"   ${INTEGMOVEXCCAEPF23[1]}
    Então    CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E        Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO  @{INTEGMOVEXCCAEPF23}