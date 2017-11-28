require './config/environment'
require_relative './app/controllers/blog_controller'
require_relative './app/controllers/portfolio_controller'
require_relative './app/controllers/admin_controller'

if ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending. Run `rake db:migrate` to resolve the issue.'
end

run ApplicationController
use Rack::MethodOverride
use BlogController
use PortfolioController
use AdminController
use VideosController
