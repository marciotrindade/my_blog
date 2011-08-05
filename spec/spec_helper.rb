require 'rubygems'
require 'spork'
require 'simplecov'
SimpleCov.start 'rails' if ENV["COVERAGE"]

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  require 'database_cleaner'
  DatabaseCleaner.strategy = :truncation

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.include I18nMacros
    config.include ControllerMacros
    config.include RoutesMacros
    config.use_transactional_fixtures = true
    config.after(:all) do
      DatabaseCleaner.clean
    end
  end
end
