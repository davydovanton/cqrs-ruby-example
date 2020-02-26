module WriteModel
  module Repositories
    class Users < ROM::Repository[:users]
      include Import[container: 'rom']

      struct_namespace WriteModel::Entities

      commands :create,
        use: :timestamps,
        plugins_options: {
          timestamps: {
            timestamps: %i(created_at updated_at)
          }
        }

      def find_by_full_name(full_name)
        root.where(full_name: full_name).one
      end
    end
  end
end
