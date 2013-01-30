load 'deploy'
# load 'deploy/assets'
load 'config/deploy'

namespace :deploy do
 
  task :start, :roles => :app do
    symlink_shared
    kill_mongrel
  end

  task :restart, :roles => :app do
    start
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    run "ln -s #{config_path}/database.yml #{release_path}/config/database.yml"
    run "ln -s #{config_path}/fulcrum.rb #{release_path}/config/fulcrum.rb"
  end

  desc "Kills mongrel_rails process. Hosting provider runs it then automatically"
  task :kill_mongrel do
    run "RAILS_ENV=production ~/init.d/mongrel restart"
  end
   
end