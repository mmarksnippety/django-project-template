================================
snippety-django-project-template
================================

A project template for Django 1.7
Template with vagrant support for developping, nginix + gunicorn setup for production

Start project from template
===========================

django-admin startproject --template=./django-mm-project-template --extension py,md,rst,sh djangotest


Setup vagrant box
=================
go to project home directory and execute:
vagrant up

if dns not working see this link:
http://serverfault.com/questions/453185/vagrant-virtualbox-dns-10-0-2-3-not-working

vagrant provision is based on puppet
on provisioning is created virtualenv and installed all requiremnts for local envs

There is some usefully scripts:
django_setupenv.sh <= setup enviroments, virtualenvs and upgrade pip
django_runserver.sh <= run develop server visible on loclahost:8000

Postgresql
==========

$ psql -h localhost -U postgres
$ psql -h my.postgres.server -U