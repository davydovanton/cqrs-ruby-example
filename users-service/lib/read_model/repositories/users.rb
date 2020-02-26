module ReadModel
  module Repositories
    class Users < ROM::Repository[:users]
      include Import[container: 'rom']

      struct_namespace ReadModel::Entities

      def all
        root.to_a
      end

      def find(id)
        root.by_pk(id).one
      end
    end
  end
end
