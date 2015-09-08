require 'test_helper'

module API
  module V1
    class RoundEndsControllerTest < ActionController::TestCase
      test "should get index" do
        request_params = {}
        get :index, request_params, request_headers
        assert_response :success
      end

      test "should create a round_end" do
        request_params = { shots: %w(x x x x x x),
                           distance: 60, uom: 'yd',
                           max_shots_count: 6, mulligan: false
                        }
        post :create, request_params, request_headers
        assert_response :success
      end

      test "shouldn't create a round_end" do
        request_params = {}
        post :create, request_params, request_headers
        assert_response 403
      end

      test "should show the round_end" do
        request_params = { id: round_end.id }
        get :show, request_params, request_headers
        assert_response :success
      end

      test "should update the round_end" do
        request_params = { id: round_end.id, shots: %w(10 10 10 10 10 10),
                           distance: 40, uom: 'm'
                          }
        put :update, request_params, request_headers
        assert_response :success
        patch :update, request_params, request_headers
        assert_response :success
      end

      test "shouldn't update the round_end" do
        request_params = { id: round_end.id }
        put :update, request_params, request_headers
        assert_response 403
        patch :update, request_params, request_headers
        assert_response 403
      end

      test "should get delete" do
        request_params = { id: round_end.id }
        delete :destroy, request_params, request_headers
        assert_response :success
      end

      private
      def round_end
        @round_end ||= round_ends(:nfaa900_round_end_001)
      end
    end
  end
end
