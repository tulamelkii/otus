Vagrant.configure("2") do |config|
  config.vm.define "backup" do |backup|
    config.vm.box = "tulamelkii/VDebian12" 
 config.vm.box_version = "6.1.0.9.1" 
    backup.vm.network "private_network", ip: "192.168.56.10"
    
    backup.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
#      if File.exist?("machine1_disk.vdi")   
      vb.customize ["createhd", "--filename", "machine1_disk.vdi", "--size", "2000"]
      vb.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', 'machine1_disk.vdi']
    end
  end

  config.vm.define "client" do |client|
   config.vm.box = "tulamelkii/VDebian12" 
 config.vm.box_version = "6.1.0.9.1" 
    client.vm.network "private_network", ip: "192.168.56.11"
    
    client.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
#      vb.customize ["createhd", "--filename", "machine2_disk.vdi", "--size", "10240"]
 #     vb.customize ['storageattach', :id, '--storagectl', 'IDE Controller', '--port', 1, '--device', 0, '--type', 'hdd', '--medium', 'machine2_disk.vdi']
    end
   config.vm.provision "shell", inline: <<-SHELL
 sudo su
 apt install python3.11 -y
 SHELL
  end

end
