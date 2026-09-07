*** Settings ***
Library     DebugLibrary
Resource    PO/LoginCanalContratante.robot
Resource    PO/SolicitacaoPortabilidadeCanal.robot
Resource    PO/ExclusaoBeneficiariosMassa.robot
Resource    PO/TransfGrupoFamiliarCanal.robot
Resource    PO/InclusaoBeneficiarioCanal.robot
Resource    PO/ImportacaoBeneficiarioCanal.robot
Resource    PO/ExclusaoBeneficiarioCanal.robot
Resource    PO/ExclusaoRN412Canal.robot
Resource    PO/MudancaProdCanal.robot
Resource    PO/MovTransfGrupoFamiliar.robot
Resource    ../../utils/Comum.robot

*** Variables ***
${USER_PWD_CANAL_CONTRATANTE} =  ${CANAL_PASSWORD}

${USER_NOME_CANAL_CONTRATANTE} =  ${CANAL_USER}


*** Keywords ***
O Usuário logou no sistema Canal do Contratante
    Comum.Abrir Canal do Contratante
    LoginCanalContratante.Verificar se estou na pagina de login do Canal do Contratante
    LoginCanalContratante.Logar no Canal do Contratante  ${USER_PWD_CANAL_CONTRATANTE}  ${USER_NOME_CANAL_CONTRATANTE}

Clicar no menu Portabilidade > Solicitar Portabilidade
    SolicitacaoPortabilidadeCanal.Clicou no menu Portabilidade > Solicitar Portabilidade

Clicar no menu Ações > Nova Solicitação de Portabilidade
    SolicitacaoPortabilidadeCanal.Clicou no menu Ações > Nova Solicitação de Portabilidade

Selecionar o Contrato e clicou no botão "SALVAR"
    SolicitacaoPortabilidadeCanal.Selecionou o Contrato e clicou no botão "SALVAR"

Clicar no botão "ADICIONAR" painel Pessoa
    SolicitacaoPortabilidadeCanal.Clicou no botão "ADICIONAR" painel Pessoa

Validar a apresentação da tela "Solicitação de Portabilidade", com "Situação" igual a RASCUNHO, sem pessoas na tabela "Pessoas"
    SolicitacaoPortabilidade.Validou a apresentação da tela "Solicitação de Portabilidade", com "Situação" igual a RASCUNHO, sem pessoas na tabela "Pessoas" 

Cadastrar duas Pessoas TITULAR e DEPENDENTE
    SolicitacaoPortabilidadeCanal.Cadastrou duas Pessoa TITULAR e DEPENDENTE

Anexar um arquivo no painel Documentos
    SolicitacaoPortabilidadeCanal.Anexou um arquivo no painel Documentos

Clicar no menu "ENCAMINHAR PARA VALIDAÇÃO"
    SolicitacaoPortabilidadeCanal.Clicou o menu "ENCAMINHAR PARA VALIDAÇÃO"

Clicar o botão "SIM" da modal de Confirmação com a mensagem "Deseja Encaminhar para Validação?"
    SolicitacaoPortabilidadeCanal.Clicou o botão "SIM" da modal de Confirmação com a mensagem "Deseja Encaminhar para Validação?"

Apresentar a mensagem "A solicitação de portabilidade foi encaminhada para a validação da documentação enviada. Em breve você receberá um retorno de sua solicitação."
    SolicitacaoPortabilidadeCanal.Apresentou a mensagem "A solicitação de portabilidade foi encaminhada para a validação da documentação enviada. Em breve você receberá um retorno de sua solicitação."

Alterar a "Situação" para AGUARDANDO VALIDAÇÃO
    SolicitacaoPortabilidadeCanal.Alterou a "Situação" para AGUARDANDO VALIDAÇÃO

Acessar a Solicitação de Portabilidade pelo Canal do Contratante
    O Usuário logou no sistema Canal do Contratante
    SolicitacaoPortabilidadeCanal.Acessou a Solicitação de Portabilidade pelo Canal do Contratante

Clicar no menu "EMITIR PROPOSTA DE ADESÃO DE PORTABILIDADE"
    SolicitacaoPortabilidadeCanal.Clicou no menu "EMITIR PROPOSTA DE ADESÃO PORTABILIDADE"

Fechar a modal aberta
    SolicitacaoPortabilidadeCanal.Fechou a modal aberta

Clicar no menu "REALIZAR UPLOAD DE PROPOSTA DE ADESÃO DE PORTABILIDADE"
    SolicitacaoPortabilidadeCanal.Clicou o menu "REALIZAR UPLOAD DE PROPOSTA DE ADESÃO DE PORTABILIDADE"

Anexar e gravar o documento
    SolicitacaoPortabilidadeCanal.Anexou e gravou o documento

Apresentar a mensagem "${MENSAGEM_ANALISE_ASSINATURA}", alterar a "Situação" para AGUARDANDO VALIDAÇÃO DE ASSINATURA DA PROPOSTA DE ADESÃO e no campo "${PROPOSTA_ADESAO}" incluiu um link "Baixar"
    SolicitacaoPortabilidadeCanal.Apresentou a mensagem "${MENSAGEM_ANALISE_ASSINATURA}", alterou a "Situação" para AGUARDANDO VALIDAÇÃO DE ASSINATURA DA PROPOSTA DE ADESÃO e no campo "${PROPOSTA_ADESAO}" incluiu um link "Baixar"

Acessar a Solicitação de Portabilidade pelo Canal do Contratante"
    O Usuário logou no sistema Canal do Contratante
    Clicar no menu Portabilidade > Solicitar Portabilidade

Canal do Contratante deve atualizar a tela Solicitação de Portabilidade, com situação igual a APROVADA  
    SolicitacaoPortabilidadeCanal.O Canal do Contratante deve atualizar a tela Solicitação de Portabilidade, com situação igual a APROVADA

Clicar no menu Movimentação Cadastral > Movimentar em Massa 
    ExclusaoBeneficiariosMassa.Clicou no menu Movimentação Cadastral > Movimentar em Massa

Clicar no menu Ações > Solicitar Movimentação em Massa
    ExclusaoBeneficiariosMassa.Clicou no menu Ações > Solicitar Movimentação em Massa

Gerar um registro, com campo "Tipo de Movimentação" igual a EXCLUSÃO DE BENEFICIÁRIOS
    [Arguments]  ${arg1}
    ExclusaoBeneficiariosMassa.Gerou registro, com campo "Tipo de Movimentação" igual a EXCLUSÃO DE BENEFICIÁRIOS    ${arg1}

Clicar o botão "DEFINIR BENEFICIÁRIOS"
    ExclusaoBeneficiariosMassa.Clicou o botão "DEFINIR BENEFICIÁRIOS"

Clicar o botão "+ ADICIONAR BENEFICIÁRIOS"
    ExclusaoBeneficiariosMassa.Clicou o botão "+ ADICIONAR BENEFICIÁRIOS"

Clicar a opção "LISTA DE CPF"
    ExclusaoBeneficiariosMassa.Clicou a opção "LISTA DE CPF"

Preencher um CPF de um DEPENDENTE existente e um CPF de um TITULAR, com dependentes existente no Contrato PJ Empresarial, preencheu as colunas "E-mail", "Telefone" e clicou no botão "INSERIR"
    [Arguments]  @{arg1}
    ExclusaoBeneficiariosMassa.Preencheu um CPF de um DEPENDENTE existente e um CPF de um TITULAR, com dependentes existente no Contrato PJ Empresarial, preencheu as colunas "E-mail", "Telefone" e clicou no botão "INSERIR"  @{arg1}

Validar apresentação dos Beneficiários selecionados e seus dependentes
    [Arguments]  @{arg1}
    ExclusaoBeneficiariosMassa.Validou apresentação dos Beneficiários selecionados e seus dependentes    ${arg1[39]}  ${arg1[47]}  ${arg1[63]}

Preencher os campos "Motivo", "Submotivo", telefone e email de "Contato" e clicou no botão "SALVAR"
    [Arguments]  @{arg1}
    ExclusaoBeneficiariosMassa.Preencheu os campos "Motivo", "Submotivo", telefone e email de "Contato" e clicou no botão "SALVAR"    ${arg1[8]}

Apresentar a tela Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais
    [Arguments]  @{arg1}
    ExclusaoBeneficiariosMassa.Apresentou a tela Movimentação em Massa, com a "situação" igual a PENDENTE, os Beneficiários selecionados e sem Movimentações Cadastrais     ${arg1}

Clicou o menu "GERAR MOVIMENTAÇÕES CADASTRAIS"
    ExclusaoBeneficiariosMassa.Clicar o menu "GERAR MOVIMENTAÇÕES CADASTRAIS"

Clicou o botão "SIM" na modal de Confirmação "Confirma geração das movimentações cadastrais?"
    ExclusaoBeneficiariosMassa.Clicar o botão "SIM" na modal de Confirmação "Confirma geração das movimentações cadastrais?"

O Canal do Contratante deve atualizar a tela de Movimentações Cadastrais com:
    ExclusaoBeneficiariosMassa.A Mensagem: "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação."
    ExclusaoBeneficiariosMassa.Com botão "ENCAMINHAR MOVIMENTAÇÕES PARA A APROVAÇÃO"
    ExclusaoBeneficiariosMassa.A "situação" igual a CONCLUIDA
    ExclusaoBeneficiariosMassa.O Painel de "Movimentações Cadastrais", com um registro na "situação" igual a EM ANDAMENTO

Preencher o campo "Nome", selecionou no campo "Tipo de Movimentação" a opção TRANSFERÊNCIA DE GRUPO FAMILIAR e clicou no botão "SALVAR"
    TransfGrupoFamiliarCanal.Preencheu o campo "Nome", selecionou no campo "Tipo de Movimentação" a opção TRANSFERÊNCIA DE GRUPO FAMILIAR e clicou no botão "SALVAR"

Validar a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, sem beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"
    TransfGrupoFamiliarCanal.Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, sem beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"

Validar a apresentação da modal "Pesquisa Beneficiários"
    TransfGrupoFamiliarCanal.Validou a apresentação da modal "Pesquisa Beneficiários"

Clicar botão "+ ADICIONAR BENEFICIÁRIOS"
    TransfGrupoFamiliarCanal.Clicou botão "+ ADICIONAR BENEFICIÁRIOS"
    
Preencheu o campo "Nome / Razão Social" do Contrato PF
    [Arguments]   ${arg1}
    TransfGrupoFamiliarCanal.Preencher o campo "Nome / Razão Social" do Contrato PF   ${arg1}

Clicou no botão "PESQUISAR"
    TransfGrupoFamiliarCanal.Clicar no botão "PESQUISAR"

Canal do Contratante deve apresentar a mensagem "Não foram localizados Beneficiários para os parâmetros informados na pesquisa."
    TransfGrupoFamiliarCanal.O Canal do Contratante deve apresentar a mensagem "Não foram localizados Beneficiários para os parâmetros informados na pesquisa."

Preencher o campo "Nome / Razão Social" do Contrato PJ ADESÃO
    TransfGrupoFamiliarCanal.Preencheu o campo "Nome / Razão Social" do Contrato PJ ADESÃO

Validar a apresentação de somente Beneficiários TITULARES
    TransfGrupoFamiliarCanal.Validou a apresentação de somente Beneficiários TITULARES

Clicar em um beneficiário TITULAR e clicou no botão "SELECIONAR"
    TransfGrupoFamiliarCanal.Clicou em um beneficiário TITULAR e clicou no botão "SELECIONAR"

Validar a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Transferência", "Contrato de Destino", "Produto Assistencial", "Produto(s) Acessório", "Tipo Transferência", "Motivo", botões "APLICAR", "LIMPAR", outra tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão onde o beneficiário que será excluido está vinculado, com as colunas "Contrato de Destino", "Titular", "Transferência" desabilitado, "Matricula", "Motivo", "Assistencial" e "Produto(s) Acessório" desabilitados
    TransfGrupoFamiliarCanal.Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Transferência", "Contrato de Destino", "Produto Assistencial", "Produto(s) Acessório", "Tipo Transferência", "Motivo", botões "APLICAR", "LIMPAR", outra tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão onde o beneficiário que será excluido está vinculado, com as colunas "Contrato de Destino", "Titular", "Transferência" desabilitado, "Matricula", "Motivo", "Assistencial" e "Produto(s) Acessório" desabilitados

Selecionar um Contrato PJ EMPRESARIAL
    TransfGrupoFamiliarCanal.Selecionou um Contrato PJ EMPRESARIAL

Validar a alteração habilitando os campos "Trnasferência" com as opções EM 24 HORAS, 1° DIA DO MÊS SEGUINTE, ÚLTIMO DIA DO MÊS, ESPECIFICAR DATA, "Assistencial" com os Produtos do Contrato PJ EMPRESARIAL, "Produto(s) Acessório" vazio
    TransfGrupoFamiliarCanal.Validou a alteração habilitando os campos "Trnasferência" com as opções EM 24 HORAS, 1° DIA DO MÊS SEGUINTE, ÚLTIMO DIA DO MÊS, ESPECIFICAR DATA, "Assistencial" com os Produtos do Contrato PJ EMPRESARIAL, "Produto(s) Acessório" vazio

Validar a apresentação dos registros no campo "Produto(s) Acessório"
    TransfGrupoFamiliarCanal.Validou a apresentação dos registros no campo "Produto(s) Acessório"

PreencheR o campo "Nome / Razão Social" do Contrato PJ EMPRESARIAL e clicou no botão "PESQUISAR"
    TransfGrupoFamiliarCanal.Preencheu o campo "Nome / Razão Social" do Contrato PJ EMPRESARIAL e clicou no botão "PESQUISAR"

Selecionar um Contrato PJ ADESÃO
    TransfGrupoFamiliarCanal.Selecionou um Contrato PJ ADESÃO

Validar a alteração habilitando os campos "Trnasferência" com as opções EM 24 HORAS, 1° DIA DO MÊS SEGUINTE, ÚLTIMO DIA DO MÊS, ESPECIFICAR DATA, "Assistencial" com os Produtos do Contrato PJ ADESÃO, "Produto(s) Acessório" vazio
    TransfGrupoFamiliarCanal.Validou a alteração habilitando os campos "Trnasferência" com as opções EM 24 HORAS, 1° DIA DO MÊS SEGUINTE, ÚLTIMO DIA DO MÊS, ESPECIFICAR DATA, "Assistencial" com os Produtos do Contrato PJ ADESÃO, "Produto(s) Acessório" vazio

Clicar o botão "SALVAR"
    TransfGrupoFamiliarCanal.Clicou o botão "SALVAR"

Validar a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, com beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"
    TransfGrupoFamiliarCanal.Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, com beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"

Clicou no botão "SIM" da modal "Confirmação" com a mensagem "Confirma geração das movimentações cadastrais?"
    TransfGrupoFamiliarCanal.Clicar no botão "SIM" da modal "Confirmação" com a mensagem "Confirma geração das movimentações cadastrais?"

Canal do Contratante deve atualizar a tela "Movimentação em Massa" + Nome, com a mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação.", "Situação" igual a CONCLUIDA, com beneficiários no painel tabela "Beneficiários - Transferência de Grupo Familiar" e no painel "Movimentações Cadastrais" DOIS registros com "Situação" igual a EM ANDAMENTO
    TransfGrupoFamiliarCanal.O Canal do Contratante deve atualizar a tela "Movimentação em Massa" + Nome, com a mensagem "Movimentações Cadastrais geradas com sucesso! É necessário encaminhar os protocolos para aprovação.", "Situação" igual a CONCLUIDA, com beneficiários no painel tabela "Beneficiários - Transferência de Grupo Familiar" e no painel "Movimentações Cadastrais" DOIS registros com "Situação" igual a EM ANDAMENTO

Mostrou que ao atualizar a tela é apresentada a mensagem "Atenção! Há movimentações que ainda não foram encaminhadas para aprovação."
    TransfGrupoFamiliarCanal.Mostrar que ao atualizar a tela é apresentada a mensagem "Atenção! Há movimentações que ainda não foram encaminhadas para aprovação."

Preencher o campo "Nome / Razão Social" do Contrato CAEPF ADESÃO e clicou no botão "PESQUISAR"
    TransfGrupoFamiliarCanal.Preencheu o campo "Nome / Razão Social" do Contrato CAEPF ADESÃO e clicou no botão "PESQUISAR"

Selecionar um Contrato CAEPF EMPRESARIAL
    TransfGrupoFamiliarCanal.Selecionou um Contrato CAEPF EMPRESARIAL

Preencher o campo "Nome / Razão Social" do Contrato CAEPF EMPRESARIAL e clicou no botão "PESQUISAR"
    TransfGrupoFamiliarCanal.Preencheu o campo "Nome / Razão Social" do Contrato CAEPF EMPRESARIAL e clicou no botão "PESQUISAR"

Selecionar um Contrato CAEPF ADESÃO
    TransfGrupoFamiliarCanal.Selecionou um Contrato CAEPF ADESÃO

Validar a alteração habilitando os campos "Trnasferência" com as opções EM 24 HORAS, 1° DIA DO MÊS SEGUINTE, ÚLTIMO DIA DO MÊS, ESPECIFICAR DATA, "Assistencial" com os Produtos do Contrato CAEPF ADESÃO, "Produto(s) Acessório" vazio
    TransfGrupoFamiliarCanal.Validou a alteração habilitando os campos "Trnasferência" com as opções EM 24 HORAS, 1° DIA DO MÊS SEGUINTE, ÚLTIMO DIA DO MÊS, ESPECIFICAR DATA, "Assistencial" com os Produtos do Contrato CAEPF ADESÃO, "Produto(s) Acessório" vazio

Validar a alteração habilitando os campos "Trnasferência" com as opções EM 24 HORAS, 1° DIA DO MÊS SEGUINTE, ÚLTIMO DIA DO MÊS, ESPECIFICAR DATA, "Assistencial" com os Produtos do Contrato CAEPF EMPRESARIAL, "Produto(s) Acessório" vazio
    TransfGrupoFamiliarCanal.Validou a alteração habilitando os campos "Trnasferência" com as opções EM 24 HORAS, 1° DIA DO MÊS SEGUINTE, ÚLTIMO DIA DO MÊS, ESPECIFICAR DATA, "Assistencial" com os Produtos do Contrato CAEPF EMPRESARIAL, "Produto(s) Acessório" vazio

Clicar o menu Movimentação Cadastral > Movimentar Beneficiários
    InclusaoBeneficiarioCanal.Clicar no menu Movimentação Cadastral > Movimentar Beneficiários

Clicar no menu Ações > Solicitar Movimentação
    InclusaoBeneficiarioCanal.Clicou no menu Ações > Solicitar Movimentação

selecionar o Contrato, no campo "Tipo de Movimentação" a opção INCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"
    InclusaoBeneficiarioCanal.Selecionou o Contrato, no campo "Tipo de Movimentação" a opção INCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"

Cadastrar 1 (UM) Beneficiário TITULAR, "Início vigência" igual a EM 24 HORAS
    InclusaoBeneficiarioCanal.Cadastrou 1 (UM) Beneficiário TITULAR, "Início vigência" igual a EM 24 HORAS

Clicar no botão "NOVO TITULAR"
    InclusaoBeneficiarioCanal.Clicou no botão "NOVO TITULAR"

Clicar no botão "NOVO DEPENDENTE"
    InclusaoBeneficiarioCanal.Clicou no botão "NOVO DEPENDENTE"

Clicar no botão "ENCERRAR CADASTRO"
    InclusaoBeneficiarioCanal.Clicou no botão "ENCERRAR CADASTRO"

Cadastrar 1 (UM) Beneficiário DEPENDENTE Conjuge, "Início vigência" igual a 1º DIA DO MÊS SEGUINTE
    InclusaoBeneficiarioCanal.Cadastrou 1 (UM) Beneficiário DEPENDENTE Conjuge, "Início vigência" igual a 1º DIA DO MÊS SEGUINTE

Cadastrar 1 (UM) Beneficiário DEPENDENTE Filho, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS
    InclusaoBeneficiarioCanal.Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 3 DIAS

Cadastrar 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS
    InclusaoBeneficiarioCanal.Cadastrou 1 (UM) Beneficiário DEPENDENTE Filho Adotivo, "Início vigência" igual a ESPECIFICAR DATA, preencher o campo "Data Início Vigência" igual a DATA ATUAL + 9 DIAS

Clicar o menu "ENCAMINHAR PARA APROVAÇÃO"
    InclusaoBeneficiarioCanal.Clicou o menu "ENCAMINHAR PARA APROVAÇÃO"

Preencher o campo "Informações Adicionais" e clicou no botão "SALVAR"
    InclusaoBeneficiarioCanal.Preencheu o campo "Informações Adicionais" e clicou no botão "SALVAR"

Cadastrar Titular com "Data Admissão Empresa" menor que 10 dias da data atual
    InclusaoBeneficiarioCanal.Cadastrou Titular com "Data Admissão Empresa" menor que 10 dias da data atual

Cadastrar Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular menor que 10 dias da data atual
    InclusaoBeneficiarioCanal.Cadastrou Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular menor que 10 dias da data atual

Cadastrar Titular com "Data Admissão Empresa" igual a 10 dias da data atual
    InclusaoBeneficiarioCanal.Cadastrou Titular com "Data Admissão Empresa" igual a 10 dias da data atual

Cadastrar Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular igual a 10 dias da data atual "Data Base de Carência" igual a Data Início Vigência – 301 Dias
    InclusaoBeneficiarioCanal.Cadastrou Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular igual a 10 dias da data atual "Data Base de Carência" igual a Data Início Vigência – 301

Cadastrar Titular com "Data Admissão Empresa" maior que 10 dias da data atual
    InclusaoBeneficiarioCanal.Cadastrou Titular com "Data Admissão Empresa" maior que 10 dias da data atual

Cadastrar Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular maior que 10 dias da data atual
    InclusaoBeneficiarioCanal.Cadastrou Dependente Conjuge e Filho com "Data Admissão Empresa" do Titular maior que 10 dias da data atual

Gerar um arquivo com 10 vidas
    ImportacaoBeneficiarioCanal.Gerou arquivo com 10 vidas

Clicar na aba "Inclusão por Arquivo"
    ImportacaoBeneficiarioCanal.Clicou na aba "Inclusão por Arquivo"
    
Selecionar o arquivo e clicou no botão "SALVAR E FINALIZAR"
    ImportacaoBeneficiarioCanal.Selecionou o arquivo e clicou no botão "SALVAR E FINALIZAR"

Clicar no menu Ações > Confirmar Importação e clicar no botão "SIM" na modal de Confirmação
    ImportacaoBeneficiarioCanal.Clicou no menu Ações > Confirmar Importação e clicar no botão "SIM" na modal de Confirmação

Clicou no link "ID MOV CADASTRAL"
    ImportacaoBeneficiarioCanal.Clicar no link "ID MOV CADASTRAL"


Cadastrar 1 (UM) Pessoa DEPENDENTE Conjuge
    [Arguments]    @{arg1}
    SolicitacaoPortabilidadeCanal.Cadastrou 1 (UM) Pessoa DEPENDENTE Conjuge  @{arg1}

Cadastrar 1 (UM) Pessoa DEPENDENTE Filho
    [Arguments]    @{arg1}
    SolicitacaoPortabilidadeCanal.Cadastrou 1 (UM) Pessoa DEPENDENTE Filho  @{arg1}

Cadastrar 1 (UM) Pessoa TITULAR, com Produtos Asistencial (5050)
    [Arguments]    @{arg1}
    SolicitacaoPortabilidadeCanal.Cadastrou 1 (UM) Pessoa TITULAR, com Produtos Asistencial (5050)  @{arg1}

Cadastrar 1 (UM) Pessoa DEPENDENTE Conjuge, com Produtos Asistencial (5051)
    [Arguments]    @{arg1}
    SolicitacaoPortabilidadeCanal.Cadastrou 1 (UM) Pessoa DEPENDENTE Conjuge, com Produtos Asistencial (5051)  @{arg1}

Cadastrar 1 (UM) Pessoa TITULAR, com Produtos Asistencial (5045)
   [Arguments]    @{arg1}
   SolicitacaoPortabilidadeCanal.Cadastrou 1 (UM) Pessoa TITULAR, com Produtos Asistencial (5045)  @{arg1}

Cadastrar 1 (UM) Pessoa DEPENDENTE Conjuge, com Produtos Asistencial (5048)
    [Arguments]    @{arg1}
    SolicitacaoPortabilidadeCanal.Cadastrou 1 (UM) Pessoa DEPENDENTE Conjuge, com Produtos Asistencial (5048)  @{arg1}


Validar a apresentação da tela "Solicitação de Portabilidade", com "Situação" igual a RASCUNHO, com pessoas na tabela "Pessoas"
    SolicitacaoPortabilidadeCanal.Validou a apresentação da tela "Solicitação de Portabilidade", com "Situação" igual a RASCUNHO, com pessoas na tabela "Pessoas"

# Validar a apresentação da tela "Solicitação de Portabilidade", com a mensagem "A solicitação de portabilidade foi encaminhada para a validação da documentação enviada. Em breve você receberá um retorno de sua solicitação.", com "Situação" da Portabilidade e das Pessoas igual a AGUARDANDO VALIDAÇÃO
#     SolicitacaoPortabilidade.Validou a apresentação da tela "Solicitação de Portabilidade", com a mensagem "A solicitação de portabilidade foi encaminhada para a validação da documentação enviada. Em breve você receberá um retorno de sua solicitação.", com "Situação" da Portabilidade e das Pessoas igual a AGUARDANDO VALIDAÇÃO

Validar a apresentação da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL e pessoas com "Situação" igual a AGUARDANDO VALIDAÇÃO
    SolicitacaoPortabilidadeCanal.Validou a apresentação da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL e pessoas com "Situação" igual a AGUARDANDO VALIDAÇÃO

Validar a atualização da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL e pessoas com "Situação" igual a DOCUMENTAÇÃO APROVADA
    SolicitacaoPortabilidadeCanal.Validou a atualização da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO, "Tipo" igual a MOVIMENTAÇÃO CADASTRAL e pessoas com "Situação" igual a DOCUMENTAÇÃO APROVADA

Validar a alteração da "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE e pessoas com "Situação" igual a AGUARDANDO ASSINATURA
    SolicitacaoPortabilidadeCanal.Validou a alteração da "Situação" para ASSINATURA DA PROPOSTA DE ADESÃO PENDENTE e pessoas com "Situação" igual a AGUARDANDO ASSINATURA

Validar a atualização da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO DE ASSINATURA DA PROPOSTA DE ADESÃO, preencheu os campos "Data Emissão Proposta de Adesão de Portabilidade" com a DATA E HORA, "Proposta de Adesão de Portabilidade Assinada" igual a PROPOSTA DE ADESÃO DE PORTABILIDADE ASSINADA (link) e pessoas com "Situação" igual a AGUARDANDO ASSINATURA
    SolicitacaoPortabilidadeCanal.Validou a atualização da tela "Solicitação de Portabilidade » Solicitação - " + Data e Hora, com a "Situação" igual a AGUARDANDO VALIDAÇÃO DE ASSINATURA DA PROPOSTA DE ADESÃO, preencheu os campos "Data Emissão Proposta de Adesão de Portabilidade" com a DATA E HORA, "Proposta de Adesão de Portabilidade Assinada" igual a PROPOSTA DE ADESÃO DE PORTABILIDADE ASSINADA (link) e pessoas com "Situação" igual a AGUARDANDO ASSINATURA

No Canal do Contratante a Solicitação de Portabilidade, com a "Situação" igual a APROVADA, campo "Protocolo", "Data Solicitação", "Data/Hora Envio para Análise", "Responsável Envio para Análise" preenchidos e com o menu "GERAR MOV. CADASTRAL"
    Acessar a Solicitação de Portabilidade pelo Canal do Contratante"
    Wait Until Page Contains  Solicitação de Portabilidade  timeout=${TIMEOUT}
    Sleep  15s
    Set Focus To Element  xpath://*[@id="table_list_portabilidade"]/tbody/tr[1]
    Click Element  xpath://*[@id="table_list_portabilidade"]/tbody/tr[1]
    Page Should Contain   Aprovada
    ${p}  Get Text  xpath://*[@id="tab_1"]/div/div[2]
    ${p}  Remove String  ${p}  Protocolo:\n
    Page Should Contain  ${p}
    ${date}  Get Current Date
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Element Should Contain  xpath://*[@id="tab_1"]/div/div[3]   ${data_formatada}
    ${date}  Get Current Date
    ${date}  Convert Date  ${date}  exclude_millis=yes
    ${data_formatada}  Convert Date  ${date}  date_format=%Y-%m-%d %H:%M:%S  result_format=%d/%m/%Y
    Element Should Contain  xpath://*[@id="tab_1"]/div[2]/div[2]   ${data_formatada}
    ${RESPONSAVEL}  Get Text  xpath://*[@id="tab_1"]/div[2]/div[3]
    ${r}  Remove String  ${RESPONSAVEL}  Responsável Envio para Análise:\n
    Should Be Equal  ${r}  Prime Automação
    Click Element  xpath://button[1][contains(.,'AÇÕES')]
    Element Should Be Visible  xpath://a[contains(.,'Gerar Mov. Cadastral')]

CRM deve atualizar tela "Solicitação de Portabilidade" + Protocolo, com a mensagem "Protocolo Finalizado.", a "Situação" igual a APROVADA, "Data Encerramento Protocolo" igual a data e hora atual
    SolicitacaoPortabilidadeCanal.O CRM deve atualizar a tela "Solicitação de Portabilidade" + Protocolo, com a mensagem "Protocolo Finalizado.", a "Situação" igual a APROVADA, "Data Encerramento Protocolo" igual a data e hora atual

Validar a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, sem beneficiários no painel "Beneficiários - Exclusão"
    ExclusaoBeneficiariosMassa.Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, sem beneficiários no painel "Beneficiários - Exclusão"

Validar a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", com as opções "SELECIONAR" e "LISTA DE CPF"
    ExclusaoBeneficiariosMassa.Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", com as opções "SELECIONAR" e "LISTA DE CPF"

Clicar no menu "SELECIONAR"
    ExclusaoBeneficiariosMassa.Clicou no menu "SELECIONAR"

Clicar no botão "CANCELAR"
    ExclusaoBeneficiariosMassa.Clicou no botão "CANCELAR"

Clicar no menu "LISTA DE CPF"
    ExclusaoBeneficiariosMassa.Clicou no menu "LISTA DE CPF"

Validar a apresentação da modal "Inserir Beneficiários", com uma tabela com as colunas CPF, "E-mail", "Telefone", os botões "INSERIR", "LIMPAR" e "CANCELAR"
    ExclusaoBeneficiariosMassa.Validou a apresentação da modal "Inserir Beneficiários", com uma tabela com as colunas CPF, "E-mail", "Telefone", os botões "INSERIR", "LIMPAR" e "CANCELAR"

Preencheu o CPF de um DEPENDENTE existente no Contrato PF e clicar no botão "INSERIR"
    ExclusaoBeneficiariosMassa.Preencher o CPF de um DEPENDENTE existente no Contrato PF e clicar no botão "INSERIR"

Canal do Contratante deve apresentar a mensagem de erro "Beneficiário não encontrado!
    ExclusaoBeneficiariosMassa.O Canal do Contratante deve apresentar a mensagem de erro "Beneficiário não encontrado!

Clicar em um beneficiário DEPENDENTE e um TITULAR, com dependentes retornado na pesquisa e clicou no botão "SELECIONAR"
    ExclusaoBeneficiariosMassa.Clicou em um beneficiário DEPENDENTE e um TITULAR, com dependentes retornado na pesquisa e clicou no botão "SELECIONAR"

Validar a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Exclusão", "Motivo", "Submotivo", botões "APLICAR", "LIMPAR", outra tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão (Contrato PJ Adesão) onde o beneficiário que será excluido está vinculado, com as colunas "Beneficiário", "Motivo" com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Submotivo", "Contato", com os campos "E-mail" e "Telefone"
    ExclusaoBeneficiariosMassa.Validou a apresentação da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Exclusão", "Motivo", "Submotivo", botões "APLICAR", "LIMPAR", outra tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão (Contrato PJ Adesão) onde o beneficiário que será excluido está vinculado, com as colunas "Beneficiário", "Motivo" com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Submotivo", "Contato", com os campos "E-mail" e "Telefone"

Validar a atualização da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Exclusão", "Motivo", "Submotivo", botões "APLICAR", "LIMPAR", uma tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão (Contrato PJ Adesão) e uma tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão (Contrato PJ Empresarial) onde os beneficiários que serão excluidos estão vinculados, com as colunas "Beneficiário", "Motivo" com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRES, 44 - ÓBITO, "Submotivo", "Contato", com os campos "E-mail" e "Telefone"
    ExclusaoBeneficiariosMassa.Validou a atualização da tela "Movimentação em Massa", com o botão "+ ADICIONAR BENEFICIÁRIO", uma tabela com os campos "Dados padrão para Exclusão", "Motivo", "Submotivo", botões "APLICAR", "LIMPAR", uma tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão (Contrato PJ Adesão) e uma tabela com o Nome do Contrato - CNPJ - ID Sistema de Gestão (Contrato PJ Empresarial) onde os beneficiários que serão excluidos estão vinculados, com as colunas "Beneficiário", "Motivo" com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRES, 44 - ÓBITO, "Submotivo", "Contato", com os campos "E-mail" e "Telefone"

Preencheer um Beneficiário o "Motivo" igual a 41 - ROMPIMENTO DO CONTRATO e preencheu demais campos
    ExclusaoBeneficiariosMassa.Preencheu um Beneficiário o "Motivo" igual a 41 - ROMPIMENTO DO CONTRATO e preencheu demais campos

Preencheer um Beneficiário o "Motivo" igual a 42 - DESLIGAMENTO DA EMPRES, preencheu o questionário de inativo com as respostas NÃO, "Situação Plano Inativo" igual a NÃO POSSUI DIREITO DA CONTINUIDADE DO PLANO e preencheu demais campos
    ExclusaoBeneficiariosMassa.Preencheu um Beneficiário o "Motivo" igual a 42 - DESLIGAMENTO DA EMPRES, preencheu o questionário de inativo com as respostas NÃO, "Situação Plano Inativo" igual a NÃO POSSUI DIREITO DA CONTINUIDADE DO PLANO e preencheu demais campos

Preencheer um Beneficiário o "Motivo" igual a 42 - DESLIGAMENTO DA EMPRES, preencheu o questionário de inativo com as respostas SIM, NÃO, "DEMISSÃO/EXONERAÇÃO SEM JUSTA CAUSA", "Situação Plano Inativo" igual a POSSUI DIREITO DA CONTINUIDADE DO PLANO, NÃO e preencheu demais campos
    ExclusaoBeneficiariosMassa.Preencheu um Beneficiário o "Motivo" igual a 42 - DESLIGAMENTO DA EMPRES, preencheu o questionário de inativo com as respostas SIM, NÃO, "DEMISSÃO/EXONERAÇÃO SEM JUSTA CAUSA", "Situação Plano Inativo" igual a POSSUI DIREITO DA CONTINUIDADE DO PLANO, NÃO e preencheu demais campos

Clicar em botão "SALVAR"
    ExclusaoBeneficiariosMassa.Clicou botão "SALVAR"

Validar a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, com beneficiários no painel "Beneficiários - Exclusão"
    ExclusaoBeneficiariosMassa.Validou a apresentação da tela "Movimentação em Massa" + Nome, com "Situação" igual a PENDENTE, com beneficiários no painel "Beneficiários - Exclusão"

##Gabriel

Editou o campo "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS
    ExclusaoBeneficiarioCanal.Editou o campo "Assumir data padrão na exclusão de Beneficiário" igual a SIM. PRIMEIRO DIA DO MÊS.

Selecionar o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"
    ExclusaoBeneficiarioCanal.Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção EXCLUSÃO DE BENEFICIÁRIOS e clicou no botão "SALVAR"

Validar a apresentação da tela "Protocolo" com id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    ExclusaoBeneficiarioCanal.Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"

Clicando no botão "ADICIONAR"
    ExclusaoBeneficiarioCanal.Clicou no botão "ADICIONAR"

Validando a apresentação da tela "Solicitação de Exclusão" com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    ExclusaoBeneficiarioCanal.Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 42 - DESLIGAMENTO DA EMPRESA, 44 - ÓBITO, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"


Validando a apresentação do campo "Submotivo"
    ExclusaoBeneficiarioCanal.Validou a apresentação do campo "Submotivo"

Selecionar o 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios e clicou no botão "SALVAR"
    ExclusaoBeneficiarioCanal.Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios e clicou no botão "SALVAR"

Selecionar 1 (UM) Beneficiário TITULAR CAEPF, preencheu campos obrigatórios e clicou no botão "SALVAR"
    ExclusaoBeneficiarioCanal.Selecionou 1 (UM) Beneficiário TITULAR CAEPF, preencheu campos obrigatórios e clicou no botão "SALVAR"

Selecionar 1 (UM) Beneficiário TITULAR PJ, preencheu campos obrigatórios e clicou no botão "SALVAR"
    ExclusaoBeneficiarioCanal.Selecionou 1 (UM) Beneficiário TITULAR PJ, preencheu campos obrigatórios e clicou no botão "SALVAR"

Validando na tela a apresentação da mensagem de erro "A exclusão de um beneficiário Titular para contrato Pessoa Física caracteriza cancelamento de contrato e esta movimentação não é permitida via Canal do Contratante. Entre em contato com a operadora."
    ExclusaoBeneficiarioCanal.Validou a apresentação da mensagem de erro "A exclusão de um beneficiário Titular para contrato Pessoa Física caracteriza cancelamento de contrato e esta movimentação não é permitida via Canal do Contratante. Entre em contato com a operadora."

Cadastrando 1 (UM) Beneficiário DEPENDENTE, preencheu campos obrigatórios e clicou no botão "SALVAR"
    ExclusaoBeneficiarioCanal.Cadastrou 1 (UM) Beneficiário DEPENDENTE, preencheu campos obrigatórios e clicou no botão "SALVAR"

Validando a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"
    ExclusaoBeneficiarioCanal.Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o beneficiário na tabela "Exclusão de Beneficiários"

Clicando no botão de "ADICIONAR EM LOTE"
    ExclusaoBeneficiarioCanal.Clicou no botão "ADICIONAR EM LOTE"

Selecionando 1 (UM) Beneficiário TITULAR, clicou no botão "ADICIONAR PESSOA", preenchendo campos obrigatórios e clicou no botão "SALVAR"
    ExclusaoBeneficiarioCanal.Selecionou 1 (UM) Beneficiário TITULAR, clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios e clicou no botão "SALVAR"

Selecionar 1 (UM) Beneficiário DEPENDENTE e clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios e clicou no botão "SALVAR".
    ExclusaoBeneficiarioCanal.Selecionou 1 (UM) Beneficiário DEPENDENTE e clicou no botão "ADICIONAR PESSOA", preencheu campos obrigatórios e clicou no botão "SALVAR"

Validar a apresentação da tela final de "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários na tabela "Exclusão de Beneficiários"
    ExclusaoBeneficiarioCanal.Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com os beneficiários na tabela "Exclusão de Beneficiários"

Validando uma atualização da tela com "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO
    ExclusaoBeneficiarioCanal.Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO APROVAÇÃO

Validar a apresentação dos beneficiários na tela cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte
    ExclusaoBeneficiarioCanal.Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão preenchida com o primeiro dia do mês seguinte

Clicando para abrir o menu "VALIDAR DADOS" (Mov Cadastral)
    ExclusaoBeneficiarioCanal.Clicar abrir o menu "VALIDAR DADOS" (Mov Cadastral)

Clicando na primeira opção "APROVAR CONFERÊNCIA" do submenu dentro do menu "VALIDAR DADOS" (Mov Cadastral)
    ExclusaoBeneficiarioCanal.Clicar na opção "APROVAR CONFERÊNCIA" do submenu dentro do menu "VALIDAR DADOS" (Mov Cadastral)

Validando na aba "Visão Geral" as alterações de "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA 
    ExclusaoBeneficiarioCanal.Validou na aba "Visão Geral" a alteração da "Situação" igual a APROVADA, a inclusão da notificação "Conferência Aprovada Horário: DATA E HORA Identificador de Origem: ID MOVIMENTAÇÃO", no painel "Solicitações de Integração" o registro INTEGRAÇÃO SOLICITADA 

No pagina de Contrato os Beneficiários cadastrados na exclusão com a "Situação" igual a ATIVO e com campo "Data de Exclusão" igual a primeiro dia do mês seguinte
    ExclusaoBeneficiarioCanal.No Contrato os Beneficiários cadastrados na exclusão com a "Situação" igual a ATIVO e com campo "Data de Exclusão" igual a primeiro dia do mês seguinte

# gabriel cenario 02 começo
Editando no campo "Assumir data padrão na exclusão de Beneficiário" igual a SIM. NO DIA DA SOLICIAÇÃO.
    ExclusaoBeneficiarioCanal.Editou o campo "Assumir data padrão na exclusão de Beneficiário" igual a SIM. NO DIA DA SOLICIAÇÃO.


Validando a apresentação dos campos "Submotivo", "Data de Óbito", "É necessário anexar a certidão de óbito".
    ExclusaoBeneficiarioCanal.Validou a apresentação dos campos "Submotivo", "Data de Óbito", "É necessário anexar a certidão de óbito"


Selecionar o 1 (UM) Beneficiário TITULAR, selecionou um arquivo com extensão (PDF, PNG, JPEG ou JPG), preencheu "Data de Óbito" igual a DATA DE HOJE - 1, preencheu campos obrigatórios e clicou no botão "SALVAR".
    ExclusaoBeneficiarioCanal.Selecionou 1 (UM) Beneficiário TITULAR, selecionou um arquivo com extensão (PDF, PNG, JPEG ou JPG), preencheu "Data de Óbito" igual a DATA DE HOJE - 1, preencheu campos obrigatórios e clicou no botão "SALVAR"


Validando na apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"
    ExclusaoBeneficiarioCanal.Validou a apresentação dos campos "Submotivo" e "O titular contribuiu no pagamento da mensalidade de seu plano?"

Selecionar 1 (UM) Beneficiário TITULAR, e preencheu campos "Submotivo", "As carteirinhas foram devolvidas?", telefone, email, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM
    ExclusaoBeneficiarioCanal.Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos "Submotivo", "As carteirinhas foram devolvidas?", telefone, email, "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a SIM

Validando a apresentação dos campos: "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?","Motivos da extinção do Contrato de Trabalho"
    ExclusaoBeneficiarioCanal.Validou a apresentação dos campos "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?","Motivos da extinção do Contrato de Trabalho"

Preenchendo os campos: "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA
    ExclusaoBeneficiarioCanal.Preencheu os campos "Trata-se de titular que permaneceu com vínculo empregatício na mesma empresa, após aposentadoria?" igual a SIM, "Motivos da extinção do Contrato de Trabalho" igual a APOSENTADORIA


Validar na apresentação dos campos: "Situação Plano Inativo" igual a POSSUI DIREITO DA CONTINUIDADE DO PLANO, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?"
    ExclusaoBeneficiarioCanal.Validou a apresentação dos campos "Situação Plano Inativo" igual a POSSUI DIREITO DA CONTINUIDADE DO PLANO, "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?"

Preenchendo o campo: "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM    
    ExclusaoBeneficiarioCanal.Preencheu o campo "O titular optou pela continuidade do plano na condição de vínculo empregatício inativo?" igual a SIM    

Validando a apresentação dos campos: "Data de início de vigência no plano inativo" preenchido e bloqueado, painel "Insira abaixo o endereço atualizado do beneficiário titular" com campos de endereço, painel "Opção de Continuidade do Plano Inativo" com os campos "Tempo de contribuição? (meses)" habilitado e preenchido com o valor 0, "Dependentes que continuarão no plano" titular bloqueado e dependentes habilitados para seleção, "Custo total mensal" preenchido
    ExclusaoBeneficiarioCanal.Validou a apresentação dos campos "Data de início de vigência no plano inativo" preenchido e bloqueado, painel "Insira abaixo o endereço atualizado do beneficiário titular" com campos de endereço, painel "Opção de Continuidade do Plano Inativo" com os campos "Tempo de contribuição? (meses)" habilitado e preenchido com o valor 0, "Dependentes que continuarão no plano" titular bloqueado e dependentes habilitados para seleção, "Custo total mensal" preenchido


Preenchendo os campos de endereço completo, "Tempo de contribuição? (meses)" igual a 120, selecionou um dependente, clicou no botão "SALVAR"
    ExclusaoBeneficiarioCanal.Preencheu os campos de endereço, "Tempo de contribuição? (meses)" igual a 120, selecionou um dependente, clicou no botão "SALVAR"

Clicando no botão "OK" da modal de Confirmação com a mensagem: "É necessário anexar documento comprobatório de contribuição excedente ao indicado. Consideramos o tempo vinculado ao plano da Unimed, porém ao anexar o documento este poderá ser revisto."
    ExclusaoBeneficiarioCanal.Clicou no botão "OK" da modal de Confirmação com a mensagem "É necessário anexar documento comprobatório de contribuição excedente ao indicado. Consideramos o tempo vinculado ao plano da Unimed, porém ao anexar o documento este poderá ser revisto."

Selecionar apenas 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO
    ExclusaoBeneficiarioCanal.Selecionou 1 (UM) Beneficiário TITULAR, preencheu campos obrigatórios "O titular contribuiu no pagamento da mensalidade de seu plano?" igual a NÃO

Validando na apresentação do campo "Situação Plano Inativo" igual a NÃO POSSUI DIREITO DA CONTINUIDADE DO PLANO              
    ExclusaoBeneficiarioCanal.Validou a apresentação do campo "Situação Plano Inativo" igual a NÃO POSSUI DIREITO DA CONTINUIDADE DO PLANO              




Selecionar no campo "Funções Permitidas" a opção "Exclusão de Beneficiário RN412"
    ExclusaoRN412Canal.Selecionou no campo "Funções Permitidas" a opção "Exclusão de Beneficiário RN412"

Validar a apresentação da tela "Exclusão RN412", com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"
    ExclusaoRN412Canal.Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a EM ANDAMENTO, sem beneficiários na tabela "Exclusão de Beneficiários"

Clicar o botão "ADICIONAR"
    ExclusaoRN412Canal.Clicou o botão "ADICIONAR"

Validar a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 48 - POR PORTABILIDADE DE CARÊNCIA, "Perfil Solicitante" com as opções CONTRATANTE, CONTRATANTE PAGADOR e TITULAR, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"
    ExclusaoRN412Canal.Validou a apresentação da tela "Solicitação de Exclusão", com os campos "Motivo", com as opções 41 - ROMPIMENTO DO CONTRATO POR INICIATIVA DO BENEFICIÁRIO, 48 - POR PORTABILIDADE DE CARÊNCIA, "Perfil Solicitante" com as opções CONTRATANTE, CONTRATANTE PAGADOR e TITULAR, "Complemento", "Beneficiário", "As carteirinhas foram devolvidas?" com as opções SIM, NÃO, "Telefone Comercial", "Telefone Residencial", "Telefone Celular", "E-mail", os botões "SALVAR" e "CANCELAR"

Validar a apresentação da tela "Exclusão RN412", com o beneficiário na tabela "Exclusão de Beneficiários"
    ExclusaoRN412Canal.Validou a apresentação da tela "Exclusão RN412", com o beneficiário na tabela "Exclusão de Beneficiários"

Anexar um documento no painel "Documentos"
    ExclusaoRN412Canal.Anexou um documento no painel "Documentos"

Clicar no botão "SIM" da modal "Confirmação" com a mensagem "A data da exclusão será a partir da data da CIENCIA e APROVAÇÃO da operadora de plano de saúde, e possui caráter IRREVOGÁVEL, ou seja, NÃO SERÁ PERMITIDO O DIREITO DE ARREPENDIMENTO POSTERIOR. Deseja continuar?"
    ExclusaoRN412Canal.Clicou no botão "SIM" da modal "Confirmação" com a mensagem "A data da exclusão será a partir da data da CIENCIA e APROVAÇÃO da operadora de plano de saúde, e possui caráter IRREVOGÁVEL, ou seja, NÃO SERÁ PERMITIDO O DIREITO DE ARREPENDIMENTO POSTERIOR. Deseja continuar?"

Validar a apresentação da tela "Exclusão RN412", com "Situação" igual a AGUARDANDO APROVAÇÃO
    ExclusaoRN412Canal.Validou a apresentação da tela "Exclusão RN412", com "Situação" igual a AGUARDANDO APROVAÇÃO

Validar a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão" preenchida com a DATA/HORA ATUAL e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA
    ExclusaoRN412Canal.Validou a apresentação dos beneficiários cadastrados na movimentação, com a coluna "Data de Exclusão" preenchida com a DATA/HORA ATUAL e painel "Documentos Conferência" com o documento anexado na "Situação" AGUARDANDO CONFERÊNCIA

Validar na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO
    ExclusaoRN412Canal.Validou na aba "Resumo Conferência" a alteração da "Situação Validação dos Dados" igual a VALIDAÇÃO EFETUADA COM SUCESSO

Clicar no botão "ATUALIZAR SITUAÇÃO EM MASSA"
    ExclusaoRN412Canal.Clicou no botão "ATUALIZAR SITUAÇÃO EM MASSA"

Validar a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"
    ExclusaoRN412Canal.Validou a apresentação da modal "Atualizar Situação em Massa", com os documentos, campos "Situação" e "Complemento"

Selecionar todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"
    ExclusaoRN412Canal.Selecionou todos os documento, selecionou no campo "Situação" igual a APROVADO, preencheu o campo "Complemento" e clicou no botão "ATUALIZAR"

Validar a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO
    ExclusaoRN412Canal.Validou a atualização do painel "Documentos Conferência" com a "Situação" igual a APROVADO

Validou a apresentação da modal "Aprovar Conferência", com a "Data/hora criação" preenchido com a DATA/HORA ATUAL, "Responsável" com o usuário logado, campo "Parecer", mensagem "Não foram encontradas devoluções de valores.", botões "SALVAR" e "CANCELAR"
    ExclusaoRN412Canal.Validar a apresentação da modal "Aprovar Conferência", com a "Data/hora criação" preenchido com a DATA/HORA ATUAL, "Responsável" com o usuário logado, campo "Parecer", mensagem "Não foram encontradas devoluções de valores.", botões "SALVAR" e "CANCELAR"

Selecionar "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA
    ExclusaoRN412Canal.Selecionou "Motivo" 48 - POR PORTABILIDADE DE CARÊNCIA

Validar a apresentação do campo "Submotivo" 48
    ExclusaoBeneficiarioCanal.Validou a apresentação do campo "Submotivo" 48

Selecionar no campo "Funções Permitidas" a opção "Mudança de Produto"
    MudancaProdCanal.Selecionou no campo "Funções Permitidas" a opção "Mudança de Produto"

Selecionou o Contrato PF, no campo "Tipo de Movimentação" a opção MUDANÇA DE PRODUTO e clicar no botão "SALVAR"
    MudancaProdCanal.Selecionar o Contrato PF, no campo "Tipo de Movimentação" a opção MUDANÇA DE PRODUTO e clicar no botão "SALVAR"

Canal do Contratante deve apresentar a mensagem de erro "A mudança de produto via movimentação cadastral é permitido apenas para Contratos Pessoa Jurídica."
    MudancaProdCanal.O Canal do Contratante deve apresentar a mensagem de erro "A mudança de produto via movimentação cadastral é permitido apenas para Contratos Pessoa Jurídica."

Validar a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários no painel "Beneficiários - Mudança de Produto"
    MudancaProdCanal.Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários no painel "Beneficiários - Mudança de Produto"

Validar a apresentação da tela "Mudança de Produto", com os campos "Alteração", "Beneficiário", "Motivo", "Produto Atual" vazio e bloqueado, "Novo Produto", "Observação"
    MudancaProdCanal.Validou a apresentação da tela "Mudança de Produto", com os campos "Alteração", "Beneficiário", "Motivo", "Produto Atual" vazio e bloqueado, "Novo Produto", "Observação"

Selecionar 1 (UM) Beneficiário TITULAR, com dependentes
    MudancaProdCanal.Selecionou 1 (UM) Beneficiário TITULAR, com dependentes

Validar a atualização da tela com campo "Produto Atual" preenchido, "Novo Produto" com os Produtos do Contrato, "O(s) dependentes(s) assume(m) o mesmo produto do titular?" igual a SIM, "Beneficiário Dependente", "Grau de Dependência", "Produto Atual" preenchido/bloqueado
    MudancaProdCanal.Validou a atualização da tela com campo "Produto Atual" preenchido, "Novo Produto" com os Produtos do Contrato, "O(s) dependentes(s) assume(m) o mesmo produto do titular?" igual a SIM, "Beneficiário Dependente", "Grau de Dependência", "Produto Atual" preenchido/bloqueado

Clicar na opção "NÃO" do campo "O(s) dependentes(s) assume(m) o mesmo produto do titular?"
    MudancaProdCanal.Clicou na opção "NÃO" do campo "O(s) dependentes(s) assume(m) o mesmo produto do titular?"

Validar a apresentação dos campos de seleção nos dependentes e campo "Novo Produto"
    MudancaProdCanal.Validou a apresentação dos campos de seleção nos dependentes e campo "Novo Produto"

Preencher os campos "Alteração" igual a EM 24 HORAS, "Observação", "Novo Produto" para o Titular, "Novo Produto" para um dependente, desmarcou o campo de seleção dos outros dependentes
    MudancaProdCanal.Preencheu os campos "Alteração" igual a EM 24 HORAS, "Observação", "Novo Produto" para o Titular, "Novo Produto" para um dependente, desmarcou o campo de seleção dos outros dependentes

Clicar o botão SALVAR
    MudancaProdCanal.Clicou o botão SALVAR

Validar a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o TITULAR e UM DEPENDNETE no painel "Beneficiários - Mudança de Produto"
    MudancaProdCanal.Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o TITULAR e UM DEPENDNETE no painel "Beneficiários - Mudança de Produto"

Validar a apresentação do registro, com a coluna "Prioridades" vazia
    MudancaProdCanal.Validou a apresentação do registro, com a coluna "Prioridades" vazia

Contrato os Beneficiários cadastrados na movimentação, com os produtos alterados
    MudancaProdCanal.No Contrato os Beneficiários cadastrados na movimentação, com os produtos alterados


Selecionou o Contrato, no campo "Tipo de Movimentação" a opção TRANSFERÊNCIA DE GRUPO FAMILIAR e clicar no botão "SALVAR"
    MovTransfGrupoFamiliar.Selecionar o Contrato, no campo "Tipo de Movimentação" a opção TRANSFERÊNCIA DE GRUPO FAMILIAR e clicar no botão "SALVAR"

Canal do Contratante deve apresentar a mensagem de erro "A Transferência de Grupo Familiar via movimentação cadastral é permitida apenas para Contratos Pessoa Jurídica."
    MovTransfGrupoFamiliar.O Canal do Contratante deve apresentar a mensagem de erro "A Transferência de Grupo Familiar via movimentação cadastral é permitida apenas para Contratos Pessoa Jurídica."

Validar a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"
    MovTransfGrupoFamiliar.Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, sem beneficiários no painel "Beneficiários - Transferência de Grupo Familiar"

Validar a apresentação da tela "Transf. de Grupo Familiar", com os campos "Transferência", "Motivo", "Beneficiário Titular", "Número da Matricula", "Contrato Destino", "Produto Assistencial" vazio e bloqueado e os botões "SALVAR" e "CANCELAR"
    MovTransfGrupoFamiliar.Validou a apresentação da tela "Transf. de Grupo Familiar", com os campos "Transferência", "Motivo", "Beneficiário Titular", "Número da Matricula", "Contrato Destino", "Produto Assistencial" vazio e bloqueado e os botões "SALVAR" e "CANCELAR"

Selecionar 1 UM Beneficiário TITULAR, com dependentes
    MovTransfGrupoFamiliar.Selecionou 1 UM Beneficiário TITULAR, com dependentes

Validar a atualização da tela com os campos "Beneficiário Dependente", "Grau de Dependência"
    MovTransfGrupoFamiliar.Validou a atualização da tela com os campos "Beneficiário Dependente", "Grau de Dependência"

Preencher os campos "Transferência" igual a EM 24 HORAS, "Motivo", "Contrato Destino"
    MovTransfGrupoFamiliar.Preencheu os campos "Transferência" igual a EM 24 HORAS, "Motivo", "Contrato Destino"

Validar a atualização da tela com os campos "Produto Assistencial" habilitado com os produtos do Contrato destino, "O(s) dependentes(s) assume(m) o mesmo produto do titular?" igual a SIM
    MovTransfGrupoFamiliar.Validou a atualização da tela com os campos "Produto Assistencial" habilitado com os produtos do Contrato destino, "O(s) dependentes(s) assume(m) o mesmo produto do titular?" igual a SIM

Validar a atualização da tela apresentando os produtos Acessórios
    MovTransfGrupoFamiliar.Validou a atualização da tela apresentando os produtos Acessórios

Selecionar um Produto Assistencial
    MovTransfGrupoFamiliar.Selecionou um Produto Assistencial

Validar a atualização da tela apresentando o campo "Produto Assistencial" para os dependentes
    MovTransfGrupoFamiliar.Validou a atualização da tela apresentando o campo "Produto Assistencial" para os dependentes

Selecionar o Produto Assistencial do dependente
    MovTransfGrupoFamiliar.Selecionou o Produto Assistencial do dependente

Validar a atualização da tela apresentando o campo "Produto Acessório" com as opções de acordo com o Produto Assistencial
    MovTransfGrupoFamiliar.Validou a atualização da tela apresentando o campo "Produto Acessório" com as opções de acordo com o Produto Assistencial

Clicar no botão "SALVAR", sem selecionar acessórios
    MovTransfGrupoFamiliar.Clicou no botão "SALVAR", sem selecionar acessórios

Validar a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o painel "Beneficiários - Transferência de Grupo Familiar" com registros
    MovTransfGrupoFamiliar.Validou a apresentação da tela "Protocolo" id gerado automaticamente, com "Situação" igual a EM ANDAMENTO, com o painel "Beneficiários - Transferência de Grupo Familiar" com registros

Clicou o menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA"
    MovTransfGrupoFamiliar.Clicar menu "REALIZAR INTEGRAÇÃO AUTOMÁTICA"

Validou a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO INTEGRAÇÃO AUTOMÁTICA
    MovTransfGrupoFamiliar.Validar a atualização da tela "Protocolo" id gerado automaticamente, com "Situação" igual a AGUARDANDO INTEGRAÇÃO AUTOMÁTICA

