Vagrant.configure("2") do |config|

  config.vm.define "backup" do |backup|
    backup.vm.box = "tulamelkii/VDebian12"
    backup.vm.box_version = "6.1.0.9.1"
    backup.vm.network "private_network", ip: "192.168.56.10"
    backup.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
      vb.customize ["createhd", "--filename", "machine1_disk.vdi", "--size", "2000"]
      vb.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', 'machine1_disk.vdi']
    end

    backup.vm.provision "shell", inline: <<-SHELL
      sudo su
      apt install python3.11 -y
    SHELL

    backup.vm.provision "ansible" do |ansible|
      ansible.playbook = "main.yml"
      ansible.inventory_path = "hosts"
      ansible.become = true
    end
  end

  config.vm.define "client" do |client|
    client.vm.box = "tulamelkii/VDebian12"
    client.vm.box_version = "6.1.0.9.1"
    client.vm.network "private_network", ip: "192.168.56.11"
    client.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end

    client.vm.provision "shell", inline: <<-SHELL
      sudo su
      apt install python3.11 -y
      SHELL

    client.vm.provision "ansible" do |ansible|
        ansible.playbook = "main.yml"
        ansible.inventory_path = "hosts"
        ansible.become = true
      end
      end
      
  end
