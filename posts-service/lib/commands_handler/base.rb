module CommandsHandler
  class Base
    include Import[create_post_command: 'commands_handler.create_post']

    def call(command)
      case command
      when Commands::CreatePost
        create_post_command.call(command.to_h)
      else
        fail 'invalid command'
      end
    end
  end
end
