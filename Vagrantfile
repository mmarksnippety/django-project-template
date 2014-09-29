# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box = "ubuntu/trusty64"
    config.vm.box_url = "https://vagrantcloud.com/ubuntu/boxes/trusty64"

    config.vm.network :forwarded_port, guest: 8000, host: 8000

    # # Add to /etc/hosts: 33.33.33.24 dev.example.com
    # config.vm.network :hostonly, "33.33.33.24"

    config.vm.provision "shell" do |shell|
        shell.path = "./scripts/puppet-setup.sh"
    end

    config.vm.provision "puppet" do |p|

        p.manifests_path    = "puppet/manifests"
        p.module_path       = "puppet/modules"
        p.manifest_file     = "site.pp"
        p.options           = "--verbose"
    end

end
