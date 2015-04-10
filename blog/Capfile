require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/rbenv'

set :rbenv_type, :system
set :rbenv_ruby, '2.2.1'

require 'capistrano/bundler'
require 'capistrano/rails'
require 'capistrano/rails/assets'
require 'capistrano/rails/migrations'
require 'capistrano3/unicorn'

set :linked_fiels, %w{config/secrets.yml .env config/database.yml}

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
