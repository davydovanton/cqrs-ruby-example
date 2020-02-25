require "hanami/api"

class WebApp < Hanami::API
  get "/" do
    App.keys.join(' ')
  end

  get "/users" do
    'List of users'
  end

  get "/users/:id" do
    'information about specific user'
  end

  post "/posts" do
    'A new user was created'
  end
end
