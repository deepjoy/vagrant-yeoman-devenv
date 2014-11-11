class vagrant_yeoman_devenv {
  include vagrant_yeoman_devenv::sys_update
  include apt
  include nodejs

  Exec {
    path      => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"],
    logoutput => "on_failure"
  }

  apt::ppa { 'ppa:chris-lea/node.js': before => Package["nodejs"] }

  exec { "upgrade-latest-npm":
    command => "npm update npm -g",
    require => Package["nodejs"],
    unless  => "npm --version |grep \"^[2|3]\""
  }

  package { 'compass': provider => 'gem' }

  package { 'git': }

  package { 'grunt-cli':
    provider => 'npm',
    require  => Package["nodejs"]
  }

  package { 'yo':
    provider => 'npm',
    require  => Package["nodejs"]
  }

  package { 'bower':
    provider => 'npm',
    require  => Package["nodejs"]
  }

  package { 'generator-angular':
    ensure   => present,
    provider => 'npm',
    require  => Package["nodejs"]
  }

  file { "create-grunt-interface-fix-script":
    path   => "/usr/bin/fix-grunt-file-listen-host",
    ensure => "link",
    target => "/vagrant/grunt-fix.sh"
  }
}