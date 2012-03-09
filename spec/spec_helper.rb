if ENV["COVERAGE"]
  require 'simplecov'
  SimpleCov.start 'rails'
end

ENV["RAILS_ENV"] ||= 'test'
require "rails/application"
require File.dirname(__FILE__) + "/../config/environment.rb"
require 'rspec/rails'

Rails.logger.level = 4

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include I18nMacros
  config.include ControllerMacros
  config.include RoutesMacros
  config.include Factory::Syntax::Methods

  config.use_transactional_fixtures = true
end
