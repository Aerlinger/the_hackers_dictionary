source 'https://rubygems.org'

gem 'rails', '3.2.8'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'validates_email_format_of'
gem 'nifty-generators'
gem 'acts-as-taggable-on'
gem 'activerecord-reputation-system', require: 'reputation_system'
gem 'ransack'
gem 'sqlite3'
gem 'devise'
gem 'twitter-bootstrap-rails'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem "better_errors"
end

group :test, :development do
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "guard-spork"
  gem "guard-rspec"
  gem 'guard-livereload'
  gem "faker"
  gem 'database_cleaner'
  gem 'launchy'

end

group :test do
  gem "spork"
  gem "capybara"
  gem 'growl'
  gem 'rb-fsevent'
end

group :production do
  gem 'pg'
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
