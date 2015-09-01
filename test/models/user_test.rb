require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user_is_invalid_when_email_is_empty" do
    user = User.new
    refute user.valid?, "Missing presence validation for :email"
  end

  test "user_is_invalid_when_email_is_not_unique" do
    user = User.new(email: 'saghaulor@gmail.com')
    refute user.valid?, "Missing uniqueness validation for :email"
  end

  test "user_is_invalid_when_email_is_not_correct_email_address_format" do
    user = User.new(email: 'derp')
    refute user.valid?, "Missing format validation for :email"
  end
end
