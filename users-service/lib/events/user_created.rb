module Events
  class UserCreated < Dry::Struct
    attribute :id, Types::Integer
    attribute :full_name, Types::String
    attribute :created_at, Types::Time
    attribute :updated_at, Types::Time

    def serialize
      {
        event_type: "user.created",
        event_id: SecureRandom.uuid,
        event_created_at: Time.now,
        event_version: "1.0",
        data: self.to_h
      }
    end
  end
end
