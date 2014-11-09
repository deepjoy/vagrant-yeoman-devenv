#!/bin/sh
DEBIAN_FRONTEND=noninteractive
PUPPET_DIR='/etc/puppet'

if [ ! -f /root/dist-upgrade ]; then
  apt-get update
fi

mkdir -p $PUPPET_DIR
cp /vagrant/puppet/Puppetfile $PUPPET_DIR/
if [ `gem query --local | grep librarian-puppet | wc -l` -eq 0 ]; then
 apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"  install ruby-dev
 gem install librarian-puppet
 cd $PUPPET_DIR && librarian-puppet install --clean
else
 cd $PUPPET_DIR && librarian-puppet update
fi
