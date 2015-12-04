#
# Cookbook Name:: omero
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

include_recipe 'apt'
include_recipe 'java'
include_recipe 'build-essential'
include_recipe 'python'
include_recipe 'postgresql::server'

package %w(zip python-tables libdb++-dev libjpeg-dev zeroc-ice35 mcpp python-matplotlib libmcpp-dev libbz2-dev git ant zsh vim)
python_pip 'django'
python_pip 'awscli'
python_pip 'pillow'
python_pip 'NumPy'
python_pip 'tables'
python_pip 'matplotlib'

user 'omero' do
  action :create
  comment 'Random User'
  gid 'users'
  home '/opt/OMERO.server'
  shell '/bin/bash'
  password '$1$JJsvHslV$szsCjVEroftprNn4JHtDi.'
end

ark 'OMERO.server' do
  path '/opt'
  owner 'omero'
  url 'http://downloads.openmicroscopy.org/omero/5.2.0/artifacts/OMERO.server-5.2.0-ice35-b12.zip'
  action :put
end

ark 'OMERO.py' do
  path '/opt'
  owner 'omero'
  url 'http://downloads.openmicroscopy.org/omero/5.2.0/artifacts/OMERO.py-5.2.0-ice35-b12.zip'
  action :put
end