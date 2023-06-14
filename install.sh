#!/bin/bash

# Atualiza o sistema operacional e instala pacotes necessários
sudo apt update && sudo apt upgrade -y && sudo apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common

# Adiciona a chave GPG oficial do Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Configura o repositório do Docker
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualiza a lista de pacotes do sistema e instala o Docker
sudo apt update && sudo apt install -y docker-ce docker-ce-cli containerd.io docker-compose -y

# Habilita e inicia o serviço do Docker
if ps -p1 | grep -q systemd; then
    sudo systemctl enable docker
    sudo systemctl start docker
elif grep -qEi "(Microsoft|WSL)" /proc/version &> /dev/null; then
    sudo service docker start
else
    echo "Unable to start Docker. Your system does not seem to use systemd or WSL. Execute 'wsl --set-default-version 2' and try again"
fi

# Adiciona o usuário atual ao grupo do Docker
sudo usermod -aG docker $USER && newgrp docker
