# frozen_string_literal: true

require_relative './web_app'
require_relative './config/boot'

run Rack::URLMap.new(
  '/' => WebApp.new
)
