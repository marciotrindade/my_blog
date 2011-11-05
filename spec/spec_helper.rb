require 'rubygems'
require 'spork'

require 'simplecov'
SimpleCov.start 'rails'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require "rails/application"
  Spork.trap_method(Rails::Application, :reload_routes!)
  require File.dirname(__FILE__) + "/../config/environment.rb"
  require 'rspec/rails'

  require 'database_cleaner'
  DatabaseCleaner.strategy = :truncation

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    config.include I18nMacros
    config.include ControllerMacros
    config.include RoutesMacros
    config.include Factory::Syntax::Methods

    config.use_transactional_fixtures = true
    config.after(:all) do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
  $rspec_start_time = Time.now
  FactoryGirl.reload
end
