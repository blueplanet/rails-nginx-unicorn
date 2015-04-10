#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'nginx' do
  action :install
end

service 'nginx' do
  action [:enable, :start]
  supports :status => true, :restart => true, :reload => true
end

template '/etc/nginx/conf.d/sample.conf' do
  owner 'root'
  group 'root'
  mode 0644
  notifies :reload , 'service[nginx]'
end
