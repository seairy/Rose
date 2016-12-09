# -*- encoding : utf-8 -*-
set :stage, :production
set :branch, 'develop'
set :rvm_type, :user
set :rvm_ruby_version, '2.1.0'
set :deploy_user, 'deploy'

server '60.205.167.123', user: 'deploy', roles: %w{web app db}

set :deploy_to, "/srv/www/Rose"
set :rails_env, :production