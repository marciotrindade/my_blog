if ENV["COVERAGE"]
  require 'simplecov'
  SimpleCov.start 'rails'
end

ENV["RAILS_ENV"] ||= 'test'


require File.expand_path("../../config/environment", __FILE__)
require 'factory_girl_rails'
require 'pry'
require 'rspec/autorun'
require 'rspec/rails'
require 'shoulda-matchers'

Rails.logger.level = 4

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec do |c|
    # c.syntax = :expect
  end
  config.expect_with :rspec do |c|
    # c.syntax = :expect
  end

  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false

  config.include FactoryGirl::Syntax::Methods

  config.before :each do
    Rails.cache.clear
  end
end
