require "bundler/capistrano"
set :application, "diggthing"
#set :repository,  "https://github.com/dongtong/diggthing.git"

set :repository,  "git@github.com:dongtong/diggthing.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
set :user, "deployer"
set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :remote_cache
set :use_sudo, true
set :branch, "master"
default_run_options[:pty] = true
 
server "184.106.95.59", :web, :app, :db, :primary => true

namespace :deploy do
 
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, :roles => :app, except: {no_release: true} do
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end
 
  desc "things I need to do after deploy:setup"
  task :setup_config, :roles => :app do
    run "#{try_sudo} ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    run "#{try_sudo} ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.yml.example"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}. create db"
  end
  after "deploy:setup", "deploy:setup_config"
 
  task :symlink_config, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"
 
end