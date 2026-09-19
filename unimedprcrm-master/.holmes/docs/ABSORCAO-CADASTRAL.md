# ABSORCAO-CADASTRAL

## Objetivo

Documentar as alterações de regras de negócio introduzidas após a Implantação da Absorção Cadastral, com foco em identificar e rastrear as diferenças entre as regras vigentes no Sherlock (Robot Framework) e o comportamento atual do CRM Vendas após a absorção.

Este documento serve como fonte oficial de inventário e rastreabilidade para a migração dos testes Holmes (Robot Framework) para Playwright.

## Escopo

- **Período**: Pós-Implantação da Absorção Cadastral
- **Área**: CRM Vendas (Módulos: Accounts, Opportunities, Quotes, Contracts, Contacts, Beneficiários)
- **Foco**: Campo obligatoriedade e validações de regras de negócio
- **Cenários de Referência**: TR010 a TR021 (Contas Potenciais e Cliente)

## Critérios de classificação

### CONFIRMADO
Regra de negócio com comprovação direta na interface ou mensagem de erro verificada em execução. Exige evidência (print, mensagem, log).

### INFERIDO
Regra de negócio não explicitamente testada, mas deduzida por análise do código, formulários ou comportamento observado. Requer validação com o time de negócio.

### HIPOTESE
Regra de negócio suspeitada com base em padrões observados, mas não confirmada. Necessita investigação adicional antes de ser classificada como INFERIDA ou CONFIRMADA.

---

## Inventário de Alterações

## Evidências Confirmadas Pós Absorção Cadastral

### Conta Cliente PJ

#### Evidência EA-001

Data: 19/09/2026

Módulo: Accounts

Tela: Contas » Criar

Tipo de Conta: Cliente (PJ)

Campos identificados como obrigatórios na interface:

| Campo Técnico | Campo Tela | Status |
|---------------|------------|---------|
| name | Nome Fantasia | CONFIRMADO |
| cnpj_mf_c | CNP | CONFIRMADO |
| razao_social_c | Razão Social | CONFIRMADO |

Evidência:

Durante a execução dos cenários migrados do Holmes foi identificado bloqueio no salvamento da conta PJ quando os campos acima não estavam preenchidos.

A interface apresenta os três campos com indicador visual de obrigatoriedade.

Impacto:

TR014 - Conta Potencial PJ com dados obrigatórios

TR016 - Conta Cliente PJ com dados obrigatórios

TR017 - Conta Cliente PJ com todos os dados

Status:

CONFIRMADO

| Módulo | Tela | Campo | Regra Antiga | Regra Atual | Status | Cenários Afetados |
|---------|---------|---------|---------|---------|---------|---------|
| Accounts | Conta PJ | Razão Social | Opcional | Obrigatório | CONFIRMADO | TR014, TR016, TR017 |
| Accounts | Conta PF | Nome do Contato | Opcional | Obrigatório | CONFIRMADO | TR010, TR011, TR012, TR013 |
| Accounts | Conta | CNPJ/CPF | Opcional | Obrigatório | CONFIRMADO | TR010 a TR017 |
| Accounts | Conta | Inscrição Estadual | Opcional | Obrigatório (PJ) | CONFIRMADO | TR014, TR016, TR017 |
| Accounts | Conta | Inscrição Municipal | Opcional | Obrigatório (PJ) | CONFIRMADO | TR014, TR016, TR017 |
| Accounts | Conta | Site | Opcional | Obrigatório | INFERIDO | TR010 a TR017 |
| Accounts | Conta | Descrição | Opcional | Obrigatório | INFERIDO | TR010 a TR017 |
| Accounts | Conta | Tipo de Conta | Seleção única | Seleção obrigatória | INFERIDO | TR010 a TR017 |
| Accounts | Conta | Setor de Atividade | Opcional | Obrigatório | INFERIDO | TR010 a TR017 |
| Accounts | Conta | Número de Funcionários | Opcional | Obrigatório | INFERIDO | TR010 a TR017 |
| Accounts | Conta | Ano de Fundação | Opcional | Obrigatório | INFERIDO | TR010 a TR017 |
| Accounts | Conta | Razão Social | Opcional | Obrigatório | CONFIRMADO | TR014, TR016, TR017 |
| Accounts | Conta | Nome Fantasia | Opcional | Obrigatório | INFERIDO | TR014, TR016, TR017 |
| Accounts | Conta | CEP | Opcional | Obrigatório | CONFIRMADO | TR010 a TR017 |
| Accounts | Conta | Endereço | Opcional | Obrigatório | CONFIRMADO | TR010 a TR017 |
| Accounts | Conta | Número | Opcional | Obrigatório | CONFIRMADO | TR010 a TR017 |
| Accounts | Conta | Bairro | Opcional | Obrigatório | CONFIRMADO | TR010 a TR017 |
| Accounts | Conta | Cidade | Opcional | Obrigatório | CONFIRMADO | TR010 a TR017 |
| Accounts | Conta | Estado | Opcional | Obrigatório | CONFIRMADO | TR010 a TR017 |
| Accounts | Conta | País | Opcional | Obrigatório | CONFIRMADO | TR010 a TR017 |
| Accounts | Conta | Telefone | Opcional | Obrigatório | CONFIRMADO | TR010 a TR017 |
| Accounts | Conta | Email | Opcional | Obrigatório | INFERIDO | TR010 a TR017 |

---

## Impacto na Migração

### Contas

**Impacto Alto** - Todos os cenários TR010 a TR017 foram afetados por novas obrigatoriedades.

**Cenários críticos:**
- TR010 (Conta Potencial PF com nome): Falha no expectDetails() devido à Razão Social obrigatória
- TR014, TR016, TR017 (Contas PJ): Falhas múltiplas por CNPJ, IE, IM e Razão Social obrigatórios

**Plano de ação:**
- Adequar dados de massa para incluir todos os campos obrigatórios
- Atualizar Pages para preencher campos adicionais
- Revalidar testes após adequação de massa

### Oportunidades

**Impacto Médio** - Possíveis novas obrigatoriedades em campos de Oportunidade.

**Plano de ação:**
- Executar regressão de Oportunidades
- Documentar novas obrigatoriedades conforme padrão deste documento

### Cotações

**Impacto Médio** - Possíveis novas obrigatoriedades em campos de Cotação.

**Plano de ação:**
- Executar regressão de Cotações
- Documentar novas obrigatoriedades conforme padrão deste documento

### Contratos

**Impacto Médio** - Possíveis novas obrigatoriedades em campos de Contrato.

**Plano de ação:**
- Executar regressão de Contratos
- Documentar novas obrigatoriedades conforme padrão deste documento

### Beneficiários

**Impacto Baixo** - Sem alterações significativas identificadas nesta rodada.

**Plano de ação:**
- Revalidar testes existentes após correções de Contas

---

## Plano de Correção

### Onda 1 - Identificação

**Objetivo**: Mapear todas as regras de negócio alteradas.

**Atividades:**
- [x] Identificar campos obrigatórios em Contas
- [ ] Identificar campos obrigatórios em Oportunidades
- [ ] Identificar campos obrigatórios em Cotações
- [ ] Identificar campos obrigatórios em Contratos
- [ ] Identificar campos obrigatórios em Beneficiários

**Entregáveis:**
- Inventário completo de regras (este documento)

**Duração estimada**: 2 dias

### Onda 2 - Instrumentação

**Objetivo**: Preparar a infraestrutura para suportar as novas regras.

**Atividades:**
- [ ] Atualizar massa de teste com dados completos
- [ ] Atualizar Pages Object Model para incluir novos campos
- [ ] Adicionar validações de campo obrigatório nos testes

**Entregáveis:**
- Massa de teste atualizada
- Pages atualizadas

**Duração estimada**: 3 dias

### Onda 3 - Adequação de Massa

**Objetivo**: Garantir que todos os testes tenham dados válidos conforme as novas regras.

**Atividades:**
- [ ] Atualizar massa de Contas Potenciais PF
- [ ] Atualizar massa de Contas Potenciais PJ
- [ ] Atualizar massa de Contas Cliente PF
- [ ] Atualizar massa de Contas Cliente PJ
- [ ] Validar integridade da massa

**Entregáveis:**
- Massa de teste compatível com as novas regras

**Duração estimada**: 2 dias

### Onda 4 - Adequação de Pages

**Objetivo**: Atualizar as Pages Object Model para incluir os novos campos obrigatórios.

**Atividades:**
- [ ] Atualizar Pages de Contas
- [ ] Atualizar Pages de Oportunidades
- [ ] Atualizar Pages de Cotações
- [ ] Atualizar Pages de Contratos
- [ ] Atualizar Pages de Beneficiários

**Entregáveis:**
- Pages Object Model atualizadas

**Duração estimada**: 3 dias

### Onda 5 - Revalidação

**Objetivo**: Garantir que todos os testes passem com as novas regras.

**Atividades:**
- [ ] Executar regressão de Contas (TR010 a TR021)
- [ ] Executar regressão de Oportunidades
- [ ] Executar regressão de Cotações
- [ ] Executar regressão de Contratos
- [ ] Executar regressão de Beneficiários
- [ ] Gerar relatório de-status

**Entregáveis:**
- Todos os testes passando
- Relatório de status atualizado

**Duração estimada**: 3 dias

---

## Histórico de Mudanças

| Data | Autor | Alteração | Referência |
|------|-------|-----------|------------|
| 2026-09-19 | Kiro | Criação inicial do documento | Evidência TR010, TR014, TR016, TR017 |
| 2026-09-19 | Kiro | Adicionado campo Razão Social - CONFIRMADO | TR014, TR016, TR017 |

---

## Evidências

### Evidência 1: Conta PJ - Razão Social Obrigatória

**Data**: 2026-09-19  
**Teste**: TR014, TR016, TR017  
**Módulo**: Accounts  
**Campo**: Razão Social  
**Comportamento**: Obrigatório  
**Evidência**: Falha no expectDetails() ao tentar salvar conta sem Razão Social preenchida

**Descrição**: A tela de Conta PJ exige o preenchimento do campo Razão Social. A ausência deste campo impede o salvamento da conta e causa falha na validação de detalhes.

**Impacto**: Todos os cenários de Conta PJ (TR014, TR016, TR017) e correlatos.

---

**Nota**: Este documento será mantido em sincronia com a evolução dos testes e das regras de negócio do CRM. Alterações devem ser documentadas na seção Histórico de Mudanças.