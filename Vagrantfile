# -*- mode: ruby -*-
# vim: set ft=ruby

MACHINES = {
:inetRouter => {
        :box_name => "debian/bullseye64",
        :vm_name => "inetRouter",
        :net => [
                   {ip: '192.168.255.13', adapter: 2, netmask: '255.255.255.252', virtualbox__intnet: "router-net"}, 
                   {ip:'192.168.56.10', adapter:3, netmask: '255.255.255.0'},         
                ]
  },

:CentRouter => {
        :box_name => "debian/bullseye64",
        :vm_name => "CentRouter",
        :net => [
                   {ip: '192.168.255.14', adapter: 2, netmask: '255.255.255.252', virtualbox__intnet: "router-net"},
                   {ip: '192.168.2.5', adapter: 3, netmask: '255.255.255.252', virtualbox__intnet: "host"},
                 
                   {ip: '192.168.56.11', adapter: 4,  netmask: '255.255.255.0'},
                ]
},

:inetRouter2 => {
        :box_name => "debian/bullseye64",
        :vm_name => "inetRouter2",
        :net => [
                   {ip: '192.168.2.6', adapter: 2, netmask: '255.255.255.252', virtualbox__intnet: "host"}, 
                   {ip:'192.168.56.12', adapter: 3, netmask: '255.255.255.0'},         
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
  
 if boxconfig[:hostname] == "inetRouter2"
       box.vm.provision "ansible" do |ansible|
        ansible.playbook = "ansible/provision.yml"
        ansible.inventory_path = "ansible/hosts"
        ansible.host_key_checking = "false"
        ansible.limit = "all"
       end
end
end
end
end

