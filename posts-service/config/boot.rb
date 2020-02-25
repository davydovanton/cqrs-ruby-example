ENV['APP_ENV'] ||= "development"

require "bundler"
Bundler.setup(:default, ENV["APP_ENV"])

require "dotenv"
Dotenv.load(".env", ".env.#{ENV["APP_ENV"]}")

require_relative './../system/import'

App.finalize!

# App['kafka_producer'].call(event: { hello: 'world' }, topic: 'posts-topic')
