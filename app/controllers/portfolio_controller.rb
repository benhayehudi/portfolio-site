class PortfolioController < ApplicationController

get '/portfolio/main' do
  erb :'/portfolio/main'
end

get '/portfolio/show/:id' do
  @item = Portfolio.find_by_id(params[:id])
  erb :'/portfolio/show'
end

def blog_link?
  @item.blog_link == "http://bengreenberg.org/portfolio/show/#{@item.id}" || @item.blog_link == "" || @item.blog_link == nil
end

def website_link?
  @item.website_link == "http://bengreenberg.org/portfolio/show/#{@item.id}"|| @item.website_link == "" || @item.website_link == nil
end

def youtube_link?
  @item.youtube_link == "http://bengreenberg.org/portfolio/show/#{@item.id}" || @item.youtube_link == "" || @item.youtube_link == nil
end

def github_link?
  @item.link == "http://bengreenberg.org/portfolio/show/#{@item.id}" || @item.link == "" || @item.link == nil
end



end
