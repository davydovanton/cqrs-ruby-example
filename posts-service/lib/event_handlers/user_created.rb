module EventHandlers
  class UserCreated
    include Import[rom: :read_rom]

    def call(event)
      rom.relations[:users].command(:create).call(event[:data])
    end
  end
end
