class PortfolioController < ApplicationController
  require 'sinatra'
  require 'sinatra/cross_origin'

  configure do
    enable :cross_origin
  end

  # Sinatra Frontend
  # Commenting out frontend client since only using API service
  # get '/portfolio/main' do
  #   erb :'/portfolio/main'
  # end
  #
  # get '/portfolio/show/:id' do
  #   @item = Portfolio.find_by_id(params[:id])
  #   erb :'/portfolio/show'
  # end

  # API Service
  get '/api/portfolio/index.json' do
    headers 'Access-Control-Allow-Origin' => 'http://www.bengreenberg.org'
    @items = Portfolio.where(show: [true])
    content_type :json
    @items.to_json
  end

  get '/api/portfolio/show/:id' do
    headers 'Access-Control-Allow-Origin' => 'http://www.bengreenberg.org'
    @item = Portfolio.find_by_id(params[:id])
    content_type :json
    @item.to_json
  end

  # Helper Functions
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
