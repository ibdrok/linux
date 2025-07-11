install GPU drive
wget https://raw.githubusercontent.com/ibdrok/linux/refs/heads/main/.github/workflows/Rx580.install.sh
chmod +x Rx580.install.sh
./Rx580.install.sh



configurações adicionais
Configure o driver AMD-PRO para uso
Certifique-se de que a conta de usuário seja membro do grupo "vídeo" antes de usar o driver vulkan. Você pode encontrar em quais grupos você é membro com o seguinte comando:
grupos
Se sua conta não fizer parte do grupo de vídeo, você precisará da senha sudo para elevar os seguintes comandos:
sudo usermod - um - G vídeo $LOGNAME
sudo gedit /etc/default/grub
Localize e substitua GRUB_CMDLINE_LINUX_DEFAULT="silencioso splash' com GRUB_CMDLINE_LINUX_DEFAULT="silencioso splash amdgpu.vm_fragment_size=9" 
Salve e feche o editor txt 
Execute o seguinte no terminal para atualizar o grub:
# sudo update-grub
Reiniciar



verificação 
Verificar Funcionalidade
Execute o seguinte no terminal:
lspci -k | grep -EA3 'VGA|3D|Exibição'    (Este comando indicará a placa de vídeo instalada e o driver kerneled em uso. Se funcionar corretamente deve indicar "amdgpu" (amdgpu)
sudo apt-get install mesa-utils             (Instala um pacote usado para as próximas etapas)
glxinfo | grep OpenGL                             (Esta é uma verificação adicional para verificar se o cartão AMD está ativado e funcionando)
glxinfo | grep "renderização direta"            (Se disser sim, então sua placa AMD está habilitada e não usa o processador para gráficos)
