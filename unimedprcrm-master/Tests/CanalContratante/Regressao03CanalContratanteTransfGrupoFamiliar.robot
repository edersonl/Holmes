*** Settings ***
Resource    ../../main.resource

Suite Setup      Instancia Variaveis    C03
Test Setup       Comum.Abrir Nav  
Test Teardown    Comum.Fechar Nav

*** Variables ***

*** Test Cases ***
Teste de Regressão 01 - TRANSFERÊNCIA GRUPO FAMILIAR - Gerar Movimentação de Transferência em Massa (CONTRATO PF)
    [Documentation]  TRANSFERÊNCIA GRUPO FAMILIAR - Gerar Movimentação de Transferência em Massa (CONTRATO PF)
    Dado     Usuário logou no sistema 
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Tipo de Contratação" igual a INDIVIDUAL FAMILIAR, com Beneficiários    @{MOVTRANFGRUPOFAMILIARMASSAPF01}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Transferência de Grupo Familiar"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicou no menu Movimentação Cadastral > Movimentar em Massa
    E     Clicou no menu Ações > Solicitar Movimentação em Massa
    E     Preencheu o campo "Nome", selecionou no campo "Tipo de Movimentação" a opção TRANSFERÊNCIA DE GRUPO FAMILIAR e clicou no botão "SALVAR"    ${MOVTRANFGRUPOFAMILIARMASSAPF01[1]}
    E     Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, sem beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"    ${MOVTRANFGRUPOFAMILIARMASSAPF01[1]}
    E     Clicou o botão "DEFINIR BENEFICIÁRIOS"
    E     Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO"
    E     Clicou botão "+ ADICIONAR BENEFICIÁRIOS"
    E     Validou a apresentação da modal "Pesquisa Beneficiários"
    Quando     Preencher o campo "Nome / Razão Social" do Contrato PF  ${MOVTRANFGRUPOFAMILIARMASSAPF01[1]}
    E     Clicar no botão "PESQUISAR"
    Então     O Canal do Contratante deve apresentar a mensagem "Não foram localizados Beneficiários para os parâmetros informados na pesquisa."


Teste de Regressão 02 - TRANSFERÊNCIA GRUPO FAMILIAR - Gerar Movimentação de Transferência de Beneficiários em Massa (CONTRATO PJ ADESÃO e CONTRATO PJ EMPRESARIAL)
    [Documentation]  TRANSFERÊNCIA GRUPO FAMILIAR - Gerar Movimentação de Transferência de Beneficiários em Massa (CONTRATO PJ ADESÃO e CONTRATO PJ EMPRESARIAL)
    Dado     Usuário logou no sistema 
    E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários     @{MOVTRANFGRUPOFAMILIARMASSAPJ01}
    E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários    @{MOVTRANFGRUPOFAMILIARMASSAPJ02}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Transferência de Grupo Familiar"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicou no menu Movimentação Cadastral > Movimentar em Massa
    E     Clicou no menu Ações > Solicitar Movimentação em Massa
    E     Preencheu o campo "Nome", selecionou no campo "Tipo de Movimentação" a opção TRANSFERÊNCIA DE GRUPO FAMILIAR e clicou no botão "SALVAR"    ${MOVTRANFGRUPOFAMILIARMASSAPJ01[1]}
    E     Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, sem beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"    ${MOVTRANFGRUPOFAMILIARMASSAPJ01[1]}
    E     Clicou o botão "DEFINIR BENEFICIÁRIOS"
    E     Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO"
    E     Clicou botão "+ ADICIONAR BENEFICIÁRIOS"
    E     Validou a apresentação da modal "Pesquisa Beneficiários"
    E     Preencheu o campo "Nome / Razão Social" do Contrato PJ ADESÃO     @{MOVTRANFGRUPOFAMILIARMASSAPJ01}
    E     Clicar no botão "PESQUISAR"    
    E     Validou a apresentação de somente Beneficiários TITULARES
    E     Clicou em um beneficiário TITULAR e clicou no botão "SELECIONAR"
    E     Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Transferência", "Contrato de Destino", "Produto Assistencial", "Produto(s) Acessório", "Tipo Transferência", "Motivo", botões "APLICAR", "LIMPAR", outra tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão onde o beneficiário que será excluido está vinculado, com as colunas "Contrato de Destino", "Titular", "Transferência" desabilitado, "Matricula", "Motivo", "Assistencial" e "Produto(s) Acessório" desabilitados    ${MOVTRANFGRUPOFAMILIARMASSAPJ01[1]}
    E     Selecionou um Contrato PJ EMPRESARIAL    ${MOVTRANFGRUPOFAMILIARMASSAPJ02[2]}
    E     Validou a alteração habilitando os campos "Trnasferência" com as opções EM 24 HORAS, 1° DIA DO MÊS SEGUINTE, ÚLTIMO DIA DO MÊS, ESPECIFICAR DATA, "Assistencial" com os Produtos do Contrato PJ EMPRESARIAL, "Produto(s) Acessório" vazio
    E     Selecionou no campo "Transferência" a opção 1° DIA DO MÊS SEGUINTE, "Assistencial" igual a 5045
    E     Validou a apresentação dos registros no campo "Produto(s) Acessório"
    E     Preencheu o campo "Nome / Razão Social" do Contrato PJ EMPRESARIAL e clicou no botão "PESQUISAR"    ${MOVTRANFGRUPOFAMILIARMASSAPJ02[1]}  ${MOVTRANFGRUPOFAMILIARMASSAPJ02[2]}
    E     Validou a apresentação de somente Beneficiários TITULARES
    E     Clicou em um beneficiário TITULAR e clicou no botão "SELECIONAR"
    E     Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Transferência", "Contrato de Destino", "Produto Assistencial", "Produto(s) Acessório", "Tipo Transferência", "Motivo", botões "APLICAR", "LIMPAR", outra tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão onde o beneficiário que será excluido está vinculado, com as colunas "Contrato de Destino", "Titular", "Transferência" desabilitado, "Matricula", "Motivo", "Assistencial" e "Produto(s) Acessório" desabilitados 5045
    E     Selecionou um Contrato PJ ADESÃO  ${MOVTRANFGRUPOFAMILIARMASSAPJ01[2]}
    E     Validou a alteração habilitando os campos "Trnasferência" com as opções EM 24 HORAS, 1° DIA DO MÊS SEGUINTE, ÚLTIMO DIA DO MÊS, ESPECIFICAR DATA, "Assistencial" com os Produtos do Contrato PJ ADESÃO, "Produto(s) Acessório" vazio
    E     Selecionou no campo "Transferência" a opção 1° DIA DO MÊS SEGUINTE, "Assistencial" igual a 5051
    E     Validou a apresentação dos registros no campo "Produto(s) Acessório"
    E     Clicou o botão "SALVAR"
    E     Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, com beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"  ${MOVTRANFGRUPOFAMILIARMASSAPJ01[1]}
    Quando     Clicar o menu "GERAR MOVIMENTAÇÕES CADASTRAIS"
    E     Clicar no botão "SIM" da modal "Confirmação" com a mensagem "Confirma geração das movimentações cadastrais?"
    Então     O Canal do Contratante deve atualizar a tela "Movimentação em Massa" + Nome, com a mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação.", "Situação" igual a CONCLUIDA, com beneficiários no painel tabela "Beneficiários - Transferência de Grupo Familiar" e no painel "Movimentações Cadastrais" DOIS registros com "Situação" igual a EM ANDAMENTO    ${MOVTRANFGRUPOFAMILIARMASSAPJ01[1]}
    E     Mostrar que ao atualizar a tela é apresentada a mensagem "Atenção! Há movimentações que ainda não foram encaminhadas para aprovação."  ${MOVTRANFGRUPOFAMILIARMASSAPJ01[2]}


Teste de Regressão 03 - TRANSFERÊNCIA GRUPO FAMILIAR - Gerar Movimentação de Transferência de Beneficiários em Massa (CONTRATO CAEPF ADESÃO e CONTRATO CAEPF EMPRESARIAL)
    [Documentation]  TRANSFERÊNCIA GRUPO FAMILIAR - Gerar Movimentação de Transferência de Beneficiários em Massa (CONTRATO CAEPF ADESÃO e CONTRATO CAEPF EMPRESARIAL)
    Dado     Usuário logou no sistema 
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários   @{MOVTRANFGRUPOFAMILIARMASSACAEPF01}
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários  @{MOVTRANFGRUPOFAMILIARMASSACAEPF02}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Transferência de Grupo Familiar"
    E     O Usuário logou no sistema Canal do Contratante
    E     Clicou no menu Movimentação Cadastral > Movimentar em Massa    
    E     Clicou no menu Ações > Solicitar Movimentação em Massa
    E     Preencheu o campo "Nome", selecionou no campo "Tipo de Movimentação" a opção TRANSFERÊNCIA DE GRUPO FAMILIAR e clicou no botão "SALVAR"  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01[1]}
    E     Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, sem beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"   ${MOVTRANFGRUPOFAMILIARMASSACAEPF01[1]}
    E     Clicou o botão "DEFINIR BENEFICIÁRIOS"
    E     Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO"
    E     Clicou botão "+ ADICIONAR BENEFICIÁRIOS"
    E     Validou a apresentação da modal "Pesquisa Beneficiários"
    E     Preencheu o campo "Nome / Razão Social" do Contrato CAEPF ADESÃO e clicou no botão "PESQUISAR"  @{MOVTRANFGRUPOFAMILIARMASSACAEPF01}
    E     Validou a apresentação de somente Beneficiários TITULARES
    E     Clicou em um beneficiário TITULAR e clicou no botão "SELECIONAR"
    E     Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Transferência", "Contrato de Destino", "Produto Assistencial", "Produto(s) Acessório", "Tipo Transferência", "Motivo", botões "APLICAR", "LIMPAR", outra tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão onde o beneficiário que será excluido está vinculado, com as colunas "Contrato de Destino", "Titular", "Transferência" desabilitado, "Matricula", "Motivo", "Assistencial" e "Produto(s) Acessório" desabilitados  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01[1]}
    E     Selecionou um Contrato CAEPF EMPRESARIAL  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02[2]}
    E     Validou a alteração habilitando os campos "Trnasferência" com as opções EM 24 HORAS, 1° DIA DO MÊS SEGUINTE, ÚLTIMO DIA DO MÊS, ESPECIFICAR DATA, "Assistencial" com os Produtos do CAEPF EMPRESARIAL, "Produto(s) Acessório" vazio
    E     Selecionou no campo "Transferência" a opção 1° DIA DO MÊS SEGUINTE, "Assistencial" igual a 5045
    E     Validou a apresentação dos registros no campo "Produto(s) Acessório"
    E     Preencheu o campo "Nome / Razão Social" do Contrato CAEPF EMPRESARIAL e clicou no botão "PESQUISAR"  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02[1]}  ${MOVTRANFGRUPOFAMILIARMASSACAEPF02[2]}
    E     Validou a apresentação de somente Beneficiários TITULARES
    E     Clicou em um beneficiário TITULAR e clicou no botão "SELECIONAR"
    E     Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Transferência", "Contrato de Destino", "Produto Assistencial", "Produto(s) Acessório", "Tipo Transferência", "Motivo", botões "APLICAR", "LIMPAR", outra tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão onde o beneficiário que será excluido está vinculado, com as colunas "Contrato de Destino", "Titular", "Transferência" desabilitado, "Matricula", "Motivo", "Assistencial" e "Produto(s) Acessório" desabilitados 5045
    E     Selecionou um Contrato CAEPF ADESÃO  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01[2]}
    E     Validou a alteração habilitando os campos "Trnasferência" com as opções EM 24 HORAS, 1° DIA DO MÊS SEGUINTE, ÚLTIMO DIA DO MÊS, ESPECIFICAR DATA, "Assistencial" com os Produtos do Contrato CAEPF ADESÃO, "Produto(s) Acessório" vazio
    E     Selecionou no campo "Transferência" a opção 1° DIA DO MÊS SEGUINTE, "Assistencial" igual a 5051
    E     Validou a apresentação dos registros no campo "Produto(s) Acessório"
    E     Clicou o botão "SALVAR"
    E     Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, com beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01[1]}
    Quando     Clicar o menu "GERAR MOVIMENTAÇÕES CADASTRAIS"
    E     Clicar no botão "SIM" da modal "Confirmação" com a mensagem "Confirma geração das movimentações cadastrais?"
    Então     O Canal do Contratante deve atualizar a tela "Movimentação em Massa" + Nome, com a mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação.", "Situação" igual a CONCLUIDA, com beneficiários no painel tabela "Beneficiários - Transferência de Grupo Familiar" e no painel "Movimentações Cadastrais" DOIS registros com "Situação" igual a EM ANDAMENTO  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01[1]}
    E     Mostrar que ao atualizar a tela é apresentada a mensagem "Atenção! Há movimentações que ainda não foram encaminhadas para aprovação."  ${MOVTRANFGRUPOFAMILIARMASSACAEPF01[2]}