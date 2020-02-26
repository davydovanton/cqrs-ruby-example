module ReadModel
  module Repositories
    class Posts < ROM::Repository[:posts]
      include Import[container: 'read_rom']

      struct_namespace ReadModel::Entities

      def all
        root.to_a
      end

      def find_with_comments(id)
        root.combine(:comments).by_pk(id).one
      end
    end
  end
end
