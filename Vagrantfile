# http://vagrantup.com/v1/docs/vagrantfile.html
# # vi:ft=ruby:

Vagrant::Config.run do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.box_url = "https://vagrantcloud.com/ubuntu/boxes/trusty64/versions/1/providers/virtualbox.box"

  #config.vm.network :hostonly, "33.33.33.10"
  config.vm.forward_port 80, 9999

  config.vm.customize ["modifyvm", :id, "--memory", 1024]
  #config.vm.provision "shell", path: "go.sh"

  #config.vm.provision :puppet do |puppet|
  #  puppet.manifests_path = "manifests"
  #  puppet.module_path = "modules"
  #  puppet.manifest_file  = "init.pp"
  #end
end
