# Setup do Painel de Testes

## Acesso ao Painel

O painel de testes será acessível em: **http://192.168.1.78/testesCRM**

## Como Configurar

### 1. Copiar o Backend para o Servidor 192.168.1.78

```cmd
# Copiar diretório backend
xcopy "tests\playwright\backend\*" "\\192.168.1.78\c$\crm-unimed\tests\playwright\backend\" /E /I /Y /H
```

### 2. Instalar Node.js no Servidor (se necessário)

Acesse o servidor e instale Node.js 22+:
https://nodejs.org/

### 3. Iniciar o Servidor no 192.168.1.78

```cmd
cd C:\crm-unimed\tests\playwright\backend
node src/server.js
```

### 4. (Opcional) Configurar Nginx para /testesCRM

Use o arquivo `.inventory\nginx\testecrm.conf` como configuração.

## Endpoints Disponíveis

| Endpoint | Descrição |
|----------|-----------|
| `/testesCRM` | Redireciona para o painel |
| `/testesCRM/panel` | Página principal do painel |
| `/testesCRM/api/docs` | Documentação da API |
| `/testesCRM/api/cenarios` | Lista de cenários |
| `/testesCRM/socket.io` | WebSocket para execução em tempo real |

## Arquivos Criados

```
.inventory/
├── nginx/
│   └── testecrm.conf          # Configuração Nginx para /testesCRM
├── scripts/
│   ├── copiar-backend-192.168.1.78.cmd
│   ├── configurar-servidor-nginx.cmd
│   └── iniciar-servidor-testecrm.cmd
├── rodar-inventario.js        # Script principal de inventário
├── README-testesCRM.md        # Documentação completa
└── SETUP-PAINEL-TESTES.md     # Este arquivo
```

## Verificação

Após iniciar o servidor, verifique acessando:

```
http://192.168.1.78/testesCRM
```

Ou via API:

```bash
curl http://192.168.1.78/testesCRM/api/docs
```

---

**Status**: Aguardando configuração do servidor 192.168.1.78