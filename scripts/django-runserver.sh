#!/bin/bash
source /usr/local/bin/virtualenvwrapper.sh
workon $DJANGO_PROJECT
cd /vagrant/$DJANGO_PROJECT
django-admin runserver 0.0.0.0:8000
