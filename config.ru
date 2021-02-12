require './config/environment' #links to environment

set :public_folder, Proc.new { File.join(root, "public") }

use Rack::MethodOverride #middleware for patch/delete requests

use ReportsController
use UsersController
run ApplicationController