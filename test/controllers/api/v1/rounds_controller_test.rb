require 'test_helper'

module API
  module V1
    class RoundsControllerTest < ActionController::TestCase
      test "should get index" do
        request_params = {}
        get :index, request_params, request_headers
        assert_response :success
      end

      test "should create a round" do
        request_params = { name: 'Vegas Round', category: 'BHFS' }
        post :create, request_params, request_headers
        assert_response :success
      end

      test "shouldn't create a round" do
        request_params = { }
        post :create, request_params, request_headers
        assert_response 403
      end

      test "should show the round" do
        request_params = { id: @round.id }
        get :show, request_params, request_headers
        assert_response :success
      end

      test "should update the round" do
        request_params = { id: @round.id, name: @round.name + 'Updated', category: 'primitive' }
        patch :update, request_params, request_headers
        assert_response :success
        put :update, request_params, request_headers
        assert_response :success
      end

      test "shouldn't update the round" do
        request_params = { id: @round.id }
        patch :update, request_params, request_headers
        assert_response 403
        put :update, request_params, request_headers
        assert_response 403
      end

      test "should delete the round" do
        request_params = { id: @round.id }
        delete :destroy, request_params, request_headers
        assert_response :success
      end

      private
      def setup
        DatabaseCleaner.start
        @round ||= Round.create(name: 'RoundsControllerTest')
      end

      def teardown
        DatabaseCleaner.clean
      end
    end
  end
end
