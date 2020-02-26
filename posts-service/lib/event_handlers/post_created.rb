# App[:read_rom].relations[:posts].command(:create).call(title: 'test', body: 'test', author_name: 'Anton', comments_count: 1, created_at: Time.now, updated_at: Time.now)

module EventHandlers
  class PostCreated
    include Import[rom: :read_rom]

    def call(event)
      data = event[:data]

      user = rom.relations[:users].by_pk(data[:author_id]).one
      data[:author_name] = user&.full_name || 'Anonymous'

      rom.relations[:posts].command(:create).call(data)
    end
  end
end

