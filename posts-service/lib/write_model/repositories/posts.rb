module WriteModel
  module Repositories
    class Posts < ROM::Repository[:posts]
      include Import[container: 'write_rom']

      struct_namespace WriteModel::Entities

      commands :create,
        use: :timestamps,
        plugins_options: {
          timestamps: {
            timestamps: %i(created_at updated_at)
          }
        }
    end
  end
end
