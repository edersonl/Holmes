# Diretrizes de Economia de Créditos do Kiro

## Resumo
Este documento orienta o uso eficiente dos créditos do Kiro, priorizando operações que maximizam o valor com o menor custo.

## Diretrizes de Uso

### 1. Execução Manual de Comandos
- **Priorizar**: Passar comandos longos ou repetitivos para o usuário executar manualmente
- **Exemplo**: `npm run lint`, `npm test`, builds completos, deploy's
- **Motivo**: Comandos de build/test/deploy podem ser executados localmente sem impacto nos créditos

### 2. Análise Direcionada do Código
- **Evitar**: Leituras completas da base de código quando apenas alguns arquivos específicos precisam ser analisados
- **Fazer**: Usar `file_search` ou `grep_search` com filtros específicos antes de ler arquivos
- **Motivo**: Buscas direcionadas são muito mais baratas que análise completa

### 3. Solicitar Informações Relevantes Antecipadamente
- **Solicitar**: Logs, trechos de código ou erros específicos antes de iniciar buscas amplas
- **Motivo**: Evita investigações desnecessárias baseadas em informações incompletas

### 4. Reutilização de Contexto
- **Reutilizar**: Análises e contexto já compartilhados na conversa
- **Evitar**: Repetir inspeções dos mesmos arquivos sem necessidade
- **Motivo**: Contexto já compartilhado não gera custo adicional de leitura

### 5. Alterações em Lote
- **Agrupar**: Mudanças relacionadas em uma única execução
- **Evitar**: Múltiplas execuções sequenciais para tarefas afins
- **Motivo**: Reduz overhead de idas e vindas

### 6. Escopo Limitado de Buscas
- **Focar**: Buscas em diretórios ou módulos específicos
- **Evitar**: Escaneamento completo do repositório
- **Motivo**: Buscas em subconjuntos são significativamente mais baratas

### 7. Validações Seletivas
- **Limitar**: Validations e testes completos quando apenas partes isoladas foram modificadas
- **Focar**: Em testes específicos do módulo alterado
- **Motivo**: Testes completos não são sempre necessários para validação de mudanças menores

### 8. Confirmação de Requisitos
- **Pedir**: Confirmação dos requisitos antes de iniciar tarefas potencialmente custosas
- **Motivo**: Evita retrabalho e execuções desnecessárias

### 9. Buscas Direcionadas
- **Usar**: Comandos de busca direcionados (`grep_search`, `file_search`, `list_directory`)
- **Evitar**: Análise ampla do workspace sem critérios claros
- **Motivo**: Buscas com filtros são mais econômicas e rápidas

### 10. Explicações Conceptuais
- **Priorizar**: Explicações conceituais e sugestões de implementação
- **Delegar**: Etapas operacionais que o usuário pode executar localmente
- **Motivo**: O usuário tem acesso local e pode executar operações sem usar créditos

### 11. Limitação de Artefatos
- **Evitar**: Geração de artefatos extensos (documentação completa, relatórios detalhados, refatorações grandes)
- **Fornecer**: Resumos ou orientações quando suficientes para o objetivo
- **Motivo**: Documentação e relatórios completos podem ser criados pelo usuário localmente

### 12. Foco Único
- **Manter**: Contexto da tarefa focado
- **Evitar**: Múltiplas frentes de investigação simultâneas
- **Motivo**: Investigações paralelas aumentam custo e complexidade

### 13. Encerramento Prematuro
- **Encerrar**: Análises assim que evidências suficientes forem encontradas
- **Evitar**: Exploração contínua do código sem necessidade
- **Motivo**: "Exploração exaustiva" nem sempre é necessária para responder à solicitação

### 14. Uso de Ferramentas Específicas
- **Priorizar**: `read_code` para código (AST parsing é mais barato que leitura completa)
- **Usar**: `grep_search` para encontrar padrões antes de ler arquivos
- **Evitar**: `read_file` em arquivos grandes sem filtro de linha

### 15. Confirmação de Tarefas Longas
- **Alertar**: Quando tarefa estimada exigir muitos créditos
- **Perguntar**: Se o usuário quer proceder ou prefere abordagem alternativa
- **Motivo**: Transparência e controle sobre o uso de recursos

## Princípio Geral

**Pergunta antes de executar**: "Esta tarefa é realmente necessária para resolver o problema atual, ou o usuário pode executá-la localmente?"

## Exemplo de Fluxo Eficiente

1. Usuário relata erro
2. Kiro pergunta: "Você pode compartilhar o stack trace ou mensagem de erro?"
3. Usuário fornece erro específico
4. Kiro usa `grep_search` para findar onde o erro ocorre
5. Kiro lê apenas o arquivo relevante (não todo o projeto)
6. Kiro sugere correção
7. Usuário aplica correção localmente

**Resultado**: Menos créditos usados, mesmo resultado final.
