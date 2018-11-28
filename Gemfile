source 'http://rubygems.org'

gem 'sinatra', '~> 2.0.2'
gem 'activerecord', '~> 4.2', '>= 4.2.6', :require => 'active_record'
gem 'sinatra-activerecord', :require => 'sinatra/activerecord'
gem 'rake'
gem 'require_all'
gem 'thin'
gem 'shotgun'
gem 'pry'
gem 'bcrypt'
gem "tux"
gem "json"
gem 'sinatra-cross_origin'
gem "rack", ">= 2.0.6"

group :test do
  gem 'rspec'
  gem 'capybara'
  gem 'rack-test'
  gem 'database_cleaner', git: 'https://github.com/bmabey/database_cleaner.git'
end

group :development do
   gem 'sqlite3'
end

group :production do
   gem 'pg'
   gem 'activerecord-postgresql-adapter'
end
