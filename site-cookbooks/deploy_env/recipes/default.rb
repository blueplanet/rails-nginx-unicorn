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
  mode '0755 '
  action :create
end
