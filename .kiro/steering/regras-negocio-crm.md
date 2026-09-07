---
inclusion: auto
name: Regras de Negócio CRM
description: Regras funcionais do CRM Vendas (Beneficiários, Contas, Contratos) e fonte de modelagem no Enterprise Architect (EA). Ative ao trabalhar com regras de negócio, validações, campos, tabelas ou modelagem do CRM.
---

# Regras de Negócio do CRM Vendas

Este documento é a ponte entre o assistente e as regras de negócio do CRM Vendas.
As regras completas ficam versionadas na pasta `REGRAS_CRM/` na raiz do projeto e
são referenciadas abaixo. **Sempre consulte estes arquivos como fonte da verdade das
regras funcionais** (identificadas por códigos como `BEN_RNxxx`, `CTA_RNxxx`, `CTO_RNxxx`).

## Organização das regras

Todas as regras de negócio ficam centralizadas em `REGRAS_CRM/`. Ao adicionar novas
regras, mantenha-as nessa pasta e, se necessário, referencie o novo arquivo aqui.

### Beneficiários
Regras de cadastro, validação, família, carências e vigência de beneficiários (`BEN_RNxxx`).

#[[file:../../REGRAS_CRM/Beneficiarios.txt]]

### Contas
Regras de manutenção de contas PF/PJ, gravação, DataSUS e contratos de inativos (`CTA_RNxxx`).

#[[file:../../REGRAS_CRM/Contas.txt]]

### Contratos
Regras de criação, produtos, tabelas de preço, número do contrato e integrações (`CTO_RNxxx`).

#[[file:../../REGRAS_CRM/Contratos.txt]]

### Regras de Ligação / Compartilhadas
Regras referenciadas pelos módulos acima (links do EA): Regras Comuns (`RCxxx`),
Pessoa (`PES_RNxxx`), Integração (`ING_RNxxx`), Movimentação Cadastral, Responsável
Financeiro, Emissão de Cartão, Faturamento, entre outras. Consulte este arquivo
quando uma regra de Beneficiário/Conta/Contrato acionar outra regra por código.

#[[file:../../REGRAS_CRM/RegrasLigacao.txt]]

## Enterprise Architect (EA) — fonte de modelagem READ-ONLY

O **Enterprise Architect (Sparx Systems)** é o padrão oficial de modelagem do CRM e a
fonte da verdade para diagramas, elementos e estrutura de dados. O repositório do EA
fica em um SQL Server (catálogo `EArchitect`, host `eadb.unimedpr.com.br`) e está
disponível para consulta via servidor MCP `ea-enterprise-architect`.

**Regras de uso do EA:**

- O EA é **somente leitura (READ-ONLY)**. Nunca execute comandos de escrita
  (`INSERT`, `UPDATE`, `DELETE`, `DROP`, `ALTER`, `TRUNCATE`) no banco `EArchitect`.
- Use o EA apenas para **consultar** modelos, elementos, diagramas e relacionamentos.
- As tabelas principais do repositório do EA incluem:
  - `t_object` — elementos (classes, casos de uso, componentes, etc.)
  - `t_diagram` — diagramas
  - `t_connector` — relacionamentos entre elementos
  - `t_package` — pacotes/estrutura de organização
  - `t_attribute` — atributos dos elementos
  - `t_operation` — operações/métodos dos elementos
- Ao referenciar modelagem, cite o elemento/diagrama do EA como fonte.

Se uma regra de negócio conflitar com a modelagem do EA, sinalize a divergência ao
usuário em vez de assumir qual está correta.
