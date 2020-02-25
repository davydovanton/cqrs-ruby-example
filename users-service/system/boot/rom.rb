# frozen_string_literal: true

App.boot(:read_rom) do |app|
  init do
    require "rom"
    require "rom-sql"
    require "rom-repository"

    container = ROM.container(:sql, ENV['DATABASE_URL']) do |configuration|
      configuration.relation(:users) do
        schema(infer: true)
        auto_struct true
      end
    end

    register(:rom, container)
  end
end
