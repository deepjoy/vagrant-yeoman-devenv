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

  config.vm.network :private_network, ip: "192.168.22.2"
  # config.vm.synced_folder "/home/source/jsproject", "/home/vagrant/jsproject" #, type: "nfs"

  config.vm.provision :shell, path: "puppet/bootstrap.sh"
  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.options =  ["--modulepath", "/vagrant/puppet/modules:/etc/puppet/modules"]
    puppet.manifest_file  = "site.pp"
  end
end
