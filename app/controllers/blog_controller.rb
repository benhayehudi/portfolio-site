class BlogController < ApplicationController
  require 'json'

  # Sinatra Frontend
  get '/blog/all-postings' do
    @postings = Blog.all
    erb :'/blog/all-postings'
  end

  get '/blog/tech-postings' do
    erb :'/blog/tech-postings'
  end

  get '/blog/jewish-postings' do
    erb :'/blog/jewish-postings'
  end

  get '/blog/show/:id' do
    @listing = Blog.find_by_id(params[:id])
    erb :"/blog/show"
  end

  # API Service
  get '/api/blog/index.json' do
    @postings = Blog.all
    content_type :json
    @postings.to_json
  end

  get '/api/blog/tech.json' do
    @techposts = Blog.where(publish: [true], tags: ["Tech"])
    content_type :json 
    @techposts.to_json
  end

  get '/api/blog/jewish.json' do
    @jewishposts = Blog.where(publish: [true], tags: ["Jewish"])
    content_type :json 
    @jewishposts.to_json 
  end

  get '/api/blog/show/:id' do
    @listing = Blog.find_by_id(params[:id])
    content_type :json 
    @listing.to_json
  end
end
