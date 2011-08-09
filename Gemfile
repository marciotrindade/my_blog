source 'http://rubygems.org'

gem 'rails', '3.1.0.rc5'
gem 'mysql2'

gem 'devise'
gem 'inherited_resources'
gem 'simple_form'
gem 'dynamic_form'
gem 'settingslogic'
gem 'slim'
gem 'decent_exposure'
gem 'redcarpet'
gem 'coderay'
gem 'gravtastic'
gem 'responders'

group :assets do
  gem 'sass-rails', "~> 3.1.0.rc"
  gem 'coffee-rails', "~> 3.1.0.rc"
  gem 'uglifier'
end

gem 'jquery-rails'
gem 'client_side_validations'

group :production do
  gem 'newrelic_rpm'
end

group :development do
  gem 'thin'
end

group :console do
  gem 'wirble'
  gem 'hirb'
end

group :test do
  gem 'rspec-rails'
  gem 'shoulda', '~> 3.0.0.beta2'
  gem 'database_cleaner'
  gem 'factory_girl_rails', '~> 1.1'
  gem 'simplecov', '>= 0.4.0', :require => false
  gem 'spork', '~> 0.9.0.rc9'
  gem 'capybara'
  gem 'launchy'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
  gem 'growl' if RUBY_PLATFORM =~ /darwin/i
  gem 'guard-rspec'
  gem 'guard-livereload'
end
