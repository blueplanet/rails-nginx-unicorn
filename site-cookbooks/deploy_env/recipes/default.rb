#
# Cookbook Name:: deploy_env
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

directory '/var/www' do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end

directory '/home/vagrant/.ssh' do
  owner 'vagrant'
  group 'vagrant'
  mode '0700'
  action :create
end

template '/home/vagrant/.ssh/id_rsa' do
  owner 'vagrant'
  group 'vagrant'
  mode 0400
end

template '/home/vagrant/.ssh/id_rsa.pub' do
  owner 'vagrant'
  group 'vagrant'
  mode 0400
end

package 'nodejs' do
  action :install
end

template '/tmp/mysql-schema.sql' do
end

execute 'create database' do
  command "mysql -uroot -p#{node['mysql']['server_root_password']} < /tmp/mysql-schema.sql"
end
