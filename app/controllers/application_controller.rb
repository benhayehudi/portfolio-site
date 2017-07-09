require './config/environment'

class ApplicationController < Sinatra::Base
  configure do #open do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "bitachon"
  end #close do

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
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
