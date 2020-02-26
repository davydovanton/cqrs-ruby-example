module Commands
  class CreatePost < Dry::Struct
    attribute :title, Types::String
    attribute :body, Types::String
    attribute :author_id, Types::Integer
  end
end
