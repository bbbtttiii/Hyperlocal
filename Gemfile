source 'http://rubygems.org'

ruby '2.7.2'

gem 'sinatra'
gem 'activerecord', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem 'sinatra-flash'
gem 'pg'
gem 'dotenv'
gem 'figaro'

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

group :development do
  # gem 'sqlite3'
  gem 'tux'
end

group :production do
  #  gem 'pg'
   gem 'activerecord-postgresql-adapter'
end