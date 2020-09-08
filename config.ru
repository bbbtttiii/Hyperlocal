require './config/environment' #links to environment

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.' #renders a warning if you try to make alterations without migrating
end

use Rack::MethodOverride #middleware for patch/delete requests
use ReportsController
use UsersController
run ApplicationController #program can only take one 'run' command, other controllers inherit from appcontoller