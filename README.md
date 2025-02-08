# Atividade IaC - GERÊNCIA DE CONFIGURAÇÃO (2024.2 - T01)

## 📌 Visão Geral
Este projeto utiliza Terraform para provisionar uma máquina virtual (Droplet) na DigitalOcean e configurar um servidor Flask. O servidor estará acessível na porta 80 via HTTP e permitirá acesso SSH pela porta 22.

## 🛠️ Tecnologias Utilizadas
- **Terraform** (~> 2.0)
- **DigitalOcean** (Infraestrutura Cloud)
- **Ubuntu 20.04** (Sistema Operacional do Droplet)
- **Flask** (Aplicação Web em Python)
- **Shell Script** (Automação de setup)

## 📁 Estrutura do Projeto
```
/
├── main.tf         # Código principal do Terraform
├── app.py          # Código da aplicação Flask
├── setup.sh        # Script de configuração da aplicação
├── .env.example    # Exemplo como deve ficar o .env
└── README.md       # Este arquivo
```

## 🚀 Configuração e Deploy

### 1️⃣ **Pré-requisitos**
Antes de começar, certifique-se de ter:
- Conta na **DigitalOcean** e um token de API
- **Terraform** instalado
- **Chave SSH** configurada na DigitalOcean

### 2️⃣ **Configurar Token da DigitalOcean**
Crie um arquivo `.env` na raiz do projeto e adicione:
```sh
DIGITALOCEAN_API_TOKEN="seu_token_aqui"
```
No **Windows (PowerShell)**, carregue a variável antes de executar o Terraform:
```powershell
$env:DIGITALOCEAN_API_TOKEN="seu_token_aqui"
```
No **Linux/Mac**, use:
```bash
export DIGITALOCEAN_API_TOKEN="seu_token_aqui"
```

### 3️⃣ **Inicializar o Terraform**
```bash
terraform init
```

### 4️⃣ **Planejar a Infraestrutura**
```bash
terraform plan
```

### 5️⃣ **Criar a Infraestrutura**
```bash
terraform apply -auto-approve
```

Isso criará:
- Um **Droplet** Ubuntu 20.04
- Regras de firewall para portas 22 (SSH) e 80 (HTTP)
- Download e instalação automática do Flask

### 6️⃣ **Acessar o Servidor**
Após a criação, pegue o IP do Droplet e acesse via SSH:
```bash
ssh root@SEU_IP_DO_DROPLET
```

Verifique se a aplicação está rodando:
```bash
curl http://SEU_IP_DO_DROPLET
```

### 7️⃣ **Destruir a Infraestrutura**
Para remover tudo criado pelo Terraform:
```bash
terraform destroy -auto-approve
```
## 🚀 Aplicação
Para acessar aplicação acesse:

[http://167.172.251.8/](http://167.172.251.8/)


## 📢 Considerações Finais
Agora a aplicação Flask está rodando na DigitalOcean! Se precisar de mais personalizações ou encontrar problemas, me avise. 

