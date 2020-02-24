require 'sinatra/base'

class WebApp < Sinatra::Base
  get "/" do
    App.keys.join(' ')
  end

  get "/comments" do
    'List of comments'
  end

  post "/comments" do
    'A new comment was created'
  end
end
