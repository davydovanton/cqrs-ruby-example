module EventHandlers
  class CommentCreated
    include Import[rom: :read_rom]

    def call(event)
      return if event.is_a?(String)

      data = event[:data]
      user = rom.relations[:users].by_pk(data[:author_id]).one

      data[:author_name] = user&.full_name || 'Anonymous'

      rom.relations[:comments].command(:create).call(data)

      post = rom.relations[:posts].by_pk(data[:post_id]).one
      if post
        rom.relations[:posts].command(:update).call(comments_count: post.comments_count + 1)
      end
    end
  end
end
