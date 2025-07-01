#!/bin/bash

# Instala driver AMD RX 580 (amdgpu open source) + OpenCL Proprietário (AMDGPU-PRO)
# Compatível com Arch Linux

echo "==> Atualizando sistema..."
sudo pacman -Syu --noconfirm

echo "==> Instalando drivers de vídeo AMD (open source)..."
sudo pacman -S --noconfirm xf86-video-amdgpu mesa vulkan-radeon lib32-mesa lib32-vulkan-radeon

echo "==> Instalando ferramentas de desenvolvimento..."
sudo pacman -S --noconfirm base-devel git wget clinfo

echo "==> Clonando pacote AUR opencl-amd (OpenCL AMDGPU-PRO)..."
cd /tmp
git clone https://aur.archlinux.org/opencl-amd.git
cd opencl-amd

echo "==> Compilando e instalando opencl-amd..."
makepkg -si --noconfirm

echo "==> Verificando OpenCL..."
clinfo | grep -i amd

echo "==> Instalação finalizada com sucesso."
echo "Você está usando o driver de vídeo AMD open source + OpenCL proprietário."
