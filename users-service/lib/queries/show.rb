module Queries
  class Show
    include Import[user_repo: 'read_model.repositories.users']

    def call(id:)
      user_repo.find(id)
    end
  end
end
