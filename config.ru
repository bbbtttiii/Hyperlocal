require './config/environment' #links to environment

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.' #renders a warning if you try to make alterations without migrating
end

set :public_folder, Proc.new { File.join(root, "public") }

use Rack::MethodOverride #middleware for patch/delete requests

use ReportsController
use UsersController
run ApplicationController #program can only take one 'run' command, other controllers inherit from appcontoller