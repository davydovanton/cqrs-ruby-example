module Queries
  class Show
    include Import[user_repo: 'read_model.repositories.users']

    def call
    end
  end
end
