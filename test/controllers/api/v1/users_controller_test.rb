require "test_helper"

module API
  module V1
    class UsersControllerTest < ActionController::TestCase
      test "should get index" do
        request_params = {}
        get :index, request_params, request_headers
        assert_response :success
      end

      test "should show the user" do
        request_params = { id: @user.id }
        get :show, request_params, request_headers
        assert_response :success
      end

      private
      def setup
        DatabaseCleaner.start
        @user ||= User.create(email: 'derp@derp.com')
      end

      def teardown
        DatabaseCleaner.clean
      end
    end
  end
end
