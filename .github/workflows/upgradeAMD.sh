#!/bin/bash

# Instala driver AMD RX 580 (amdgpu open source) + OpenCL Proprietário (AMDGPU-PRO)
# Compatível com Arch Linux

echo "==> Atualizando sistema..."
sudo pacman -Syu --noconfirm

echo "==> Instalando drivers de vídeo AMD (open source)..."
sudo pacman -S --noconfirm xf86-video-amdgpu mesa vulkan-

