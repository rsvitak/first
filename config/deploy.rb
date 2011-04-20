set :application, "firemniflotila"
set :repository, "git://github.com/rsvitak/first.git"

set :scm, "git"

role :web, "server7.railshosting.cz"
role :app, "server7.railshosting.cz"
role :db,  "server7.railshosting.cz", :primary => true

set :deploy_to, "/home/firemniflotila/app/"
set :user, "firemniflotila"

set :use_sudo, false

task :after_update_code, :roles => [:app, :db] do
  run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
end


namespace :deploy do
  task :start, :roles => :app do
  end
end

namespace :deploy do
  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end
end
