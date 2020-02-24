# frozen_string_literal: true

require 'dry/system/container'

class App < Dry::System::Container
  configure do |config|
    config.auto_register = %w[lib]
    config.name = :main
  end

  load_paths!('lib')
end
