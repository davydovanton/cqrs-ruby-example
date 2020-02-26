module Queries
  class Show
    include Import[repo: 'read_model.repositories.posts']

    def call(id:)
      repo.find_with_comments(id)
    end
  end
end
