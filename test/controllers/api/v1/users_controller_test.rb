require "test_helper"

module API
  module V1
    class UsersControllerTest < ActionController::TestCase
      should use_before_action :authenticate

      test "should get index" do
        request_params = {}
        get :index, request_params
        assert_response :success
      end

      test "should show the user" do
        request_params = { id: user.id }
        get :show, request_params
        assert_response :success
      end

      private
      def user
        @user ||= users(:saghaulor)
      end

      def setup
        @request.headers.merge!(request_headers)
      end
    end
  end
end
