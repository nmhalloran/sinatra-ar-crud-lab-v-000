require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do

    erb :new
  end

  get '/posts/:id' do

    @post = Post.find(params[:id].to_i)

    erb :show

  end

  get '/posts' do

    @posts = Post.all

    erb :index
  end

  post '/posts' do

    Post.create(params)
    @posts = Post.all

    erb :index

  end

  post '/posts/new' do
    binding.pry

    Post.create(params)

    erb :index
  end

  get '/posts/:id/edit' do

    @post = Post.find(params[:id].to_i)

    erb :edit

  end

  patch '/posts/:id' do

    @post = Post.find(params[:id].to_i)
    @post.name = params[:name]
    @post.content = params[:content]

    erb :show
  end

end
