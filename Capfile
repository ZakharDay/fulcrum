load 'deploy'
# load 'deploy/assets'
load 'config/deploy'

namespace :deploy do
 
  task :start, :roles => :app do
    build_assets
    symlink_shared
    kill_mongrel
  end

  task :restart, :roles => :app do
    start
  end

  desc "lite deploy: no assets"
  task :lite do
    set :is_lite, true
    default
  end

  task :build_assets, :roles => :app do
    if is_lite
      run "ln -s #{shared_path}/assets #{release_path}/public/assets"
    else
      run "cd #{current_release} && RAILS_ENV=production bundle exec rake assets:precompile"
    end
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