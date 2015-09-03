vagrant-yeoman-devenv
======================

Sets up a vagrant virtual box based on Ubuntu 15.04 (Vivid Vervet) with yeoman and angular generator pre-configured.


Prerequisites
------------

* Install VirtualBox
* Install Vagrant

Usage
-----

* Clone this repo into a local directory
* Open a terminal and navigate to the directory created above
* Run `mkdir source`. Generated project root, accessible from the host machine
* Run `vagrant up`
* Run `vagrant ssh`
* Run `cd /home/vagrant/source`. Navigates to the source folder created above
* Run `yo angular`. Generates a yeoman project
* Run `fix-grunt-file-listen-host`. Fixes the generated grunt file to make server accessible from the host machine
* Start the grunt dev server with `grunt serve`
* Open a browser on your host machine to http://localhost:9000

Easy peasy lemon squeezy.
