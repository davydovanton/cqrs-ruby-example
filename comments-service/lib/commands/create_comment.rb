module Commands
  class CreateComment < Dry::Struct
    attribute :post_id, Types::Integer
    attribute :body, Types::String
    attribute :author_id, Types::Integer
  end
end
