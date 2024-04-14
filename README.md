# Semi-automated installation of Ubuntu 22.04 with docker and Nvidia GPU support on WSL2

## **1. Open a PowerShell window and install Ubuntu**
If necessary, first delete the existing Ubuntu distribution.
Warning: Make sure you first backup any data you do not want deleted.
- `wsl -l -v`
- `wsl --unregister Ubuntu-22.04`

Install a new Ubuntu distribution
- `wsl --install Ubuntu-22.04`

## **2. This opens an Ubuntu session**
Ubuntu will prompt you for :
- a username
- a password

Then clone this project into your home directory
- `git clone https://github.com/tostt/docker-cuda-wsl-install.git`
- `cd docker-cuda-wsl-install`

Install the CUDA WSL toolkit and docker
- `sudo ./install-cuda-wsl-toolkit.sh `
- `sudo ./install-docker.sh `

To avoid having to type `sudo docker...`,
- `sudo usermod -aG docker $USER`

Exit the Ubuntu session
- `logout`

## **3. Back in the PowerShell window**
Shut down Ubuntu and set sparse mode
- `wsl --shutdown Ubuntu-22.04 ; wsl --manage Ubuntu-22.04 --set-sparse true`

## **4. Open a new Ubuntu session**
Test that docker works and supports GPUs
- `docker run --rm --gpus all nvidia/cuda:12.4.0-devel-ubuntu22.04 nvidia-smi`
