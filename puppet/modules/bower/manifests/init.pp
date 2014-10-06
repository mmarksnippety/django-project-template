class bower {

    package {[
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
    }

}
