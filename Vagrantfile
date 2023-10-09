# -*- mode: ruby -*-
# vim: set ft=ruby

MACHINES = {
:Router1 => {
        :box_name => "debian/bullseye64",
        :vm_name => "Router1",
        :net => [
                   {ip: '10.0.10.1', adapter: 2, netmask: "255.255.255.252", virtualbox__intnet: "r1-r2"},
                   {ip: '10.0.12.1', adapter: 3, netmask: "255.255.255.252", virtualbox__intnet: "r1-r3"},
                   {ip: '192.168.10.1', adapter: 4, netmask: "255.255.255.0", virtualbox__intnet: "net1"},
                   {ip: '192.168.56.10', adapter: 5},
       
        ]
  },

:Router2 => {
        :box_name => "debian/bullseye64",
        :vm_name => "Router2",
        :net => [
             
                   {ip: '10.0.10.2', adapter: 2, netmask: "255.255.255.252", virtualbox__intnet: "r1-r2"},
                   {ip: '10.0.11.2', adapter: 3, netmask: "255.255.255.252", virtualbox__intnet: "r2-r3"},
                   {ip: '192.168.20.1', adapter: 4, netmask: "255.255.255.0", virtualbox__intnet: "net2"},
                   {ip: '192.168.56.11', adapter: 5},

                ]
},

:Router3 => {
        :box_name => "debian/bullseye64",
        :vm_name => "Router3",
        :net => [
                   {ip: '10.0.11.1', adapter: 2, netmask: "255.255.255.252", virtualbox__intnet: "r2-r3"},
                   {ip: '10.0.12.2', adapter: 3, netmask: "255.255.255.252", virtualbox__intnet: "r1-r3"},
                   {ip: '192.168.30.1', adapter: 4, netmask: "255.255.255.0", virtualbox__intnet: "net3"},
                   {ip: '192.168.56.12', adapter: 5},   
                ]
  },
}
Vagrant.configure("2") do |config|

  MACHINES.each do |boxname, boxconfig|
    
    config.vm.define boxname do |box|
   
      box.vm.box = boxconfig[:box_name]
      box.vm.host_name = boxconfig[:vm_name]
      boxconfig[:net].each do |ipconf|
      box.vm.network "private_network", ip: ipconf[:ip], virtualbox__intnet: ipconf[:virtualbox__intnet], netmask: ipconf[:netmask], adapter: ipconf[:adapter]
      end
       box.vm.provider :virtualbox do |v|
        v.customize ['modifyvm', :id, '--nested-hw-virt', 'on']
      end

  
 if boxconfig[:vm_name] == "Router3"
       box.vm.provision "ansible" do |ansible|
        ansible.playbook = "main.yml"
        ansible.inventory_path = "host"
        ansible.host_key_checking = "false"
        ansible.limit = "all"
       end
end
end
end
end
