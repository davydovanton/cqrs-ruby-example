module CommandsHandler
  class CreatePost
    include Import[
      repo: 'write_model.repositories.posts',
      producer: 'kafka_producer'
    ]

    def call(payload)
      return {} if repo.find_by_title(payload[:title])

      new_post = repo.create(payload)

      event = Events::PostCreated.new(new_post.to_h)
      producer.call(event: event, topic: 'post-topic')
      new_post
    end
  end
end
