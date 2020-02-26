module ReadModel
  module Repositories
    class Comments < ROM::Repository[:comments]
      include Import[container: 'read_rom']

      struct_namespace ReadModel::Entities

      def all
        root.to_a
      end

      def all_for_post(post_id)
        root.where(post_id: post_id).to_a
      end
    end
  end
end
