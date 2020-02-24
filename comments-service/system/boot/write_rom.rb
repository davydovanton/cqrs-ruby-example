# frozen_string_literal: true

App.boot(:write_rom) do |app|
  init do
    require "rom"
    require "rom-sql"
    require "rom-repository"

    container = ROM.container(:sql, ENV['WRITE_DATABASE_URL']) do |configuration|
      configuration.relation(:comments) do
        schema(infer: true)
        auto_struct true
      end
    end

    register(:write_rom, container)
  end
end
