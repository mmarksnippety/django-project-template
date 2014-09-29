#!/bin/bash

source /usr/local/bin/virtualenvwrapper.sh

lsvirtualenv -b | grep $DJANGO_PROJECT > /dev/null 2>&1
if [ $? -ne 0 ]; then
    echo "Make virtualenv $DJANGO_PROJECT"
    mkvirtualenv $DJANGO_PROJECT
fi

workon $DJANGO_PROJECT

# upgrade pip
pip install -r /vagrant/requirements/local.txt --upgrade

# syncdb and migrate
django-admin syncdb
django-admin migrate

# update bower
django-admin bower_install
