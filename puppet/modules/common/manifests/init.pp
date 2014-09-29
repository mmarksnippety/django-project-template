class common {

    exec { 'apt-update':
        command => 'apt-get update',
        path    => '/usr/bin'
    }->

    package {[
        'augeas-tools',
        'bash-completion',
        'elinks',
        'git',
        'lsof',
#          'man',
        'screen',
        'tree',
        'language-pack-pl-base',
      ]:
      ensure => 'present',
    }->

#    exec { 'polish_locale' :
#        command => 'sudo locale-gen pl_PL.UTF-8',
#        path    => ['/usr/sbin'],
##        unless  => 'locale -a | grep pl_PL'
#    }->

    file { '/etc/motd':
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        source  => 'puppet:///modules/common/motd'
    }->

    file { '/home/vagrant/.bash_profile' :
        ensure  => 'file',
        source  => 'puppet:///modules/common/bash_profile',
        owner   => 'vagrant',
        group   => 'vagrant',
    }->

    # create bash profile rc directory
    file { '/home/vagrant/.bash_profile_rc':
        ensure => 'directory',
        owner   => 'vagrant',
        group   => 'vagrant',
    }



#  exec { 'install-epel-repo' :
#    command => 'rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm',
#    path    => ['/bin', '/usr/bin'],
#    unless  => 'rpm -qa | grep epel'
#  }->
#
#  yumrepo { 'epel':
#    enabled => 1
#  }->
  
#  package { [
#    'augeas',
#    'bash-completion',
#    'elinks',
#    'git',
#    'lsof',
#    'man',
#    'screen',
#    'tree',
#    'vim-enhanced'
#  ] :
#    ensure => 'present',
#  }->
  
#  file { '/root/.bash_profile' :
#    ensure  => 'file',
#    source  => 'puppet:///modules/common/bash_profile',
#    owner   => 'root',
#    group   => 'root',
#  }->
  
#  exec { 'backup-etc-localtime' :
#    command => 'mv /etc/localtime /etc/localtime.bak',
#    path    => ['/bin', '/usr/bin'],
#    unless  => 'ls -al /etc/localtime.bak'
#  }->
  
#  exec { 'set-timezone' :
#    command => 'ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime',
#    path    => ['/bin', '/usr/bin'],
#    unless  => 'ls -al /etc/localtime | grep /usr/share/zoneinfo/Europe/Warsaw'
#  }->
  
#  package { 'ntp' :
#    ensure  => 'present',
#  }->
  
#  exec { 'chkconfig ntpd on' :
#    path    => ['/bin', '/usr/bin', '/sbin'],
#    unless  => 'chkconfig | grep ntpd | grep 3:on'
#  }->
  
#  service { 'ntpd' :
#    ensure  => 'running'
#  }->
#
#  file { '/etc/resolv.conf' :
#    ensure  => 'file',
#    owner   => 'root',
#    group   => 'root',
#  } ->

#  augeas { "augeas:/etc/resolv.conf" :
#    context => '/files/etc/resolv.conf',
#    changes => [
#      'set search/domain[1] softintegrated.lan',
#      'set search/domain[2] loc',
#      'set nameserver 10.101.1.1'
#    ],
#  }->

#  augeas { "augeas:/etc/sysctl.conf" :
#    context => '/files/etc/sysctl.conf',
#    changes => [
#      'set #comment[16] "Disable ipv6"',
#      'set net.ipv6.conf.all.disable_ipv6 1',
#      'set net.ipv6.conf.default.disable_ipv6 1'
#    ],
#  }

}