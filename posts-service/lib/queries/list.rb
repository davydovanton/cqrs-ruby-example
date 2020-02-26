module Queries
  class List
    include Import[repo: 'read_model.repositories.posts']

    def call
      repo.all
    end
  end
end
