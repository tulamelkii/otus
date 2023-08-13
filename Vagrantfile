# -*- mode: ruby -*- 
# vi: set ft=ruby : vsa
Vagrant.configure(2) do |config|
 config.vm.box = "tulamelkii/VDebian12" 
 config.vm.box_version = "6.1.0.9.1" 
 config.vm.provider "virtualbox" do |v| 
 v.memory = 256 
 v.cpus = 1
  end
  config.vm.define "web" do |web| 
  web.vm.network "private_network", ip: "192.168.56.10", virtualbox__intnet: "net1"
  web.vm.hostname = "web"
 end 
 config.vm.define "log" do |log| 
 log.vm.network "private_network", ip: "192.168.56.11",  virtualbox__intnet: "net1" 
 log.vm.hostname = "log" 
 end 
 
 config.vm.provision "shell", inline: <<-SHELL
 sudo su
 apt install python3.11 -y
 SHELL
     config.vm.provision "ansible" do |ansible|
     ansible.playbook = "main.yml"
     ansible.become ="true"
 end
end    
