# # vi:ft=ruby:

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/jammy64"

  config.vm.network "forwarded_port", guest: 80, host: 9999

  # server2 only had 512 MB of memory but server3 has 1 GB
  #config.vm.provider "virtualbox" do |vb|
  #  vb.customize ["modifyvm", :id, "--memory", "512"]
  #end
  #config.vm.provision "shell", path: "go.sh"
  config.vm.synced_folder ".", "/tmp/greptilian"

end
