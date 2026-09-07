*** Settings ***
Resource    ../../main.resource

Suite Setup      Instancia Variaveis    C02
Test Setup       Comum.Abrir Nav  
Test Teardown    Comum.Fechar Nav

*** Variables ***

*** Test Cases ***
Teste de Regressão 01 - EXCLUSÃO CANAL - Gerar Movimentação de Exclusão de Beneficiários em Massa (CONTRATO PF)
    [Documentation]  EXCLUSÃO CANAL - Gerar Movimentação de Exclusão de Beneficiários em Massa (CONTRATO PF)
    Dado  Usuário logou no sistema 
    E     Integrou um Contrato, com "Tipo da Conta" igual a CLIENTE (PF), com "Tipo de Contratação" igual a INDIVIDUAL FAMILIAR, com Beneficiários  @{MOVCADASTRALEXCPF01}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicou no menu Movimentação Cadastral > Movimentar em Massa
    E     Clicou no menu Ações > Solicitar Movimentação em Massa
    E     Gerou registro, com campo "Tipo de Movimentação" igual a EXCLUSÃO DE BENEFICIÁRIOS  ${MOVCADASTRALEXCPF01[1]}
    E     Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, sem beneficiários no painel "Beneficiários - Exclusão"  ${MOVCADASTRALEXCPF01[1]}

    E     Clicou o botão "DEFINIR BENEFICIÁRIOS"
    E     Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", com as opções "SELECIONAR" e "LISTA DE CPF"
    E     Clicou no menu "SELECIONAR"
    E     Validou a apresentação da modal "Pesquisa Beneficiários"
    E     Preencheu o campo "Nome / Razão Social" do Contrato PF  ${MOVCADASTRALEXCPF01[1]}
    E     Clicar no botão "PESQUISAR"    
    E     Validou a apresentação da mensagem "Não foram localizados Beneficiários para os parâmetros informados na pesquisa."

    E     Clicou no botão "CANCELAR"
    E     Clicou no menu "LISTA DE CPF"
    E     Validou a apresentação da modal "Inserir Beneficiários", com uma tabela com as colunas CPF, "E-mail", "Telefone", os botões "INSERIR", "LIMPAR" e "CANCELAR"
    Quando    Preencher o CPF de um DEPENDENTE existente no Contrato PF e clicar no botão "INSERIR"  ${MOVCADASTRALEXCPF01[46]}
    Então     O Canal do Contratante deve apresentar a mensagem de erro "Beneficiário não encontrado!


Teste de Regressão 02 - EXCLUSÃO CANAL - GERAR UMA MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIOS EM MASSA (CONTRATO PJ)
    [Documentation]  EXCLUSÃO CANAL - GERAR UMA MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIOS EM MASSA (CONTRATO PJ)
    Dado  Usuário logou no sistema
    E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários   @{MOVCADASTRALEXCPJ02}
    E     Integrou um Contrato PJ, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários  @{MOVCADASTRALEXCPJ01}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicou no menu Movimentação Cadastral > Movimentar em Massa
    E     Clicou no menu Ações > Solicitar Movimentação em Massa
    E     Gerou registro, com campo "Tipo de Movimentação" igual a EXCLUSÃO DE BENEFICIÁRIOS   ${MOVCADASTRALEXCPJ02[1]}
    E     Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, sem beneficiários no painel "Beneficiários - Exclusão"  ${MOVCADASTRALEXCPJ02[1]}

    E     Clicou o botão "DEFINIR BENEFICIÁRIOS"
    E     Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", com as opções "SELECIONAR" e "LISTA DE CPF"
    E     Clicou no menu "SELECIONAR"
    E     Validou a apresentação da modal "Pesquisa Beneficiários"
    E     Preencheu o campo "Nome / Razão Social" do Contrato PJ ADESÃO  @{MOVCADASTRALEXCPJ02}
    E     Clicar no botão "PESQUISAR"
    E     Clicou em um beneficiário DEPENDENTE e um TITULAR, com dependentes retornado na pesquisa e clicou no botão "SELECIONAR"

    E     Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Exclusão", "Motivo", "Submotivo", botões "APLICAR", "LIMPAR", outra tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão (Contrato PJ Adesão) onde o beneficiário que será excluido está vinculado, com as colunas "Beneficiário", "Motivo" com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Submotivo", "Contato", com os campos "E-mail" e "Telefone"
    E     Clicou no menu "LISTA DE CPF"
    E     Validou a apresentação da modal "Inserir Beneficiários", com uma tabela com as colunas CPF, "E-mail", "Telefone", os botões "INSERIR", "LIMPAR" e "CANCELAR"
    E     Preencheu um CPF de um DEPENDENTE existente e um CPF de um TITULAR, com dependentes existente no Contrato PJ Empresarial, preencheu as colunas "E-mail", "Telefone" e clicou no botão "INSERIR"  @{MOVCADASTRALEXCPJ01}  

    E     Validou a atualização da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Exclusão", "Motivo", "Submotivo", botões "APLICAR", "LIMPAR", uma tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão (Contrato PJ Adesão) e uma tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão (Contrato PJ Empresarial) onde os beneficiários que serão excluidos estão vinculados, com as colunas "Beneficiário", "Motivo" com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRES, 44 - ÓBITO, "Submotivo", "Contato", com os campos "E-mail" e "Telefone"

    E     Preencheu um Beneficiário o "Motivo" igual a 41 - ROMPIMENTO DO CONTRATO e preencheu demais campos  @{MOVCADASTRALEXCPJ01}
    E     Preencheu um Beneficiário o "Motivo" igual a 42 - DESLIGAMENTO DA EMPRES, preencheu o questionário de inativo com as respostas NÃO, "Situação Plano Inativo" igual a NÃO POSSUI DIREITO DA CONTINUIDADE DO PLANO e preencheu demais campos
    E     Preencheu um Beneficiário o "Motivo" igual a 42 - DESLIGAMENTO DA EMPRES, preencheu o questionário de inativo com as respostas SIM, NÃO, "DEMISSÃO/EXONERAÇÃO SEM JUSTA CAUSA", "Situação Plano Inativo" igual a POSSUI DIREITO DA CONTINUIDADE DO PLANO, NÃO e preencheu demais campos  @{MOVCADASTRALEXCPJ01}
    E     Preencheu um Beneficiário o "Motivo" igual a 44 - ÓBITO, "Data de Óbito", anexou arquivo e preencheu demais campos  @{MOVCADASTRALEXCPJ01}

    E     Clicou botão "SALVAR"
    E     Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, com beneficiários no painel "Beneficiários - Exclusão"  ${MOVCADASTRALEXCPJ02[1]}
    Quando    Clicar o menu "GERAR MOVIMENTAÇÕES CADASTRAIS"
    E     Clicar no botão "SIM" da modal "Confirmação" com a mensagem "Confirma geração das movimentações cadastrais?"
    Então     O Canal do Contratante deve atualizar a tela "Movimentação em Massa" + Nome, com a mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação.", "Situação" igual a CONCLUIDA, com beneficiários no painel tabela "Beneficiários - Exclusão" e no painel "Movimentações Cadastrais" DOIS registros com "Situação" igual a EM ANDAMENTO  ${MOVCADASTRALEXCPJ02[1]}
    E     Mostrar que ao atualizar a tela é apresentada a mensagem "Atenção! Há movimentações que ainda não foram encaminhadas para aprovação."  ${MOVCADASTRALEXCPJ02[2]}



Teste de Regressão 03 - EXCLUSÃO CANAL - GERAR UMA MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIOS EM MASSA (CONTRATO CAEPF)
    [Documentation]  EXCLUSÃO CANAL - GERAR UMA MOV CADASTRAL DE EXCLUSÃO DE BENEFICIÁRIOS EM MASSA (CONTRATO CAEPF)
    Dado  Usuário logou no sistema
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO POR ADESÃO (5050, 5051), com Beneficiários   @{MOVCADASTRALEXCCAEPF02}
    E     Integrou um Contrato CAEPF, com "Tipo de Contratação" igual a COLETIVO EMPRESARIAL (5045, 5048), com Beneficiários  @{MOVCADASTRALEXCCAEPF01}
    E     Acessou o módulo Todos > Usuário Canal do Contratante
    E     Preencheu o campo "Login" e clicou no botão "PESQUISAR"
    E     Acessou o usuário desejado
    E     Vinculou o Contrato integrado no painel "Contrato"
    E     Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário"

    E     O Usuário logou no sistema Canal do Contratante
    E     Clicou no menu Movimentação Cadastral > Movimentar em Massa
    E     Clicou no menu Ações > Solicitar Movimentação em Massa
    E     Gerou registro, com campo "Tipo de Movimentação" igual a EXCLUSÃO DE BENEFICIÁRIOS   ${MOVCADASTRALEXCCAEPF02[1]}
    E     Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, sem beneficiários no painel "Beneficiários - Exclusão"  ${MOVCADASTRALEXCCAEPF02[1]}

    E     Clicou o botão "DEFINIR BENEFICIÁRIOS"
    E     Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", com as opções "SELECIONAR" e "LISTA DE CPF"
    E     Clicou no menu "SELECIONAR"
    E     Validou a apresentação da modal "Pesquisa Beneficiários"
    E     Preencheu o campo "Nome / Razão Social" do Contrato CAEPF ADESÃO e clicou no botão "PESQUISAR"  @{MOVCADASTRALEXCCAEPF02}
    E     Clicou em um beneficiário DEPENDENTE e um TITULAR, com dependentes retornado na pesquisa e clicou no botão "SELECIONAR"

    E     Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Exclusão", "Motivo", "Submotivo", botões "APLICAR", "LIMPAR", outra tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão (Contrato PJ Adesão) onde o beneficiário que será excluido está vinculado, com as colunas "Beneficiário", "Motivo" com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Submotivo", "Contato", com os campos "E-mail" e "Telefone"
    E     Clicou no menu "LISTA DE CPF"
    E     Validou a apresentação da modal "Inserir Beneficiários", com uma tabela com as colunas CPF, "E-mail", "Telefone", os botões "INSERIR", "LIMPAR" e "CANCELAR"
    E     Preencheu um CPF de um DEPENDENTE existente e um CPF de um TITULAR, com dependentes existente no Contrato PJ Empresarial, preencheu as colunas "E-mail", "Telefone" e clicou no botão "INSERIR"  @{MOVCADASTRALEXCCAEPF01}  

    E     Validou a atualização da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Exclusão", "Motivo", "Submotivo", botões "APLICAR", "LIMPAR", uma tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão (Contrato PJ Adesão) e uma tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão (Contrato PJ Empresarial) onde os beneficiários que serão excluidos estão vinculados, com as colunas "Beneficiário", "Motivo" com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRES, 44 - ÓBITO, "Submotivo", "Contato", com os campos "E-mail" e "Telefone"

    E     Preencheu um Beneficiário o "Motivo" igual a 41 - ROMPIMENTO DO CONTRATO e preencheu demais campos  @{MOVCADASTRALEXCCAEPF01}
    E     Preencheu um Beneficiário o "Motivo" igual a 42 - DESLIGAMENTO DA EMPRES, preencheu o questionário de inativo com as respostas NÃO, "Situação Plano Inativo" igual a NÃO POSSUI DIREITO DA CONTINUIDADE DO PLANO e preencheu demais campos
    E     Preencheu um Beneficiário o "Motivo" igual a 42 - DESLIGAMENTO DA EMPRES, preencheu o questionário de inativo com as respostas SIM, NÃO, "DEMISSÃO/EXONERAÇÃO SEM JUSTA CAUSA", "Situação Plano Inativo" igual a POSSUI DIREITO DA CONTINUIDADE DO PLANO, NÃO e preencheu demais campos  @{MOVCADASTRALEXCCAEPF01}
    E     Preencheu um Beneficiário o "Motivo" igual a 44 - ÓBITO, "Data de Óbito", anexou arquivo e preencheu demais campos  @{MOVCADASTRALEXCCAEPF01}

    E     Clicou botão "SALVAR"
    E     Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, com beneficiários no painel "Beneficiários - Exclusão"  ${MOVCADASTRALEXCCAEPF02[1]}
    Quando    Clicar o menu "GERAR MOVIMENTAÇÕES CADASTRAIS"
    E     Clicar no botão "SIM" da modal "Confirmação" com a mensagem "Confirma geração das movimentações cadastrais?"
    Então     O Canal do Contratante deve atualizar a tela "Movimentação em Massa" + Nome, com a mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação.", "Situação" igual a CONCLUIDA, com beneficiários no painel tabela "Beneficiários - Exclusão" e no painel "Movimentações Cadastrais" DOIS registros com "Situação" igual a EM ANDAMENTO  ${MOVCADASTRALEXCCAEPF02[1]}
    E     Mostrar que ao atualizar a tela é apresentada a mensagem "Atenção! Há movimentações que ainda não foram encaminhadas para aprovação."  ${MOVCADASTRALEXCCAEPF02[2]}