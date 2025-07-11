sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
vsudo reboot
cd ~Downloads/
wget https://repo.radeon.com/amdgpu-install/6.4.1/ubuntu/noble/amdgpu-install_6.4.60401-1_all.deb
tar -jxvf amdgpu-pro*
cd amdgpu-pro*
./amdgpu-pro-install --compute
sudo reboot
