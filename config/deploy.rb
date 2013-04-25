require 'bundler/capistrano'
set :application, "assemblea"
set :applicationdir, "/home/admsecofr/rails/assemblea"
# set :test, '192.168.69.50'
# set :prod, '193.206.255.88'
role :web, '192.168.69.201'    # Your HTTP server, Apache/etc
role :app, '192.168.69.201'    # This may be the same as your `Web` server
role :db,  '192.168.69.201', :primary => true # This is where Rails migrations will run
ssh_options[:forward_agent] = true

default_run_options[:pty] = true
#set :repository,  "git@github.com:kranz/redberry.git"
set :repository,  "https://github.com/kranz/assemblea.git"
set :scm, :git 
set :user, "admsecofr"  
set :scm_passphrase, "forzagenoa"  # The deploy user's password
set :scm_verbose, true
set :branch, "master"
set :deploy_via, :remote_cache
set :deploy_to, applicationdir

# role :db,  "your slave db-server here"

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
   task :start do ; end
   task :stop do ; end
   task :restart, :roles => :app, :except => { :no_release => true } do
     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
   end
end