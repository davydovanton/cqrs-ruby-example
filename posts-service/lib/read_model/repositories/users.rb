module ReadModel
  module Repositories
    class Users < ROM::Repository[:users]
      include Import[container: 'read_rom']

      struct_namespace ReadModel::Entities
    end
  end
end
