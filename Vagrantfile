# -*- mode: ruby -*- 
# vi: set ft=ruby : vsa
Vagrant.configure(2) do |config| 
 config.vm.box = "tulamelkii/VDebian12" 
 config.vm.box_version = "6.1.0.9.1" 
 config.vm.provider "virtualbox" do |v| 
 v.memory = 256 
 v.cpus = 1
 end
 config.vm.provision "shell", path: "sys.sh"
end
