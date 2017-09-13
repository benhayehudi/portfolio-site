require './config/environment'
require 'sinatra'
require 'sinatra/cross_origin'

class ApplicationController < Sinatra::Base
  configure do 
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "bitachon"
    enable :cross_origin
  end 

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  options "*" do
    response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    200
  end


  get '/' do
    erb :index
  end

  get '/contact' do
    erb :contact
  end


  def current_user #open def
      Admin.find(session[:user_id])
    end #close def

  def logged_in? #ope def
    !!session[:user_id]
  end #end def

end
