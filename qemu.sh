sudo apt update 
sudo apt upgrade
sudo apt wget git curl 
sudo apt install ufw
sudo apt install qemu-kvm
git clone https://github.com/novnc/noVNC /tmp/vnc
# linux 4 curl --location "http://k.copy.sh/linux4.iso" --output /tmp/cdrom
# DSL 3
# curl --location "http://computernewb.com/~dartz/isos/dsl-3.4.12.iso" --output /tmp/cdrom
wget https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.271-1/virtio-win.iso
wget -O win.iso "https://software.download.prss.microsoft.com/dbazure/Win11_24H2_BrazilianPortuguese_Arm64.iso?t=9c0c3c6e-b281-4ed3-b372-78cf16b13f33&P1=1749905322&P2=601&P3=2&P4=uTxnELvnPXbBR8Pbh3OGHmUVVkK1hy2x0H%2bKX24Ne2cffwdGYWh1yotKZZIBmffoiF8OAfaqzLILbRPAdJ6RBnUhZvtP3NvRpqqOFnDaYCvnGtMS6FdbSfrVf8tASAelPZtuH%2bP2Nm4v45Dq6fJz6CSk4GEtb5NLjO44W%2fweCOa%2byK1ScMwaAjGOTkjvKtxCe9EBW7Wnf2Z%2f%2fSb8%2bKrGCJFggf5MGaW4GiM%2bXMH0xMk1GSzTe%2bCxySfxoU4mEJCSyQUWAzU32IsG8tjL%2fYWl0cygQ6PgPDLF1%2fbwPh3%2boP01X%2bp5NBrEc34gdm5YvIXPfMlGObr%2bA0PqHv0z1zHwyw%3d%3d" --output /tmp/
# curl --location "https://old-releases.ubuntu.com/releases/8.04.0/ubuntu-8.04.4-desktop-i386.iso" --output /tmp/cdrom
# Slax
# curl --location "https://ftp.sh.cvut.cz/slax/Slax-11.x/slax-ipxe.iso" --output /tmp/cdrom
# NodeOS
# curl --location "http://k.copy.sh/nodeos-kernel.bin" --output /tmp/kernel
qemu-img create win.img 128G /tmp/
qemu-system-aarch64 -M virt -cpu host -accel kvm -m 4G -smp 4 -device ramfb -device virtio-gpu-pci -bios /usr/share/qemu/qemu-uefi-aarch64.bin -device qemu-xhci -device usb-kbd -device usb-tablet -drive file=Win11_24H2_EnglishInternational_Arm64.iso,media=cdrom,if=none,id=inst -device usb-storage,drive=inst -drive file=virtio-win.iso,media=cdrom,if=none,id=iso -device usb-storage,drive=iso -drive file=win11.qcow2,if=virtio -nic user,model=virtio-net-pci,mac=2A:50:A7:4E:D9:C4 -vnc  :0
/tmp/vnc/utils/novnc_proxy
