source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 4.2'
gem 'rails-api'
gem 'active_model_serializers', '0.10.0.rc2'

# Use postgres as the database for Active Record
gem 'pg'
gem "schema_plus_enums"

# Authentication
gem 'jwt'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Service Objects
gem 'simple_command'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc


gem 'puma'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-byebug'
  gem 'byebug'
  gem 'pry-rails'
  gem 'minitest-rails'
  gem 'minitest-reporters'
  gem 'shoulda'
  gem 'shoulda-matchers'
  gem 'guard'
  gem 'guard-minitest'
  gem 'guard-brakeman'
  gem 'ruby-prof'
  gem 'ruby_gntp'
  gem 'simplecov', require: false
#  gem 'pronto'
#  gem 'pronto-brakeman'
#  gem 'pronto-flay'
#  gem 'pronto-reek'
#  gem 'pronto-rails_best_practices'
#  gem 'fasterer'
#  gem 'debride'
#  gem 'ruby-lint'
end
