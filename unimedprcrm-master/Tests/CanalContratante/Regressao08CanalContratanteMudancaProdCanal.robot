*** Settings ***
Resource    ../../main.resource

Suite Setup      Instancia Variaveis    C08
Test Setup       Comum.Abrir Nav  
Test Teardown    Comum.Fechar Nav

*** Variables ***

*** Test Cases ***
Teste de Regressão 1 - INTEGRAÇÃO MOV CAD MUDANÇA PROD CANAL - GERAR MOV CADASTRAL DE MUDANÇA DE PRODUTO (CONTRATO PF)
    [Documentation]  INTEGRAÇÃO MOV CAD MUDANÇA PROD CANAL - GERAR MOV CADASTRAL DE MUDANÇA DE PRODUTO (CONTRATO PF)
    Dado  Usuário logou no sistema
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Tipo de Contratação" igual a INDIVIDUAL FAMILIAR, com Beneficiários  @{MUDANCAPRODCANALPF01}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Mudança de Produto"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    Quando   Selecionar o Contrato PF, no campo "Tipo de Movimentação" a opção MUDANÇA DE PRODUTO e clicar no botão "SALVAR"  ${MUDANCAPRODCANALPF01[2]}
    Então 	 O Canal do Contratante deve apresentar a mensagem de erro "A mudança de produto via movimentação cadastral é permitido apenas para Contratos Pessoa Jurídica."

Teste de Regressão 2 - INTEGRAÇÃO MOV CAD MUDANÇA PROD CANAL - INTEGRAR MOV CADASTRAL DE MUDANÇA DE PRODUTO (CONTRATO CAEPF ADESÃO)
    [Documentation]  INTEGRAÇÃO MOV CAD MUDANÇA PROD CANAL - INTEGRAR MOV CADASTRAL DE MUDANÇA DE PRODUTO (CONTRATO CAEPF ADESÃO)
    
    Dado  Usuário logou no sistema
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários  @{MUDANCAPRODCANALCAEPF01}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Mudança de Produto"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionar o Contrato PF, no campo "Tipo de Movimentação" a opção MUDANÇA DE PRODUTO e clicar no botão "SALVAR"  ${MUDANCAPRODCANALCAEPF01[2]}

    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários no painel "Beneficiários - Mudança de Produto"
    E     Clicou o botão "ADICIONAR"
    E     Validou a apresentação da tela "Mudança de Produto", com os campos "Alteração", "Beneficiário", "Motivo", "Produto Atual" vazio e bloqueado, "Novo Produto", "Observação"
    E     Selecionou 1 (UM) Beneficiário TITULAR, com dependentes  @{MUDANCAPRODCANALCAEPF01}
    E     Validou a atualização da tela com campo "Produto Atual" preenchido, "Novo Produto" com os Produtos do Contrato, "O(s) dependentes(s) assume(m) o mesmo produto do titular?" igual a SIM, "Beneficiário Dependente", "Grau de Dependência", "Produto Atual" preenchido/bloqueado   @{MUDANCAPRODCANALCAEPF01}
    E     Clicou na opção "NÃO" do campo "O(s) dependentes(s) assume(m) o mesmo produto do titular?"
    E     Validou a apresentação dos campos de seleção nos dependentes e campo "Novo Produto"
    E     Preencheu os campos "Alteração" igual a EM 24 HORAS, "Observação", "Novo Produto" para o Titular, "Novo Produto" para um dependente, desmarcou o campo de seleção dos outros dependentes   @{MUDANCAPRODCANALCAEPF01}
    E     Clicou o botão SALVAR
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o TITULAR e UM DEPENDNETE no painel "Beneficiários - Mudança de Produto"
    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"

    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR" 
    E     Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO

    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" vazia
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{MUDANCAPRODCANALCAEPF01}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então     CRM deve atualizar tela de Conferência » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E     No Contrato os Beneficiários cadastrados na movimentação, com os produtos alterados				


Teste de Regressão 3 - INTEGRAÇÃO MOV CAD MUDANÇA PROD CANAL - INTEGRAR MOV CADASTRAL DE MUDANÇA DE PRODUTO (CONTRATO CAEPF EMPRESARIAL)
    [Documentation]  INTEGRAÇÃO MOV CAD MUDANÇA PROD CANAL - INTEGRAR MOV CADASTRAL DE MUDANÇA DE PRODUTO (CONTRATO CAEPF EMPRESARIAL)
   
    Dado  Usuário logou no sistema
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários  @{MUDANCAPRODCANALCAEPF02}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Mudança de Produto"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionar o Contrato PF, no campo "Tipo de Movimentação" a opção MUDANÇA DE PRODUTO e clicar no botão "SALVAR"  ${MUDANCAPRODCANALCAEPF02[2]}

    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários no painel "Beneficiários - Mudança de Produto"
    E     Clicou o botão "ADICIONAR"
    E     Validou a apresentação da tela "Mudança de Produto", com os campos "Alteração", "Beneficiário", "Motivo", "Produto Atual" vazio e bloqueado, "Novo Produto", "Observação"
    E     Selecionou 1 (UM) Beneficiário TITULAR, com dependentes  @{MUDANCAPRODCANALCAEPF02}
    E     Validou a atualização da tela com campo "Produto Atual" preenchido, "Novo Produto" com os Produtos do Contrato, "O(s) dependentes(s) assume(m) o mesmo produto do titular?" igual a SIM, "Beneficiário Dependente", "Grau de Dependência", "Produto Atual" preenchido/bloqueado   @{MUDANCAPRODCANALCAEPF02}
    E     Clicou na opção "NÃO" do campo "O(s) dependentes(s) assume(m) o mesmo produto do titular?"
    E     Validou a apresentação dos campos de seleção nos dependentes e campo "Novo Produto"
    E     Preencheu os campos "Alteração" igual a EM 24 HORAS, "Observação", "Novo Produto" para o Titular, "Novo Produto" para um dependente, desmarcou o campo de seleção dos outros dependentes   @{MUDANCAPRODCANALCAEPF02}
    E     Clicou o botão SALVAR
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o TITULAR e UM DEPENDNETE no painel "Beneficiários - Mudança de Produto"
    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"

    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR" 
    E     Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO

    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" vazia
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{MUDANCAPRODCANALCAEPF02}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então     CRM deve atualizar tela de Conferência » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E     No Contrato os Beneficiários cadastrados na movimentação, com os produtos alterados


Teste de Regressão 4 - INTEGRAÇÃO MOV CAD MUDANÇA PROD CANAL - INTEGRAR MOV CADASTRAL DE MUDANÇA DE PRODUTO (CONTRATO PJ ADESÃO)
    [Documentation]  INTEGRAÇÃO MOV CAD MUDANÇA PROD CANAL - INTEGRAR MOV CADASTRAL DE MUDANÇA DE PRODUTO (CONTRATO PJ ADESÃO)  
    Dado  Usuário logou no sistema
    E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários  @{MUDANCAPRODCANALPJ01}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Mudança de Produto"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionar o Contrato PF, no campo "Tipo de Movimentação" a opção MUDANÇA DE PRODUTO e clicar no botão "SALVAR"  ${MUDANCAPRODCANALPJ01[2]}

    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários no painel "Beneficiários - Mudança de Produto"
    E     Clicou o botão "ADICIONAR"
    E     Validou a apresentação da tela "Mudança de Produto", com os campos "Alteração", "Beneficiário", "Motivo", "Produto Atual" vazio e bloqueado, "Novo Produto", "Observação"
    E     Selecionou 1 (UM) Beneficiário TITULAR, com dependentes  @{MUDANCAPRODCANALPJ01}
    E     Validou a atualização da tela com campo "Produto Atual" preenchido, "Novo Produto" com os Produtos do Contrato, "O(s) dependentes(s) assume(m) o mesmo produto do titular?" igual a SIM, "Beneficiário Dependente", "Grau de Dependência", "Produto Atual" preenchido/bloqueado   @{MUDANCAPRODCANALPJ01}
    E     Clicou na opção "NÃO" do campo "O(s) dependentes(s) assume(m) o mesmo produto do titular?"
    E     Validou a apresentação dos campos de seleção nos dependentes e campo "Novo Produto"
    E     Preencheu os campos "Alteração" igual a EM 24 HORAS, "Observação", "Novo Produto" para o Titular, "Novo Produto" para um dependente, desmarcou o campo de seleção dos outros dependentes   @{MUDANCAPRODCANALPJ01}
    E     Clicou o botão SALVAR
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o TITULAR e UM DEPENDNETE no painel "Beneficiários - Mudança de Produto"
    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"

    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR" 
    E     Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO

    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" vazia
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{MUDANCAPRODCANALPJ01}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então     CRM deve atualizar tela de Conferência » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E     No Contrato os Beneficiários cadastrados na movimentação, com os produtos alterados


Teste de Regressão 5 - INTEGRAÇÃO MOV CAD MUDANÇA PROD CANAL - INTEGRAR MOV CADASTRAL DE MUDANÇA DE PRODUTO (CONTRATO PJ EMPRESARIAL)
    [Documentation]  INTEGRAÇÃO MOV CAD MUDANÇA PROD CANAL - INTEGRAR MOV CADASTRAL DE MUDANÇA DE PRODUTO (CONTRATO PJ EMPRESARIAL)
    Dado  Usuário logou no sistema
    E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários  @{MUDANCAPRODCANALPJ02}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Mudança de Produto"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicar no menu Movimentação Cadastral > Movimentar Beneficiários
    E     Clicou no menu Ações > Solicitar Movimentação
    E     Selecionar o Contrato PF, no campo "Tipo de Movimentação" a opção MUDANÇA DE PRODUTO e clicar no botão "SALVAR"  ${MUDANCAPRODCANALPJ02[2]}

    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários no painel "Beneficiários - Mudança de Produto"
    E     Clicou o botão "ADICIONAR"
    E     Validou a apresentação da tela "Mudança de Produto", com os campos "Alteração", "Beneficiário", "Motivo", "Produto Atual" vazio e bloqueado, "Novo Produto", "Observação"
    E     Selecionou 1 (UM) Beneficiário TITULAR, com dependentes  @{MUDANCAPRODCANALPJ02}
    E     Validou a atualização da tela com campo "Produto Atual" preenchido, "Novo Produto" com os Produtos do Contrato, "O(s) dependentes(s) assume(m) o mesmo produto do titular?" igual a SIM, "Beneficiário Dependente", "Grau de Dependência", "Produto Atual" preenchido/bloqueado   @{MUDANCAPRODCANALPJ02}
    E     Clicou na opção "NÃO" do campo "O(s) dependentes(s) assume(m) o mesmo produto do titular?"
    E     Validou a apresentação dos campos de seleção nos dependentes e campo "Novo Produto"
    E     Preencheu os campos "Alteração" igual a EM 24 HORAS, "Observação", "Novo Produto" para o Titular, "Novo Produto" para um dependente, desmarcou o campo de seleção dos outros dependentes   @{MUDANCAPRODCANALPJ02}
    E     Clicou o botão SALVAR
    E     Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o TITULAR e UM DEPENDNETE no painel "Beneficiários - Mudança de Produto"
    E     Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"

    E     Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR" 
    E     Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO

    E     Acessou o sistema CRM
    E     Acessou o módulo Conferência
    E     Clicou no menu "CONFERIR PROCESSOS"
    E     Preencheu os campos "Encaminhado para aprovação em" igual a data atual, seleciounou a opção "MEUS ITENS" e clicou no botão "PESQUISAR"
    E     Validou a apresentação do registro, com a coluna "Prioridades" vazia
    E     Clicou no botão "CONFERIR" do Contrato em Conferência  @{MUDANCAPRODCANALPJ02}
    E     Clicou no botão "SIM" da modal de Confirmação
    E     Validou que o campo "Usuário Canal do Contratante" está preenchido
    E     Clicou na aba "Movimentação Cadastral"
    E     Clicar no menu "VALIDAR DADOS" (Mov Cadastral)
    E     Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    Quando    Clicar no menu "APROVAR CONFERÊNCIA" dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    E     Preencher o campo "Parecer" e clicar no botão "SALVAR"
    Então     CRM deve atualizar tela de Conferência » ID Mov Cadastral, com a situação "Integrado com sucesso"
    E     No Contrato os Beneficiários cadastrados na movimentação, com os produtos alterados



