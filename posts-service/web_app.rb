require "sinatra"
require "json"

class WebApp < Sinatra::Base
  get "/" do
    App.keys.join(' ')
  end

  get "/posts" do
    App['queries.list'].call.map(&:to_h).to_json
  end

  get "/posts/:id" do
    App['queries.show'].call(id: params[:id]).to_h.to_json
  end

  post "/posts" do
    json = JSON.parse(request.body.read, symbolize_names: true)
    command = Commands::CreatePost.new(json[:post])
    result = App['commands_handler.base'].call(command)
    result.to_h.to_json
  end
end
