*** Settings ***
Library         FakerLibrary        locale=pt-BR
Library         Collections
Library         DateTime
Library         String
Library         RequestsLibrary
Library         JSONLibrary
Library         libs/writecsv.py
Library         libs/CSVLibrary.py
Library         libs/utilities.py

Resource        ./env.resource
Resource        utils/Comum.robot
Resource        utils/BDDpt-BR.robot

#### Massa de Dados ####
Resource        resources/CRM/PO/ProdutoAssistenciaisAcessorios.robot
Resource        resources/CRM/PO/InclusaoBeneficiarioCanalContratante.robot
Resource        resources/CRM/PO/ProdutosPlano.robot
Resource        resources/CRM/PO/ProdutosConvenio.robot
Resource        resources/CRM/PO/ProdutosAlcada.robot
Resource        resources/CRM/PO/ProdutoAssistenciaisAcessorios.robot

### CRM Unimed PR  ###
Resource        resources/CRM/CRMUnimedPR.robot
Resource        resources/CRM/data/Massa01PotClienteResMerc.robot
Resource        resources/CRM/data/Massa02Conta.robot
Resource        resources/CRM/data/Massa03Oportunidades.robot
Resource        resources/CRM/data/Massa04Cotacao.robot
Resource        resources/CRM/data/Massa05Portabilidade.robot
Resource        resources/CRM/data/Massa06Beneficiario.robot
Resource        resources/CRM/data/Massa07DecDeSaude.robot
Resource        resources/CRM/data/Massa08Contrato.robot
Resource        resources/CRM/data/Massa09Integracao.robot
Resource        resources/CRM/data/Massa10IntegMovExclusaoCRM.robot
Resource        resources/CRM/data/Massa11IntegMovExclusaoRN412CRM.robot
Resource        resources/CRM/data/Massa12IntegMovMudancaProdCRM.robot
Resource        resources/CRM/data/Massa13IntegMovTransfGrupFamilCRM.robot
Resource        resources/CRM/data/Massa14IntegMovCancelamContratoCRM.robot
Resource        resources/CRM/data/Massa15ImportDeBenefMovCadastral.robot
Resource        resources/CRM/data/Massa16IntegMovInclusaoCRM.robot
Resource        resources/CRM/data/Massa17MovCadTranferenciaDeGrupoFamiliarEmMassaCRM.robot
Resource        resources/CRM/data/Massa18MovCadExclusaodeBeneficiariosEmMassaCRM.robot
Resource        resources/CRM/data/Massa19PortabilidadeCRM.robot
Resource        resources/CRM/data/Massa20ServicoVendaAPI.robot
Resource        resources/CRM/data/banco/DBCRMUnimed.robot

### CRM Unimed PR - PO ###
Resource        resources/CRM/PO/BeneficiariosCadastro.robot
Resource        resources/CRM/PO/ConferenciaDetalhes.robot
Resource        resources/CRM/PO/ConferenciaPesquisa.robot
Resource        resources/CRM/PO/ContasCadastro.robot
Resource        resources/CRM/PO/ContasDetalhes.robot
Resource        resources/CRM/PO/ContasPesquisa.robot
Resource        resources/CRM/PO/ContratosCadastro.robot
Resource        resources/CRM/PO/ContratosDetalhes.robot
Resource        resources/CRM/PO/CotacoesCadastro.robot
Resource        resources/CRM/PO/CotacoesDetalhes.robot
Resource        resources/CRM/PO/CotacoesPesquisa.robot
Resource        resources/CRM/PO/DeclaracaoSaudeCadastro.robot
Resource        resources/CRM/PO/DeclaracaoSaudeDetalhes.robot
Resource        resources/CRM/PO/InclusaoBeneficiarioCanalContratante.robot
Resource        resources/CRM/PO/Login.robot
Resource        resources/CRM/PO/MenuSuperior.robot
Resource        resources/CRM/PO/MovimentacaoCadastral.robot
Resource        resources/CRM/PO/MovimentacaoEmMassa.robot
Resource        resources/CRM/PO/OportunidadesCadastro.robot
Resource        resources/CRM/PO/OportunidadesDetalhes.robot
Resource        resources/CRM/PO/OportunidadesPesquisa.robot
Resource        resources/CRM/PO/ParametrosComerciais.robot
Resource        resources/CRM/PO/PopupPesquisarConvenios.robot
Resource        resources/CRM/PO/PopupPesquisarNomeConta.robot
Resource        resources/CRM/PO/PortabilidadeCadastro.robot
Resource        resources/CRM/PO/PortabilidadeCanalContratante.robot
Resource        resources/CRM/PO/PortabilidadeDetalhes.robot
Resource        resources/CRM/PO/PotencialClienteCadastro.robot
Resource        resources/CRM/PO/PotencialClienteDetalhes.robot
Resource        resources/CRM/PO/PotencialClientePesquisa.robot


### Canal Contratante Unimed PR ###
Resource        resources/CanalContratante/CanalContratanteUnimedPR.robot
Resource        resources/CanalContratante/data/massa01portabilidadecanal.robot
Resource        resources/CanalContratante/data/massa02exclusaocanal.robot
Resource        resources/CanalContratante/data/massa03transferenciagrupofamiliar.robot
Resource        resources/CanalContratante/data/massa04inclusaobeneficiariocanal.robot
Resource        resources/CanalContratante/data/massa05importacaobeneficiariocanal.robot
Resource        resources/CanalContratante/data/massa06exclusaobeneficiarioCanal.robot
Resource        resources/CanalContratante/data/massa07exclusaoRN412canal.robot
Resource        resources/CanalContratante/data/massa08mudancaprodcanal.robot
Resource        resources/CanalContratante/data/massa09movtransfergrupofamiliar.robot




#
# ATENÇÂO
#
# Criar arquivo env.resource e jogar todas as variaveis que estão comentadas abaixo dentro
# Assim criando um env para cada maquina e não tendo problemas de conflitos.
#
# Exemplo de como fica o arquivo env.resource (https://prnt.sc/vd9pqq)
#

#*** Variables ***
#${BROWSER} =  chrome
#${DOCUMENTS_FOLDER} =  C:\\Projetos\\unimedprcrm\\documents
#${DOWNLOADS_FOLDER} =  C:\\Users\\User\\Downloads
#${timeout}             60
#${short_timeout}       30
#${long_timeout}        180
#${ultra_timeout}       360