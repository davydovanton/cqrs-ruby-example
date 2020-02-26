require "sinatra"
require "json"

class WebApp < Sinatra::Base
  get "/" do
    App.keys.join(' ')
  end

  get "/users" do
    App['queries.list'].call.map(&:to_h).to_json
  end

  get "/users/:id" do
    App['queries.show'].call(id: params[:id]).to_h.to_json
  end

  post "/users" do
    json = JSON.parse request.body.read
    command = Commands::CreateUser.new(full_name: json['user']['full_name'])
    result = App['commands_handler.base'].call(command)
    result.to_h.to_json
  end
end
