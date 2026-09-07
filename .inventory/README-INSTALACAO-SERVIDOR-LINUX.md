# Instalação QA-crm-test-panel - Servidor Linux 192.168.1.78

## Credenciais

| Item | Valor |
|------|-------|
| Host | 192.168.1.78 |
| Usuário SSH | crm |
| Senha SSH | Banco$975$med |

---

## Opção 1: WinSCP (Mais Fácil)

### Passo 1: Download WinSCP
Baixe: https://winscp.net/eng/download.php

### Passo 2: Conectar
- Host: 192.168.1.78
- Port: 22
- User: crm
- Password: Banco$975$med
- Protocol: SFTP

### Passo 3: Copiar arquivos
1. Copie o script: `.inventory\scripts\instalar-tudo-linux.sh` → `/tmp/instalar-tudo-linux.sh`
2. Copie o .env: `.inventory\scripts\.env-linux` → `/var/www/html/QA-crm-test-panel/backend/.env`

### Passo 4: Executar instalação
1. No WinSCP, vá para Terminal → Command Line
2. Execute:
```bash
chmod +x /tmp/instalar-tudo-linux.sh
bash /tmp/instalar-tudo-linux.sh
```

### Passo 5: Acessar
```
http://192.168.1.78/QA-crm-test-panel
```

---

## Opção 2: Manual (Comando a Comando)

```bash
# Acessar o servidor
ssh crm@192.168.1.78

# Instalar Node.js 22
curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs

# Instalar dependências
cd /var/www/html/QA-crm-test-panel/backend
npm install --production

# Criar serviço systemd
sudo cat > /etc/systemd/system/qa-crm-test-panel.service << 'EOF'
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
EOF

# Carregar e iniciar serviço
sudo systemctl daemon-reload
sudo systemctl enable qa-crm-test-panel
sudo systemctl start qa-crm-test-panel

# Configurar Nginx
sudo cat > /etc/nginx/sites-available/qa-crm-test-panel << 'EOF'
server {
    listen 80;
    server_name _;
    location /QA-crm-test-panel {
        alias /var/www/html/QA-crm-test-panel/public;
        try_files $uri $uri/ /panel/index.html;
    }
    location /QA-crm-test-panel/panel {
        alias /var/www/html/QA-crm-test-panel/public;
        try_files $uri $uri/ /panel/index.html;
    }
    location /QA-crm-test-panel/api {
        proxy_pass http://127.0.0.1:3500/api;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
    }
    location /QA-crm-test-panel/api/docs {
        proxy_pass http://127.0.0.1:3500/api/docs;
    }
    location /QA-crm-test-panel/socket.io {
        proxy_pass http://127.0.0.1:3500/socket.io;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $host;
    }
}
EOF

sudo ln -sf /etc/nginx/sites-available/qa-crm-test-panel /etc/nginx/sites-enabled/
sudo nginx -t && sudo systemctl reload nginx

# Verificar
sudo systemctl status qa-crm-test-panel
```

---

## Opção 3: Script Batch (Se sshpass estiver instalado)

Execute o arquivo: `.inventory\scripts\instalar.bat`

---

## Verificação

Após a instalação:

```bash
# Verificar status
sudo systemctl status qa-crm-test-panel

# Ver logs
sudo journalctl -u qa-crm-test-panel -f

# Acessar o painel
http://192.168.1.78/QA-crm-test-panel
```

---

## Comandos Úteis

```bash
# Iniciar serviço
sudo systemctl start qa-crm-test-panel

# Parar serviço
sudo systemctl stop qa-crm-test-panel

# Reiniciar serviço
sudo systemctl restart qa-crm-test-panel

# Ver logs em tempo real
sudo journalctl -u qa-crm-test-panel -f

# Ver logs do Nginx
sudo tail -f /var/log/nginx/error.log
```

---

**Sucesso**: O painel estará acessível em `http://192.168.1.78/QA-crm-test-panel`