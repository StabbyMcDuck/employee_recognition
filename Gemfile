# frozen_string_literal: true
source 'https://rubygems.org'
ruby '2.3.3'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'

# Authentication for users
gem 'authlogic', '~> 3.5'
#for bootstrap
gem 'bootstrap-sass', '~> 3.3.6'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Postgres SQLf
gem 'pg', '~> 0.19.0'
# Prawn PDF generation
gem 'prawn', '~> 2.1'
# Gem for Charts
gem "chartkick"
# Gem for date on Charts
gem 'groupdate'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Simple Form for signature capture
gem 'simple_form', '~> 3.2', '>= 3.2.1'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'coffee-script-source', '1.8.0'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  # Factory Girl testing
  gem 'factory_girl_rails', '~> 4.8'
  # Dependency of Rubocop. Rainbow 2.2.1 fails to build on Travis CI
  # See https://travis-ci.org/StabbyMcDuck/employee_recognition/builds/194126335
  gem 'rainbow', '< 2.2.1'
  # Rspec testing for Rails
  gem 'rspec-rails', '~> 3.5'
  # Rubocop style checking
  gem 'rubocop', '~> 0.47.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  # Fake user information
  gem 'faker', '~> 1.6'

  # Rails Controller Testing
  gem 'rails-controller-testing'

  # Rspec matchers for ActiveRecord
  gem 'shoulda-matchers', '~> 3.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
