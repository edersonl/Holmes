*** Settings ***
Resource    ../../main.resource

Suite Setup      Instancia Variaveis    C06
Test Setup       Comum.Abrir Nav  
Test Teardown    Comum.Fechar Nav

*** Variables ***

**Test Cases***
Teste de Regressão 01 - EXCLUSAO BENEFICIÁRIOS CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41 (CONTRATO PF)
    [Documentation]  EXCLUSAO BENEFICIÁRIOS CANAL - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41 (CONTRATO PF)
    Dado  Usuário logou no sistema 
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Tipo de Contratação" igual a INDIVIDUAL FAMILIAR, com 2 ou mais Beneficiários      @{EXCLUSAOBENEFICIARIOCANALPF01}
    E     Editou o campo "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"    @{EXCLUSAOBENEFICIARIOCANALPF01}
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E     Clicou no botão "ADICIONAR"
    E     Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E     Validou a apresentação do campo "Submotivo"
    E     Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios e clicou no botão "SALVAR"      @{EXCLUSAOBENEFICIARIOCANALPF01}
    E     Validou a apresentação da mensagem de erro "A exclusão de um beneficiário Titular para contrato Pessoa Física caracteriza cancelamento de contrato e esta movimentação não é permitida via Canal do Contratante. Entre em contato com a operadora."
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"           @{EXCLUSAOBENEFICIARIOCANALPF01}
    E     Clicou no botão "ADICIONAR EM LOTE"
    E     Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E     Validou a apresentação do campo "Submotivo"
    E     Selecionou 1 (UM) Beneficiário TITULAR, clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios e clicou no botão "SALVAR"      @{EXCLUSAOBENEFICIARIOCANALPF01}
    E     Validou a apresentação da mensagem de erro "A exclusão de um beneficiário Titular para contrato Pessoa Física caracteriza cancelamento de contrato e esta movimentação não é permitida via Canal do Contratante. Entre em contato com a operadora."
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários na tabela "Exclusão de Beneficiários"         @{EXCLUSAOBENEFICIARIOCANALPF01}
    E     Clicou O Menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E     Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${EXCLUSAOBENEFICIARIOCANALPF01[1]}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte      @{EXCLUSAOBENEFICIARIOCANALPF01}
    E     Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E     Clicar na opção "APROVAR CONFERÊNCIA" do submenu dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E     Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA 
    Quando     Clicar no registro "Integração Solicitada"
    E     Clicar no botão "EFETUAR INTEGRAÇÃO"      ${EXCLUSAOBENEFICIARIOCANALPF01[1]}
    Então     CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E     Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual ATIVO        @{EXCLUSAOBENEFICIARIOCANALPF01}
    


Teste Regressão 02 - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 44 (CONTRATO PF)
    [Documentation]        INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 44 (CONTRATO PF)
    Dado  Usuário logou no sistema                                                                      
    E  Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Tipo de Contratação" igual a INDIVIDUAL FAMILIAR, com 2 ou mais Beneficiários       @{EXCLUSAOBENEFICIARIOCANALPF02}
    E  Editou o campo "Assumir data padrão na exclusão de Beneficiário" igual a SIM. NO DIA DA SOLICIAÇÃO.
    E  Acessou o módulo Todos > Usuário Canal do Contratante
    E  Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E  Acessou o usuário desejado
    E  Vinculou o Contrato integrado no painel "Contrato"
    E  Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E  O Usuário logou no sistema Canal do Contratante
    E  Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E  Clicou no menu Ações > Solicitar Movimentação
    E  Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"      @{EXCLUSAOBENEFICIARIOCANALPF02}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E  Clicou no botão "ADICIONAR"
    E  Selecionou "Motivo" 44 - ÓBITO
    E  Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E  Validou a apresentação dos campos "Submotivo", "Data de Óbito", "É necessário anexar a certidão de óbito"
    E  Selecionou 1 (UM) Beneficiário TITULAR, selecionou um arquivo com extensão (PDF, PNG, JPEG ou JPG), preencheu "Data de Óbito" igual a DATA DE HOJE - 1, preencheu campos obrigatórios e clicou no botão "SALVAR"    @{EXCLUSAOBENEFICIARIOCANALPF02}
    E  Validou a apresentação da mensagem de erro "A exclusão de um beneficiário Titular para contrato Pessoa Física caracteriza cancelamento de contrato e esta movimentação não é permitida via Canal do Contratante. Entre em contato com a operadora."
    #E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"          @{EXCLUSAOBENEFICIARIOCANALPF02}
    E  Clicou no botão "ADICIONAR EM LOTE"
    E  Selecionou "Motivo" 44 - ÓBITO
    E  Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E  Validou a apresentação dos campos "Submotivo", "Data de Óbito", "É necessário anexar a certidão de óbito"
    E  Selecionou 1 (UM) Beneficiário TITULAR, com "Data de Óbito" igual a DATA DE HOJE - 1, clicou no botão "ADICIONAR PESSOA"     @{EXCLUSAOBENEFICIARIOCANALPF02}
    E  Validou a apresentação de uma tabela com "Nome do Beneficiário que será excluido", com os campos "É necessário anexar a certidão de óbito", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E  Preencheu campos obrigatórios e clicou no botão "SALVAR"
    E  Validou a apresentação da mensagem de erro "A exclusão de um beneficiário Titular para contrato Pessoa Física caracteriza cancelamento de contrato e esta movimentação não é permitida via Canal do Contratante. Entre em contato com a operadora."
    E  Selecionou um arquivo com extensão (PDF, PNG, JPEG ou JPG), preencheu demais campos e clicou no botão "SALVAR"
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários na tabela "Exclusão de Beneficiários"       @{EXCLUSAOBENEFICIARIOCANALPF02}
    E  Clicou O Menu "ENCAMINHAR PARA APROVAÇÃO"
    E  Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR" 
    E  Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    E  Acessou o sistema CRM
    E  Acessou o módulo Conferência
    E  Clicou no menu "CONFERIR PROCESSOS"
    E  Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E  Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${EXCLUSAOBENEFICIARIOCANALPF02[1]}
    E  Clicou no botão "SIM" da modal de Confirmação
    E  Validou que o campo "Usuário Canal do Contratante" está preenchido
    E  Clicou na aba "Movimentação Cadastral"
    E  Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA           @{EXCLUSAOBENEFICIARIOCANALPF02}
    E  Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E  Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E  Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E  Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E  Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA", no painel "Documentos Conferência"
    E  Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    E  Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    E  Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    E  Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA
    Quando  Clicar no registro "Integração Solicitada"
    E  Clicar no botão "EFETUAR INTEGRAÇÃO"         ${EXCLUSAOBENEFICIARIOCANALPF02[1]}
    Então  CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E  Contrato os Beneficiários cadastrados na exclusão com a "Situação" igual a CANCELADO e com campo "Data de Exclusão" igual a data atual


Teste Regressão 03 - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41 (CONTRATO CAEPF ADESÃO)
    [Documentation]         INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41 (CONTRATO CAEPF ADESÃO)
    
    Dado  Usuário logou no sistema
    E  Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com 2 ou mais Beneficiários       @{EXCLUSAOBENEFIARIOCAEPF01}
    E  Editou o campo "Assumir data padrão na exclusão de Beneficiário" igual a SIM. NO DIA DA SOLICIAÇÃO.
    E  Acessou o módulo Todos > Usuário Canal do Contratante
    E  Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E  Acessou o usuário desejado
    E  Vinculou o Contrato integrado no painel "Contrato"
    E  Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E  O Usuário logou no sistema Canal do Contratante
    E  Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E  Clicou no menu Ações > Solicitar Movimentação
    E  Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"        @{EXCLUSAOBENEFIARIOCAEPF01}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E  Clicou no botão "ADICIONAR"
    E  Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E  Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E  Validou a apresentação do campo "Submotivo"
    E  Selecionou 1 (UM) Beneficiário TITULAR CAEPF, preencheu campos obrigatórios e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOCAEPF01}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"           @{EXCLUSAOBENEFIARIOCAEPF01}
    E  Clicou no botão "ADICIONAR EM LOTE"
    E  Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E  Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E  Validou a apresentação do campo "Submotivo"
    E  Selecionou 1 (UM) Beneficiário TITULAR CAEPF, clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios e clicou no botão "SALVAR"       @{EXCLUSAOBENEFIARIOCAEPF01}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"  @{EXCLUSAOBENEFIARIOCAEPF01}    
    E  Clicou O Menu "ENCAMINHAR PARA APROVAÇÃO"
    E  Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR" 
    E  Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    E  Acessou o sistema CRM
    E  Acessou o módulo Conferência
    E  Clicou no menu "CONFERIR PROCESSOS"
    E  Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E  Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${EXCLUSAOBENEFICIARIOCANALPF02[1]}
    E  Clicou no botão "SIM" da modal de Confirmação
    E  Validou que o campo "Usuário Canal do Contratante" está preenchido
    E  Clicou na aba "Movimentação Cadastral"
    E  Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel sem Documento anexado     @{EXCLUSAOBENEFICIARIOCANALPF02}
    E  Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E  Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E  Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E  Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E  Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA
    Quando  Clicar no registro "Integração Solicitada"
    E  Clicar no botão "EFETUAR INTEGRAÇÃO"         ${EXCLUSAOBENEFIARIOCAEPF01[1]}
    Então  CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E  Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO    @{EXCLUSAOBENEFICIARIOCANALPF02}

Teste Regressão 04 - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42 (CONTRATO CAEPF ADESÃO)
    [Documentation]         INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42 (CONTRATO CAEPF ADESÃO)
    Dado  Usuário logou no sistema
    E  Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com 2 ou mais Beneficiários       @{EXCLUSAOBENEFIARIOCAEPF02}
    E  Editou o campo "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.
    E  Acessou o módulo Todos > Usuário Canal do Contratante
    E  Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E  Acessou o usuário desejado
    E  Vinculou o Contrato integrado no painel "Contrato"
    E  Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E  O Usuário logou no sistema Canal do Contratante
    E  Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E  Clicou no menu Ações > Solicitar Movimentação
    E  Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"        @{EXCLUSAOBENEFIARIOCAEPF02}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E  Clicou no botão "ADICIONAR"
    E  Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E  Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E  Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"
    E  Selecionou 1 (UM) Beneficiário TITULAR CAEPF, preencheu campos obrigatórios e clicou no botão "SALVAR"      @{EXCLUSAOBENEFIARIOCAEPF02}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"           @{EXCLUSAOBENEFIARIOCAEPF02}
    E  Clicou no botão "ADICIONAR EM LOTE"
    E  Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E  Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E  Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"
    E  Selecionou 1 (UM) Beneficiário TITULAR CAEPF, clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios e clicou no botão "SALVAR"       @{EXCLUSAOBENEFIARIOCAEPF02}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"         @{EXCLUSAOBENEFIARIOCAEPF02}
    E  Clicou O Menu "ENCAMINHAR PARA APROVAÇÃO"
    E  Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"  
    E  Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    E  Acessou o sistema CRM
    E  Acessou o módulo Conferência
    E  Clicou no menu "CONFERIR PROCESSOS"
    E  Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E  Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${EXCLUSAOBENEFIARIOCAEPF02[1]}
    E  Clicou no botão "SIM" da modal de Confirmação
    E  Validou que o campo "Usuário Canal do Contratante" está preenchido
    E  Clicou na aba "Movimentação Cadastral"
    E  Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel sem Documento anexado   @{EXCLUSAOBENEFICIARIOCANALPF02}
    E  Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E  Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E  Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E  Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E  Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    E  Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA
    Quando  Clicar no registro "Integração Solicitada"
    E  Clicar no botão "EFETUAR INTEGRAÇÃO"         ${EXCLUSAOBENEFIARIOCAEPF02[1]}
    Então  CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E  No Contrato Os Beneficiários Cadastrados Na Exclusão Com A "Situação" Igual A ATIVO E Com Campo "Data De Exclusão" Igual A Primeiro Dia Do Mês Seguinte


Teste Regressão 05 - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 44 (CONTRATO CAEPF ADESÃO)
    [Documentation]         INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 44 (CONTRATO CAEPF ADESÃO)		
    Dado  Usuário logou no sistema
    E  Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com 2 ou mais Beneficiários        @{EXCLUSAOBENEFIARIOCAEPF04}
    E  Editou o campo "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.
    E  Acessou o módulo Todos > Usuário Canal do Contratante
    E  Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E  Acessou o usuário desejado
    E  Vinculou o Contrato integrado no painel "Contrato"
    E  Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E  O Usuário logou no sistema Canal do Contratante
    E  Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E  Clicou no menu Ações > Solicitar Movimentação
    E  Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"        @{EXCLUSAOBENEFIARIOCAEPF04}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E  Clicou no botão "ADICIONAR"
    E  Selecionou "Motivo" 44 - ÓBITO
    E  Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR" 
    E  Validou a apresentação dos campos "Submotivo", "Data de Óbito", "É necessário anexar a certidão de óbito"
    E  Selecionou 1 (UM) Beneficiário TITULAR CAEPF, selecionou um arquivo com extensão (PDF, PNG, JPEG ou JPG), preencheu "Data de Óbito" igual a DATA DE HOJE - 1, preencheu campos obrigatórios e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOCAEPF04}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"          @{EXCLUSAOBENEFIARIOCAEPF04}
    E  Clicou no botão "ADICIONAR EM LOTE"
    E  Selecionou "Motivo" 44 - ÓBITO
    E  Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E  Validou a apresentação dos campos "Submotivo", "Data de Óbito", "É necessário anexar a certidão de óbito"
    E  Selecionou 1 (UM) Beneficiário TITULAR CAEPF, clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios Data Obtio e documento e clicou no botão "SALVAR"          @{EXCLUSAOBENEFIARIOCAEPF04}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"   @{EXCLUSAOBENEFIARIOCAEPF04}
    E  Clicou O Menu "ENCAMINHAR PARA APROVAÇÃO"
    E  Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"  
    E  Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    E  Acessou o sistema CRM
    E  Acessou o módulo Conferência
    E  Clicou no menu "CONFERIR PROCESSOS"
    E  Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E  Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${EXCLUSAOBENEFIARIOCAEPF04[1]}
    E  Clicou no botão "SIM" da modal de Confirmação
    E  Validou que o campo "Usuário Canal do Contratante" está preenchido
    E  Clicou na aba "Movimentação Cadastral"
    E  Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA           @{EXCLUSAOBENEFICIARIOCANALPF02}
    E  Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E  Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E  Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E  Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E  Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA", no painel "Documentos Conferência"
    E  Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    E  Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    E  Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    E  Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA
    Quando  Clicar no registro "Integração Solicitada"
    E  Clicar no botão "EFETUAR INTEGRAÇÃO"         ${EXCLUSAOBENEFIARIOCAEPF04[1]}
    E  No Contrato Os Beneficiários Cadastrados Na Exclusão Com A "Situação" Igual A ATIVO E Com Campo "Data De Exclusão" Igual A Primeiro Dia Do Mês Seguinte


Teste Regressão 06 - INTEGRAR MANUALMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41 (CONTRATO CAEPF EMPRESARIAL)
    [Documentation]         INTEGRAR MANUALMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41 (CONTRATO CAEPF EMPRESARIAL)		
    
    Dado  Usuário logou no sistema
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, com 2 ou mais Beneficiários  @{EXCLUSAOBENEFIARIOCAEPF03}
    E     Editou os campos "Integração automática" sem registros e "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOCAEPF03}
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E     Clicou no botão "ADICIONAR"
    E     Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E     Validou a apresentação do campo "Submotivo"
    E     Selecionou 1 (UM) Beneficiário TITULAR CAEPF, preencheu campos obrigatórios e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOCAEPF03}
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"          @{EXCLUSAOBENEFIARIOCAEPF03}
    E     Clicou no botão "ADICIONAR EM LOTE"
    E     Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E     Validou a apresentação do campo "Submotivo"
    E     Selecionou 1 (UM) Beneficiário TITULAR CAEPF, clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios e clicou no botão "SALVAR"      @{EXCLUSAOBENEFIARIOCAEPF03}
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"    @{EXCLUSAOBENEFIARIOCAEPF03}
    E     Clicou O Menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E     Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${EXCLUSAOBENEFIARIOCAEPF03[1]}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel sem Documento anexado    @{EXCLUSAOBENEFIARIOCAEPF03}
    E     Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E     Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E     Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E     Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA
    Quando  Clicar no registro "Integração Solicitada"
    E      Clicar no botão "EFETUAR INTEGRAÇÃO"         ${EXCLUSAOBENEFIARIOCAEPF03[1]}
    Então  CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E   No Contrato Os Beneficiários Cadastrados Na Exclusão Com A "Situação" Igual A ATIVO E Com Campo "Data De Exclusão" Igual A Primeiro Dia Do Mês Seguinte

    

Teste Regressão 07 - INTEGRAR MANUALMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42, SEM CONTRATO INATIVO (CONTRATO CAEPF EMPRESARIAL)
    [Documentation]         INTEGRAR MANUALMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42, SEM CONTRATO INATIVO (CONTRATO CAEPF EMPRESARIAL)	
    
    Dado  Usuário logou no sistema
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, com 2 ou mais Beneficiários   @{EXCLUSAOBENEFIARIOCAEPF05}    
    E     Editou os campos "Integração automática" sem registros e "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOCAEPF05}
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E     Clicou no botão "ADICIONAR"
    E     Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E     Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"
    E     Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO     @{EXCLUSAOBENEFIARIOCAEPF05}   
    E     Validou a apresentação do campo "Situação Plano Inativo" igual a NÃO POSSUI DIREITO DA CONTINUIDADE DO PLANO
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"           @{EXCLUSAOBENEFIARIOCAEPF05}
    E     Clicou no botão "ADICIONAR EM LOTE"
    E     Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E     Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"
    E     Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO clicou em ADICIONAR PESSOA E SALVAR   @{EXCLUSAOBENEFIARIOCAEPF05}
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"    @{EXCLUSAOBENEFIARIOCAEPF05}
    E     Clicou O Menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E     Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${EXCLUSAOBENEFIARIOCAEPF05[1]}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel sem Documento anexado    @{EXCLUSAOBENEFIARIOCAEPF05}
    E     Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E     Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E     Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E     Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA
    Quando  Clicar no registro "Integração Solicitada"
    E      Clicar no botão "EFETUAR INTEGRAÇÃO"         ${EXCLUSAOBENEFIARIOCAEPF05[1]}
    Então  CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E    No Contrato Os Beneficiários Cadastrados Na Exclusão Com A "Situação" Igual A ATIVO E Com Campo "Data De Exclusão" Igual A Primeiro Dia Do Mês Seguinte


Teste Regressão 08 - INTEGRAR MANUALMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42, COM CONTRATO INATIVO (CONTRATO CAEPF EMPRESARIAL)	
    [Documentation]        INTEGRAR MANUALMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42, COM CONTRATO INATIVO (CONTRATO CAEPF EMPRESARIAL)	
    
    Dado  Usuário logou no sistema
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, com 2 ou mais Beneficiários   @{EXCLUSAOBENEFIARIOCAEPF06} 
    E     Editou os campos "Integração automática" sem registros e "Assumir data padrão na exclusão de Beneficiário" igual a SIM. NO DIA DA SOLICIAÇÃO.
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOCAEPF06}
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E     Clicou no botão "ADICIONAR"
    E     Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E     Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"
    E     Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos "Submotivo", "As carteirinhas foram devolvidas?", telefone, email, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM      @{EXCLUSAOBENEFIARIOCAEPF06}
    E     Validou a apresentação dos campos "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?","Motivos da extinção do Contrato de Trabalho"
    E     Preencheu os campos "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA
    E     Validou a apresentação dos campos "Situação Plano Inativo" igual a POSSUI DIREITO DA CONTINUIDADE DO PLANO, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?"
    E     Preencheu o campo "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM
    E     Validou a apresentação dos campos "Data de início de vigência no plano inativo" preenchido e bloqueado, painel "Insira abaixo o endereço atualizado do beneficiário titular" com campos de endereço, painel "Opção de Continuidade do Plano Inativo" com os campos "Tempo de contribuição? (meses)" habilitado e preenchido com o valor 0, "Dependentes que continuarão no plano" titular bloqueado e dependentes habilitados para seleção, "Custo total mensal" preenchido
    E     Preencheu os campos de endereço, "Tempo de contribuição? (meses)" igual a 120, selecionou um dependente, clicou no botão "SALVAR"         @{EXCLUSAOBENEFIARIOCAEPF06}
    E     Clicou no botão "OK" da modal de Confirmação com a mensagem "É necessário anexar documento comprobatório de contribuição excedente ao indicado. Consideramos o tempo vinculado ao plano da Unimed, porém ao anexar o documento este poderá ser revisto."
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"       @{EXCLUSAOBENEFIARIOCAEPF06}
    E     Clicou no botão "ADICIONAR EM LOTE"
    E     Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E     Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos "Submotivo", "As carteirinhas foram devolvidas?", telefone, email, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM 
    E     Validou a apresentação dos campos "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?","Motivos da extinção do Contrato de Trabalho"
    E     Preencheu os campos "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA
    E     Validou a apresentação dos campos "Situação Plano Inativo" igual a POSSUI DIREITO DA CONTINUIDADE DO PLANO, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?", "Data de início de vigência no plano inativo" vazio
    E     Preencheu o campo "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM
    E     Validou a preenchidmento do campo "Data de início de vigência no plano inativo" preenchido e bloqueado e clicou no botão "ADICIONAR PESSOA"
    E     Validou a apresentação de uma tabela com "Nome do Beneficiário que será excluido", com os campos "Opção de Continuidade do Plano Inativo", "Tempo de contribuição? (meses)" habilitado e preenchido com o valor 0, "Dependentes que continuarão no plano" titular bloqueado e dependentes habilitados para seleção, , "Custo total mensal" preenchido, "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", campos de endereço, os botões "SALVAR" e "CANCELAR"
    E     Preencheu os campos "Tempo de contribuição? (meses)" igual a 120, selecionou um dependente, "As carteirinhas foram devolvidas?" igual a NÃO, endereço e clicou no botão "SALVAR"
    E     Clicou no botão "OK" da modal de Confirmação com a mensagem "É necessário anexar documento comprobatório de contribuição excedente ao indicado. Consideramos o tempo vinculado ao plano da Unimed, porém ao anexar o documento este poderá ser revisto."
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"      @{EXCLUSAOBENEFIARIOCAEPF06}
    E     Clicou O Menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E     Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${EXCLUSAOBENEFIARIOCAEPF06[1]}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E   Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel sem Documento anexado        @{EXCLUSAOBENEFIARIOCAEPF06}
    E     Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E     Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E     Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E     Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA
    Quando  Clicar no registro "Integração Solicitada"
    E      Clicar no botão "EFETUAR INTEGRAÇÃO"         ${EXCLUSAOBENEFIARIOCAEPF06[1]}
    Então  CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E      Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO        @{EXCLUSAOBENEFIARIOCAEPF06}


Teste Regressão 09 - INTEGRAR MANUALMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 44 (CONTRATO CAEPF EMPRESARIAL)
    [Documentation]             INTEGRAR MANUALMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 44 (CONTRATO CAEPF EMPRESARIAL)
    Dado  Usuário logou no sistema
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, com 2 ou mais Beneficiários   @{EXCLUSAOBENEFIARIOCAEPF07}    
    E     Editou os campos "Integração automática" sem registros e "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOCAEPF07}
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E     Clicou no botão "ADICIONAR"
    E     Selecionou "Motivo" 44 - ÓBITO
    E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E     Validou a apresentação dos campos "Submotivo", "Data de Óbito", "É necessário anexar a certidão de óbito"
    E     Selecionou 1 (UM) Beneficiário TITULAR CAEPF, selecionou um arquivo com extensão (PDF, PNG, JPEG ou JPG), preencheu "Data de Óbito" igual a DATA DE HOJE - 1, preencheu campos obrigatórios e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOCAEPF07}
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"         @{EXCLUSAOBENEFIARIOCAEPF07}
    E     Clicou no botão "ADICIONAR EM LOTE"
    E     Selecionou "Motivo" 44 - ÓBITO
    E     Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E     Validou a apresentação dos campos "Submotivo", "Data de Óbito", "É necessário anexar a certidão de óbito"
    E     Selecionou 1 (UM) Beneficiário TITULAR CAEPF, clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios Data Obtio e documento e clicou no botão "SALVAR"     @{EXCLUSAOBENEFIARIOCAEPF07}
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"    @{EXCLUSAOBENEFIARIOCAEPF07}
    E     Clicou O Menu "ENCAMINHAR PARA APROVAÇÃO"
    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E     Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${EXCLUSAOBENEFIARIOCAEPF07[1]}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA          @{EXCLUSAOBENEFIARIOCAEPF07}
    E     Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E     Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E     Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA", no painel "Documentos Conferência"
    E     Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    E     Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    E     Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    E     Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA
    Quando  Clicar no registro "Integração Solicitada"
    E      Clicar no botão "EFETUAR INTEGRAÇÃO"         ${EXCLUSAOBENEFIARIOCAEPF07[1]}
    Então  CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E      No Contrato Os Beneficiários Cadastrados Na Exclusão Com A "Situação" Igual A ATIVO E Com Campo "Data De Exclusão" Igual A Primeiro Dia Do Mês Seguinte



Teste Regressão 10 - INTEGRAR AUTOMATICAMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVOS 41 E 42 SEM CONTRATO INATIVO (CONTRATO CAEPF EMPRESARIAL)
    [Documentation]             INTEGRAR AUTOMATICAMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVOS 41 E 42 SEM CONTRATO INATIVO (CONTRATO CAEPF EMPRESARIAL)		
    
    Dado  Usuário logou no sistema
    E   Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, com 2 ou mais Beneficiários   @{EXCLUSAOBENEFIARIOCAEPF08} 
    E   Editou os campos "Integração automática" igual a EXCLUSÃO DE BENEFICIÁRIOS e "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.
    E   Acessou o módulo Todos > Usuário Canal do Contratante
    E   Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E   Acessou o usuário desejado
    E   Vinculou o Contrato integrado no painel "Contrato"
    E   Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E   Ativou os agendadores "Conferência - Realizar conferência automática" e "Solicitação de Integração Automática"
    E   O Usuário logou no sistema Canal do Contratante
    E   Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E   Clicou no menu Ações > Solicitar Movimentação
    E   Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOCAEPF08}
    E   Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E   Clicou no botão "ADICIONAR"
    E   Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E   Validou a apresentação do campo "Submotivo"
    E  Selecionou 1 (UM) Beneficiário TITULAR CAEPF, preencheu campos obrigatórios e clicou no botão "SALVAR"        @{EXCLUSAOBENEFIARIOCAEPF08}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"      @{EXCLUSAOBENEFIARIOCAEPF08}
    E  Clicou no botão "ADICIONAR"
    E  Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E  Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"
    E  Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO   @{EXCLUSAOBENEFIARIOCAEPF08}   
    E  Validou a apresentação do campo "Situação Plano Inativo" igual a NÃO POSSUI DIREITO DA CONTINUIDADE DO PLANO
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"     @{EXCLUSAOBENEFIARIOCAEPF08}
    Quando  Clicar menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA" Canal Contratante
    E   Validar a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO INTEGRAÇÃO AUTOMÁTICA
    E   Após executar os dois agendadores
    Então  Canal do Contratante deve atualizar a  tela "Protocolo" id gerado automaticamente, com "Situação" igual a INTEGRADA AUTOMÁTICAMENTE
    E   Contrato (CRM) os Beneficiários cadastrados na exclusão com a "Situação" igual a ATIVO e com campo "Data de Exclusão" igual a primeiro dia do mês seguinte


Teste Regressão 11 - INTEGRAR AUTOMATICAMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIOS E GERAR OUTRA MANUALMENTE (CONTRATO CAEPF EMPRESARIAL)	
    [Documentation]         INTEGRAR AUTOMATICAMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIOS E GERAR OUTRA MANUALMENTE (CONTRATO CAEPF EMPRESARIAL)
    
    Dado  Usuário logou no sistema
    E  Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL, com 4 Titulares   @{EXCLUSAOBENEFIARIOCAEPF09}
    E  Editou os campos "Integração automática" igual a EXCLUSÃO DE BENEFICIÁRIOS e "Assumir data padrão na exclusão de Beneficiário" igual a SIM. NO DIA DA SOLICIAÇÃO.
    E  Acessou o módulo Todos > Usuário Canal do Contratante
    E  Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E  Acessou o usuário desejado
    E  Vinculou o Contrato integrado no painel "Contrato"
    E  Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E  Ativou os agendadores "Conferência - Realizar conferência automática" e "Solicitação de Integração Automática"
    E  O Usuário logou no sistema Canal do Contratante
    E  Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E  Clicou no menu Ações > Solicitar Movimentação
    E  Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOCAEPF09}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E  Clicou no botão "ADICIONAR"
    ### MOTIVO 42 COM SIM
    E  Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E  Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"
    E  Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos "Submotivo", "As carteirinhas foram devolvidas?", telefone, email, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM   @{EXCLUSAOBENEFIARIOCAEPF09}
    E  Validou a apresentação dos campos "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?","Motivos da extinção do Contrato de Trabalho"
    E  Preencheu os campos "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA
    E  Validou a apresentação dos campos "Situação Plano Inativo" igual a POSSUI DIREITO DA CONTINUIDADE DO PLANO, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?"
    E  Preencheu o campo "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM
    E  Validou a apresentação dos campos "Data de início de vigência no plano inativo" preenchido e bloqueado, painel "Insira abaixo o endereço atualizado do beneficiário titular" com campos de endereço, painel "Opção de Continuidade do Plano Inativo" com os campos "Tempo de contribuição? (meses)" habilitado e preenchido com o valor 0, "Dependentes que continuarão no plano" titular bloqueado e dependentes habilitados para seleção, "Custo total mensal" preenchido
    E  Preencheu os campos de endereço, "Tempo de contribuição? (meses)" igual a 120, selecionou um dependente, clicou no botão "SALVAR"
    E  Clicou no botão "OK" da modal de Confirmação com a mensagem "É necessário anexar documento comprobatório de contribuição excedente ao indicado. Consideramos o tempo vinculado ao plano da Unimed, porém ao anexar o documento este poderá ser revisto."
    ## MOTIVO 44 OBITO
    E  Clicou no botão "ADICIONAR"
    E  Selecionou "Motivo" 44 - ÓBITO
    E  Validou a apresentação dos campos "Submotivo", "Data de Óbito", "É necessário anexar a certidão de óbito"
    E  Selecionou 2 (Segundo) Beneficiário TITULAR CAEPF, selecionou um arquivo com extensão (PDF, PNG, JPEG ou JPG), preencheu "Data de Óbito" igual a DATA DE HOJE - 1, preencheu campos obrigatórios e clicou no botão "SALVAR"  @{EXCLUSAOBENEFIARIOCAEPF09}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"   @{EXCLUSAOBENEFIARIOCAEPF09}
    ## MOTIVO 41 OBITO
    E  Clicou no botão "ADICIONAR"
    E  Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E  Validou a apresentação do campo "Submotivo"
    E  Selecionou 1 (UM) Beneficiário TITULAR CAEPF, preencheu campos obrigatórios e clicou no botão "SALVAR"      @{EXCLUSAOBENEFIARIOCAEPF09}
    ## MOTIVO 42 COM NÃO
    E  Clicou no botão "ADICIONAR"
    E  Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E  Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"
    E  Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO     @{EXCLUSAOBENEFIARIOCAEPF09}   
    E  Validou a apresentação do campo "Situação Plano Inativo" igual a NÃO POSSUI DIREITO DA CONTINUIDADE DO PLANO
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com a mensagem "Atenção!   Este contrato permite integração automática, porém há beneficiários nesta movimentação que não se enquadram nos critérios e, após encaminhado o protocolo, serão alocados em uma nova movimentação para conferência.", "Situação" igual a EM ANDAMENTO, com os beneficiários na tabela "Exclusão de Beneficiários" e com o menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA"
    E  Clicar menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA" Canal Contratante
    E  Validou a atualização da tela "Protocolo" id gerado automaticamente, com a mensagem de erro “Não é possível realizar integração automática para os beneficiários que estão sendo excluídos por óbito ou por desligamento da empresa com direito ao inativo, e por causa disso foi criada a movimentação NUMERODOPROTOCOLO.", com "Situação" igual a AGUARDANDO INTEGRAÇÃO AUTOMÁTICA, com painel "Exclusão de Beneficiários" com os beneficiários dos Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO e 42 - DESLIGAMENTO DA EMPRESA e "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO
    E  Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a INTEGRADA AUTOMÁTICAMENTE 
    E  Clicou no link "NUMERODOPROTOCOLO"
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO com os beneficiários dos Motivo" 42 - DESLIGAMENTO DA EMPRESA "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM, "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA, "Situação Plano Inativo" igual a POSSUI DIREITO DA CONTINUIDADE DO PLANO, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM e 44 - ÓBITO
    E  Acessou o sistema CRM
    E  Acessou o módulo Conferência
    E  Clicou no menu "CONFERIR PROCESSOS"
    E  Clicou no botão "Conferir" da Movimentação Cadastral de Exclusão de Beneficiários
    E  Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E  Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E  Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E  Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E  Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA
    E  Clicou no registro do painel "Solicitações de Integração"
    Quando  Clicar no botão "EFETUAR INTEGRAÇÃO"         ${EXCLUSAOBENEFIARIOCAEPF09[1]}
    Então  CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E  Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO        @{EXCLUSAOBENEFIARIOCAEPF09}


Teste Regressão 12 - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41 (CONTRATO PJ ADESÃO)	
    [Documentation]      INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41 (CONTRATO PJ ADESÃO)
    Dado  Usuário logou no sistema
    E  Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), mais de 2 Beneficiários       @{EXCLUSAOBENEFIARIOPJ12}
    E  Editou o campo "Assumir data padrão na exclusão de Beneficiário" igual a SIM. NO DIA DA SOLICIAÇÃO.
    E  Acessou o módulo Todos > Usuário Canal do Contratante
    E  Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E  Acessou o usuário desejado
    E  Vinculou o Contrato integrado no painel "Contrato"
    E  Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E  O Usuário logou no sistema Canal do Contratante
    E  Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E  Clicou no menu Ações > Solicitar Movimentação
    E  Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOPJ12}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E  Clicou no botão "ADICIONAR"
    E  Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E  Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E  Validou a apresentação do campo "Submotivo"
    E  Selecionou 1 (UM) Beneficiário TITULAR PJ, preencheu campos obrigatórios e clicou no botão "SALVAR"     @{EXCLUSAOBENEFIARIOPJ12}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"      @{EXCLUSAOBENEFIARIOPJ12}
    E  Clicou no botão "ADICIONAR EM LOTE"
    E  Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E  Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E  Validou a apresentação do campo "Submotivo"
    E  Selecionou 1 (UM) Beneficiário TITULAR PJ, clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios e clicou no botão "SALVAR"     @{EXCLUSAOBENEFIARIOPJ12}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"  @{EXCLUSAOBENEFIARIOPJ12}
    E  Clicou O Menu "ENCAMINHAR PARA APROVAÇÃO"
    E  Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E  Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    E  Acessou o sistema CRM
    E  Acessou o módulo Conferência
    E  Clicou no menu "CONFERIR PROCESSOS"
    E  Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E  Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${EXCLUSAOBENEFIARIOPJ12[1]}
    E  Clicou no botão "SIM" da modal de Confirmação
    E  Validou que o campo "Usuário Canal do Contratante" está preenchido
    E  Clicou na aba "Movimentação Cadastral"
    E  Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel sem Documento anexado    @{EXCLUSAOBENEFIARIOPJ12}
    E  Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E  Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E  Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E  Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E  Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA
    Quando  Clicar no registro "Integração Solicitada"
    E   Clicar no botão "EFETUAR INTEGRAÇÃO"         ${EXCLUSAOBENEFIARIOPJ12[1]}
    Então   CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E  Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO         @{EXCLUSAOBENEFIARIOPJ12}


Teste Regressão 13 - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42 (CONTRATO PJ ADESÃO)
    [Documentation]         INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42 (CONTRATO PJ ADESÃO)	
    Dado  Usuário logou no sistema
    E   Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), mais de 2 Beneficiários      @{EXCLUSAOBENEFIARIOPJ13}
    E   Editou o campo "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.
    E   Acessou o módulo Todos > Usuário Canal do Contratante
    E   Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E   Acessou o usuário desejado
    E   Vinculou o Contrato integrado no painel "Contrato"
    E   Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E   O Usuário logou no sistema Canal do Contratante
    E   Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E   Clicou no menu Ações > Solicitar Movimentação
    E   Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOPJ13}
    E   Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E   Clicou no botão "ADICIONAR"
    E   Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E   Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E   Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"
    E   Selecionou 1 (UM) Beneficiário TITULAR PJ, preencheu campos obrigatórios e clicou no botão "SALVAR"      @{EXCLUSAOBENEFIARIOPJ13}
    E   Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"
    E   Clicou no botão "ADICIONAR EM LOTE"
    E   Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E   Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E   Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"
    E   Selecionou 1 (UM) Beneficiário TITULAR PJ, clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios e clicou no botão "SALVAR"     @{EXCLUSAOBENEFIARIOPJ13}
    E   Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"     @{EXCLUSAOBENEFIARIOPJ13}
    E   Clicou O Menu "ENCAMINHAR PARA APROVAÇÃO"
    E   Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E   Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    E   Acessou o sistema CRM
    E   Acessou o módulo Conferência
    E   Clicou no menu "CONFERIR PROCESSOS"
    E   Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E   Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${EXCLUSAOBENEFIARIOPJ13[1]}
    E   Clicou no botão "SIM" da modal de Confirmação
    E   Validou que o campo "Usuário Canal do Contratante" está preenchido
    E   Clicou na aba "Movimentação Cadastral"
    E   Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel sem Documento anexado     @{EXCLUSAOBENEFIARIOPJ13}
    E   Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E   Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E   Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E   Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E   Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA
    Quando  Clicar no registro "Integração Solicitada"
    E   Clicar no botão "EFETUAR INTEGRAÇÃO"         ${EXCLUSAOBENEFIARIOPJ13[1]}
    Então  CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E   Contrato (CRM) os Beneficiários cadastrados na exclusão com a "Situação" igual a ATIVO e com campo "Data de Exclusão" igual a primeiro dia do mês seguinte


Teste Regressão 14 - INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 44 (CONTRATO PJ ADESÃO)
    [Documentation]         INTEGRAR MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 44 (CONTRATO PJ ADESÃO)						
    Dado  Usuário logou no sistema
    E    Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), mais de 2 Beneficiários       @{EXCLUSAOBENEFIARIOPJ14}
    E    Editou o campo "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.
    E    Acessou o módulo Todos > Usuário Canal do Contratante
    E    Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E    Acessou o usuário desejado
    E    Vinculou o Contrato integrado no painel "Contrato"
    E    Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E    O Usuário logou no sistema Canal do Contratante
    E    Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E    Clicou no menu Ações > Solicitar Movimentação
    E    Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOPJ14}
    E    Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E    Clicou no botão "ADICIONAR"
    E    Selecionou "Motivo" 44 - ÓBITO
    E    Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E    Validou a apresentação dos campos "Submotivo", "Data de Óbito", "É necessário anexar a certidão de óbito"
    E    Selecionou 1 (UM) Beneficiário TITULAR CAEPF, selecionou um arquivo com extensão (PDF, PNG, JPEG ou JPG), preencheu "Data de Óbito" igual a DATA DE HOJE - 1, preencheu campos obrigatórios e clicou no botão "SALVAR"   @{EXCLUSAOBENEFIARIOPJ14}
    E    Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"         @{EXCLUSAOBENEFIARIOPJ14}
    E    Clicou no botão "ADICIONAR EM LOTE"
    E    Selecionou "Motivo" 44 - ÓBITO
    E    Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E    Validou a apresentação dos campos "Submotivo", "Data de Óbito", "É necessário anexar a certidão de óbito"
    E    Selecionou 1 (UM) Beneficiário TITULAR CAEPF, clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios Data Obtio e documento e clicou no botão "SALVAR"     @{EXCLUSAOBENEFIARIOPJ14}
    E    Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"    @{EXCLUSAOBENEFIARIOPJ14}
    E    Clicou O Menu "ENCAMINHAR PARA APROVAÇÃO"
    E    Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E    Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    E    Acessou o sistema CRM
    E    Acessou o módulo Conferência
    E    Clicou no menu "CONFERIR PROCESSOS"
    E    Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E    Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${EXCLUSAOBENEFIARIOPJ14[1]}
    E    Clicou no botão "SIM" da modal de Confirmação
    E    Validou que o campo "Usuário Canal do Contratante" está preenchido
    E    Clicou na aba "Movimentação Cadastral"
    
    E    Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA          @{EXCLUSAOBENEFIARIOPJ14}
    E    Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E    Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E    Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E    Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA", no painel "Documentos Conferência"
    E    Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    E    Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    E    Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO

    E    Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA
    Quando  Clicar no registro "Integração Solicitada"
    E    Clicar no botão "EFETUAR INTEGRAÇÃO"         ${EXCLUSAOBENEFIARIOPJ14[1]}
    Então  CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E    Contrato (CRM) os Beneficiários cadastrados na exclusão com a "Situação" igual a ATIVO e com campo "Data de Exclusão" igual a primeiro dia do mês seguinte


Teste Regressão 15 - INTEGRAR MANUALMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41 (CONTRATO PJ EMPRESARIAL)
    [Documentation]         INTEGRAR MANUALMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 41 (CONTRATO PJ EMPRESARIAL)		
    Dado  Usuário logou no sistema
    E   Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com mais de 1 Beneficiários      @{EXCLUSAOBENEFIARIOPJ15}
    E   Editou os campos "Integração automática" sem registros e "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.
    E   Acessou o módulo Todos > Usuário Canal do Contratante
    E   Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E   Acessou o usuário desejado
    E   Vinculou o Contrato integrado no painel "Contrato"
    E   Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E   O Usuário logou no sistema Canal do Contratante
    E   Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E   Clicou no menu Ações > Solicitar Movimentação
    E   Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOPJ15}
    E   Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E   Clicou no botão "ADICIONAR"
    E   Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E   Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E   Validou a apresentação do campo "Submotivo"
    E   Selecionou 1 (UM) Beneficiário TITULAR PJ, preencheu campos obrigatórios e clicou no botão "SALVAR"      @{EXCLUSAOBENEFIARIOPJ15}
    E   Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"
    E   Clicou no botão "ADICIONAR EM LOTE"
    E   Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E   Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E   Validou a apresentação do campo "Submotivo"
    E   Selecionou 1 (UM) Beneficiário TITULAR PJ, clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOPJ15}
    E   Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"   @{EXCLUSAOBENEFIARIOPJ15}
    E   Clicou O Menu "ENCAMINHAR PARA APROVAÇÃO"
    E   Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E   Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    E   Acessou o sistema CRM
    E   Acessou o módulo Conferência
    E   Clicou no menu "CONFERIR PROCESSOS"
    E   Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E   Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${EXCLUSAOBENEFIARIOPJ15[1]}
    E   Clicou no botão "SIM" da modal de Confirmação
    E   Validou que o campo "Usuário Canal do Contratante" está preenchido
    E   Clicou na aba "Movimentação Cadastral"
    E   Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel sem Documento anexado    @{EXCLUSAOBENEFIARIOPJ15}
    E   Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E   Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E   Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E   Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E   Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA
    Quando  Clicar no registro "Integração Solicitada"
    E   Clicar no botão "EFETUAR INTEGRAÇÃO"         ${EXCLUSAOBENEFIARIOPJ15[1]}
    Então  CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E   Contrato (CRM) os Beneficiários cadastrados na exclusão com a "Situação" igual a ATIVO e com campo "Data de Exclusão" igual a primeiro dia do mês seguinte


Teste Regressão 16 - INTEGRAR MANUALMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42, SEM CONTRATO INATIVO (CONTRATO PJ EMPRESARIAL)
    [Documentation]         INTEGRAR MANUALMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42, SEM CONTRATO INATIVO (CONTRATO PJ EMPRESARIAL)	
    Dado  Usuário logou no sistema
    E   Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com mais de 1 Beneficiários    @{EXCLUSAOBENEFIARIOPJ16}
    E   Editou os campos "Integração automática" sem registros e "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.
    E   Acessou o módulo Todos > Usuário Canal do Contratante
    E   Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E   Acessou o usuário desejado
    E   Vinculou o Contrato integrado no painel "Contrato"
    E   Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E   O Usuário logou no sistema Canal do Contratante
    E   Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E   Clicou no menu Ações > Solicitar Movimentação
    E   Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOPJ16}
    E   Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E   Clicou no botão "ADICIONAR"
    E   Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E   Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E   Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"
    E   Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO      @{EXCLUSAOBENEFIARIOPJ16}
    E   Validou a apresentação do campo "Situação Plano Inativo" igual a NÃO POSSUI DIREITO DA CONTINUIDADE DO PLANO
    E   Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"     @{EXCLUSAOBENEFIARIOPJ16}
    E   Clicou no botão "ADICIONAR EM LOTE"
    E   Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E   Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E   Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"
    E   Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO clicou em ADICIONAR PESSOA E SALVAR   @{EXCLUSAOBENEFIARIOPJ16}
    E   Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"   @{EXCLUSAOBENEFIARIOPJ16}
    E   Clicou O Menu "ENCAMINHAR PARA APROVAÇÃO"
    E   Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E   Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    E   Acessou o sistema CRM
    E   Acessou o módulo Conferência
    E   Clicou no menu "CONFERIR PROCESSOS"
    E   Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E   Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${EXCLUSAOBENEFIARIOPJ16[1]}
    E   Clicou no botão "SIM" da modal de Confirmação
    E   Validou que o campo "Usuário Canal do Contratante" está preenchido
    E   Clicou na aba "Movimentação Cadastral"
    E   Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel sem Documento anexado   @{EXCLUSAOBENEFIARIOPJ16}
    E   Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E   Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E   Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E   Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E   Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA
    Quando  Clicar no registro "Integração Solicitada"
    E    Clicar no botão "EFETUAR INTEGRAÇÃO"         ${EXCLUSAOBENEFIARIOPJ16[1]}
    Então   CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E   Contrato (CRM) os Beneficiários cadastrados na exclusão com a "Situação" igual a ATIVO e com campo "Data de Exclusão" igual a primeiro dia do mês seguinte



Teste Regressão 17 - INTEGRAR MANUALMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42, COM CONTRATO INATIVO (CONTRATO PJ EMPRESARIAL)	
    [Documentation]       INTEGRAR MANUALMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 42, COM CONTRATO INATIVO (CONTRATO PJ EMPRESARIAL)	
    
    Dado  Usuário logou no sistema
    E   Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com mais de 1 Beneficiários    @{EXCLUSAOBENEFIARIOPJ17}
    E   Editou os campos "Integração automática" sem registros e "Assumir data padrão na exclusão de Beneficiário" igual a SIM. NO DIA DA SOLICIAÇÃO.
    E   Acessou o módulo Todos > Usuário Canal do Contratante
    E   Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E   Acessou o usuário desejado
    E   Vinculou o Contrato integrado no painel "Contrato"
    E   Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E   O Usuário logou no sistema Canal do Contratante
    E   Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E   Clicou no menu Ações > Solicitar Movimentação
    E   Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOPJ17}
    E   Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E   Clicou no botão "ADICIONAR"
    E   Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E   Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E   Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"
    E   Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos "Submotivo", "As carteirinhas foram devolvidas?", telefone, email, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM   @{EXCLUSAOBENEFIARIOPJ17}
    E   Validou a apresentação dos campos "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?","Motivos da extinção do Contrato de Trabalho"
    E   Preencheu os campos "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA
    E   Validou a apresentação dos campos "Situação Plano Inativo" igual a POSSUI DIREITO DA CONTINUIDADE DO PLANO, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?"
    E   Preencheu o campo "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM
    E   Validou a apresentação dos campos "Data de início de vigência no plano inativo" preenchido e bloqueado, painel "Insira abaixo o endereço atualizado do beneficiário titular" com campos de endereço, painel "Opção de Continuidade do Plano Inativo" com os campos "Tempo de contribuição? (meses)" habilitado e preenchido com o valor 0, "Dependentes que continuarão no plano" titular bloqueado e dependentes habilitados para seleção, "Custo total mensal" preenchido
    E   Preencheu os campos de endereço, "Tempo de contribuição? (meses)" igual a 120, selecionou um dependente, clicou no botão "SALVAR"
    E   Clicou no botão "OK" da modal de Confirmação com a mensagem "É necessário anexar documento comprobatório de contribuição excedente ao indicado. Consideramos o tempo vinculado ao plano da Unimed, porém ao anexar o documento este poderá ser revisto."
    E   Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"         @{EXCLUSAOBENEFIARIOPJ17}
    E   Clicou no botão "ADICIONAR EM LOTE"
    E   Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E   Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E   Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"
    E   Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO clicou em ADICIONAR PESSOA E SALVAR   @{EXCLUSAOBENEFIARIOPJ17}
    E   Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"   @{EXCLUSAOBENEFIARIOPJ17}
    E   Clicou O Menu "ENCAMINHAR PARA APROVAÇÃO"
    E   Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E   Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    E   Acessou o sistema CRM
    E   Acessou o módulo Conferência
    E   Clicou no menu "CONFERIR PROCESSOS"
    E   Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E   Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${EXCLUSAOBENEFIARIOPJ17[1]}
    E   Clicou no botão "SIM" da modal de Confirmação
    E   Validou que o campo "Usuário Canal do Contratante" está preenchido
    E   Clicou na aba "Movimentação Cadastral"
    E  Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel sem Documento anexado     @{EXCLUSAOBENEFIARIOPJ17}
    E   Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E   Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E   Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E   Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E   Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA
    Quando  Clicar no registro "Integração Solicitada"
    E   Clicar no botão "EFETUAR INTEGRAÇÃO"         ${EXCLUSAOBENEFIARIOPJ17[1]}
    Então  CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E   Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO'     @{EXCLUSAOBENEFIARIOPJ17}


Teste Regressão 18 - INTEGRAR MANUALMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 44 (CONTRATO PJ EMPRESARIAL)
    [Documentation]         INTEGRAR MANUALMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVO 44 (CONTRATO PJ EMPRESARIAL)
    Dado  Usuário logou no sistema
    E   Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com mais de 1 Beneficiários    @{EXCLUSAOBENEFIARIOPJ18}
    E   Editou os campos "Integração automática" sem registros e "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.
    E   Acessou o módulo Todos > Usuário Canal do Contratante
    E   Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E   Acessou o usuário desejado
    E   Vinculou o Contrato integrado no painel "Contrato"
    E   Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E   O Usuário logou no sistema Canal do Contratante
    E   Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E   Clicou no menu Ações > Solicitar Movimentação
    E   Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOPJ18}
    E   Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E   Clicou no botão "ADICIONAR"
    E   Selecionou "Motivo" 44 - ÓBITO
    E   Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E   Validou a apresentação dos campos "Submotivo", "Data de Óbito", "É necessário anexar a certidão de óbito"
    E   Selecionou 1 (UM) Beneficiário TITULAR CAEPF, selecionou um arquivo com extensão (PDF, PNG, JPEG ou JPG), preencheu "Data de Óbito" igual a DATA DE HOJE - 1, preencheu campos obrigatórios e clicou no botão "SALVAR"  @{EXCLUSAOBENEFIARIOPJ18}
    E   Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"
    E   Clicou no botão "ADICIONAR EM LOTE"
    E   Selecionou "Motivo" 44 - ÓBITO
    E   Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    E   Validou a apresentação dos campos "Submotivo", "Data de Óbito", "É necessário anexar a certidão de óbito"
    E   Selecionou 1 (UM) Beneficiário TITULAR CAEPF, clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios Data Obtio e documento e clicou no botão "SALVAR"      @{EXCLUSAOBENEFIARIOPJ18}
    E   Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"   @{EXCLUSAOBENEFIARIOPJ18}
    E   Clicou O Menu "ENCAMINHAR PARA APROVAÇÃO"
    E   Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"
    E   Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    E   Acessou o sistema CRM
    E   Acessou o módulo Conferência
    E   Clicou no menu "CONFERIR PROCESSOS"
    E   Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E   Clicou no botão "CONFERIR" da Movimentação Cadastral de Inclusão de Beneficiários em Conferência   ${EXCLUSAOBENEFIARIOPJ18[1]}
    E   Clicou no botão "SIM" da modal de Confirmação
    E   Validou que o campo "Usuário Canal do Contratante" está preenchido
    E   Clicou na aba "Movimentação Cadastral"
    E   Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA          @{EXCLUSAOBENEFIARIOPJ18}
    E   Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E   Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E   Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E   Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E   Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA", no painel "Documentos Conferência"
    E   Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    E   Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    E   Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    E   Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA
    Quando  Clicar no registro "Integração Solicitada"
    E   Clicar no botão "EFETUAR INTEGRAÇÃO"         ${EXCLUSAOBENEFIARIOPJ18[1]}
    Então  CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E   Contrato (CRM) os Beneficiários cadastrados na exclusão com a "Situação" igual a ATIVO e com campo "Data de Exclusão" igual a primeiro dia do mês seguinte


Teste Regressão 19 - INTEGRAR AUTOMATICAMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVOS 41 E 42 SEM CONTRATO INATIVO (CONTRATO PJ EMPRESARIAL)	
    [Documentation]         INTEGRAR AUTOMATICAMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIO - MOTIVOS 41 E 42 SEM CONTRATO INATIVO (CONTRATO PJ EMPRESARIAL)	
    Dado  Usuário logou no sistema
    E  Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com mais de 1 Beneficiários     @{EXCLUSAOBENEFIARIOPJ19}
    E  Editou os campos "Integração automática" sem registros e "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.
    E  Acessou o módulo Todos > Usuário Canal do Contratante
    E  Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E  Acessou o usuário desejado
    E  Vinculou o Contrato integrado no painel "Contrato"
    E  Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E  Ativou os agendadores "Conferência - Realizar conferência automática" e "Solicitação de Integração Automática"
    E  O Usuário logou no sistema Canal do Contratante
    E  Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E  Clicou no menu Ações > Solicitar Movimentação
    E  Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOPJ19}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E  Clicou no botão "ADICIONAR"
    E  Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E  Validou a apresentação do campo "Submotivo"
    E  Selecionou 1 (UM) Beneficiário TITULAR PJ, preencheu campos obrigatórios e clicou no botão "SALVAR"        @{EXCLUSAOBENEFIARIOPJ19}
    E  Clicou no botão "ADICIONAR"
    E  Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E  Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?" 
    E  E  Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO      @{EXCLUSAOBENEFIARIOPJ19}
    E  Validou a apresentação do campo "Situação Plano Inativo" igual a NÃO POSSUI DIREITO DA CONTINUIDADE DO PLANO
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários na tabela "Exclusão de Beneficiários"       @{EXCLUSAOBENEFIARIOPJ19}
    Quando  Clicar menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA" Canal Contratante
    E  Validar a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO INTEGRAÇÃO AUTOMÁTICA
    Então   Canal do Contratante deve atualizar a  tela "Protocolo" id gerado automaticamente, com "Situação" igual a INTEGRADA AUTOMÁTICAMENTE
    E  Contrato (CRM) os Beneficiários cadastrados na exclusão com a "Situação" igual a ATIVO e com campo "Data de Exclusão" igual a primeiro dia do mês seguinte


Teste Regressão 20 - INTEGRAR AUTOMATICAMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIOS E GERAR OUTRA MANUALMENTE (CONTRATO PJ EMPRESARIAL)
    [Documentation]         INTEGRAR AUTOMATICAMENTE MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIOS E GERAR OUTRA MANUALMENTE (CONTRATO PJ EMPRESARIAL)									
    Dado  Usuário logou no sistema
    E  Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com mais de 1 Beneficiários    @{EXCLUSAOBENEFIARIOPJ20}
    E  Editou os campos "Integração automática" sem registros e "Assumir data padrão na exclusão de Beneficiário" igual a SIM. NO DIA DA SOLICIAÇÃO.
    E  Acessou o módulo Todos > Usuário Canal do Contratante
    E  Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E  Acessou o usuário desejado
    E  Vinculou o Contrato integrado no painel "Contrato"
    E  Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"
    E  Ativou os agendadores "Conferência - Realizar conferência automática" e "Solicitação de Integração Automática"
    E  O Usuário logou no sistema Canal do Contratante
    E  Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E  Clicou no menu Ações > Solicitar Movimentação
    E  Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"    @{EXCLUSAOBENEFIARIOPJ20}
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    E  Clicou no botão "ADICIONAR"
    # MOTIVO 42 COM SIM
    E  Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E  Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?" 
    E  Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos "Submotivo", "As carteirinhas foram devolvidas?", telefone, email, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM      @{EXCLUSAOBENEFIARIOPJ20}
    E  Validou a apresentação dos campos "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?","Motivos da extinção do Contrato de Trabalho"
    E  Preencheu os campos "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA
    E  Validou a apresentação dos campos "Situação Plano Inativo" igual a POSSUI DIREITO DA CONTINUIDADE DO PLANO, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?"
    E  Preencheu o campo "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM
    E  Validou a apresentação dos campos "Data de início de vigência no plano inativo" preenchido e bloqueado, painel "Insira abaixo o endereço atualizado do beneficiário titular" com campos de endereço, painel "Opção de Continuidade do Plano Inativo" com os campos "Tempo de contribuição? (meses)" habilitado e preenchido com o valor 0, "Dependentes que continuarão no plano" titular bloqueado e dependentes habilitados para seleção, "Custo total mensal" preenchido
    E  Preencheu os campos de endereço, "Tempo de contribuição? (meses)" igual a 120, selecionou um dependente, clicou no botão "SALVAR"         @{EXCLUSAOBENEFIARIOPJ20}
    E  Clicou no botão "OK" da modal de Confirmação com a mensagem "É necessário anexar documento comprobatório de contribuição excedente ao indicado. Consideramos o tempo vinculado ao plano da Unimed, porém ao anexar o documento este poderá ser revisto."
    # MOTIVO 44
    E  Clicou no botão "ADICIONAR"
    E  Selecionou "Motivo" 44 - ÓBITO
    E  Validou a apresentação dos campos "Submotivo", "Data de Óbito", "É necessário anexar a certidão de óbito"
    E  Selecionou 2 (Segundo) Beneficiário TITULAR CAEPF, selecionou um arquivo com extensão (PDF, PNG, JPEG ou JPG), preencheu "Data de Óbito" igual a DATA DE HOJE - 1, preencheu campos obrigatórios e clicou no botão "SALVAR"   @{EXCLUSAOBENEFIARIOPJ20}   
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários CAEPF OU PJ na tabela "Exclusão de Beneficiários"   @{EXCLUSAOBENEFIARIOPJ20}
    # MOTIVO 41
    E  Clicou no botão "ADICIONAR"
    E  Selecionou "Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO
    E  Validou a apresentação do campo "Submotivo"
    E  Selecionou 1 (UM) Beneficiário TITULAR PJ, preencheu campos obrigatórios e clicou no botão "SALVAR"     @{EXCLUSAOBENEFIARIOPJ20}
    # MOTIVO 42 COM NÃO
    E  Clicou no botão "ADICIONAR"
    E  Selecionou "Motivo" 42 - DESLIGAMENTO DA EMPRESA
    E  Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?" 
    E  Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO       @{EXCLUSAOBENEFIARIOPJ20}
    E  Validou a apresentação do campo "Situação Plano Inativo" igual a NÃO POSSUI DIREITO DA CONTINUIDADE DO PLANO
    E  Validou a apresentação da tela "Protocolo" id gerado automaticamente, com a mensagem "Atenção!   Este contrato permite integração automática, porém há beneficiários nesta movimentação que não se enquadram nos critérios e, após encaminhado o protocolo, serão alocados em uma nova movimentação para conferência.", "Situação" igual a EM ANDAMENTO, com os beneficiários na tabela "Exclusão de Beneficiários" e com o menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA"
    E  Clicou no menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA"
    E  Validou a atualização da tela "Protocolo" id gerado automaticamente, com a mensagem de erro “Não é possível realizar integração automática para os beneficiários que estão sendo excluídos por óbito ou por desligamento da empresa com direito ao inativo, e por causa disso foi criada a movimentação NUMERODOPROTOCOLO.", com "Situação" igual a AGUARDANDO INTEGRAÇÃO AUTOMÁTICA, com painel "Exclusão de Beneficiários" com os beneficiários dos Motivo" 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO e 42 - DESLIGAMENTO DA EMPRESA e "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO
    E  Acessou o sistema CRM
    E  Acessou o módulo Conferência
    E  Clicou no menu "CONFERIR PROCESSOS"
    E  Clicou no botão "Conferir" da Movimentação Cadastral de Exclusão de Beneficiários
    E  Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    E  Validação na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    E  Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E  Preencher o campo "Parecer" e clicar no botão "SALVAR"
    E  Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA 
    Quando  Clicar no registro "Integração Solicitada"
    E  Clicar no botão "EFETUAR INTEGRAÇÃO"      ${EXCLUSAOBENEFIARIOPJ20[1]}
    Então  CRM deve atualizar a tela Solicitação de Integração » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E  Contrato os BENEFICIÁRIO excluidos (com Data de Exclusão igual a DATA ATUAL) devem estar com a situação igual a CANCELADO, demais devem manter a situação igual a ATIVO    @{EXCLUSAOBENEFIARIOPJ20}