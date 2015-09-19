require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # Test relations
  should have_many :rounds

  # Test validations
  should validate_uniqueness_of :email

  should validate_presence_of :email

  should_not allow_value('derp').for :email

  should allow_value('derp@derp.com').for :email

  should have_secure_password
end
