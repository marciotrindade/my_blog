require 'rubygems'
require 'spork'
require 'simplecov'
SimpleCov.start 'rails'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'

  require 'database_cleaner'
  DatabaseCleaner.strategy = :truncation

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.include(I18nMacros)
    config.include(ControllerMacros, type: :controller)
    config.mock_with :mocha
    config.use_transactional_fixtures = true
    config.after(:all) do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.
end
