module ReadModel
  module Repositories
    class Users < ROM::Repository[:users]
      include Import[container: 'rom']

      struct_namespace ReadModel::Entities
    end
  end
end
