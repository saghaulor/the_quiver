require "test_helper"

module API
  module V1
    class UsersControllerTest < ActionController::TestCase
      test "should get index" do
        request_params = {}
        get :index, request_params, request_headers
        assert_response :success
      end

      private
      def setup
        DatabaseCleaner.start
      end

      def teardown
        DatabaseCleaner.clean
      end
    end
  end
end
