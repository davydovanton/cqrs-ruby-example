require "sinatra"
require "json"

class WebApp < Sinatra::Base
  get "/" do
    App.keys.join(' ')
  end

  get "/comments" do
    App['queries.list'].call.map(&:to_h).to_json
  end

  get "/posts/:post_id/comments" do
    App['queries.list_for_post'].call(post_id: params[:post_id]).map(&:to_h).to_json
  end

  post "/comments" do
    json = JSON.parse(request.body.read, symbolize_names: true)
    command = Commands::CreateComment.new(json[:comment])
    result = App['commands_handler.base'].call(command)
    result.to_h.to_json
  end
end
