class VideosController < ApplicationController
  require 'sinatra'
  require 'sinatra/cross_origin'

  configure do
    enable :cross_origin
  end

  # API Service
  get '/api/videos/index.json' do
    headers 'Access-Control-Allow-Origin' => 'https://www.bengreenberg.org'
    @videos = Video.where(publish: [true])
    content_type :json
    @videos.to_json
  end

  get '/api/videos/show/:id' do
    headers 'Access-Control-Allow-Origin' => 'https://www.bengreenberg.org'
    @video = Video.find_by_id(params[:id])
    content_type :json
    @video.to_json
  end
  
end
