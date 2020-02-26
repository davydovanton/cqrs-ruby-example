module CommandsHandler
  class Base
    include Import[create_user_command: 'commands_handler.create_user']

    def call(command)
      case command
      when Commands::CreateUser
        create_user_command.call(command.to_h)
      else
        fail 'invalid command'
      end
    end
  end
end
