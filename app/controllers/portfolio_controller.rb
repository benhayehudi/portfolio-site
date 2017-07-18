class PortfolioController < ApplicationController

get '/portfolio/main' do
  erb :'/portfolio/main'
end

get '/portfolio/show/:id' do
  @item = Portfolio.find_by_id(params[:id])
  erb :'/portfolio/show'
end

def blog_link?
  @item.blog_link == "http://bengreenberg.org/portfolio/show/#{@item.id}"
end

def website_link?
  @item.website_link == "http://bengreenberg.org/portfolio/show/#{@item.id}"
end

def youtube_link?
  @item.youtube_link == "http://bengreenberg.org/portfolio/show/#{@item.id}"
end

def github_link?
  @item.link == "http://bengreenberg.org/portfolio/show/#{@item.id}"
end



end
