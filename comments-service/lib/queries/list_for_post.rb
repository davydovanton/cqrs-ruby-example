module Queries
  class ListForPost
    include Import[repo: 'read_model.repositories.comments']

    def call(post_id:)
      repo.all_for_post(post_id)
    end
  end
end
