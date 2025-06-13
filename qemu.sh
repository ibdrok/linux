sudo apt update 
sudo apt upgrade
sudo apt wget git curl 
sudo apt install ufw
sudo apt install qemu-kvm
wget "https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.271-1/virtio-win.iso"
wget -O win.iso "https://software.download.prss.microsoft.com/dbazure/Win11_24H2_BrazilianPortuguese_Arm64.iso?t=fffb821c-936b-433c-8936-917b1afa6e36&P1=1749904599&P2=601&P3=2&P4=O7iV8l6wH0c7ao9sZzP%2f9FDWcygPOE2ugzukyy0BMHjzuZN3%2fM0US8%2bzjte5j5ZM8U6flcETjKIkLzgt4QaqRHIii0pjt%2bowvKr3R9TF64BbXetqgU010%2bjwpoPonmMORIdytg40dyZPZZsQOevVLIkFzEJRzmUo2qRXm9wehTfunYipuTWcoZrbRxJRoGZ9iFSLULQfJaslrt6%2fxoaTtNpjTQ7emz3Xe08jQQTqV%2bmg9%2brl7ACHhKaeHijGDQDhjmcp0AlWpYbVLTPTQmbzjXz2wnyiGvj%2bbAJy%2fty8ZT08a24e12N7CmaH%2blyCQ%2bQOpsGZuGPPi%2fcv3%2bPmwpU3lA%3d%3d"
qemu-img create -f qcow2 win.img 128G
qemu-system-aarch64 -M virt -cpu host -accel kvm -m 4G -smp 4 -device ramfb -device virtio-gpu-pci -bios /usr/share/qemu/qemu-uefi-aarch64.bin -device qemu-xhci -device usb-kbd -device usb-tablet -drive file=Win11_24H2_EnglishInternational_Arm64.iso,media=cdrom,if=none,id=inst -device usb-storage,drive=inst -drive file=virtio-win.iso,media=cdrom,if=none,id=iso -device usb-storage,drive=iso -drive file=win11.qcow2,if=virtio -nic user,model=virtio-net-pci,mac=2A:50:A7:4E:D9:C4
