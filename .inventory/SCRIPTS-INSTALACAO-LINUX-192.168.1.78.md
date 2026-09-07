# Guia Rápido de Instalação - Servidor Linux 192.168.1.78

## Credenciais do Servidor

| Item | Valor |
|------|-------|
| **Host** | 192.168.1.78 |
| **Usuário SSH** | crm |
| **Senha SSH** | Banco$975$med |
| **Acesso ao Windows** | Administrator / C11R03M01! |

---

## Método 1: Usando WinSCP (Recomendado)

### Passo 1: Copiar arquivos com WinSCP

1. Baixe e instale o WinSCP: https://winscp.net/eng/download.php
2. Abra o WinSCP e conecte-se:
   - **Host name**: 192.168.1.78
   - **Port number**: 22
   - **User name**: crm
   - **Password**: Banco$975$med
   - **File protocol**: SFTP

3. Navegue até `/var/www/html/`
4. Crie a pasta `QA-crm-test-panel`
5. Dentro dela, crie a pasta `backend`
6. Copie todo o conteúdo de `tests\playwright\backend` para `backend/`
7. Copie o arquivo `.env-linux` para `.env` dentro de `backend/`

---

### Passo 2: Instalar Node.js no servidor

Acesse o servidor via SSH:

```bash
ssh crm@192.168.1.78
```

Instale Node.js 22:

```bash
# Atualizar o sistema
sudo apt update && sudo apt upgrade -y

# Instalar Node.js 22
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs

# Verificar instalação
node --version
npm --version
```

---

### Passo 3: Instalar dependências e iniciar o servidor

```bash
cd /var/www/html/QA-crm-test-panel/backend

# Instalar dependências
npm install --production

# Criar arquivo .env (se não copiou)
cp .env.example .env
# Edite o .env se necessário: sudo nano .env

# Testar execução
node src/server.js
```

Se funcionar, use Ctrl+C para parar e criar o serviço:

```bash
# Criar serviço systemd
sudo nano /etc/systemd/system/qa-crm-test-panel.service
```

Cole o conteúdo:

```ini
[Unit]
Description=QA CRM Test Panel Backend
After=network.target

[Service]
Type=simple
User=www-data
WorkingDirectory=/var/www/html/QA-crm-test-panel/backend
ExecStart=/usr/bin/node src/server.js
Restart=on-failure
Environment=NODE_ENV=production

[Install]
WantedBy=multi-user.target
```

Salve (Ctrl+X, depois Y, depois Enter)

```bash
# Carregar serviço
sudo systemctl daemon-reload

# Habilitar para iniciar com o sistema
sudo systemctl enable qa-crm-test-panel

# Iniciar o serviço
sudo systemctl start qa-crm-test-panel

# Verificar status
sudo systemctl status qa-crm-test-panel
```

---

### Passo 4: Configurar Nginx (Opcional, mas recomendado)

```bash
# Copiar configuração para sites-available
sudo nano /etc/nginx/sites-available/qa-crm-test-panel
```

Cole o conteúdo do arquivo `.inventory\nginx\qa-crm-test-panel.conf`

```bash
# Ativar o site
sudo ln -sf /etc/nginx/sites-available/qa-crm-test-panel /etc/nginx/sites-enabled/

# Testar configuração
sudo nginx -t

# Recarregar Nginx
sudo systemctl reload nginx
```

---

## Método 2: Copiar manualmente via Explorer

1. No seu computador, abra o Explorer
2. Digite: `\\192.168.1.78\c$`
3. Use as credenciais: Administrator / C11R03M01!
4. Navegue até `C:\crm-unimed\tests\playwright\backend`
5. Copie os arquivos
6. Acesse o servidor via RDP e execute os passos de instalação do Node.js

---

## Verificação

Após a instalação, acesse:

```
http://192.168.1.78/QA-crm-test-panel
```

Ou, se não usou Nginx:

```
http://192.168.1.78:3500
```

---

## Comandos Úteis

```bash
# Ver status do serviço
sudo systemctl status qa-crm-test-panel

# Ver logs em tempo real
sudo journalctl -u qa-crm-test-panel -f

# Ver logs do Nginx
sudo tail -f /var/log/nginx/error.log

# Reiniciar o serviço
sudo systemctl restart qa-crm-test-panel
```

---

## Problemas Comuns

### Erro: "Port 3500 already in use"

```bash
# Ver o que está usando a porta
sudo lsof -i :3500

# Parar o processo ou mudar a porta no .env
```

### Erro: "Permission denied"

```bash
# Corrigir permissões
sudo chown -R www-data:www-data /var/www/html/QA-crm-test-panel
sudo chmod -R 755 /var/www/html/QA-crm-test-panel
```

### Serviço não inicia

```bash
# Ver logs detalhados
sudo journalctl -u qa-crm-test-panel -n 50

# Verificar se o Node.js está instalado
which node
```

---

**Sucesso**: O painel estará acessível em `http://192.168.1.78/QA-crm-test-panel`