require 'simplecov'
SimpleCov.start 'rails' do
  add_filter 'tmp/'
  add_filter 'log/'
  add_filter 'bin/'
  add_filter 'coverage/'
end

ENV["RAILS_ENV"] = "test"

require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require "minitest/reporters"
require 'shoulda/matchers'

Minitest::Reporters.use!(
  Minitest::Reporters::DefaultReporter.new,
  ENV,
  Minitest.backtrace_filter
)
# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  def json(json)
    JSON.parse(json, symbolize_names: true)
  end

  def request_headers
    content_headers.merge(auth_headers)
  end

  def content_headers
    {
      "Accept" => "application/json",
      "Content-Type" => "application/json"
    }
  end

  def auth_headers
    { :authorization => "Bearer #{jwt}" }
  end

  def jwt
    JsonWebToken.encode(sub: User.first.id)
  end
  # Add more helper methods to be used by all tests here...
end
