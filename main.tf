terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

variable "digitalocean_api_token" {}

provider "digitalocean" {
  token = var.digitalocean_api_token
}

resource "digitalocean_droplet" "web" {
  image  = "ubuntu-20-04-x64"
  name   = "flask-droplet"
  region = "nyc3"
  size   = "s-1vcpu-1gb"

  user_data = <<-EOT
    #!/bin/bash
    apt update -y
    apt install -y curl

    # Baixar arquivos do repositório
    curl -o /tmp/app.py https://raw.githubusercontent.com/joaoev/atividade-gc-iac/main/app.py
    curl -o /tmp/setup.sh https://raw.githubusercontent.com/joaoev/atividade-gc-iac/main/setup.sh

    chmod +x /tmp/setup.sh
    /tmp/setup.sh
  EOT

  provisioner "local-exec" {
    command = "echo Droplet created with IP: ${self.ipv4_address}"
  }
}

resource "digitalocean_firewall" "web_firewall" {
  name = "flask-firewall"

  droplet_ids = [digitalocean_droplet.web.id]

  inbound_rule {
    protocol         = "tcp"
    port_range       = "22"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  inbound_rule {
    protocol         = "tcp"
    port_range       = "80"
    source_addresses = ["0.0.0.0/0", "::/0"]
  }

  outbound_rule {
    protocol         = "tcp"
    port_range       = "all"
    destination_addresses = ["0.0.0.0/0", "::/0"]
  }
}

