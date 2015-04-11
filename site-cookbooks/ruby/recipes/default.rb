#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

ruby_version = node['ruby']['version']

group 'rbenv' do
  action :create
  members 'vagrant'
  append true
end

git "/tmp/ruby-build" do
  user 'vagrant'
  repository "git://github.com/sstephenson/ruby-build.git"
  reference "master"
  action :sync
end

execute "install -rubybuild" do
  not_if 'which ruby-build' # 既にインストール済みの場合実行しない
  user 'root'
  command 'cd /tmp/ruby-build; ./install.sh'
end

git "/usr/local/rbenv" do
  repository "git://github.com/sstephenson/rbenv.git"
  reference "master"
  action :sync
  user 'root'
  group 'rbenv'
end

template '/etc/profile.d/rbenv.sh' do
  owner 'vagrant'
  group 'rbenv'
  mode 0644
end

execute "install ruby #{ruby_version}" do
  not_if "source /etc/profile.d/rbenv.sh; rbenv versions | grep #{ruby_version}"
  command "source /etc/profile.d/rbenv.sh; rbenv install #{ruby_version}"
  action :run
end

execute 'ruby change' do
  command "source /etc/profile.d/rbenv.sh; rbenv global #{ruby_version}; rbenv rehash"
  action :run
end

execute 'install bundler' do
  user 'root'
  command 'source /etc/profile.d/rbenv.sh; gem install bundler; rbenv rehash'
  action :run
end
