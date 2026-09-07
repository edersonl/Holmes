*** Settings ***
Resource    ../../main.resource

Suite Setup     Run Keywords     Executar as querys para Validar e Gerar Massa de Dados    AND   Instancia Variaveis   06
# Suite Setup     Instancia Variaveis   05
Test Setup      Abrir Nav
Test Teardown   Comum.Fechar Nav


*** Test Cases ***
Teste de Regressão 01 - BENEFICIARIO - CRIAR UM BENEFICIÁRIO EM CONTRATO VIA POTENCIAL PF
    [Documentation]  BENEFICIARIO - TR001: CRIAR UM BENEFICIÁRIO EM CONTRATO VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios    @{BENEFPOTENCIALPF01}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPF01}
    E        Cadastrou uma Cotação  @{BENEFPOTENCIALPF01}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios    @{BENEFPOTENCIALPF01}
    Quando   Usuário clicar no botão "Criar" do painel Beneficiários
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 02 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA POTENCIAL PF
    [Documentation]  BENEFICIARIO - TR002: CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios    @{BENEFPOTENCIALPF02}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPF02}
    E        Cadastrou uma Cotação  @{BENEFPOTENCIALPF02}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios    @{BENEFPOTENCIALPF02}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Beneficiários)    @{BENEFPOTENCIALPF02}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFPOTENCIALPF02}
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 03 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIOS DEPENDENTE EM CONTRATO VIA POTENCIAL PF
    [Documentation]  BENEFICIARIO - TR003: CADASTRAR UM BENEFICIÁRIOS DEPENDENTE EM CONTRATO VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios    @{BENEFPOTENCIALPF03}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPF03}
    E        Cadastrou uma Cotação  @{BENEFPOTENCIALPF03}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios    @{BENEFPOTENCIALPF03}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Beneficiários)    @{BENEFPOTENCIALPF03}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFPOTENCIALPF03}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiário incluido  @{BENEFPOTENCIALPF03}


Teste de Regressão 04 - BENEFICIARIO - IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA POTENCIAL PF
    [Documentation]  BENEFICIARIO - TR004: IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios    @{BENEFPOTENCIALPF04}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPF04}
    E        Cadastrou uma Cotação  @{BENEFPOTENCIALPF04}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios    @{BENEFPOTENCIALPF04}
    Quando   Acessar menu IMPORTAR BENEFICIÁRIOS
    E        Selecionar, validar e confirmar arquivo    @{BENEFPOTENCIALPF04}
    E        Clicar no link "Nome Contrato"    @{BENEFPOTENCIALPF04}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiários importados		@{BENEFPOTENCIALPF04}


Teste de Regressão 05 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA POTENCIAL PF
    [Documentation]  BENEFICIARIO - TR005: CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA POTENCIAL PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PF com os campos obrigatórios    @{BENEFPOTENCIALPF05}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPF05}
    E        Cadastrou uma Cotação  @{BENEFPOTENCIALPF05}
    E        Clicar no link "Nome Oportunidade"    ${BENEFPOTENCIALPF05[1]}
    E        Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Cadastrou uma Pessoa    @{BENEFPOTENCIALPF05}
    E        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL
    E        Aprovou a Portabilidade
    E        Clicou no link "Nome Oportunidade" na tela Cotações    ${BENEFPOTENCIALPF05[1]}
    E        Clicou no registro da Cotação    ${BENEFPOTENCIALPF05[1]}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios    @{BENEFPOTENCIALPF05}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Usuário selecionar o beneficiário no campo "Pessoa da Portabilidade"
    E        Preencher demais campos obrigatórios    @{BENEFPOTENCIALPF05}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFPOTENCIALPF05}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiário incluido	@{BENEFPOTENCIALPF05}			


Teste de Regressão 06 - BENEFICIARIO - CRIAR UM BENEFICIÁRIO EM CONTRATO VIA CONTA PF
    [Documentation]  BENEFICIARIO - TR006: CRIAR UM BENEFICIÁRIO EM CONTRATO VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios    @{BENEFCONTAPF06}
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPF06}
    E        Cadastrou uma Cotação    @{BENEFCONTAPF06}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios    @{BENEFCONTAPF06}
    Quando   Usuário clicar no botão "Criar" do painel Beneficiários
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 07 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA CONTA PF
    [Documentation]  BENEFICIARIO - TR007: CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios    @{BENEFCONTAPF07}
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPF07}
    E        Cadastrou uma Cotação    @{BENEFCONTAPF07}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios    @{BENEFCONTAPF07}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Beneficiários)    @{BENEFCONTAPF07}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFCONTAPF07}
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 08 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIOS DEPENDENTE EM CONTRATO VIA CONTA PF
    [Documentation]  BENEFICIARIO - TR008: CADASTRAR UM BENEFICIÁRIOS DEPENDENTE EM CONTRATO VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061

    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios    @{BENEFCONTAPF08}
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPF08}
    E        Cadastrou uma Cotação    @{BENEFCONTAPF08}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios    @{BENEFCONTAPF08}
    E        Cadastrou um Beneficiário Titular    @{BENEFCONTAPF08}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Beneficiários - Dependente)    @{BENEFCONTAPF08}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFCONTAPF08}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiário Titular e Dependente incluido	@{BENEFCONTAPF08}		


Teste de Regressão 09 - BENEFICIARIO - IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA CONTA PF
    [Documentation]  BENEFICIARIO - TR009: CADASTRAR UM BENEFICIÁRIOS DEPENDENTE EM CONTRATO VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios    @{BENEFCONTAPF09}
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPF09}
    E        Cadastrou uma Cotação  @{BENEFCONTAPF09}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios    @{BENEFCONTAPF09}
    Quando   Acessar menu IMPORTAR BENEFICIÁRIOS
    E        Selecionar, validar e confirmar arquivo    @{BENEFCONTAPF09}
    E        Clicar no link "Nome Contrato"    @{BENEFCONTAPF09}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiários importados		@{BENEFCONTAPF09}


Teste de Regressão 10 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA CONTA PF
    [Documentation]  BENEFICIARIO - TR010: CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA CONTA PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PF com os campos obrigatórios    @{BENEFCONTAPF10}
    E        Cadastrou uma Oportunidade, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPF10}
    E        Cadastrou uma Cotação  @{BENEFCONTAPF10}
    E        Clicar no link "Nome Oportunidade"    ${BENEFCONTAPF10[1]}
    E        Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Cadastrou uma Pessoa    @{BENEFCONTAPF10}
    E        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL
    E        Aprovou a Portabilidade
    E        Clicou no link "Nome Oportunidade" na tela Cotações    ${BENEFCONTAPF10[1]}
    E        Clicou no registro da Cotação    ${BENEFCONTAPF10[1]}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios    @{BENEFCONTAPF10}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Usuário selecionar o beneficiário no campo "Pessoa da Portabilidade"
    E        Preencher demais campos obrigatórios    @{BENEFCONTAPF10}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFCONTAPF10}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiário incluido	@{BENEFCONTAPF10}


Teste de Regressão 11 - BENEFICIARIO - CRIAR UM BENEFICIÁRIO EM CONTRATO VIA COTAÇÃO PF
    [Documentation]  BENEFICIARIO - TR011: CRIAR UM BENEFICIÁRIO EM CONTRATO VIA COTAÇÃO PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta PF, Oportunidade e Cotação    @{BENEFCOTACAOPF11}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios    @{BENEFCOTACAOPF11}
    Quando   Usuário clicar no botão "Criar" do painel Beneficiários
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 12 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA COTAÇÃO PF
    [Documentation]  BENEFICIARIO - TR012: CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA COTAÇÃO PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta PF, Oportunidade e Cotação    @{BENEFCOTACAOPF12}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios    @{BENEFCOTACAOPF12}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Beneficiários - Titular)    @{BENEFCOTACAOPF12}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFCOTACAOPF12}
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 13 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIOS DEPENDENTE EM CONTRATO VIA COTAÇÃO PF
    [Documentation]  BENEFICIARIO - TR013: CADASTRAR UM BENEFICIÁRIOS DEPENDENTE EM CONTRATO VIA COTAÇÃO PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta PF, Oportunidade e Cotação    @{BENEFCOTACAOPF13}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios    @{BENEFCOTACAOPF13}
    E        Cadastrou um Beneficiário Titular    @{BENEFCOTACAOPF13}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Beneficiários - Dependente)    @{BENEFCOTACAOPF13}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFCOTACAOPF13}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiário Titular e Dependente incluido	@{BENEFCOTACAOPF13}	


Teste de Regressão 14 - BENEFICIARIO - IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA COTAÇÃO PF
    [Documentation]  BENEFICIARIO - TR014: IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA COTAÇÃO PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta PF, Oportunidade e Cotação    @{BENEFCOTACAOPF14}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios    @{BENEFCOTACAOPF14}
    Quando   Acessar menu IMPORTAR BENEFICIÁRIOS
    E        Selecionar, validar e confirmar arquivo    @{BENEFCOTACAOPF14}
    E        Clicar no link "Nome Contrato"    @{BENEFCOTACAOPF14}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiários importados		@{BENEFCOTACAOPF14}


Teste de Regressão 15 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA COTAÇÃO PF
    [Documentation]  BENEFICIARIO - TR015: CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA COTAÇÃO PF
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Clicou na submenu <Cotações> do <Comercial>
    E        Cadastrou uma Conta PF, Oportunidade e Cotação    @{BENEFCOTACAOPF15}
    E        Clicar no link "Nome Oportunidade"    ${BENEFCOTACAOPF15[1]}
    E        Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Cadastrou uma Pessoa    @{BENEFCOTACAOPF15}
    E        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL
    E        Aprovou a Portabilidade
    E        Clicou no link "Nome Oportunidade" na tela Cotações    ${BENEFCOTACAOPF15[1]}
    E        Clicou no registro da Cotação    ${BENEFCOTACAOPF15[1]}
    E        Cadastrou um Contrato, preenchendo campos obrigatórios    @{BENEFCOTACAOPF15}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Usuário selecionar o beneficiário no campo "Pessoa da Portabilidade"
    E        Preencher demais campos obrigatórios    @{BENEFCOTACAOPF15}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFCOTACAOPF15}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiário incluido	@{BENEFCOTACAOPF15}


Teste de Regressão 16 - BENEFICIARIO - CRIAR UM BENEFICIÁRIO EM CONTRATO VIA POTENCIAL PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR016: CRIAR UM BENEFICIÁRIO EM CONTRATO VIA POTENCIAL PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ16}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ16}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFPOTENCIALPJ16}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ16}
    Quando   Usuário clicar no botão "Criar" do painel Beneficiários
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 17 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA POTENCIAL PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR017: CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA POTENCIAL PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ17}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ17}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFPOTENCIALPJ17}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ17}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Titular)    @{BENEFPOTENCIALPJ17}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFPOTENCIALPJ17}
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 18 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO DEPENDENTE EM CONTRATO VIA POTENCIAL PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR018: CADASTRAR UM BENEFICIÁRIO DEPENDENTE EM CONTRATO VIA POTENCIAL PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ18}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ18}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFPOTENCIALPJ18}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ18}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários PJ - Titular)    @{BENEFPOTENCIALPJ18}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFPOTENCIALPJ18}
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Dependente)    @{BENEFPOTENCIALPJ18}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFPOTENCIALPJ18}
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 19 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA POTENCIAL PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR020: CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA POTENCIAL PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ19}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ19}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFPOTENCIALPJ19}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ19}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários PJ - Titular)    @{BENEFPOTENCIALPJ19}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFPOTENCIALPJ19}
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Dependente)    @{BENEFPOTENCIALPJ19}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFPOTENCIALPJ19}
    Então    CRM deve apresentar a tela Contrato » TITULO PJ, com Beneficiário Titular e Dependente incluido   @{BENEFPOTENCIALPJ19}

#### revisar a ultima KW do cenario
Teste de Regressão 20 - BENEFICIARIO - IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA POTENCIAL PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR020: IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA POTENCIAL PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ20}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ20}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFPOTENCIALPJ20}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ20}
    Quando   Acessar menu IMPORTAR BENEFICIÁRIOS
    E        Selecionar, validar e confirmar arquivo (Beneficiário PJ)    @{BENEFPOTENCIALPJ20}
    E        Clicar no link "Nome Contrato PJ"    @{BENEFPOTENCIALPJ20}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiários PJ importados		@{BENEFPOTENCIALPJ20}


Teste de Regressão 21 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA POTENCIAL PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR021: CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA POTENCIAL PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ21}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ21}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFPOTENCIALPJ21}
    E        Clicar no link "Nome Oportunidade"    ${BENEFPOTENCIALPJ21[2]}
    E        Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Cadastrou Pessoa "Titular"
    E        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL
    E        Aprovou a Portabilidade
    E        Clicou no link "Nome Oportunidade" na tela Cotações    ${BENEFPOTENCIALPJ21[2]}
    E        Clicou no registro da Cotação    ${BENEFPOTENCIALPJ21[1]}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ21}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Usuário selecionar o beneficiário no campo "Pessoa da Portabilidade"
    E        Preencher demais campos obrigatórios PJ   @{BENEFPOTENCIALPJ21}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFPOTENCIALPJ21}
    Então    CRM deve apresentar a tela Contrato » TITULO PJ, com Beneficiário incluido	@{BENEFPOTENCIALPJ21}


Teste de Regressão 22 - BENEFICIARIO - CRIAR UM BENEFICIÁRIO EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR022: CRIAR UM BENEFICIÁRIO EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ22}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ22}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFPOTENCIALPJ22}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ22}
    Quando   Usuário clicar no botão "Criar" do painel Beneficiários
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 23 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR023: CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ23}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ23}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais, com Acessório e sem Desconto e Acréscimo    @{BENEFPOTENCIALPJ23}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ23}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Titular)   @{BENEFPOTENCIALPJ23}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFPOTENCIALPJ23}
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 24 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO DEPENDENTE EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR024: CADASTRAR UM BENEFICIÁRIO DEPENDENTE EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ24}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ24}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais, com Acessório e sem Desconto e Acréscimo    @{BENEFPOTENCIALPJ24}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ24}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários PJ - Titular)   @{BENEFPOTENCIALPJ24}
    E        Salvar o Beneficiário desejando incluir dependentes
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Dependente)    @{BENEFPOTENCIALPJ24}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFPOTENCIALPJ24}
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 25 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR025: CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ25}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ25}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais, com Acessório e sem Desconto e Acréscimo    @{BENEFPOTENCIALPJ25}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ25}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários PJ - Titular)   @{BENEFPOTENCIALPJ25}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFPOTENCIALPJ25}
    E        Preencher os campos obrigatórios (Beneficiários PJ - Dependente)    @{BENEFPOTENCIALPJ25}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFPOTENCIALPJ25}
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Segundo Dependente)    @{BENEFPOTENCIALPJ25}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFPOTENCIALPJ25}
    Então    CRM deve apresentar a tela Contrato » TITULO PJ, com Beneficiário Titular e Dependentes incluidos    @{BENEFPOTENCIALPJ25}


Teste de Regressão 26 - BENEFICIARIO - IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR026: IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ26}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ26}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais, com Acessório e sem Desconto e Acréscimo    @{BENEFPOTENCIALPJ26}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ26}
    Quando   Acessar menu IMPORTAR BENEFICIÁRIOS
    E        Selecionar, validar e confirmar arquivo (Beneficiário PJ)    @{BENEFPOTENCIALPJ26}
    E        Clicar no link "Nome Contrato PJ"    @{BENEFPOTENCIALPJ26}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiários PJ importados		@{BENEFPOTENCIALPJ26}


Teste de Regressão 27 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR027: CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ27}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ27}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFPOTENCIALPJ27}
    E        Clicar no link "Nome Oportunidade"    ${BENEFPOTENCIALPJ27[1]}
    E        Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Cadastrou Pessoa "Titular"
    E        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL
    E        Aprovou a Portabilidade
    E        Clicou no link "Nome Oportunidade" na tela Cotações    ${BENEFPOTENCIALPJ27[2]}
    E        Clicou no registro da Cotação    ${BENEFPOTENCIALPJ27[1]}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ27}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Usuário selecionar o beneficiário no campo "Pessoa da Portabilidade"
    E        Preencher demais campos obrigatórios PJ   @{BENEFPOTENCIALPJ27}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFPOTENCIALPJ27}
    Então    CRM deve apresentar a tela Contrato » TITULO PJ, com Beneficiário incluido 	@{BENEFPOTENCIALPJ27}


Teste de Regressão 28 - BENEFICIARIO - CRIAR UM BENEFICIÁRIO EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR028: CRIAR UM BENEFICIÁRIO EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ28}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ28}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFPOTENCIALPJ28}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ28}
    Quando   Usuário clicar no botão "Criar" do painel Beneficiários
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 29 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR029: CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ29}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ29}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFPOTENCIALPJ29}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ29}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários PJ - Titular)   @{BENEFPOTENCIALPJ29}
    Quando   Salvar o Beneficiário desejando incluir dependentes    @{BENEFPOTENCIALPJ29}
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 30 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO DEPENDENTE EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR030: CADASTRAR UM BENEFICIÁRIO DEPENDENTE EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ30}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ30}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFPOTENCIALPJ30}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ30}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários PJ - Titular)   @{BENEFPOTENCIALPJ30}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFPOTENCIALPJ30}
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Dependente)    @{BENEFPOTENCIALPJ30}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFPOTENCIALPJ30}
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 31 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR031: CADASTRAR UM BENEFICIÁRIO DEPENDENTE EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ31}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ31}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFPOTENCIALPJ31}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ31}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários PJ - Titular)   @{BENEFPOTENCIALPJ31}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFPOTENCIALPJ31}
    E        Preencher os campos obrigatórios (Beneficiários PJ - Dependente)    @{BENEFPOTENCIALPJ31}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFPOTENCIALPJ31}
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Segundo Dependente)    @{BENEFPOTENCIALPJ31}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFPOTENCIALPJ31}
    Então    CRM deve apresentar a tela Contrato » TITULO PJ, com Beneficiário Titular e Dependentes incluidos  @{BENEFPOTENCIALPJ31}


Teste de Regressão 32 - BENEFICIARIO - IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR032: IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ32}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ32}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo (Importação)   @{BENEFPOTENCIALPJ32}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ32}
    Quando   Acessar menu IMPORTAR BENEFICIÁRIOS
    E        Selecionar, validar e confirmar arquivo (Beneficiário PJ)    @{BENEFPOTENCIALPJ32}
    E        Clicar no link "Nome Contrato PJ"    @{BENEFPOTENCIALPJ32}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiários PJ importados		@{BENEFPOTENCIALPJ32}


Teste de Regressão 33 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR033: CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA POTENCIAL PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL PJ com os campos obrigatórios    @{BENEFPOTENCIALPJ33}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFPOTENCIALPJ33}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFPOTENCIALPJ33}
    E        Clicar no link "Nome Oportunidade"    ${BENEFPOTENCIALPJ33[2]}
    E        Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Cadastrou Pessoa "Titular"
    E        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL
    E        Aprovou a Portabilidade
    E        Clicou no link "Nome Oportunidade" na tela Cotações    ${BENEFPOTENCIALPJ33[2]}
    E        Clicou no registro da Cotação    ${BENEFPOTENCIALPJ33[1]}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFPOTENCIALPJ33}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Usuário selecionar o beneficiário no campo "Pessoa da Portabilidade"
    E        Preencher demais campos obrigatórios PJ   @{BENEFPOTENCIALPJ33}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFPOTENCIALPJ33}
    Então    CRM deve apresentar a tela Contrato » TITULO PJ, com Beneficiário incluido	@{BENEFPOTENCIALPJ33}


Teste de Regressão 34 - BENEFICIARIO - CRIAR UM BENEFICIÁRIO EM CONTRATO VIA CONTA PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR034: CRIAR UM BENEFICIÁRIO EM CONTRATO VIA CONTA PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ34}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ34}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFCONTAPJ34}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ34}
    Quando   Usuário clicar no botão "Criar" do painel Beneficiários
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 35 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA CONTA PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR035: CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA CONTA PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ35}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ35}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFCONTAPJ35}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ35}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Titular)   @{BENEFCONTAPJ35}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFCONTAPJ35}
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 36 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO DEPENDENTE EM CONTRATO VIA CONTA PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR036: CADASTRAR UM BENEFICIÁRIO DEPENDENTE EM CONTRATO VIA CONTA PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ36}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ36}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFCONTAPJ36}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ36}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários PJ - Titular)   @{BENEFCONTAPJ36}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFCONTAPJ36}
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Dependente)    @{BENEFCONTAPJ36}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFCONTAPJ36}
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 37 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA CONTA PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR037: CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA CONTA PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ37}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ37}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFCONTAPJ37}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ37}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários PJ - Titular)   @{BENEFCONTAPJ37}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFCONTAPJ37}
    E        Preencher os campos obrigatórios (Beneficiários PJ - Dependente)    @{BENEFCONTAPJ37}
    E        Salvar o Beneficiário desejando incluir Novo Titular    @{BENEFCONTAPJ37}
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Segundo Titular)   @{BENEFCONTAPJ37}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFCONTAPJ37}
    Então    CRM deve apresentar a tela Contrato » TITULO PJ, com Beneficiário Titular e Dependentes incluidos    @{BENEFCONTAPJ37}


Teste de Regressão 38 - BENEFICIARIO - IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA CONTA PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR038: IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA CONTA PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ38}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ38}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo (Importação)   @{BENEFCONTAPJ38}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ38}
    Quando   Acessar menu IMPORTAR BENEFICIÁRIOS
    E        Selecionar, validar e confirmar arquivo (Beneficiário PJ)    @{BENEFCONTAPJ38}
    E        Clicar no link "Nome Contrato PJ"    @{BENEFCONTAPJ38}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiários PJ importados		@{BENEFCONTAPJ38}


Teste de Regressão 39 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA CONTA PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR039: CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA CONTA PJ, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ39}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ39}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFCONTAPJ39}
    E        Clicar no link "Nome Oportunidade"    ${BENEFCONTAPJ39[2]}
    E        Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Cadastrou Pessoa "Titular"
    E        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL
    E        Aprovou a Portabilidade
    E        Clicou no link "Nome Oportunidade" na tela Cotações    ${BENEFCONTAPJ39[2]}
    E        Clicou no registro da Cotação    ${BENEFCONTAPJ39[1]}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ39}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Usuário selecionar o beneficiário no campo "Pessoa da Portabilidade"
    E        Preencher demais campos obrigatórios PJ   @{BENEFCONTAPJ39}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFCONTAPJ39}
    Então    CRM deve apresentar a tela Contrato » TITULO PJ, com Beneficiário incluido	@{BENEFCONTAPJ39}


Teste de Regressão 40 - BENEFICIARIO - CRIAR UM BENEFICIÁRIO EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR040: CRIAR UM BENEFICIÁRIO EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ40}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ40}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais, com Acessório e sem Desconto e Acréscimo    @{BENEFCONTAPJ40}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ40}
    Quando   Usuário clicar no botão "Criar" do painel Beneficiários
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 41 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR041: CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ41}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ41}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais, com Acessório e sem Desconto e Acréscimo    @{BENEFCONTAPJ41}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ41}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Titular)   @{BENEFCONTAPJ41}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFCONTAPJ41}
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 42 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO DEPENDENTE EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR042: CADASTRAR UM BENEFICIÁRIO DEPENDENTE EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ42}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ42}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais, com Acessório e sem Desconto e Acréscimo    @{BENEFCONTAPJ42}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ42}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários PJ - Titular)   @{BENEFCONTAPJ42}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFCONTAPJ42}
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Dependente)    @{BENEFCONTAPJ42}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFCONTAPJ42}
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 43 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR043: CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ43}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ43}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais, com Acessório e sem Desconto e Acréscimo    @{BENEFCONTAPJ43}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ43}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários PJ - Titular)   @{BENEFCONTAPJ43}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFCONTAPJ43}
    E        Preencher os campos obrigatórios (Beneficiários PJ - Dependente)    @{BENEFCONTAPJ43}
    E        Salvar o Beneficiário desejando incluir Novo Titular    @{BENEFCONTAPJ43}
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Segundo Titular)   @{BENEFCONTAPJ43}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFCONTAPJ43}
    Então    CRM deve apresentar a tela Contrato » TITULO PJ, com Beneficiário Titular e Dependentes incluidos    @{BENEFCONTAPJ43}


Teste de Regressão 44 - BENEFICIARIO - IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR044: IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ44}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ44}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais, com Acessório e sem Desconto e Acréscimo    @{BENEFCONTAPJ44}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ44}
    Quando   Acessar menu IMPORTAR BENEFICIÁRIOS
    E        Selecionar, validar e confirmar arquivo (Beneficiário PJ)    @{BENEFCONTAPJ44}
    E        Clicar no link "Nome Contrato PJ"    @{BENEFCONTAPJ44}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiários PJ importados		@{BENEFCONTAPJ44}


Teste de Regressão 45 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR045: CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ45}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ45}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFCONTAPJ45}
    E        Clicar no link "Nome Oportunidade"    ${BENEFCONTAPJ45[2]}
    E        Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Cadastrou Pessoa "Titular"
    E        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL
    E        Aprovou a Portabilidade
    E        Clicou no link "Nome Oportunidade" na tela Cotações    ${BENEFCONTAPJ45[2]}
    E        Clicou no registro da Cotação    ${BENEFCONTAPJ45[1]}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ45}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Usuário selecionar o beneficiário no campo "Pessoa da Portabilidade"
    E        Preencher demais campos obrigatórios PJ   @{BENEFCONTAPJ45}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFCONTAPJ45}
    Então    CRM deve apresentar a tela Contrato » TITULO PJ, com Beneficiário incluido	@{BENEFCONTAPJ45}


Teste de Regressão 46 - BENEFICIARIO - CRIAR UM BENEFICIÁRIO EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR046: CRIAR UM BENEFICIÁRIO EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ46}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ46}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFCONTAPJ46}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ46}
    Quando   Usuário clicar no botão "Criar" do painel Beneficiários
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 47 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR047: CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ47}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ47}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFCONTAPJ47}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ47}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Titular)   @{BENEFCONTAPJ47}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFCONTAPJ47}
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 48 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO DEPENDENTE EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR048: CADASTRAR UM BENEFICIÁRIO DEPENDENTE EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ48}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ48}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFCONTAPJ48}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ48}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários PJ - Titular)   @{BENEFCONTAPJ48}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFCONTAPJ48}
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Dependente)    @{BENEFCONTAPJ48}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFCONTAPJ48}
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 49 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR049: CADASTRAR UM BENEFICIÁRIO TITULAR EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ49}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ49}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFCONTAPJ49}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ49}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários PJ - Titular)   @{BENEFCONTAPJ49}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFCONTAPJ49}
    E        Preencher os campos obrigatórios (Beneficiários PJ - Dependente)    @{BENEFCONTAPJ49}
    E        Salvar o Beneficiário desejando incluir Novo Titular    @{BENEFCONTAPJ49}
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Segundo Titular)   @{BENEFCONTAPJ49}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFCONTAPJ49}
    Então    CRM deve apresentar a tela Contrato » TITULO PJ, com Beneficiário Titular e Dependentes incluidos    @{BENEFCONTAPJ49}


Teste de Regressão 50 - BENEFICIARIO - IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR050: IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ50}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ50}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo (Importação)   @{BENEFCONTAPJ50}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ50}
    Quando   Acessar menu IMPORTAR BENEFICIÁRIOS
    E        Selecionar, validar e confirmar arquivo (Beneficiário PJ)    @{BENEFCONTAPJ50}
    E        Clicar no link "Nome Contrato PJ"    @{BENEFCONTAPJ50}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiários PJ importados		@{BENEFCONTAPJ50}


Teste de Regressão 51 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR051: CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA CONTA PJ, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL PJ com os campos obrigatórios (Beneficiário)   @{BENEFCONTAPJ51}
    E        Cadastrou uma Oportunidade PJ, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado    @{BENEFCONTAPJ51}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFCONTAPJ51}
    E        Clicar no link "Nome Oportunidade"    ${BENEFCONTAPJ51[1]}
    E        Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Cadastrou Pessoa "Titular"
    E        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL
    E        Aprovou a Portabilidade
    E        Clicou no link "Nome Oportunidade" na tela Cotações    ${BENEFCONTAPJ51[1]}
    E        Clicou no registro da Cotação    ${BENEFCONTAPJ51[1]}
    E        Cadastrou um Contrato PJ, preenchendo campos obrigatórios    @{BENEFCONTAPJ51}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Usuário selecionar o beneficiário no campo "Pessoa da Portabilidade"
    E        Preencher demais campos obrigatórios PJ    @{BENEFCONTAPJ51}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFCONTAPJ51}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiário incluido	@{BENEFCONTAPJ51}


Teste de Regressão 70 - BENEFICIARIO - CRIAR UM BENEFICIÁRIO EM CONTRATO VIA POTENCIAL CAEPF, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR070: CRIAR UM BENEFICIÁRIO EM CONTRATO VIA POTENCIAL CAEPF, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{BENEFPOTCAEPF70}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{BENEFPOTCAEPF70}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFPOTCAEPF70}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFPOTCAEPF70}
    Quando   Usuário clicar no botão "Criar" do painel Beneficiários
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 71 - BENEFICIARIO - CADASTRAR BENEFICIÁRIOS EM CONTRATO VIA POTENCIAL CAEPF, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR071: CADASTRAR BENEFICIÁRIOS EM CONTRATO VIA POTENCIAL CAEPF, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{BENEFPOTCAEPF71}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{BENEFPOTCAEPF71}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFPOTCAEPF71}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFPOTCAEPF71}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários PJ - Titular)   @{BENEFPOTCAEPF71}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFPOTCAEPF71}
    E        Preencher os campos obrigatórios (Beneficiários PJ - Dependente)    @{BENEFPOTCAEPF71}
    E        Salvar o Beneficiário desejando incluir Novo Titular    @{BENEFPOTCAEPF71}
    Quando   Preencher os campos obrigatórios (Beneficiários PJ - Segundo Titular)   @{BENEFPOTCAEPF71}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFPOTCAEPF71}
    Então    CRM deve apresentar a tela Contrato » TITULO CAEPF, com Beneficiário Titular e Dependentes incluidos    @{BENEFPOTCAEPF71}


Teste de Regressão 72 - BENEFICIARIO - IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA POTENCIAL CAEPF, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR072: IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA POTENCIAL CAEPF, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios   @{BENEFPOTCAEPF72}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{BENEFPOTCAEPF72}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFPOTCAEPF72}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFPOTCAEPF72}
    Quando   Acessar menu IMPORTAR BENEFICIÁRIOS
    E        Selecionar, validar e confirmar arquivo (Beneficiário CAEPF)    @{BENEFPOTCAEPF72}
    E        Clicar no link "Nome Contrato CAEPF"    @{BENEFPOTCAEPF72}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiários CAEPF importados		@{BENEFPOTCAEPF72}


Teste de Regressão 73 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA POTENCIAL CAEPF, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR073: CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA POTENCIAL CAEPF, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios   @{BENEFPOTCAEPF73}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{BENEFPOTCAEPF73}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFPOTCAEPF73}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFPOTCAEPF73}
    E        Clicar no link "Nome Oportunidade"    ${BENEFPOTCAEPF73[1]}
    E        Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Cadastrou Pessoa "Titular"
    E        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL
    E        Aprovou a Portabilidade
    E        Clicou no link "Nome Oportunidade" na tela Cotações    ${BENEFPOTCAEPF73[1]}
    E        Clicou no registro da Cotação    ${BENEFPOTCAEPF73[1]}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFPOTCAEPF73}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Usuário selecionar o beneficiário no campo "Pessoa da Portabilidade"
    E        Preencher demais campos obrigatórios PJ    @{BENEFPOTCAEPF73}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFPOTCAEPF73}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiário incluido	@{BENEFPOTCAEPF73}


Teste de Regressão 74 - BENEFICIARIO - CRIAR UM BENEFICIÁRIO EM CONTRATO VIA POTENCIAL CAEPF, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR074: CRIAR UM BENEFICIÁRIO EM CONTRATO VIA POTENCIAL CAEPF, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{BENEFPOTCAEPF74}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{BENEFPOTCAEPF74}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFPOTCAEPF74}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFPOTCAEPF74}
    Quando   Usuário clicar no botão "Criar" do painel Beneficiários
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 75 - BENEFICIARIO - CADASTRAR BENEFICIÁRIOS EM CONTRATO VIA POTENCIAL CAEPF, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR075: CADASTRAR BENEFICIÁRIOS EM CONTRATO VIA POTENCIAL CAEPF, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios    @{BENEFPOTCAEPF75}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{BENEFPOTCAEPF75}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFPOTCAEPF75}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFPOTCAEPF75}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários CAEPF - Titular)    @{BENEFPOTCAEPF75}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFPOTCAEPF75}
    E        Preencher os campos obrigatórios (Beneficiários CAEPF - Dependente)    @{BENEFPOTCAEPF75}
    E        Salvar o Beneficiário desejando incluir Novo Titular    @{BENEFPOTCAEPF75}
    Quando   Preencher os campos obrigatórios (Beneficiários CAEPF - Segundo Titular)    @{BENEFPOTCAEPF75}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFPOTCAEPF75}
    Então    CRM deve apresentar a tela Contrato » TITULO CAEPF, com Beneficiário Titular e Dependentes incluidos    @{BENEFPOTCAEPF75}


Teste de Regressão 76 - BENEFICIARIO - IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA POTENCIAL CAEPF, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR076: IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA POTENCIAL CAEPF, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios   @{BENEFPOTCAEPF76}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{BENEFPOTCAEPF76}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo (Importação)   @{BENEFPOTCAEPF76}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFPOTCAEPF76}
    Quando   Acessar menu IMPORTAR BENEFICIÁRIOS
    E        Selecionar, validar e confirmar arquivo (Beneficiário CAEPF)    @{BENEFPOTCAEPF76}
    E        Clicar no link "Nome Contrato CAEPF"    @{BENEFPOTCAEPF76}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiários CAEPF importados		@{BENEFPOTCAEPF76}


Teste de Regressão 77 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA POTENCIAL CAEPF, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR077: CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA POTENCIAL CAEPF, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou um Potencial Cliente com "Tipo" POTENCIAL CAEPF com os campos obrigatórios   @{BENEFPOTCAEPF77}
    E        Clicou no menu "Solicitar Reserva de Mercado"
    E        Clicou no link "Nome da Conta"
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{BENEFPOTCAEPF77}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo   @{BENEFPOTCAEPF77}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFPOTCAEPF77}
    E        Clicar no link "Nome Oportunidade"    ${BENEFPOTCAEPF77[1]}
    E        Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Cadastrou Pessoa "Titular"
    E        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL
    E        Aprovou a Portabilidade
    E        Clicou no link "Nome Oportunidade" na tela Cotações    ${BENEFPOTCAEPF77[1]}
    E        Clicou no registro da Cotação    ${BENEFPOTCAEPF77[1]}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFPOTCAEPF77}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Usuário selecionar o beneficiário no campo "Pessoa da Portabilidade"
    E        Preencher demais campos obrigatórios PJ    @{BENEFPOTCAEPF77}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFPOTCAEPF77}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiário incluido	@{BENEFPOTCAEPF77}


Teste de Regressão 78 - BENEFICIARIO - CRIAR UM BENEFICIÁRIO EM CONTRATO VIA CONTA CAEPF, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR078: CRIAR UM BENEFICIÁRIO EM CONTRATO VIA CONTA CAEPF, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Beneficiário)    @{BENEFCONTACAEPF78}
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{BENEFCONTACAEPF78}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFCONTACAEPF78}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFCONTACAEPF78}
    Quando   Usuário clicar no botão "Criar" do painel Beneficiários
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 79 - BENEFICIARIO - CADASTRAR BENEFICIÁRIOS EM CONTRATO VIA CONTA CAEPF, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR079: CADASTRAR BENEFICIÁRIOS EM CONTRATO VIA CONTA CAEPF, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Beneficiário)    @{BENEFCONTACAEPF79}
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{BENEFCONTACAEPF79}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo    @{BENEFCONTACAEPF79}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFCONTACAEPF79}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários CAEPF - Titular)    @{BENEFCONTACAEPF79}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFCONTACAEPF79}
    E        Preencher os campos obrigatórios (Beneficiários CAEPF - Dependente)    @{BENEFCONTACAEPF79}
    E        Salvar o Beneficiário desejando incluir Novo Titular    @{BENEFCONTACAEPF79}
    Quando   Preencher os campos obrigatórios (Beneficiários CAEPF - Segundo Titular)    @{BENEFCONTACAEPF79}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFCONTACAEPF79}
    Então    CRM deve apresentar a tela Contrato » TITULO CAEPF, com Beneficiário Titular e Dependentes incluidos    @{BENEFCONTACAEPF79}


Teste de Regressão 80 - BENEFICIARIO - IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA CONTA CAEPF, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR080: CADASTRAR BENEFICIÁRIOS EM CONTRATO VIA CONTA CAEPF, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Beneficiário)    @{BENEFCONTACAEPF80}
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{BENEFCONTACAEPF80}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo (Importação)   @{BENEFCONTACAEPF80}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFCONTACAEPF80}
    Quando   Acessar menu IMPORTAR BENEFICIÁRIOS
    E        Selecionar, validar e confirmar arquivo (Beneficiário CAEPF)    @{BENEFCONTACAEPF80}
    E        Clicar no link "Nome Contrato CAEPF"    @{BENEFCONTACAEPF80}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiários CAEPF importados		@{BENEFCONTACAEPF80}


Teste de Regressão 81 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA CONTA CAEPF, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR081: CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA CONTA CAEPF, SEM ACESSÓRIO E SEM DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Beneficiário)    @{BENEFCONTACAEPF81}
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{BENEFCONTACAEPF81}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e sem Acessório, Desconto e Acréscimo (Importação)   @{BENEFCONTACAEPF81}
    E        Clicar no link "Nome Oportunidade"    ${BENEFCONTACAEPF81[1]}
    E        Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Cadastrou Pessoa "Titular"
    E        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL
    E        Aprovou a Portabilidade
    E        Clicou no link "Nome Oportunidade" na tela Cotações    ${BENEFCONTACAEPF81[1]}
    E        Clicou no registro da Cotação    ${BENEFCONTACAEPF81[1]}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFCONTACAEPF81}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Usuário selecionar o beneficiário no campo "Pessoa da Portabilidade"
    E        Preencher demais campos obrigatórios PJ    @{BENEFCONTACAEPF81}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFCONTACAEPF81}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiário incluido	@{BENEFCONTACAEPF81}


Teste de Regressão 82 - BENEFICIARIO - CRIAR UM BENEFICIÁRIO EM CONTRATO VIA CONTA CAEPF, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR082: CRIAR UM BENEFICIÁRIO EM CONTRATO VIA CONTA CAEPF, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Beneficiário)    @{BENEFCONTACAEPF82}
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{BENEFCONTACAEPF82}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFCONTACAEPF82}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFCONTACAEPF82}
    Quando   Usuário clicar no botão "Criar" do painel Beneficiários
    Então    CRM deve apresentar a tela Beneficiário » Criar


Teste de Regressão 83 - BENEFICIARIO - CADASTRAR BENEFICIÁRIOS EM CONTRATO VIA CONTA CAEPF, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR083: CADASTRAR BENEFICIÁRIOS EM CONTRATO VIA CONTA CAEPF, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Beneficiário)    @{BENEFCONTACAEPF83}
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{BENEFCONTACAEPF83}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo    @{BENEFCONTACAEPF83}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFCONTACAEPF83}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    E        Preencher os campos obrigatórios (Beneficiários CAEPF - Titular)    @{BENEFCONTACAEPF83}
    E        Salvar o Beneficiário desejando incluir dependentes    @{BENEFCONTACAEPF83}
    E        Preencher os campos obrigatórios (Beneficiários CAEPF - Dependente)    @{BENEFCONTACAEPF83}
    E        Salvar o Beneficiário desejando incluir Novo Titular    @{BENEFCONTACAEPF83}
    Quando   Preencher os campos obrigatórios (Beneficiários CAEPF - Segundo Titular)    @{BENEFCONTACAEPF83}
    E        Salvar o Beneficiário não desejando incluir dependentes    @{BENEFCONTACAEPF83}
    Então    CRM deve apresentar a tela Contrato » TITULO CAEPF, com Beneficiário Titular e Dependentes incluidos    @{BENEFCONTACAEPF83}


Teste de Regressão 84 - BENEFICIARIO - IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA CONTA CAEPF, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR084: IMPORTAR BENEFICIÁRIOS EM CONTRATO VIA CONTA CAEPF, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Beneficiário)    @{BENEFCONTACAEPF84}
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{BENEFCONTACAEPF84}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo (Importação)   @{BENEFCONTACAEPF84}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFCONTACAEPF84}
    Quando   Acessar menu IMPORTAR BENEFICIÁRIOS
    E        Selecionar, validar e confirmar arquivo (Beneficiário CAEPF)    @{BENEFCONTACAEPF84}
    E        Clicar no link "Nome Contrato CAEPF"    @{BENEFCONTACAEPF84}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiários CAEPF importados		@{BENEFCONTACAEPF84}


Teste de Regressão 85 - BENEFICIARIO - CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA CONTA CAEPF, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    [Documentation]  BENEFICIARIO - TR085: CADASTRAR UM BENEFICIÁRIO, COM PORTABILIDADE EM CONTRATO VIA CONTA CAEPF, COM ACESSÓRIO, DESCONTO/ACRÉSCIMO
    ...              DEPENDENCIA DO CONTAS - TR022
    ...              DEPENDENCIA DO COTAÇÃO - TR061
    Dado     Usuário logou no sistema
    E        Cadastrou uma Conta com "Tipo" POTENCIAL CAEPF com os campos obrigatórios (Beneficiário)    @{BENEFCONTACAEPF85}
    E        Cadastrou uma Oportunidade CAEPF, com campo "Demonstrou interesse em produtos PF e PJ?" desmarcado  @{BENEFCONTACAEPF85}
    E        Cadastrou uma Cotação, com DOIS Produtos Assistenciais e com Acessório, Desconto e Acréscimo   @{BENEFCONTACAEPF85}
    E        Clicar no link "Nome Oportunidade"    ${BENEFCONTACAEPF85[1]}
    E        Usuário clicar no menu "Criar Portabilidade"
    E        Clicou no botão "Criar" painel Pessoa(Portabilidade)
    E        Cadastrou Pessoa "Titular"
    E        CRM deve apresentar a tela Solicitação de Portabilidade » Solicitação - DATA E HORA ATUAL
    E        Aprovou a Portabilidade
    E        Clicou no link "Nome Oportunidade" na tela Cotações    ${BENEFCONTACAEPF85[1]}
    E        Clicou no registro da Cotação    ${BENEFCONTACAEPF85[1]}
    E        Cadastrou um Contrato CAEPF, preenchendo campos obrigatórios    @{BENEFCONTACAEPF85}
    E        Usuário clicar no botão "Criar" do painel Beneficiários
    Quando   Usuário selecionar o beneficiário no campo "Pessoa da Portabilidade"
    E        Preencher demais campos obrigatórios PJ    @{BENEFCONTACAEPF85}
    E        Salvar o Beneficiário não desejando incluir dependentes   @{BENEFCONTACAEPF85}
    Então    CRM deve apresentar a tela Contrato » TITULO, com Beneficiário incluido	@{BENEFCONTACAEPF85}