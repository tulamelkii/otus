
# -*- mode: ruby -*-
# vim: set ft=ruby :
# -*- mode: ruby -*-
# vim: set ft=ruby :

Vagrant.configure("2") do |config|

  MACHINES = [
    {
      name: "intRout",
      box: "centos/7",
      networks: [
        { type: "private_network", ip: "192.168.255.1", netmask: "255.255.255.252", virtualbox__intnet: "router-net" },
        { type: "private_network", ip: "192.168.56.10" }
      ],
      hostname: "intRout"
    },
    {
      name: "centRout",
      box: "centos/7",
      networks: [
        { type: "private_network", ip: "192.168.255.2", netmask: "255.255.255.252", virtualbox__intnet: "router-net" },
        { type: "private_network", ip: "192.168.0.1", netmask: "255.255.255.240", virtualbox__intnet: "dir-net" },
        { type: "private_network", ip: "192.168.255.9", netmask: "255.255.255.252", virtualbox__intnet: "office1Rout" },
        { type: "private_network", ip: "192.168.0.33", netmask: "255.255.255.240", virtualbox__intnet: "hw-net" },
        { type: "private_network", ip: "192.168.255.5", netmask: "255.255.255.252", virtualbox__intnet: "office2Rout" },
        { type: "private_network", ip: "192.168.0.65", netmask: "255.255.255.192", virtualbox__intnet: "mgt-net" },
        { type: "private_network", ip: "192.168.56.11" }
      ],
      hostname: "centRout"
    },
    {
      name: "dirSer",
      box: "centos/7",
      networks: [
        { type: "private_network", ip: "192.168.0.2", netmask: "255.255.255.240", virtualbox__intnet: "dir-net" },
        { type: "private_network", ip: "192.168.56.12" }
      ],
      hostname: "dirSer"
    },
    {
      name: "off1Rout",
      box: "ubuntu/focal64",
      networks: [
        { type: "private_network", ip: "192.168.255.10", netmask: "255.255.255.252", virtualbox__intnet: "office1Rout" },
        { type: "private_network", ip: "192.168.2.1", netmask: "255.255.255.192", virtualbox__intnet: "Dev" },
        { type: "private_network", ip: "192.168.2.64", netmask: "255.255.255.240", virtualbox__intnet: "Test-servers1" },
        { type: "private_network", ip: "192.168.2.129", netmask: "255.255.255.192", virtualbox__intnet: "Managers" },
        { type: "private_network", ip: "192.168.2.192", netmask: "255.255.255.192", virtualbox__intnet: "Office-hard1" },
        { type: "private_network", ip: "192.168.56.13" }
      ],
      hostname: "off1Rout"
    },
    {
      name: "off1Ser",
      box: "ubuntu/focal64",
      networks: [
        { type: "private_network", ip: "192.168.2.130", netmask: "255.255.255.192", virtualbox__intnet: "Managers" },
        { type: "private_network", ip: "192.168.56.14" }
      ],
      hostname: "off1Ser"
    },
    {
      name: "off2Rout",
      box: "debian/bullseye64",
      networks: [
        { type: "private_network", ip: "192.168.255.6", netmask: "255.255.255.252", virtualbox__intnet: "office2Rout" },
        { type: "private_network", ip: "192.168.3.1", netmask: "255.255.255.128", virtualbox__intnet: "Dev2Serv" },
        { type: "private_network", ip: "192.168.3.129", netmask: "255.255.255.192", virtualbox__intnet: "Test-Servers2" },
        { type: "private_network", ip: "192.168.3.193", netmask: "255.255.255.192", virtualbox__intnet: "Office-hard2" },
        { type: "private_network", ip: "192.168.56.15" }
      ],
      hostname: "off2Rout"
    },
    {
      name: "off2Ser",
      box: "debian/bullseye64",
      networks: [
        { type: "private_network", ip: "192.168.3.2", netmask: "255.255.255.128", virtualbox__intnet: "Dev2Serv" },
        { type: "private_network", ip: "192.168.56.16" }
      ],
      hostname: "off2Ser"
    }
  ]

  MACHINES.each do |boxcon|
    config.vm.define boxcon[:name] do |vm|
      vm.vm.box = boxcon[:box]
      boxcon[:networks].each do |network|
        vm.vm.network network[:type], ip: network[:ip], netmask: network[:netmask], virtualbox__intnet: network[:virtualbox__intnet]
      end
      vm.vm.hostname = boxcon[:hostname]
    end
  end

  last_vm = MACHINES.last
  config.vm.define last_vm[:name] do |vm|
    vm.vm.provision "ansible" do |ansible|
      ansible.playbook = "main.yml"
      ansible.inventory_path = "hosts"
      ansible.limit = "all"
    end
  end
end
