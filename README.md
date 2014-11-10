vagrant-yoeman-devenv
======================

Sets up a vagrant virtual box with yeoman and the angular generator.


Prerequisites
------------

* Install VirtualBox
* Install Vagrant


Usage
-----

* Clone this repo into root project folder
* Run `vagrant up`
* Run `vagrant ssh`
* Navigate to the angular folder(this folder will sync to the host machine) and run yeoman `cd /home/vagrant/angular; yo angular`
* Run `./grunt-fix.sh` to make the grunt server accessible from the host machine
* Start the webserver with `grunt serve`
* Open a browser on your host machine to `0.0.0.0:9000`

Easy peasy lemon squeezy.