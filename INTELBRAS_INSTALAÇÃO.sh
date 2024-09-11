#!/bin/bash

# Fazendo o update
sudo apt update

# Verifica se o pacote rtl8812au-dkms está instalado
if dpkg -l | grep -q rtl8812au-dkms; then
    echo "Pacote rtl8812au-dkms encontrado. Removendo..."
    sudo apt remove -y rtl8812au-dkms
else
    echo "Pacote rtl8812au-dkms não encontrado. Continuando a instalação..."
fi

# Instalando o Git
sudo apt install -y git

# Puxando o agente de instalação
git clone https://github.com/gnab/rtl8812au.git

# Adicionando dkms ao arquivo
sudo dkms add ./rtl8812au

# Buildando o dkms
sudo dkms build 8812au/4.2.2

# Instalando o arquivo
sudo dkms install 8812au/4.2.2

echo "Instalação da Intelbras concluída!"
