#!/bin/bash

mkdir -p /etc/puppet/modules

sudo puppet module list | grep puppetlabs-postgresql > /dev/null 2>&1
if [ $? -ne 0 ]; then
    puppet module install puppetlabs/postgresql
fi



