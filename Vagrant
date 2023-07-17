# -*- mode: ruby -*- 
# vi: set ft=ruby : vsa
Vagrant.configure(2) do |config| 
 config.vm.box = "tulamelkii/VDebian12" 
 config.vm.box_version = "6.1.0.9.1" 
 config.vm.provider "virtualbox" do |v| 
 v.memory = 256 
 v.cpus = 1 
 end 
 config.vm.define "nfss" do |nfss|
  nfss.vm.network "forwarded_port", guest: 9090, host: 9090
  nfss.vm.network "forwarded_port", guest: 3000, host: 3000 
 nfss.vm.network "forwarded_port", guest: 9100, host: 9100 
nfss.vm.network "private_network", ip: "192.168.56.10", virtualbox__intnet: "net1"
nfss.vm.hostname = "nfss"
 end 
end 
