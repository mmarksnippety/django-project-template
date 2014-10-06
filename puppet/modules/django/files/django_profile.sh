#!/bin/sh
# setup all needed stuff with django

#echo "Setup Django env variables"
export DJANGO_PROJECT='{{ project name }}'
export DJANGO_SETTINGS_MODULE=$DJANGO_PROJECT.settings.vagrant

# install virtualenv
which virtualenv > /dev/null 2>&1
if [ $? -ne 0 ]; then
    #echo "Install virtualenv"
    sudo pip3 install virtualenv
fi

which virtualenvwrapper.sh > /dev/null 2>&1
if [ $? -ne 0 ]; then
    #echo "Install virtualenvwrapper"
    sudo pip3 install virtualenvwrapper
    mkdir -p /vagrant/virtualenv
fi

#echo "Setup virtualenvwrapper profile"
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
export WORKON_HOME=/vagrant/virtualenv
export PROJECT_HOME=/vagrant/
source /usr/local/bin/virtualenvwrapper.sh

# add django project to python path
export PYTHONPATH=$PYTHONPATH:/vagrant/$DJANGO_PROJECT

#django setup env if no virtualenvs
lsvirtualenv -b | grep $DJANGO_PROJECT > /dev/null 2>&1
if [ $? -ne 0 ]; then
    source /vagrant/scripts/django-setupenv.sh
fi

#echo "Workon $DJANGO_PROJECT"
workon $DJANGO_PROJECT

