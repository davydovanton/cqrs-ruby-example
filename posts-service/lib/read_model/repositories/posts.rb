module ReadModel
  module Repositories
    class Posts < ROM::Repository[:posts]
      include Import[container: 'read_rom']

      struct_namespace ReadModel::Entities
    end
  end
end
