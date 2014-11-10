# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # config.vm.hostname = "ui-dev"
  config.vm.box = "trusty64"
  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
  end
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  # projects folder next to this Vagrantfile will be shared with the VM
  config.vm.synced_folder "angular", "/home/vagrant/angular"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network :forwarded_port, guest: 9000, host: 9000
  config.vm.network :forwarded_port, guest: 35729, host: 35729

  config.vm.provision :shell, path: "puppet/bootstrap.sh"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.options =  ["--modulepath", "/vagrant/puppet/modules:/etc/puppet/modules"]
    puppet.manifest_file  = "site.pp"
  end
end
