module CommandsHandler
  class CreateComment
    include Import[
      repo: 'write_model.repositories.comments',
      producer: 'kafka_producer'
    ]

    def call(payload)
      return {} if payload[:body] == ''

      new_comment = repo.create(payload)

      event = Events::CommentCreated.new(new_comment.to_h)
      producer.call(event: event, topic: 'comment-topic')
    end
  end
end
