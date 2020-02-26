module CommandsHandler
  class Base
    include Import[create_comment_command: 'commands_handler.create_comment']

    def call(command)
      case command
      when Commands::CreateComment
        create_comment_command.call(command.to_h)
      else
        fail 'invalid command'
      end
    end
  end
end
