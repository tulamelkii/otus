# -*- mode: ruby -*-
# vim: set ft=ruby :
# -*- mode: ruby -*-
# vim: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.define "intRout" do |intRout|
    intRout.vm.box = "centos/7"
   # :public => {:ip => '10.10.10.1', :adapter => 1},
    intRout.vm.network "private_network", ip: "192.168.255.1", netmask: "255.255.255.252", virtualbox__intnet: "router-net"
    intRout.vm.network "private_network", ip: "192.168.56.10"
    intRout.vm.hostname = "intRout"
 end
 config.vm.define "centRout" do |centRout|
    centRout.vm.box = "centos/7"  
    centRout.vm.network "private_network", ip: '192.168.255.2', netmask: '255.255.255.252', virtualbox__intnet: "router-net"
    centRout.vm.network  "private_network", ip: '192.168.0.1', netmask: '255.255.255.240', virtualbox__intnet: "dir-net"
    centRout.vm.network  "private_network", ip:'192.168.255.9', netmask: '255.255.255.252',virtualbox__intnet: "office1Rout"
    centRout.vm.network  "private_network", ip: '192.168.0.33', netmask: '255.255.255.240', virtualbox__intnet: "hw-net" 
    centRout.vm.network  "private_network", ip: '192.168.255.5', netmask: '255.255.255.252', virtualbox__intnet: "office2Rout" 
    centRout.vm.network  "private_network", ip: '192.168.0.65',  netmask: '255.255.255.192', virtualbox__intnet: "mgt-net"
    centRout.vm.network  "private_network", ip: '192.168.56.11'
    centRout.vm.hostname = "centRout"
  end 
  config.vm.define "dirSer" do |dirSer|
    dirSer.vm.box = "centos/7"  
    dirSer.vm.network  "private_network", ip: '192.168.0.2', netmask: "255.255.255.240", virtualbox__intnet: "dir-net" 
    dirSer.vm.network  "private_network", ip: '192.168.56.12'
    dirSer.vm.hostname = "dirSer"
  end 
  config.vm.define "off1Rout" do |off1Rout|
    off1Rout.vm.box = "ubuntu/focal64"  
    off1Rout.vm.network  "private_network", ip: '192.168.255.10', netmask: "255.255.255.252", virtualbox__intnet: "office1Rout" 
    off1Rout.vm.network  "private_network", ip: '192.168.2.1', netmask: "255.255.255.192", virtualbox__intnet: "Dev" 
    off1Rout.vm.network  "private_network", ip: '192.168.2.64', netmask: "255.255.255.240", virtualbox__intnet: "Test-servers1" 
    off1Rout.vm.network  "private_network", ip: '192.168.2.129', netmask: "255.255.255.192", virtualbox__intnet: "Managers" 
    off1Rout.vm.network  "private_network", ip: '192.168.2.192', netmask: "255.255.255.192", virtualbox__intnet: "Office-hard1"
    off1Rout.vm.network  "private_network", ip: '192.168.56.13'
    off1Rout.vm.hostname = "off1Rout"
  end 
  config.vm.define "off1Ser" do |off1Ser|
    off1Ser.vm.box = "ubuntu/focal64"  
    off1Ser.vm.network  "private_network", ip: '192.168.2.130', netmask: "255.255.255.192", virtualbox__intnet: "Managers"  
    off1Ser.vm.network  "private_network", ip: '192.168.56.14'
    off1Ser.vm.hostname = "off1Ser"
  end
  config.vm.define "off2Rout" do |off2Rout|
    off2Rout.vm.box = "debian/bullseye64"
    off2Rout.vm.network  "private_network", ip: '192.168.255.6', netmask: "255.255.255.252", virtualbox__intnet: "office2Rout"  
    off2Rout.vm.network  "private_network", ip: '192.168.3.1', netmask: "255.255.255.128", virtualbox__intnet: "Dev2Serv" 
    off2Rout.vm.network  "private_network", ip: '192.168.3.129', netmask: "255.255.255.192", virtualbox__intnet: "Test-Servers2"  
    off2Rout.vm.network  "private_network", ip: '192.168.3.193', netmask: "255.255.255.192",virtualbox__intnet: "Office-hard2"
    off2Rout.vm.network  "private_network", ip: '192.168.56.15'
    off2Rout.vm.hostname = "off2Rout"
 end
 config.vm.define "off2Ser" do |off2Ser|
    off2Ser.vm.box = "debian/bullseye64" 
    off2Ser.vm.network  "private_network", ip: '192.168.3.2', netmask: "255.255.255.128", virtualbox__intnet: "Dev2Serv" 
    off2Ser.vm.network  "private_network", ip: '192.168.56.16'
    off2Ser.vm.hostname = "off2Ser"
 end
end
