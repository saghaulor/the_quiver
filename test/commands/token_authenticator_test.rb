require 'test_helper'

class TokenAuthenticatorTest < ActiveSupport::TestCase
  test "it returns a user from a valid token" do
    headers = HashWithIndifferentAccess.new(Authorization: "Bearer #{jwt}")
    ta = TokenAuthenticator.new(headers)
    result = ta.call
    assert result.success?
    assert_empty result.errors
    assert_instance_of User, result.result
  end

  test "it doesn't return a user from an invalid token" do
    headers = HashWithIndifferentAccess.new(Authorization: "Bearer #{jwt}_")
    ta = TokenAuthenticator.new(headers)
    result = ta.call
    refute result.success?
    refute_empty result.errors
    assert_includes result.errors[:token], 'Invalid token'
    assert_nil result.result
  end
end
