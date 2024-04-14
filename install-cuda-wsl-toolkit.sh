#!/bin/sh
# Tested OK with WSL2 Ubuntu 22.04.4 LTS
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root using sudo."
    exit 1
fi

distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
apt-get update
apt-get install -y nvidia-docker2 nvidia-container-toolkit
