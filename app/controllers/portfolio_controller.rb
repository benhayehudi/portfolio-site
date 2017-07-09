class PortfolioController < ApplicationController

get '/portfolio/main' do
  erb :'/portfolio/main'
end

get '/portfolio/show/:id' do
  @item = Portfolio.find_by_id(params[:id])
  erb :'/portfolio/show'
end

end
