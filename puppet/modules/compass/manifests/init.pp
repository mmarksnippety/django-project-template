class compass {

    # take from https://gist.github.com/stephou0104/233b5c99884f1d8c8b8b

    exec { 'install_rvm' :
        user    => 'vagrant',
        command => "bash -c 'export HOME=/home/vagrant; curl -L https://get.rvm.io | bash -s stable';
                    bash -c 'export HOME=/home/vagrant; source ~/.rvm/scripts/rvm;
                    rvm install 2.1.2;
                    rvm use 2.1.2 --default;'",
        unless  => 'ruby -v | grep 2.1.2',
        path    => ['/bin', '/usr/bin'],
        timeout => 900
    }->

    exec { 'install_compass' :
        user    => 'vagrant',
        command => "bash -c 'export HOME=/home/vagrant; source ~/.rvm/scripts/rvm ;gem install compass'",
        unless  => "bash -c 'export HOME=/home/vagrant; source ~/.rvm/scripts/rvm ; gem list | grep compass'",
#        onlyif  => "bash -c 'source ~/.rvm/scripts/rvm ; gem list | grep compass'",
#        onlyif  => "which compass",
        path    => ['/bin', '/usr/bin'],
    }

}
