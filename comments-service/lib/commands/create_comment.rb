module Commands
  class CreateComment
    include Import[post_repo: 'write_model.repositories.comments']

    def call
    end
  end
end
