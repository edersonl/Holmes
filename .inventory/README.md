# Sistema de Inventário e Validação de Cobertura Funcional do CRM

## Estrutura de Diretórios

```
.inventory/
├── scripts/                    # Scripts de automação
│   ├── fase1-mapeamento/      # Mapeamento de módulos
│   ├── fase2-ea/              # Sincronização EA Enterprise
│   ├── fase3-testes/          # Inventário de testes
│   ├── fase4-cobertura/       # Validação de cobertura
│   ├── fase5-cenarios/        # Criação de cenários
│   ├── fase6-confronto/       # Confronto EA x Código
│   ├── fase7-painel/          # Painel de testes
│   ├── fase8-evidencias/      # Sistema de evidências
│   └── fase10-relatorio/      # Relatório final
├── data/                       # Dados processados
│   ├── modulos/               # Mapeamento de módulos
│   ├── ea/                    # Dados do EA
│   ├── testes/                # Inventário de testes
│   ├── cenarios/              # Cenários criados
│   └── relatorios/            # Relatórios intermediários
├── evidencias/                 # Evidências de execução
│   └── {ano}/{mes}/{dia}/{execucao}/
│       ├── logs/
│       ├── screenshots/
│       ├── requests/
│       ├── responses/
│       ├── payloads/
│       ├── database/
│       └── relatorios/
├── matriz/                     # Matrizes de relacionamento
│   ├── modulo-servico-banco.csv
│   ├── modulos-dependencias.csv
│   ├── testes-modulo-regra.csv
│   └── cobertura-geral.csv
├── config/                     # Configurações
│   ├── mapeamento.json
│   ├── ea-sync.json
│   ├── cobertura.json
│   └── relatorio.json
└── relatorios/                 # Relatórios finais
    ├── {data}-relatorio-final.pdf
    └── {data}-relatorio-executivo.md
```

## Como Usar

### 1. Mapeamento de Módulos (FASE 1)
```bash
node scripts/fase1-mapeamento/mapear-modulos.js
```

### 2. Sincronização EA (FASE 2)
```bash
node scripts/fase2-ea/sincronizar-ea.js
```

### 3. Inventário de Testes (FASE 3)
```bash
node scripts/fase3-testes/inventariar-testes.js
```

### 4. Validação de Cobertura (FASE 4)
```bash
node scripts/fase4-cobertura/validar-cobertura.js
```

### 5. Criação de Cenários (FASE 5)
```bash
node scripts/fase5-cenarios/criar-cenarios.js
```

### 6. Confronto EA x Código (FASE 6)
```bash
node scripts/fase6-confronto/confrontar-ea-codigo.js
```

### 7. Painel de Testes (FASE 7)
```bash
node scripts/fase7-painel/iniciar-painel.js
```

### 8. Sistema de Evidências (FASE 8)
```bash
node scripts/fase8-evidencias/gerar-evidencias.js
```

### 9. Diretório de Evidências (FASE 9)
O diretório é criado automaticamente com base na data atual.

### 10. Relatório Final (FASE 10)
```bash
node scripts/fase10-relatorio/gerar-relatorio-final.js
```

## Relatórios Gerados

- `relatorio-conformidade-ea.md` - Comparação EA x Código
- `relatorio-cobertura-modulos.md` - Cobertura por módulo
- `relatorio-cobertura-geral.md` - Cobertura total do sistema
- `relatorio-final-{data}.md` - Relatório final com classificação

## Classificação Final

- **APROVADO**: >95% cobertura funcional
- **APROVADO COM RESSALVAS**: 85-95% cobertura
- **REPROVADO**: <85% cobertura

---

**Data de Início**: 04/09/2026  
**Versão**: 1.0