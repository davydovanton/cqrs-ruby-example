module Events
  class CommentCreated < Dry::Struct
    attribute :id, Types::Integer
    attribute :post_id, Types::Integer

    attribute :body, Types::String

    attribute :created_at, Types::Time
    attribute :updated_at, Types::Time

    attribute :author_id, Types::Integer

    def serialize
      {
        event_type: "comment.created",
        event_id: SecureRandom.uuid,
        event_created_at: Time.now,
        event_version: "1.0",
        data: self.to_h
      }
    end
  end
end
