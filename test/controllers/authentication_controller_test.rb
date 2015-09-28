require 'test_helper'

class AuthenticationControllerTest < ActionController::TestCase
  should_not use_before_action :authenticate

  test "create should respond with unauthorized when username/password is incorrect" do
    request_params = { email: 'saghaulor@gmail.com', password: 'wrong_passowrd' }
    post :create, request_params, request_headers
    assert_response :unauthorized
  end

  test "create should respond with success when username/password is correct" do
    request_params = { email: 'saghaulor@gmail.com', password: 'a_valid_password' }
    post :create, request_params, request_headers
    assert_response :success
  end
end
