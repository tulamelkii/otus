# -*- mode: ruby -*- 
# vi: set ft=ruby : vsa
Vagrant.configure(2) do |config| 
 config.vm.box = "tulamelkii/VDebian12" 
 config.vm.box_version = "6.1.0.9.1" 
 config.vm.provider "virtualbox" do |v| 
 v.memory = 256 
 v.cpus = 1 
 end 
 config.vm.define "pam" do |pam|
   pam.vm.synced_folder ".", "/vagrant", disable: true
  pam.vm.network "private_network", ip: "192.168.56.10", virtualbox__intnet: "net1"
  pam.vm.network "private_network", ip: "192.168.56.11", virtualbox__intnet: "net2"
pam.vm.hostname = "pam"
 
pam.vm.provision "shell", inline: <<-SHELL
          sed -i 's/^PasswordAuthentication.*$/PasswordAuthentication yes/' /etc/ssh/sshd_config
          systemctl restart sshd.service
  	  SHELL
 end
end 
