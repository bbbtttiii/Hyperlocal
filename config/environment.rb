require 'bundler/setup'
Bundler.require

configure :development do
  ENV['SINATRA_ENV'] ||= "development"
  require 'bundler/setup'
  Bundler.require(:default, ENV['SINATRA_ENV'])
  ActiveRecord::Base.establish_connection(
    :adapter => "sqlite3",
    :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
  )
end

configure :production do
  db = URI.parse(ENV['DATABASE_URL'] || 'postgres:///localhost/mydb')
  
  ActiveRecord::Base.establish_connection(
    :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
   :username => db.user,
   :password => db.password,
   :database => db.path[1..-1],
   :encoding => 'utf8'
  )
end


# ENV['SINATRA_ENV'] ||= "development"

# require 'bundler/setup' #finds all gems and adds to load path
# Bundler.require(:default, ENV['SINATRA_ENV']) #requires gems and deployment envirionment hash (for AR)

# ActiveRecord::Base.establish_connection(
#   :adapter => "postgresql", #name of db system
#   :database => "db/#{ENV['SINATRA_ENV']}.sqlite" #path to db
# )

# require_all 'app' #loads all files under app folder