# # vi:ft=ruby:

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://atlas.hashicorp.com/ubuntu/boxes/trusty64/versions/20150928.0.0/providers/virtualbox.box"

  config.vm.network "forwarded_port", guest: 80, host: 9999

  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "512"]
  end
  #config.vm.provision "shell", path: "go.sh"
  config.vm.synced_folder ".", "/greptilian"

end
