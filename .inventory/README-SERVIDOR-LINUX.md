# Instalação no Servidor Linux (192.168.1.78)

## Objetivo

Instalar o QA-crm-test-panel no servidor Linux 192.168.1.78

---

## Estrutura de Diretórios

```
/var/www/html/
├── QA-crm-test-panel/
│   ├── backend/
│   │   ├── src/
│   │   ├── public/
│   │   ├── node_modules/
│   │   ├── package.json
│   │   └── .env
│   └── public/
│       ├── panel/
│       └── docs/
```

---

## Pré-requisitos

- Servidor Linux (Ubuntu/Debian)
- Acesso root ou sudo
- Conectividade com a internet
- Node.js 22+ (será instalado pelo script)

---

## Passo 1: Preparar o Backend no Servidor

### Opção A: Copiar do seu computador (Recomendado)

No seu computador Windows, execute:

```powershell
# Copiar o backend para o servidor Linux
scp -r "c:\Users\elima\OneDrive - Unimed Federação do Parana\crm-unimed\tests\playwright\backend\*" administrator@192.168.1.78:/var/www/html/QA-crm-test-panel/backend/
```

### Opção B: Copiar via SFTP (FileZilla, WinSCP, etc.)

1. Conecte-se ao servidor 192.168.1.78
2. Navegue até `/var/www/html/`
3. Crie a pasta `QA-crm-test-panel`
4. Dentro dela, crie a pasta `backend`
5. Copie todo o conteúdo de `tests\playwright\backend` para `backend/`

---

## Passo 2: Criar o Arquivo .env

No servidor Linux:

```bash
cd /var/www/html/QA-crm-test-panel/backend
cp .env.example .env
```

Ou copie o arquivo `.env-linux` do projeto:

```bash
# No seu computador
scp "c:\Users\elima\OneDrive - Unimed Federação do Parana\crm-unimed\.inventory\scripts\.env-linux" administrator@192.168.1.78:/var/www/html/QA-crm-test-panel/backend/.env
```

---

## Passo 3: Executar o Script de Instalação

No servidor Linux:

```bash
# Copiar o script para o servidor
scp "c:\Users\elima\OneDrive - Unimed Federação do Parana\crm-unimed\.inventory\scripts\instalar-servidor-linux.sh" administrator@192.168.1.78:/tmp/

# Acessar o servidor
ssh administrator@192.168.1.78

# Tornar o script executável e rodar
chmod +x /tmp/instalar-servidor-linux.sh
sudo /tmp/instalar-servidor-linux.sh
```

---

## Passo 4: Configurar Nginx (Opcional)

Se você quiser acessar via `/QA-crm-test-panel` (recomendado):

```bash
# Copiar configuração para o servidor
scp "c:\Users\elima\OneDrive - Unimed Federação do Parana\crm-unimed\.inventory\nginx\qa-crm-test-panel.conf" administrator@192.168.1.78:/tmp/

# Acessar o servidor
ssh administrator@192.168.1.78

# Copiar para sites-available e ativar
sudo cp /tmp/qa-crm-test-panel.conf /etc/nginx/sites-available/
sudo ln -sf /etc/nginx/sites-available/qa-crm-test-panel.conf /etc/nginx/sites-enabled/

# Testar configuração e recarregar
sudo nginx -t
sudo systemctl reload nginx
```

---

## Passo 5: Verificar Instalação

### Acessar o Painel

```
http://192.168.1.78/QA-crm-test-panel
```

### Acessar a API diretamente

```
http://192.168.1.78:3500/api/docs
```

---

## Comandos Úteis

### Verificar status do serviço

```bash
sudo systemctl status qa-crm-test-panel
```

### Iniciar o serviço

```bash
sudo systemctl start qa-crm-test-panel
```

### Parar o serviço

```bash
sudo systemctl stop qa-crm-test-panel
```

### Reiniciar o serviço

```bash
sudo systemctl restart qa-crm-test-panel
```

### Ver logs em tempo real

```bash
sudo journalctl -u qa-crm-test-panel -f
```

### Ver logs do Nginx

```bash
sudo tail -f /var/log/nginx/error.log
```

---

## Solução de Problemas

### Erro: "Port 3500 already in use"

```bash
# Verificar o que está usando a porta
sudo lsof -i :3500
# ou
sudo netstat -tlnp | grep :3500

# Parar o processo ou mudar a porta no .env
```

### Erro: "Cannot find module"

```bash
# Verificar se as dependências foram instaladas
cd /var/www/html/QA-crm-test-panel/backend
npm install
```

### Nginx não carrega a página

```bash
# Verificar configuração
sudo nginx -t

# Ver logs
sudo tail -f /var/log/nginx/error.log

# Recarregar
sudo systemctl reload nginx
```

### Serviço não inicia

```bash
# Ver logs detalhados
sudo journalctl -u qa-crm-test-panel -n 50

# Verificar permissões
sudo chown -R www-data:www-data /var/www/html/QA-crm-test-panel
```

---

## Estrutura de Arquivos Criados

```
/var/www/html/
├── QA-crm-test-panel/
│   ├── backend/
│   │   ├── src/
│   │   ├── public/
│   │   ├── node_modules/
│   │   ├── package.json
│   │   └── .env
│   └── public/
│       ├── panel/
│       └── docs/
```

---

## Endpoints Disponíveis

| Endpoint | Descrição |
|----------|-----------|
| `http://192.168.1.78/QA-crm-test-panel` | Painel principal (com Nginx) |
| `http://192.168.1.78/QA-crm-test-panel/panel` | Painel de testes |
| `http://192.168.1.78/QA-crm-test-panel/api` | API do servidor |
| `http://192.168.1.78/QA-crm-test-panel/api/docs` | Documentação Swagger |
| `http://192.168.1.78:3500` | Acesso direto (sem Nginx) |

---

## Segurança

⚠️ **Importante**: Altere o `ADMIN_TOKEN` no arquivo `.env` para um valor seguro:

```bash
# Editar o arquivo
sudo nano /var/www/html/QA-crm-test-panel/backend/.env

# Mudar esta linha:
ADMIN_TOKEN=SeuTokenSeguroAqui

# Reiniciar o serviço
sudo systemctl restart qa-crm-test-panel
```

---

**Sucesso**: Após instalação, o painel estará acessível em `http://192.168.1.78/QA-crm-test-panel`