Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"

#  config.vm.provider = "VirtualBox"

  config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  config.vm.provider "virtualbox" do |vb|
    vb.name = "CentOS 7 Drupal"
	vb.gui = false
    vb.memory = "1024"
  end

  config.vm.provision "shell", path: "setup.sh"

end
