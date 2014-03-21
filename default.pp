Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin", "/usr/local/sbin" ] }

file { "sources.list":
  path => "/etc/apt/sources.list",
  source => "/vagrant/files/sources.list",
  before => Exec['apt-get update'],
}
exec { "apt-get update":
  command => "/usr/bin/apt-get update",
}

$packages = [ "vim", "git", "sudo" ]
package { $packages:
  ensure => "installed",
  require => Exec['apt-get update'],
}

exec { "add vagrant to sudoers":
  provider => shell,
  command => 'bash -c "if [ `grep -c ^vagrant /etc/sudoers` -eq 0 ]; then /bin/echo \"vagrant ALL=(ALL) NOPASSWD: ALL\" >> /etc/sudoers; fi"',
  require => Package[$packages],
}

file { "/home/vagrant/devstack.sh":
  ensure => "present",
  owner => "vagrant",
  group => "vagrant",
  mode => "755",
  content => template("/vagrant/templates/devstack.sh.erb"),
  require => Exec['add vagrant to sudoers'],
}

#exec { "set passwd for vagrant user":
#  provider => shell,
#  command => "echo 'vagrant:1234' | chpasswd",
#}

exec { "Run devstack.sh":
  provider => shell,
  cwd => "/home/vagrant",
  user => "vagrant",
  group => "vagrant",
  command => "/bin/bash -x ./devstack.sh 2>&1",
  require => File['/home/vagrant/devstack.sh'],
}

#exec { "Run ip_forward setting":
#  provider => shell,
#  command => 'sudo bash -c "echo 'net.ipv4.ip_forward=1' >> /etc/sysctl.conf"',
#}

