# Instalação do Docker CE no Ubuntu

Este script Bash automatiza o processo de instalação do Docker no Ubuntu

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

1. Abra um terminal do Ubuntu.
2. Baixe o script com o comando
`wget -O docker_installer.sh https://raw.githubusercontent.com/barrosohub/install_docker_ce_on_ubuntu/main/install.sh`.
3. Torne o script executável com o comando `chmod +x docker_installer.sh`.
4. Execute o script com o comando:

```bash
sudo ./docker_installer.sh
```
