# frozen_string_literal: true

App.boot(:read_rom) do |app|
  init do
    require "rom"
    require "rom-sql"
    require "rom-repository"

    container = ROM.container(:sql, ENV['READ_DATABASE_URL']) do |configuration|
      configuration.relation(:posts) do
        schema(infer: true) do
          associations do
            has_many :comments
          end
        end
        auto_struct true
      end

      configuration.relation(:comments) do
        schema(infer: true) do
          associations do
            belongs_to :post
          end
        end
        auto_struct true
      end

      configuration.relation(:users) do
        schema(infer: true)
        auto_struct true
      end
    end

    register(:read_rom, container)
  end
end
