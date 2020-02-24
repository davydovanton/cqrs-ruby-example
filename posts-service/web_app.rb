require 'sinatra/base'

class WebApp < Sinatra::Base
  get "/" do
    App.keys.join(' ')
  end

  get "/posts" do
    'List of posts'
  end

  get "/posts/:id" do
    'information about specific post'
  end

  post "/posts" do
    'A new post was created'
  end
end
