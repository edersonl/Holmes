# Orientação: Frontend QA-crm-test-panel

## Situação Atual

### Backend (Já Instalado no Servidor)

O backend do QA-crm-test-panel foi copiado de:
```
C:\Users\elima\OneDrive - Unimed Federação do Parana\crm-unimed\tests\playwright\backend
```

E instalado em:
```
/var/www/html/testesCRM/backend
```

**Status:** ✅ Funcionando

### Endpoint da API Disponíveis

- **Health Check:** `http://192.168.1.78/testesCRM/api/health`
- **Swagger Docs:** `http://192.168.1.78/testesCRM/api/docs`
- **Executar Testes:** `http://192.168.1.78/testesCRM/api/tests/*`

## O que FALTA (Frontend)

Não existe um frontend desenvolvido neste repositório. O arquivo `live-panel.html` no diretório `tests/playwright/reporters/` é apenas um **relatório em tempo real do Playwright**, que consome WebSocket diretamente dos testes, não da API do backend.

## Estrutura do Projeto Local

```
crm-unimed/
└── tests/
    └── playwright/
        ├── backend/              # ← Backend (copiado para o servidor)
        │   ├── src/
        │   ├── node_modules/
        │   ├── package.json      # ← Apenas backend, sem frontend
        │   └── README.md
        ├── docs/                 # ← Documentação
        ├── reporters/            # ← Relatórios do Playwright (não é frontend)
        │   └── live-panel.html  # ← Relatório em tempo real, não frontend do QA
        └── tests/                # ← Testes Playwright
```

## Opção 1: Criar um Frontend Simples (HTML/JS)

Se você quer criar uma interface `/testesCRM/panel`, você precisa criar um frontend que consome a API do backend.

### Estrutura necessária:

```
/var/www/html/testesCRM/
├── backend/                    # ← Já existe
│   ├── src/
│   ├── node_modules/
│   └── package.json
└── public/                     # ← CRIAR ESTE DIRETÓRIO
    ├── index.html              # ← Página principal do painel
    ├── css/
    │   └── style.css
    ├── js/
    │   ├── main.js
    │   ├── api.js
    │   └── socket.js
    └── assets/
        └── logo.png
```

### Arquivos Necessários:

1. **`index.html`** - Página principal com interface
2. **`css/style.css`** - Estilização
3. **`js/main.js`** - Lógica principal
4. **`js/api.js`** - Chamadas à API (fetch)
5. **`js/socket.js`** - Conexão WebSocket (Socket.IO)

### Endpoints da API para consumir:

```javascript
// Status do servidor
GET /api/health

// Swagger docs
GET /api/docs

// Executar teste GFI
POST /api/tests/gfi
{ user: "nome" }

// Executar regressão
POST /api/tests/regression
{ user: "nome" }

// Executar bloco específico
POST /api/tests/block
{ user: "nome", block: "T011-T020" }

// Cancelar execução
POST /api/tests/cancel
{ user: "nome" }

// Status atual
GET /api/tests/status

// Histórico
GET /api/tests/history
```

### WebSocket para atualizações em tempo real:

```javascript
const socket = io('http://192.168.1.78/testesCRM');
socket.on('executionStarted', (data) => { ... });
socket.on('executionProgress', (data) => { ... });
socket.on('executionCompleted', (data) => { ... });
```

## Opção 2: Usar Swagger UI

Se você só precisa da documentação da API, o Swagger UI já está disponível em `/api/docs`.

## Próximos Passos

1. **Defina o escopo do frontend:**
   - Quer apenas visualizar execuções?
   - Quer poder iniciar testes?
   - Quer histórico completo?

2. **Crie o diretório public:**
   ```bash
   sudo mkdir -p /var/www/html/testesCRM/public
   sudo chown -R www-data:www-data /var/www/html/testesCRM/public
   ```

3. **Copie os arquivos do frontend para o servidor:**
   ```bash
   scp -r public/* treinamento@192.168.1.78:/var/www/html/testesCRM/public/
   ```

4. **Atualize a configuração do Apache:**
   ```apache
   DocumentRoot /var/www/html/testesCRM/public
   ```

5. **Reinicie o Apache:**
   ```bash
   sudo systemctl restart apache2
   ```

## Endereço Final

Após criar o frontend, o acesso será:
- **Interface:** `http://192.168.1.78/testesCRM/panel`
- **API Health:** `http://192.168.1.78/testesCRM/api/health`
- **Swagger Docs:** `http://192.168.1.78/testesCRM/api/docs`

## Dúvidas?

Se você tem um frontend já desenvolvido em outro local, por favor me mostre a estrutura de diretórios para que eu possa orientar quais arquivos copiar.