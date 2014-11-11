class vagrant_yeoman_devenv::sys_update {
  Exec {
    path        => ["/bin/", "/sbin/", "/usr/bin/", "/usr/sbin/"],
    environment => ["DEBIAN_FRONTEND=noninteractive"],
    logoutput   => "on_failure"
  }
  $aptCommand = '/usr/bin/apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"'
  Exec["apt-get-dist-upgrade"] -> Package <| |>

  # fix the grub defaults cfg to avoid prompting in dist upgrade
  exec { "fix-grub-default":
    command => '/usr/sbin/dpkg-reconfigure grub-pc',
    unless  => "grep `date +\"%U\"` /root/dist-upgrade",
    before  => Exec["update-last-sys-update-week"]
  }

  exec { "apt-get-update":
    command => "$aptCommand update",
    require => [Exec["fix-grub-default"]],
    before  => Exec["update-last-sys-update-week"],
    unless  => "grep `date +\"%U\"` /root/dist-upgrade"
  }

  exec { "apt-get-dist-upgrade":
    command => "$aptCommand dist-upgrade",
    timeout => 1800,
    require => Exec["apt-get-update"],
    before  => Exec["update-last-sys-update-week"],
    unless  => "grep `date +\"%U\"` /root/dist-upgrade"
  }

  exec { "update-last-sys-update-week":
    command => "date +\"%U\" > /root/dist-upgrade",
    unless  => "grep `date +\"%U\"` /root/dist-upgrade"
  }

}