if ENV["COVERAGE"]
  require 'simplecov'
  SimpleCov.start 'rails'
end

ENV["RAILS_ENV"] ||= 'test'


require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

Rails.logger.level = 4

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.mock_with :rspec
  config.expect_with :rspec

  config.use_transactional_fixtures = true
  config.infer_base_class_for_anonymous_controllers = false

  config.extend  ControllersMacros, type: :controller
  config.include FactoryGirl::Syntax::Methods

  config.before :each do
    Rails.cache.clear
  end
end
