class AdminController < ApplicationController

# ADMIN AUTHENTICATION

get '/admin/createadmin' do
  erb :'/admin/createadmin'
end


post '/createadmin' do
  @admin = Admin.new(username: params["username"], password: params["password"])
  @admin.save
  session[:user_id] = @admin.id
  redirect '/admin/login'
end

get '/admin/login' do
  erb :'/admin/login'
end

post '/login' do
  @admin = Admin.find_by(:username => params[:username])
  if @admin && @admin.authenticate(params[:password])
    session[:user_id] = @admin.id
    redirect '/admin/main'
  else
    redirect '/'
  end
end 

get '/admin/main' do
  if logged_in?
    @admin = current_user
    if @admin.id == 1
    erb :'/admin/main'
  else
    redirect to '/'
    end
  end
end

# BLOG ADMINISTRATION

get '/admin/blog/add-listing' do
  if logged_in?
    @admin = current_user
    if @admin.id == 1
      erb :'/admin/blog/add-listing'
    else
      redirect to '/'
      end
    end
end

post '/admin/blog/add-new-listing' do
  if logged_in?
    @admin = current_user
    if @admin.id == 1
      @blog = Blog.new(title: params["title"], author: params["author"], image: params["image"], tags: params["tags"], content: params["content"], original_link: params["original_link"], publish: params["publish"])
      @blog.save
      redirect '/admin/blog/all-posts'
    else
      redirect to '/'
    end
  end
end

get '/admin/blog/all-posts' do
  if logged_in?
    @admin = current_user
    if @admin.id == 1
    erb :'/admin/blog/all-posts'
  else
    redirect to '/'
    end
  end
end

get '/admin/blog/edit/:id' do
  if logged_in?
    @admin = current_user
    if @admin.id == 1
    @blog = Blog.find_by_id(params[:id])
    erb :'/admin/blog/edit'
  else
    redirect to '/'
    end
  end
end

post '/admin/blog/edit/:id' do
  if logged_in?
    @admin = current_user
    if @admin.id == 1
      @blog = Blog.find_by_id(params[:id])
      @blog.update_attributes(title: params["title"], author: params["author"], image: params["image"], content: params["content"], original_link: params["original_link"], publish: params["publish"])
      @blog.save
      redirect to '/admin/blog/all-posts'
    else
      redirect to '/'
      end
    end
  end

delete '/blog/delete/:id' do
  if logged_in?
    @admin = current_user
    if @admin.id == 1
    @blog = Blog.find_by_id(params[:id])
    @blog.delete
    redirect to '/admin/blog/all-posts'
  else
    redirect to '/'
      end
    end
  end

# PORTFOLIO ADMINISTRATION

get '/admin/portfolio/add-listing' do
  erb :'/admin/portfolio/add-listing'
end

post '/admin/portfolio/add-new-listing' do
  if logged_in?
    @admin = current_user
    if @admin.id == 1
      @item = Portfolio.new(name: params["name"], link: params["link"], youtube_link: params["youtube_link"], website_link: params["website_link"], blog_link: params["blog_link"], description: params["description"], image: params["image"], created_on: params["created_on"], show: params["show"])
      @item.save
      redirect '/admin/portfolio/all-items'
      erb :'/admin/portfolio/add-listing'
    else
      redirect to '/'
      end
    end
  end

get '/admin/portfolio/all-items' do
  if logged_in?
    @admin = current_user
    if @admin.id == 1
      erb :'/admin/portfolio/all-items'
    else
      redirect to '/'
      end
    end
  end

get '/admin/portfolio/edit/:id' do
if logged_in?
  @admin = current_user
  if @admin.id == 1
  @item = Portfolio.find_by_id(params[:id])
  erb :'/admin/portfolio/edit'
else
  redirect to '/'
  end
end
end

post '/admin/portfolio/edit/:id' do
  if logged_in?
    @admin = current_user
    if @admin.id == 1
    item = Portfolio.find_by_id(params[:id])
    item.update_attributes(name: params["name"], link: params["link"], youtube_link: params["youtube_link"], website_link: params["website_link"], blog_link: params["blog_link"], description: params["description"], image: params["image"], created_on: params["created_on"], show: params["show"])
    item.save
    redirect '/admin/portfolio/all-items'
    erb :'/admin/portfolio/edit'
  else
    redirect to '/'
    end
  end
end

delete '/portfolio/delete/:id' do
  if logged_in?
    @admin = current_user
    if @admin.id == 1
    @item = Portfolio.find_by_id(params[:id])
    @item.delete
    redirect to '/admin/portfolio/all-items'
  else
    redirect to '/'
      end
    end
  end

  # VIDEOS ADMINISTRATION

  get '/admin/videos/add-video' do
    if logged_in?
      @admin = current_user
      if @admin.id == 1
        erb :'/admin/videos/add-video'
      else
        redirect to '/'
      end
    end
  end

  post '/admin/videos/add-new-video' do
    if logged_in?
      @admin = current_user
      if @admin.id == 1
        @video = Video.new(title: params["title"], image: params["image"], tags: params["tags"], url: params["url"], publish: params["publish"])
        @video.save
        redirect '/admin/videos/all-videos'
      else
        redirect to '/'
      end
    end
  end

  get '/admin/videos/all-videos' do
    if logged_in?
      @admin = current_user
      if @admin.id == 1
      erb :'/admin/videos/all-videos'
    else
      redirect to '/'
      end
    end
  end

  get '/admin/videos/edit/:id' do
    if logged_in?
      @admin = current_user
      if @admin.id == 1
      @video = Video.find_by_id(params[:id])
      erb :'/admin/videos/edit'
    else
      redirect to '/'
      end
    end
  end

  post '/admin/videos/edit/:id' do
    if logged_in?
      @admin = current_user
      if @admin.id == 1
        @video = Video.find_by_id(params[:id])
        @video.update_attributes(title: params["title"], image: params["image"], tags: params["tags"], url: params["url"], publish: params["publish"])
        @video.save
        redirect to '/admin/video/all-videos'
      else
        redirect to '/'
        end
      end
    end

  delete '/videos/delete/:id' do
    if logged_in?
      @admin = current_user
      if @admin.id == 1
      @video = Video.find_by_id(params[:id])
      @video.delete
      redirect to '/admin/videos/all-videos'
    else
      redirect to '/'
    end
  end
end
end
