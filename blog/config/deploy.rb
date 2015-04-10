# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'blog'
set :deploy_to, 'var/www/blog'
set :log_level, :debug

set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system public/assets}

# nokogiri はシステムライブラリを使うため bundle install にオプションを指定する
set :bundle_env_variables, { nokogiri_use_system_libraries: 1 }

namespace :deploy do
 desc 'Restart application'
 task :restart do
   invoke 'unicorn:restart'
 end
end
after 'deploy:publishing', 'deploy:restart'
