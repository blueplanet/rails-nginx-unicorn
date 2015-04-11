#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

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

execute "install ruby 2.2.1" do
  not_if 'source /etc/profile.d/rbenv.sh; rbenv versions | grep 2.2.1'
  command 'source /etc/profile.d/rbenv.sh; rbenv install 2.2.1'
  action :run
end

execute 'ruby change' do
  command 'source /etc/profile.d/rbenv.sh; rbenv global 2.2.1; rbenv rehash'
  action :run
end

execute 'install bundler' do
  user 'root'
  command 'source /etc/profile.d/rbenv.sh; gem install bundler; rbenv rehash'
  action :run
end
