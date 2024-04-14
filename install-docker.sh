#!/bin/sh
# Tested OK with WSL2 Ubuntu 22.04.4 LTS
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root using sudo."
    exit 1
fi

apt-get update && apt-get install apt-transport-https ca-certificates curl -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update && sudo apt-get -y upgrade
apt install -y docker-ce docker-ce-cli containerd.io
/etc/init.d/docker start
echo "------------------------------------------------------------------------------------------------------------------"
echo "Optional: type 'sudo usermod -aG docker $USER' to avoid having to type 'sudo docker...' (after wsl --shutdown ...)"
echo "------------------------------------------------------------------------------------------------------------------"