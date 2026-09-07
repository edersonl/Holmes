*** Settings ***
Resource    ../../main.resource

Suite Setup      Instancia Variaveis    C07
Test Setup       Comum.Abrir Nav  
Test Teardown    Comum.Fechar Nav

*** Variables ***

*** Test Cases ***
Teste de Regressão 1 - EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 41 (CONTRATO PF)
    [Documentation]  EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 41 (CONTRATO PF)
    Dado  Usuário logou no sistema
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Tipo de Contratação" igual a INDIVIDUAL FAMILIAR, com Beneficiários  @{EXCLUSAORN412CANALPF01}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário RN412"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS RN412 e clicou no botão "SALVAR"  ${EXCLUSAORN412CANALPF01[2]}
    E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E     Clicou o botão "ADICIONAR"
    E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 48 - POR PORTABILIDADE DE CARÊNCIA, "Perfil Solicitante" com as opções CONTRATANTE, CONTRATANTE PAGADOR e TITULAR, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E     Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E     Validou a apresentação do campo "Submotivo"
    E     Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios e clicou no botão "SALVAR"  @{EXCLUSAORN412CANALPF01}
    E     Validou a apresentação da mensagem de erro "A exclusão de um beneficiário Titular para contrato Pessoa Física caracteriza cancelamento de contrato e esta movimentação não é permitida via Canal do Contratante. Entre em contato com a operadora."
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE, preencheu campos obrigatórios e clicou no botão "SALVAR"  @{EXCLUSAORN412CANALPF01}
    E     Validou a apresentação da tela "Exclusão RN412", com o beneficiário na tabela "Exclusão de Beneficiários"

    E     Anexou um documento no painel "Documentos"

    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E     Clicou no botão "SIM" da modal "Confirmação" com a mensagem "A data da exclusão será a partir da data da CIENCIA e APROVAÇÃO da operadora de plano de saúde, e possui caráter IRREVOGÁVEL, ou seja, NÃO SERÁ PERMITIDO O DIREITO DE ARREPENDIMENTO POSTERIOR. Deseja continuar?"
    E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a AGUARDANDO APROVAÇÃO

    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência 
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" igual a RN412
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{EXCLUSAORN412CANALPF01}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido 
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão" preenchida com a DATA/HORA ATUAL e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E     Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA"
    E     Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    E     Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    E     Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validar a apresentação da modal "Aprovar Conferência", com a "Data/hora criação" preenchido com a DATA/HORA ATUAL, "Responsável" com o usuário logado, campo "Parecer", mensagem "Não foram encontradas devoluções de valores.", botões "SALVAR" e "CANCELAR"
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então  CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    E     Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    E     Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO  @{EXCLUSAORN412CANALPF01}


Teste de Regressão 2 - EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 48 (CONTRATO PF)
    [Documentation]  EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 48 (CONTRATO PF)
    Dado  Usuário logou no sistema
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Tipo de Contratação" igual a INDIVIDUAL FAMILIAR, com Beneficiários  @{EXCLUSAORN412CANALPF02}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário RN412"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS RN412 e clicou no botão "SALVAR"  ${EXCLUSAORN412CANALPF02[2]}
    E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E     Clicou o botão "ADICIONAR"
    E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 48 - POR PORTABILIDADE DE CARÊNCIA, "Perfil Solicitante" com as opções CONTRATANTE, CONTRATANTE PAGADOR e TITULAR, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E     Selecionou "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA
    E     Validou a apresentação do campo "Submotivo"
    E     Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios e clicou no botão "SALVAR"  @{EXCLUSAORN412CANALPF02}
    E     Validou a apresentação da mensagem de erro "A exclusão de um beneficiário Titular para contrato Pessoa Física caracteriza cancelamento de contrato e esta movimentação não é permitida via Canal do Contratante. Entre em contato com a operadora."
    E     Cadastrou 1 (UM) Beneficiário DEPENDENTE, preencheu campos obrigatórios e clicou no botão "SALVAR"  @{EXCLUSAORN412CANALPF02}
    E     Validou a apresentação da tela "Exclusão RN412", com o beneficiário na tabela "Exclusão de Beneficiários"

    E     Anexou um documento no painel "Documentos"

    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E     Clicou no botão "SIM" da modal "Confirmação" com a mensagem "A data da exclusão será a partir da data da CIENCIA e APROVAÇÃO da operadora de plano de saúde, e possui caráter IRREVOGÁVEL, ou seja, NÃO SERÁ PERMITIDO O DIREITO DE ARREPENDIMENTO POSTERIOR. Deseja continuar?"
    E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a AGUARDANDO APROVAÇÃO
    
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência 
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" igual a RN412
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{EXCLUSAORN412CANALPF02}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão" preenchida com a DATA/HORA ATUAL e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E     Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA"
    E     Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    E     Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    E     Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validar a apresentação da modal "Aprovar Conferência", com a "Data/hora criação" preenchido com a DATA/HORA ATUAL, "Responsável" com o usuário logado, campo "Parecer", mensagem "Não foram encontradas devoluções de valores.", botões "SALVAR" e "CANCELAR"
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então  CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    E     Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    E     Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO  @{EXCLUSAORN412CANALPF02}


Teste de Regressão 3 - EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 41 (CONTRATO CAEPF ADESÃO)
    [Documentation]  EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 41 (CONTRATO CAEPF ADESÃO)
    Dado  Usuário logou no sistema
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários  @{EXCLUSAORN412CANALCAEPF01}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário RN412"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS RN412 e clicou no botão "SALVAR"  ${EXCLUSAORN412CANALCAEPF01[2]}
    E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E     Clicou o botão "ADICIONAR"
    E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 48 - POR PORTABILIDADE DE CARÊNCIA, "Perfil Solicitante" com as opções CONTRATANTE, CONTRATANTE PAGADOR e TITULAR, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E     Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E     Validou a apresentação do campo "Submotivo"
    E     Selecionou 1 (UM) Beneficiário TITULAR CAEPF, preencheu campos obrigatórios e clicou no botão "SALVAR"  @{EXCLUSAORN412CANALCAEPF01}
    E     Validou a apresentação da tela "Exclusão RN412", com o beneficiário na tabela "Exclusão de Beneficiários"

    E     Anexou um documento no painel "Documentos"

    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E     Clicou no botão "SIM" da modal "Confirmação" com a mensagem "A data da exclusão será a partir da data da CIENCIA e APROVAÇÃO da operadora de plano de saúde, e possui caráter IRREVOGÁVEL, ou seja, NÃO SERÁ PERMITIDO O DIREITO DE ARREPENDIMENTO POSTERIOR. Deseja continuar?"
    E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a AGUARDANDO APROVAÇÃO
    
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência 
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" igual a RN412
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{EXCLUSAORN412CANALCAEPF01}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão" preenchida com a DATA/HORA ATUAL e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E     Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA"
    E     Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    E     Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    E     Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então  CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    E     Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    E     Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO  @{EXCLUSAORN412CANALCAEPF01}


Teste de Regressão 4 - EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 48 (CONTRATO CAEPF ADESÃO)
    [Documentation]  EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 48 (CONTRATO CAEPF ADESÃO)
    Dado  Usuário logou no sistema
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários  @{EXCLUSAORN412CANALCAEPF02}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário RN412"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS RN412 e clicou no botão "SALVAR"  ${EXCLUSAORN412CANALCAEPF02[2]}
    E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E     Clicou o botão "ADICIONAR"
    E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 48 - POR PORTABILIDADE DE CARÊNCIA, "Perfil Solicitante" com as opções CONTRATANTE, CONTRATANTE PAGADOR e TITULAR, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E     Selecionou "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA
    E     Validou a apresentação do campo "Submotivo"
    E     Selecionou 1 (UM) Beneficiário TITULAR CAEPF, preencheu campos obrigatórios e clicou no botão "SALVAR"  @{EXCLUSAORN412CANALCAEPF02}
    E     Validou a apresentação da tela "Exclusão RN412", com o beneficiário na tabela "Exclusão de Beneficiários"

    E     Anexou um documento no painel "Documentos"

    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E     Clicou no botão "SIM" da modal "Confirmação" com a mensagem "A data da exclusão será a partir da data da CIENCIA e APROVAÇÃO da operadora de plano de saúde, e possui caráter IRREVOGÁVEL, ou seja, NÃO SERÁ PERMITIDO O DIREITO DE ARREPENDIMENTO POSTERIOR. Deseja continuar?"
    E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a AGUARDANDO APROVAÇÃO
    
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência 
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" igual a RN412
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{EXCLUSAORN412CANALCAEPF02}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão" preenchida com a DATA/HORA ATUAL e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E     Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA"
    E     Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    E     Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    E     Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então  CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    E     Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    E     Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO  @{EXCLUSAORN412CANALCAEPF02}


Teste de Regressão 5 - EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 41 (CONTRATO CAEPF EMPRESARIAL)
    [Documentation]  EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 41 (CONTRATO CAEPF EMPRESARIAL)
    Dado  Usuário logou no sistema
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários  @{EXCLUSAORN412CANALCAEPF03}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário RN412"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS RN412 e clicou no botão "SALVAR"  ${EXCLUSAORN412CANALCAEPF03[2]}
    E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E     Clicou o botão "ADICIONAR"
    E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 48 - POR PORTABILIDADE DE CARÊNCIA, "Perfil Solicitante" com as opções CONTRATANTE, CONTRATANTE PAGADOR e TITULAR, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E     Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E     Validou a apresentação do campo "Submotivo"
    E     Selecionou 1 (UM) Beneficiário TITULAR CAEPF, preencheu campos obrigatórios e clicou no botão "SALVAR"  @{EXCLUSAORN412CANALCAEPF03}
    E     Validou a apresentação da tela "Exclusão RN412", com o beneficiário na tabela "Exclusão de Beneficiários"

    E     Anexou um documento no painel "Documentos"

    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E     Clicou no botão "SIM" da modal "Confirmação" com a mensagem "A data da exclusão será a partir da data da CIENCIA e APROVAÇÃO da operadora de plano de saúde, e possui caráter IRREVOGÁVEL, ou seja, NÃO SERÁ PERMITIDO O DIREITO DE ARREPENDIMENTO POSTERIOR. Deseja continuar?"
    E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a AGUARDANDO APROVAÇÃO
    
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência 
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" igual a RN412
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{EXCLUSAORN412CANALCAEPF03}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão" preenchida com a DATA/HORA ATUAL e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E     Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA"
    E     Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    E     Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    E     Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então  CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    E     Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    E     Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO  @{EXCLUSAORN412CANALCAEPF03}


Teste de Regressão 6 - EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 48 (CONTRATO CAEPF EMPRESARIAL)
    [Documentation]  EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 48 (CONTRATO CAEPF EMPRESARIAL)
    Dado  Usuário logou no sistema
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários  @{EXCLUSAORN412CANALCAEPF04}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário RN412"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS RN412 e clicou no botão "SALVAR"  ${EXCLUSAORN412CANALCAEPF04[2]}
    E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E     Clicou o botão "ADICIONAR"
    E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 48 - POR PORTABILIDADE DE CARÊNCIA, "Perfil Solicitante" com as opções CONTRATANTE, CONTRATANTE PAGADOR e TITULAR, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E     Selecionou "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA
    E     Validou a apresentação do campo "Submotivo"
    E     Selecionou 1 (UM) Beneficiário TITULAR CAEPF, preencheu campos obrigatórios e clicou no botão "SALVAR"  @{EXCLUSAORN412CANALCAEPF04}
    E     Validou a apresentação da tela "Exclusão RN412", com o beneficiário na tabela "Exclusão de Beneficiários"

    E     Anexou um documento no painel "Documentos"

    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E     Clicou no botão "SIM" da modal "Confirmação" com a mensagem "A data da exclusão será a partir da data da CIENCIA e APROVAÇÃO da operadora de plano de saúde, e possui caráter IRREVOGÁVEL, ou seja, NÃO SERÁ PERMITIDO O DIREITO DE ARREPENDIMENTO POSTERIOR. Deseja continuar?"
    E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a AGUARDANDO APROVAÇÃO
    
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência 
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" igual a RN412
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{EXCLUSAORN412CANALCAEPF04}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão" preenchida com a DATA/HORA ATUAL e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E     Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA"
    E     Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    E     Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    E     Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então  CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    E     Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    E     Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO  @{EXCLUSAORN412CANALCAEPF04}


Teste de Regressão 7 - EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 41 (CONTRATO PJ ADESÃO)
    [Documentation]  EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 41 (CONTRATO PJ ADESÃO)
    Dado  Usuário logou no sistema
	E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários  @{EXCLUSAORN412CANALPJ01}
	E     Acessou o módulo Todos > Usuário Canal do Contratante
	E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
	E     Acessou o usuário desejado
	E     Vinculou o Contrato integrado no painel "Contrato"
	E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário RN412"

	E     O Usuário logou no sistema Canal do Contratante
	E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
	E     Clicou no menu Ações > Solicitar Movimentação
	E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS RN412 e clicou no botão "SALVAR"  ${EXCLUSAORN412CANALPJ01[2]}
	E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
	E     Clicou o botão "ADICIONAR"
	E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 48 - POR PORTABILIDADE DE CARÊNCIA, "Perfil Solicitante" com as opções CONTRATANTE, CONTRATANTE PAGADOR e TITULAR, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
	E     Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
	E     Validou a apresentação do campo "Submotivo"
	E     Selecionou 1 (UM) Beneficiário TITULAR PJ, preencheu campos obrigatórios e clicou no botão "SALVAR"  @{EXCLUSAORN412CANALPJ01}
	E     Validou a apresentação da tela "Exclusão RN412", com o beneficiário na tabela "Exclusão de Beneficiários"

	E     Anexou um documento no painel "Documentos"

	E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
	E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E     Clicou no botão "SIM" da modal "Confirmação" com a mensagem "A data da exclusão será a partir da data da CIENCIA e APROVAÇÃO da operadora de plano de saúde, e possui caráter IRREVOGÁVEL, ou seja, NÃO SERÁ PERMITIDO O DIREITO DE ARREPENDIMENTO POSTERIOR. Deseja continuar?"
    E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a AGUARDANDO APROVAÇÃO
    
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência 
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" igual a RN412
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{EXCLUSAORN412CANALPJ01}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão" preenchida com a DATA/HORA ATUAL e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E     Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA"
    E     Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    E     Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    E     Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então  CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    E     Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    E     Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO  @{EXCLUSAORN412CANALPJ01}


Teste de Regressão 8 - EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 48 (CONTRATO PJ ADESÃO)
    [Documentation]  EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 48 (CONTRATO PJ ADESÃO)
    Dado  Usuário logou no sistema
	E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários  @{EXCLUSAORN412CANALPJ02}
	E     Acessou o módulo Todos > Usuário Canal do Contratante
	E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
	E     Acessou o usuário desejado
	E     Vinculou o Contrato integrado no painel "Contrato"
	E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário RN412"

	E     O Usuário logou no sistema Canal do Contratante
	E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
	E     Clicou no menu Ações > Solicitar Movimentação
	E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS RN412 e clicou no botão "SALVAR"  ${EXCLUSAORN412CANALPJ02[2]}
	E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
	E     Clicou o botão "ADICIONAR"
	E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 48 - POR PORTABILIDADE DE CARÊNCIA, "Perfil Solicitante" com as opções CONTRATANTE, CONTRATANTE PAGADOR e TITULAR, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
	E     Selecionou "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA
	E     Validou a apresentação do campo "Submotivo"
	E     Selecionou 1 (UM) Beneficiário TITULAR PJ, preencheu campos obrigatórios e clicou no botão "SALVAR"  @{EXCLUSAORN412CANALPJ02}
	E     Validou a apresentação da tela "Exclusão RN412", com o beneficiário na tabela "Exclusão de Beneficiários"

	E     Anexou um documento no painel "Documentos"

	E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
	E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E     Clicou no botão "SIM" da modal "Confirmação" com a mensagem "A data da exclusão será a partir da data da CIENCIA e APROVAÇÃO da operadora de plano de saúde, e possui caráter IRREVOGÁVEL, ou seja, NÃO SERÁ PERMITIDO O DIREITO DE ARREPENDIMENTO POSTERIOR. Deseja continuar?"
    E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a AGUARDANDO APROVAÇÃO
    
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência 
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" igual a RN412
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{EXCLUSAORN412CANALPJ02}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão" preenchida com a DATA/HORA ATUAL e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E     Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA"
    E     Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    E     Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    E     Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então  CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    E     Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    E     Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO  @{EXCLUSAORN412CANALPJ02}



Teste de Regressão 9 - EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 41 (CONTRATO PJ EMPRESARIAL)
    [Documentation]  EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 41 (CONTRATO PJ EMPRESARIAL)
    Dado  Usuário logou no sistema
	E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários  @{EXCLUSAORN412CANALPJ03}
	E     Acessou o módulo Todos > Usuário Canal do Contratante
	E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
	E     Acessou o usuário desejado
	E     Vinculou o Contrato integrado no painel "Contrato"
	E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário RN412"

	E     O Usuário logou no sistema Canal do Contratante
	E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
	E     Clicou no menu Ações > Solicitar Movimentação
	E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS RN412 e clicou no botão "SALVAR"  ${EXCLUSAORN412CANALPJ03[2]}
	E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
	E     Clicou o botão "ADICIONAR"
	E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 48 - POR PORTABILIDADE DE CARÊNCIA, "Perfil Solicitante" com as opções CONTRATANTE, CONTRATANTE PAGADOR e TITULAR, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
	E     Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
	E     Validou a apresentação do campo "Submotivo"
	E     Selecionou 1 (UM) Beneficiário TITULAR PJ, preencheu campos obrigatórios e clicou no botão "SALVAR"  @{EXCLUSAORN412CANALPJ03}
	E     Validou a apresentação da tela "Exclusão RN412", com o beneficiário na tabela "Exclusão de Beneficiários"

	E     Anexou um documento no painel "Documentos"

	E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
	E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E     Clicou no botão "SIM" da modal "Confirmação" com a mensagem "A data da exclusão será a partir da data da CIENCIA e APROVAÇÃO da operadora de plano de saúde, e possui caráter IRREVOGÁVEL, ou seja, NÃO SERÁ PERMITIDO O DIREITO DE ARREPENDIMENTO POSTERIOR. Deseja continuar?"
    E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a AGUARDANDO APROVAÇÃO
    
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência 
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" igual a RN412
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{EXCLUSAORN412CANALPJ03}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão" preenchida com a DATA/HORA ATUAL e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E     Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA"
    E     Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    E     Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    E     Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então  CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    E     Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    E     Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO  @{EXCLUSAORN412CANALPJ03}


Teste de Regressão 10 - EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 48 (CONTRATO PJ EMPRESARIAL)
    [Documentation]  EXCLUSÃO DE BENEFICIÁRIO RN412 CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO RN412 - MOTIVO 48 (CONTRATO PJ EMPRESARIAL)
    Dado  Usuário logou no sistema
	E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários  @{EXCLUSAORN412CANALPJ04}
	E     Acessou o módulo Todos > Usuário Canal do Contratante
	E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
	E     Acessou o usuário desejado
	E     Vinculou o Contrato integrado no painel "Contrato"
	E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário RN412"

	E     O Usuário logou no sistema Canal do Contratante
	E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
	E     Clicou no menu Ações > Solicitar Movimentação
	E     Selecionou o Contrato, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS RN412 e clicou no botão "SALVAR"  ${EXCLUSAORN412CANALPJ04[2]}
	E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
	E     Clicou o botão "ADICIONAR"
	E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 48 - POR PORTABILIDADE DE CARÊNCIA, "Perfil Solicitante" com as opções CONTRATANTE, CONTRATANTE PAGADOR e TITULAR, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
	E     Selecionou "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA
	E     Validou a apresentação do campo "Submotivo"
	E     Selecionou 1 (UM) Beneficiário TITULAR PJ, preencheu campos obrigatórios e clicou no botão "SALVAR"  @{EXCLUSAORN412CANALPJ04}
	E     Validou a apresentação da tela "Exclusão RN412", com o beneficiário na tabela "Exclusão de Beneficiários"

	E     Anexou um documento no painel "Documentos"

	E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"
	E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E     Clicou no botão "SIM" da modal "Confirmação" com a mensagem "A data da exclusão será a partir da data da CIENCIA e APROVAÇÃO da operadora de plano de saúde, e possui caráter IRREVOGÁVEL, ou seja, NÃO SERÁ PERMITIDO O DIREITO DE ARREPENDIMENTO POSTERIOR. Deseja continuar?"
    E     Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a AGUARDANDO APROVAÇÃO
    
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência 
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" igual a RN412
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{EXCLUSAORN412CANALPJ04}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão" preenchida com a DATA/HORA ATUAL e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E     Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA"
    E     Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    E     Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    E     Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então  CRM deve atualizar a tela de Conferência » ID Mov Cadastral, com a situação "Encerrada"
    E     Painel "Solicitação de Integração" com o registro "Integrada com Sucesso"
    E     Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO  @{EXCLUSAORN412CANALPJ04}