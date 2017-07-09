class BlogController < ApplicationController


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

end
