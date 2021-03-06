class BlogController < ApplicationController
  require 'json'
  require 'sinatra'
  require 'sinatra/cross_origin'

  configure do
    enable :cross_origin
  end

  # Sinatra Frontend
  # Commenting out client frontend since only using API service
  # get '/blog/all-postings' do
  #   @postings = Blog.all
  #   erb :'/blog/all-postings'
  # end
  #
  # get '/blog/tech-postings' do
  #   erb :'/blog/tech-postings'
  # end
  #
  # get '/blog/jewish-postings' do
  #   erb :'/blog/jewish-postings'
  # end
  #
  # get '/blog/show/:id' do
  #   @listing = Blog.find_by_id(params[:id])
  #   erb :"/blog/show"
  # end

  # API Service
  get '/api/blog/index.json' do
    headers 'Access-Control-Allow-Origin' => '*'
    @postings = Blog.all
    content_type :json
    @postings.to_json
  end

  get '/api/blog/tech.json' do
    headers 'Access-Control-Allow-Origin' => '*'
    @techposts = Blog.where(publish: [true], tags: ["Tech"])
    content_type :json
    @techposts.to_json
  end

  get '/api/blog/jewish.json' do
    headers 'Access-Control-Allow-Origin' => '*'
    @jewishposts = Blog.where(publish: [true], tags: ["Jewish"])
    content_type :json
    @jewishposts.to_json
  end

  get '/api/blog/show/:id' do
    headers 'Access-Control-Allow-Origin' => '*'
    @listing = Blog.find_by_id(params[:id])
    content_type :json
    @listing.to_json
  end
end
