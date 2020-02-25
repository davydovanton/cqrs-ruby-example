# App[:read_rom].relations[:posts].command(:create).call(title: 'test', body: 'test', author_name: 'Anton', comments_count: 1, created_at: Time.now, updated_at: Time.now)

module EventHandlers
  class PostCreated
    include Import[post_repo: 'write_model.repositories.posts']

    def call
    end
  end
end
