*** Settings ***
Resource    ../../main.resource

Suite Setup      Instancia Variaveis    C09
Test Setup       Comum.Abrir Nav  
Test Teardown    Comum.Fechar Nav

*** Variables ***

*** Test Cases ***
Teste de Regressão 1 - INTEGRAÇÃO MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR CANAL - GERAR MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO PF)
    [Documentation]  INTEGRAÇÃO MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR CANAL - GERAR MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO PF)
    Dado  Usuário logou no sistema
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Tipo de Contratação" igual a INDIVIDUAL FAMILIAR, com Beneficiários  @{MOVTRANSFGRUPOFAMILIARCANALPF01}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Transferência de Grupo Familiar"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    Quando   Selecionar o Contrato, no campo "Tipo de Movimentação" a opção TRANSFERÊNCIA DE GRUPO FAMILIAR e clicar no botão "SALVAR"  ${MOVTRANSFGRUPOFAMILIARCANALPF01[2]}
    Então    O Canal do Contratante deve apresentar a mensagem de erro "A Transferência de Grupo Familiar via movimentação cadastral é permitida apenas para Contratos Pessoa Jurídica."


Teste de Regressão 2 - INTEGRAÇÃO MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR CANAL - INTEGRAR MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO CAEPF), COM EMP_MANTER_COD_BENEF = N
    [Documentation]  INTEGRAÇÃO MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR CANAL - INTEGRAR MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO CAEPF), COM EMP_MANTER_COD_BENEF = N
    Dado  Usuário logou no sistema
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários  @{MOVTRANSFGRUPOFAMILIARCANALCAEPF01}
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários  @{MOVTRANSFGRUPOFAMILIARCANALCAEPF02}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Transferência de Grupo Familiar"

    E     Resultado da query "SELECT EMP_MANTER_COD_BENEF FROM PARAMETRO_GERAL;" deve ser N

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação

    E     Selecionar o Contrato, no campo "Tipo de Movimentação" a opção TRANSFERÊNCIA DE GRUPO FAMILIAR e clicar no botão "SALVAR"  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF01[2]}
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"
    E     Clicou o botão "ADICIONAR"
    E     Validou a apresentação da tela "Transf. de Grupo Familiar", com os campos "Transferência", "Motivo", "Beneficiário Titular", "Número da Matricula", "Contrato Destino", "Produto Assistencial" vazio e bloqueado e os botões "SALVAR" e "CANCELAR"
    E     Selecionou 1 UM Beneficiário TITULAR, com dependentes
    E     Validou a atualização da tela com os campos "Beneficiário Dependente", "Grau de Dependência"
    E     Preencheu os campos "Transferência" igual a EM 24 HORAS, "Motivo", "Contrato Destino"   @{MOVTRANSFGRUPOFAMILIARCANALCAEPF02}
    E     Validou a atualização da tela com os campos "Produto Assistencial" habilitado com os produtos do Contrato destino, "O(s) dependentes(s) assume(m) o mesmo produto do titular?" igual a SIM
    E     Selecionou um Produto Assistencial   @{MOVTRANSFGRUPOFAMILIARCANALCAEPF02}
    E     Validou a atualização da tela apresentando os produtos Acessórios
    E     Clicou na opção "NÃO" do campo "O(s) dependentes(s) assume(m) o mesmo produto do titular?"
    E     Validou a atualização da tela apresentando o campo "Produto Assistencial" para os dependentes
    E     Selecionou o Produto Assistencial do dependente  @{MOVTRANSFGRUPOFAMILIARCANALCAEPF02}
    E     Validou a atualização da tela apresentando o campo "Produto Acessório" com as opções de acordo com o Produto Assistencial
    E     Clicou no botão "SALVAR", sem selecionar acessórios
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o painel "Beneficiários - Transferência de Grupo Familiar" com registros
    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"

    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR" 
    E     Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" vazia
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{MOVTRANSFGRUPOFAMILIARCANALCAEPF01}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então     CRM deve atualizar tela de Conferência » ID Mov Cadastral, com a situação "Integrado com sucesso"


Teste de Regressão 3 - INTEGRAÇÃO MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR CANAL - INTEGRAR MANUALMENTE MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO PJ), COM EMP_MANTER_COD_BENEF = N
    [Documentation]  INTEGRAÇÃO MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR CANAL - INTEGRAR MANUALMENTE MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO PJ), COM EMP_MANTER_COD_BENEF = N
    Dado  Usuário logou no sistema
    E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários  @{MOVTRANSFGRUPOFAMILIARCANALPJ01} 
    E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários  @{MOVTRANSFGRUPOFAMILIARCANALPJ02}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Transferência de Grupo Familiar"

    E     Resultado da query "SELECT EMP_MANTER_COD_BENEF FROM PARAMETRO_GERAL;" deve ser N

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação

    E     Selecionar o Contrato, no campo "Tipo de Movimentação" a opção TRANSFERÊNCIA DE GRUPO FAMILIAR e clicar no botão "SALVAR"  ${MOVTRANSFGRUPOFAMILIARCANALPJ01[2]}
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"
    E     Clicou o botão "ADICIONAR"
    E     Validou a apresentação da tela "Transf. de Grupo Familiar", com os campos "Transferência", "Motivo", "Beneficiário Titular", "Número da Matricula", "Contrato Destino", "Produto Assistencial" vazio e bloqueado e os botões "SALVAR" e "CANCELAR"
    E     Selecionou 1 UM Beneficiário TITULAR, com dependentes
    E     Validou a atualização da tela com os campos "Beneficiário Dependente", "Grau de Dependência"
    E     Preencheu os campos "Transferência" igual a EM 24 HORAS, "Motivo", "Contrato Destino"   @{MOVTRANSFGRUPOFAMILIARCANALPJ02}
    E     Validou a atualização da tela com os campos "Produto Assistencial" habilitado com os produtos do Contrato destino, "O(s) dependentes(s) assume(m) o mesmo produto do titular?" igual a SIM
    E     Selecionou um Produto Assistencial   @{MOVTRANSFGRUPOFAMILIARCANALPJ02}
    E     Validou a atualização da tela apresentando os produtos Acessórios
    E     Clicou na opção "NÃO" do campo "O(s) dependentes(s) assume(m) o mesmo produto do titular?"
    E     Validou a atualização da tela apresentando o campo "Produto Assistencial" para os dependentes
    E     Selecionou o Produto Assistencial do dependente  @{MOVTRANSFGRUPOFAMILIARCANALPJ02}
    E     Validou a atualização da tela apresentando o campo "Produto Acessório" com as opções de acordo com o Produto Assistencial
    E     Clicou no botão "SALVAR", sem selecionar acessórios
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o painel "Beneficiários - Transferência de Grupo Familiar" com registros
    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"

    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR" 
    E     Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" vazia
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{MOVTRANSFGRUPOFAMILIARCANALPJ01}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então     CRM deve atualizar tela de Conferência » ID Mov Cadastral, com a situação "Integrado com sucesso"


Teste de Regressão 4 - INTEGRAÇÃO MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR CANAL - INTEGRAR AUTOMATICAMENTE MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO PJ), COM EMP_MANTER_COD_BENEF = N
    [Documentation]  INTEGRAÇÃO MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR CANAL - INTEGRAR AUTOMATICAMENTE MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO PJ), COM EMP_MANTER_COD_BENEF = N
    Dado  Usuário logou no sistema
    E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários  @{MOVTRANSFGRUPOFAMILIARCANALPJ03}
    E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários e "Integração automática" igual a TRANSFERÊNCIA DE GRUPO FAMILIAR  @{MOVTRANSFGRUPOFAMILIARCANALPJ04}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Transferência de Grupo Familiar"

    E     Resultado da query "SELECT EMP_MANTER_COD_BENEF FROM PARAMETRO_GERAL;" deve ser N

    E     Ativou os agendadores "Conferência - Realizar conferência automática" e "Solicitação de Integração Automática"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação

    E     Selecionar o Contrato, no campo "Tipo de Movimentação" a opção TRANSFERÊNCIA DE GRUPO FAMILIAR e clicar no botão "SALVAR"  ${MOVTRANSFGRUPOFAMILIARCANALPJ04[2]}
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"
    E     Clicou o botão "ADICIONAR"
    E     Validou a apresentação da tela "Transf. de Grupo Familiar", com os campos "Transferência", "Motivo", "Beneficiário Titular", "Número da Matricula", "Contrato Destino", "Produto Assistencial" vazio e bloqueado e os botões "SALVAR" e "CANCELAR"
    E     Selecionou 1 UM Beneficiário TITULAR, com dependentes
    E     Validou a atualização da tela com os campos "Beneficiário Dependente", "Grau de Dependência"
    E     Preencheu os campos "Transferência" igual a EM 24 HORAS, "Motivo", "Contrato Destino"   @{MOVTRANSFGRUPOFAMILIARCANALPJ03}
    E     Validou a atualização da tela com os campos "Produto Assistencial" habilitado com os produtos do Contrato destino, "O(s) dependentes(s) assume(m) o mesmo produto do titular?" igual a SIM
    E     Selecionou um Produto Assistencial   @{MOVTRANSFGRUPOFAMILIARCANALPJ03}
    E     Validou a atualização da tela apresentando os produtos Acessórios
    E     Clicou na opção "NÃO" do campo "O(s) dependentes(s) assume(m) o mesmo produto do titular?"
    E     Validou a atualização da tela apresentando o campo "Produto Assistencial" para os dependentes
    E     Selecionou o Produto Assistencial do dependente  @{MOVTRANSFGRUPOFAMILIARCANALPJ03}
    E     Validou a atualização da tela apresentando o campo "Produto Acessório" com as opções de acordo com o Produto Assistencial
    E     Clicou no botão "SALVAR", sem selecionar acessórios
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o painel "Beneficiários - Transferência de Grupo Familiar" com registros
    Quando    Clicar menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA"
    E     Validar a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO INTEGRAÇÃO AUTOMÁTICA

    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Pesquisar Identificador de origem  @{MOVTRANSFGRUPOFAMILIARCANALPJ04}
    Então    CRM deve atualizar tela de Conferência » ID Mov Cadastral, com a situação "Integrado com sucesso"


Teste de Regressão 5 - INTEGRAÇÃO MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR CANAL - INTEGRAR MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO CAEPF), COM EMP_MANTER_COD_BENEF = S
    [Documentation]  INTEGRAÇÃO MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR CANAL - INTEGRAR MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO CAEPF), COM EMP_MANTER_COD_BENEF = S
    Dado  Usuário logou no sistema
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários  @{MOVTRANSFGRUPOFAMILIARCANALCAEPF03}
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários  @{MOVTRANSFGRUPOFAMILIARCANALCAEPF04}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Transferência de Grupo Familiar"

    E     Resultado da query "SELECT EMP_MANTER_COD_BENEF FROM PARAMETRO_GERAL;" deve ser S

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação

    E     Selecionar o Contrato, no campo "Tipo de Movimentação" a opção TRANSFERÊNCIA DE GRUPO FAMILIAR e clicar no botão "SALVAR"  ${MOVTRANSFGRUPOFAMILIARCANALCAEPF03[2]}
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"
    E     Clicou o botão "ADICIONAR"
    E     Validou a apresentação da tela "Transf. de Grupo Familiar", com os campos "Transferência", "Motivo", "Beneficiário Titular", "Número da Matricula", "Contrato Destino", "Produto Assistencial" vazio e bloqueado e os botões "SALVAR" e "CANCELAR"
    E     Selecionou 1 UM Beneficiário TITULAR, com dependentes
    E     Validou a atualização da tela com os campos "Beneficiário Dependente", "Grau de Dependência"
    E     Preencheu os campos "Transferência" igual a EM 24 HORAS, "Motivo", "Contrato Destino"   @{MOVTRANSFGRUPOFAMILIARCANALCAEPF04}
    E     Validou a atualização da tela com os campos "Produto Assistencial" habilitado com os produtos do Contrato destino, "O(s) dependentes(s) assume(m) o mesmo produto do titular?" igual a SIM
    E     Selecionou um Produto Assistencial   @{MOVTRANSFGRUPOFAMILIARCANALCAEPF04}
    E     Validou a atualização da tela apresentando os produtos Acessórios
    E     Clicou na opção "NÃO" do campo "O(s) dependentes(s) assume(m) o mesmo produto do titular?"
    E     Validou a atualização da tela apresentando o campo "Produto Assistencial" para os dependentes
    E     Selecionou o Produto Assistencial do dependente  @{MOVTRANSFGRUPOFAMILIARCANALCAEPF04}
    E     Validou a atualização da tela apresentando o campo "Produto Acessório" com as opções de acordo com o Produto Assistencial
    E     Clicou no botão "SALVAR", sem selecionar acessórios
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o painel "Beneficiários - Transferência de Grupo Familiar" com registros
    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"

    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR" 
    E     Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" vazia
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{MOVTRANSFGRUPOFAMILIARCANALCAEPF03}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então     CRM deve atualizar tela de Conferência » ID Mov Cadastral, com a situação "Integrado com sucesso"
    

Teste de Regressão 6 - INTEGRAÇÃO MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR CANAL - INTEGRAR MANUALMENTE MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO PJ), COM EMP_MANTER_COD_BENEF = S
    [Documentation]  INTEGRAÇÃO MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR CANAL - INTEGRAR MANUALMENTE MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO PJ), COM EMP_MANTER_COD_BENEF = S
    Dado  Usuário logou no sistema
    E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários  @{MOVTRANSFGRUPOFAMILIARCANALPJ05}
    E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários  @{MOVTRANSFGRUPOFAMILIARCANALPJ06}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Transferência de Grupo Familiar"

    E     Resultado da query "SELECT EMP_MANTER_COD_BENEF FROM PARAMETRO_GERAL;" deve ser S

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação

    E     Selecionar o Contrato, no campo "Tipo de Movimentação" a opção TRANSFERÊNCIA DE GRUPO FAMILIAR e clicar no botão "SALVAR"  ${MOVTRANSFGRUPOFAMILIARCANALPJ05[2]}
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"
    E     Clicou o botão "ADICIONAR"
    E     Validou a apresentação da tela "Transf. de Grupo Familiar", com os campos "Transferência", "Motivo", "Beneficiário Titular", "Número da Matricula", "Contrato Destino", "Produto Assistencial" vazio e bloqueado e os botões "SALVAR" e "CANCELAR"
    E     Selecionou 1 UM Beneficiário TITULAR, com dependentes
    E     Validou a atualização da tela com os campos "Beneficiário Dependente", "Grau de Dependência"
    E     Preencheu os campos "Transferência" igual a EM 24 HORAS, "Motivo", "Contrato Destino"   @{MOVTRANSFGRUPOFAMILIARCANALPJ06}
    E     Validou a atualização da tela com os campos "Produto Assistencial" habilitado com os produtos do Contrato destino, "O(s) dependentes(s) assume(m) o mesmo produto do titular?" igual a SIM
    E     Selecionou um Produto Assistencial   @{MOVTRANSFGRUPOFAMILIARCANALPJ06}
    E     Validou a atualização da tela apresentando os produtos Acessórios
    E     Clicou na opção "NÃO" do campo "O(s) dependentes(s) assume(m) o mesmo produto do titular?"
    E     Validou a atualização da tela apresentando o campo "Produto Assistencial" para os dependentes
    E     Selecionou o Produto Assistencial do dependente  @{MOVTRANSFGRUPOFAMILIARCANALPJ06}
    E     Validou a atualização da tela apresentando o campo "Produto Acessório" com as opções de acordo com o Produto Assistencial
    E     Clicou no botão "SALVAR", sem selecionar acessórios
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o painel "Beneficiários - Transferência de Grupo Familiar" com registros
    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"

    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR" 
    E     Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    
    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" vazia
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{MOVTRANSFGRUPOFAMILIARCANALPJ05}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então     CRM deve atualizar tela de Conferência » ID Mov Cadastral, com a situação "Integrado com sucesso"



Teste de Regressão 7 - INTEGRAÇÃO MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR CANAL - INTEGRAR AUTOMATICAMENTE MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO PJ), COM EMP_MANTER_COD_BENEF = S
    [Documentation]  INTEGRAÇÃO MOV CAD TRANSFERÊNCIA DE GRUPO FAMILIAR CANAL - INTEGRAR AUTOMATICAMENTE MOV CADASTRAL DE TRANSFERENCIA DE GRUPO FAMILIAR (CONTRATO PJ), COM EMP_MANTER_COD_BENEF = S 
    Dado  Usuário logou no sistema
    E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários   @{MOVTRANSFGRUPOFAMILIARCANALPJ07}
    E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários e "Integração automática" igual a TRANSFERÊNCIA DE GRUPO FAMILIAR  @{MOVTRANSFGRUPOFAMILIARCANALPJ08}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Transferência de Grupo Familiar"

    E     Resultado da query "SELECT EMP_MANTER_COD_BENEF FROM PARAMETRO_GERAL;" deve ser S

    E     Ativou os agendadores "Conferência - Realizar conferência automática" e "Solicitação de Integração Automática"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação

    E     Selecionar o Contrato, no campo "Tipo de Movimentação" a opção TRANSFERÊNCIA DE GRUPO FAMILIAR e clicar no botão "SALVAR"  ${MOVTRANSFGRUPOFAMILIARCANALPJ08[2]}
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"
    E     Clicou o botão "ADICIONAR"
    E     Validou a apresentação da tela "Transf. de Grupo Familiar", com os campos "Transferência", "Motivo", "Beneficiário Titular", "Número da Matricula", "Contrato Destino", "Produto Assistencial" vazio e bloqueado e os botões "SALVAR" e "CANCELAR"
    E     Selecionou 1 UM Beneficiário TITULAR, com dependentes
    E     Validou a atualização da tela com os campos "Beneficiário Dependente", "Grau de Dependência"
    E     Preencheu os campos "Transferência" igual a EM 24 HORAS, "Motivo", "Contrato Destino"   @{MOVTRANSFGRUPOFAMILIARCANALPJ07}
    E     Validou a atualização da tela com os campos "Produto Assistencial" habilitado com os produtos do Contrato destino, "O(s) dependentes(s) assume(m) o mesmo produto do titular?" igual a SIM
    E     Selecionou um Produto Assistencial   @{MOVTRANSFGRUPOFAMILIARCANALPJ07}
    E     Validou a atualização da tela apresentando os produtos Acessórios
    E     Clicou na opção "NÃO" do campo "O(s) dependentes(s) assume(m) o mesmo produto do titular?"
    E     Validou a atualização da tela apresentando o campo "Produto Assistencial" para os dependentes
    E     Selecionou o Produto Assistencial do dependente  @{MOVTRANSFGRUPOFAMILIARCANALPJ07}
    E     Validou a atualização da tela apresentando o campo "Produto Acessório" com as opções de acordo com o Produto Assistencial
    E     Clicou no botão "SALVAR", sem selecionar acessórios
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o painel "Beneficiários - Transferência de Grupo Familiar" com registros
    Quando    Clicar menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA"
    E     Validar a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO INTEGRAÇÃO AUTOMÁTICA

    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Pesquisar Identificador de origem  @{MOVTRANSFGRUPOFAMILIARCANALPJ08}
    Então     CRM deve atualizar tela de Conferência » ID Mov Cadastral, com a situação "Integrado com sucesso"
