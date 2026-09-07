# Painel de Testes - Acesso via /testesCRM

## Objetivo

Tornar o painel de testes acessível via `http://192.168.1.78/testesCRM`

## Solução 1: Usando Nginx (Recomendado)

### Passo 1: Instalar Node.js no servidor 192.168.1.78

```cmd
# Acessar o servidor e instalar Node.js 22+
# Download: https://nodejs.org/
```

### Passo 2: Copiar o Backend para o Servidor

```cmd
# Copiar localmente ou via script:
xcopy "tests\playwright\backend\*" "\\192.168.1.78\c$\crm-unimed\tests\playwright\backend\" /E /I /Y
```

### Passo 3: Instalar Nginx no Servidor

Download: https://nginx.org/en/download.html

Ou usar Chocolatey:
```cmd
choco install nginx
```

### Passo 4: Configurar Nginx

Copie o arquivo `.inventory\nginx\testecrm.conf` para `C:\nginx\conf.d\testecrm.conf`

Edite `C:\nginx\nginx.conf` e adicione:
```nginx
http {
    # ... configurações existentes ...
    
    include conf.d/testecrm.conf;
}
```

### Passo 5: Iniciar Servidor Node.js

```cmd
cd C:\crm-unimed\tests\playwright\backend
node src/server.js
```

### Passo 6: Iniciar Nginx

```cmd
cd C:\nginx
nginx.exe
```

Ou recarregar se já estiver rodando:
```cmd
nginx.exe -s reload
```

### Passo 7: Acessar

```
http://192.168.1.78/testesCRM
http://192.168.1.78/testesCRM/panel
http://192.168.1.78/testesCRM/api/docs
```

---

## Solução 2: Redirecionamento Simples (Sem Nginx)

Se não quiser usar Nginx, o servidor roda em `http://localhost:3500` e você pode criar um redirecionamento HTML:

Crie um arquivo `index.html` no servidor com:

```html
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Painel de Testes CRM</title>
    <meta http-equiv="refresh" content="0; url=http://localhost:3500/panel">
</head>
<body>
    <p>Redirecionando para o Painel de Testes...</p>
</body>
</html>
```

---

## Estrutura de Arquivos Criados

```
.inventory/
├── nginx/
│   └── testecrm.conf          # Configuração Nginx para /testesCRM
├── scripts/
│   ├── copiar-backend-192.168.1.78.cmd
│   ├── configurar-servidor-nginx.cmd
│   └── iniciar-servidor-testecrm.cmd
└── README-testesCRM.md        # Este arquivo
```

---

## Verificação

Após a configuração, verifique acessando:

```bash
curl http://192.168.1.78/testesCRM
```

Deve redirecionar para o painel de testes.

---

## Portas e Endpoints

| Endpoint | Porta | Descrição |
|----------|-------|-----------|
| `/testesCRM` | 80 | Redireciona para o painel |
| `/testesCRM/api` | 3500 | API do servidor |
| `/testesCRM/socket.io` | 3500 | WebSocket do painel |

---

## Solução de Problemas

### Erro: "Cannot find module"
- Verifique se todos os arquivos foram copiados
- Execute `npm install` no diretório backend

### Erro: "Port 3500 already in use"
- Outro processo está usando a porta
- Execute `netstat -ano | findstr ":3500"` para identificar
- Pare o processo ou mude a porta no `.env`

### Nginx não carrega a página
- Verifique se o arquivo testecrm.conf foi copiado corretamente
- Execute `nginx -t` para testar a configuração
- Verifique os logs em `C:\nginx\logs\error.log`

---

**Sucesso**: Após configuração, o painel estará acessível em `http://192.168.1.78/testesCRM`