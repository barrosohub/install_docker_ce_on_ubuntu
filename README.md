# Instalação do Docker no Ubuntu

Este script Bash automatiza o processo de instalação do Docker no Ubuntu.

## Resumo do script

1. Atualiza o sistema operacional.
2. Instala pacotes necessários para adicionar o repositório do Docker.
3. Adiciona a chave GPG oficial do Docker.
4. Configura o repositório do Docker.
5. Atualiza a lista de pacotes do sistema.
6. Instala o Docker, o Docker CLI e o containerd.
7. Habilita e inicia o serviço do Docker.
8. Adiciona o usuário atual ao grupo do Docker.

## Uso

1. Abra um terminal no Ubuntu.
2. Torne o script executável com o comando `chmod +x nome_do_script.sh`.
3. Execute o script com `./nome_do_script.sh`.
4. Reinicie o terminal ou faça logout/login para aplicar as alterações ao grupo do usuário.

## Destaques do script

- `sudo apt update && sudo apt upgrade -y`: Atualiza o sistema operacional.
- `sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common`: Instala pacotes necessários.
- `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg`: Adiciona a chave GPG do Docker.
- `echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null`: Configura o repositório do Docker.
- `sudo apt install -y docker-ce docker-ce-cli containerd.io`: Instala o Docker e seus componentes.
- `sudo systemctl enable docker`: Habilita o serviço do Docker.
- `sudo systemctl start docker`: Inicia o serviço do Docker.
- `sudo usermod -aG docker $USER`: Adiciona o usuário atual ao grupo do Docker.
