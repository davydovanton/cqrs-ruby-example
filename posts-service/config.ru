# frozen_string_literal: true

require_relative './config/boot'
require_relative './web_app'

run WebApp.new
