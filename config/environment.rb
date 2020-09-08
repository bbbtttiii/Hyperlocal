ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup' #finds all gems and adds to load path
Bundler.require(:default, ENV['SINATRA_ENV']) #requires gems and deployment envirionment hash (for AR)

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3", #name of db system
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite" #path to db
)

require_all 'app' #loads all files under app folder