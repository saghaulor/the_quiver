module API
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all
        render json: users, status: 200
      end

      def show
        render json: user, status: 200
      end

      private
      def user
        User.find(params[:id])
      end

      def user_params
        params.permit(:email)
      end
    end
  end
end
