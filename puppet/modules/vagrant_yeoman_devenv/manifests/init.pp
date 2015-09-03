class vagrant_yeoman_devenv {
  require vagrant_yeoman_devenv::sys_update
  require apt
  require nodejs

  exec { "upgrade-latest-npm":
    command   => "npm update npm -g",
    require   => Package["nodejs"],
    unless    => "npm --version |grep \"^[2|3]\"",
    path      => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"],
    logoutput => "on_failure"
  }

  package { 'compass': provider => 'gem' }

  package { 'git': }

  package { 'grunt-cli': provider => 'npm', }

  package { 'yo': provider => 'npm', }

  package { 'lodash': provider => 'npm', }

  package { 'bower': provider => 'npm', }

  package { 'generator-angular': provider => 'npm', }

  file { "create-grunt-interface-fix-script":
    path   => "/usr/bin/fix-grunt-file-listen-host",
    ensure => "link",
    target => "/vagrant/grunt-fix.sh"
  }
}

