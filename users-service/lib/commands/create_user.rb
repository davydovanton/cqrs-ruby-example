module Commands
  class CreatePost
    include Import[user_repo: 'write_model.repositories.users']

    def call
    end
  end
end
