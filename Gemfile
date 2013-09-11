source 'https://rubygems.org'

gem 'rails', '3.2.14'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

group :test, :development do
  gem 'rspec'
  gem 'rspec-rails'
  # gem 'guard-rspec'
  gem 'parallel_tests'
  gem 'capybara'
end

group :test do
  gem 'factory_girl_rails'
  gem 'spork'
  gem 'cucumber-rails', :require => false
  # rails generate cucumber:install --capybara --rspec --spork
  # database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  # Pretty printed test output
  gem 'turn', :require => false
end

group :development do
  gem 'rails3-generators'
  gem 'metric_fu'
end

gem 'rails-i18n'
gem 'i18n_generators'
gem 'devise'
gem 'rails_admin'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-twitter'
gem 'paperclip'
gem 'kaminari'
gem 'acts_as_paranoid'