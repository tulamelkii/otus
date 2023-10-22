# -*- mode: ruby -*-
# vim: set ft=ruby

MACHINES = {
:Server => {
        :box_name => "debian/bullseye64",
        :vm_name => "Server",
        :net => [
                   {ip: '192.168.20.2', adapter: 2, netmask: "255.255.255.0", virtualbox__intnet: "net2"},
                  {ip: '192.168.56.10', adapter: 3},
       
        ]
  },

:Client => {
        :box_name => "debian/bullseye64",
        :vm_name => "Client",
        :net => [
                   {ip: '192.168.20.3', adapter: 2 , netmask: "255.255.255.0", virtualbox__intnet: "net2"},

                   {ip: '192.168.56.11', adapter: 3},

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

  
 if boxconfig[:vm_name] == "Client"
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
