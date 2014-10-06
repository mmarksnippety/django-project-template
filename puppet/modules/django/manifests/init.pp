class django {

    package {[
          'python3-pip',
      ]:
      ensure => 'present',
    }->

    file { '/home/vagrant/.bash_profile_rc/django_profile.sh' :
        ensure  => 'file',
        source  => 'puppet:///modules/django/django_profile.sh',
        owner   => 'vagrant',
        group   => 'vagrant',
    }->

    # scripts make executable
    file { '/vagrant/scripts/django-runserver.sh' :
        mode => '+x'
    }->

    file { '/vagrant/scripts/django-setupenv.sh' :
        mode => '+x'
    }->

    # data base
    class {'postgresql::globals':
    #  version => '9.3',
    #  manage_package_repo => true,
        encoding => 'UTF8',
        #locale  => 'pl_PL',
        user => 'postgres',
    }->

    class { 'postgresql::lib::devel':
        link_pg_config => false
    }->

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
