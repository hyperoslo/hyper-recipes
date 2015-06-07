source 'https://rubygems.org'
ruby '2.0.0'

# Full-stack web application framework.
gem 'rails', '4.0.0'

# Rails for API only Applications
gem 'rails-api'

# Manipulate images with minimal use of memory via ImageMagick / GraphicsMagick
gem 'mini_magick'

# Ruby file upload library
gem 'carrierwave'

# Brings clouds to you
gem 'fog', '~> 1.3.1'

group :production, :staging do

  # PostgreSQL RDBMS
  gem "pg"

end

group :development, :test do

  # This module allows Ruby programs to interface with the SQLite3 database engine
  gem 'sqlite3'

  # Use Pry as your rails console
  gem 'pry-rails'

  # Guard gem for RSpec
  gem 'guard-rspec', require: false

  # Rails integration for RSpec
  gem 'rspec-rails', '~> 3.0'

  # Capybara aims to simplify the process of integration testing Rack applications
  gem 'capybara'

  # Code coverage for Ruby 1.9+
  gem 'simplecov', require: false

end

# OpenBSD's bcrypt() password hashing algorithm.
gem 'bcrypt-ruby', '~> 3.0.0'

# Create JSON structures via a Builder-style DSL
gem 'jbuilder'
