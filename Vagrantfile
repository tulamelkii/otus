# -*- mode: ruby -*- 
# vi: set ft=ruby : vsa
Vagrant.configure(2) do |config|
  config.vm.define "debs" do |debs|
    debs.vm.provision "shell", path: "python3.sh" 
    debs.vm.provision "ansible" do |ansible|
     ansible.playbook = "nginx.yml"
     ansible.become ="true"
   end
  
  debs.vm.box = "tulamelkii/VDebian12"
  debs.vm.box_version = "6.1.0.9.1" 
  debs.vm.network "private_network", ip: "192.168.56.10"
  debs.vm.hostname = "debs"
  debs.vm.provision "shell", path: "python3.sh" 
  debs.vm.provider "virtualbox" do |v| 
     v.memory = 256
 end
  end
  config.vm.define "sosc" do |sosc|
  sosc.vm.provision "ansible" do |ansible|
     ansible.playbook = "nginx.yml"
     ansible.become ="true"
  end
   sosc.vm.box ="centos/7"
   sosc.vm.box_version = "2004.01"
   sosc.vm.network "private_network", ip: "192.168.56.11"
   sosc.vm.hostname = "sosc"
   sosc.vm.provider "virtualbox" do |m|
     m.memory = 256
  end 
 end
end
