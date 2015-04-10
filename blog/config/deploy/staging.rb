# staging.rb
set :stage, :staging
set :unicorn_rack_env, "staging"
set :branch, 'master'
set :rails_env, 'staging'
set :migration_role, 'db'

role :app, %w{vagrant@192.168.33.11}
role :web, %w{vagrant@192.168.33.11}
role :db, %w{vagrant@192.168.33.11}

set :ssh_options, {
  keys: [File.expand_path('/Users/gyo/sandbox/chef-repo/.vagrant/machines/default/virtualbox/private_key')],
  forward_agent: true,
  auth_methods: %w(publickey)
}

server '192.168.33.11', user: 'vagrant', roles: %w{web app db}
