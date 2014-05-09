source 'http://rubygems.org'

gem 'rails',      '4.1.1'
gem 'mysql2'

gem 'coderay'
gem 'devise'
gem 'draper'
gem 'dynamic_form'
gem 'redcarpet'
gem 'settingslogic'
gem 'kaminari'

gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'sass-rails',   '~> 4.0.0'
gem 'turbolinks'
gem 'uglifier',     '>= 1.3.0'

group :production do
  gem 'unicorn'
end

group :development do
  gem 'thin'
  gem 'rack-mini-profiler'
  gem 'annotate'
end

group :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails',        require: false
  gem 'shoulda-matchers'
  gem 'simplecov',          require: false
end

group :development, :test do
  gem 'pry-meta'
end
