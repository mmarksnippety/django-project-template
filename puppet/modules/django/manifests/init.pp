class django {

    package {[
          'python3-pip',
          'nodejs',
          'nodejs-legacy',
          'npm'
      ]:
      ensure => 'present',
    }->

    exec { 'install_bower' :
        command => 'sudo npm install -g bower',
        path    => ['/bin', '/usr/bin'],
        unless  => 'which bower'
    }->

    file { '/home/vagrant/.bash_profile_rc/django_profile.sh' :
        ensure  => 'file',
        source  => 'puppet:///modules/django/django_profile.sh',
        owner   => 'vagrant',
        group   => 'vagrant',
    }->

    class {'postgresql::globals':
    #  version => '9.3',
    #  manage_package_repo => true,
        encoding => 'UTF8',
        #locale  => 'pl_PL',
        user => 'postgres',
    }->

    class { 'postgresql::lib::devel': }->

    class { 'postgresql::server':
        postgres_password => 'django',
        user => 'postgres',
    }->

    postgresql::server::role { 'django':
        password_hash => postgresql_password('django', 'django'),
    }->

    postgresql::server::db { 'django':
        user     => 'django',
        password => 'django',
    }

}
