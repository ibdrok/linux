sudo apt update 
sudo apt upgrade
sudo apt wget git curl 
sudo apt install ufw
sudo apt install qemu-system
wget -O win.zip "https://archive.org/download/windows-tiny-7_202204/Tiny7.iso"
qemu-img create -f qcow2 win.img 130G
qemu-system-x86_64 -hda win.im -cdrom windows-tiny-7_202204/Tiny7.iso -boot d -accel kvm -cpu host -m 4G -vga std -net nic,model=e1000 -net user -usbdevice tablet -rtc base=localtime vnc=:1
