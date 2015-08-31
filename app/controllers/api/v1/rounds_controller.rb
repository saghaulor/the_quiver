module API
  module V1
    class RoundsController < ApplicationController

      def index
        rounds = Round.all
        rounds = rounds.where(name: params[:name]) if params[:name]
        rounds = rounds.where(category: params[:category]) if params[:category]
        render json: rounds, status: 200
      end

      def show
        render json: round, status: 200
      end

      def create
        round = Round.new(round_params)
        if round.valid?
          round.save!
          render json: round, status: 200
        else
          render json: round.errors, status: 403
        end
      end

      def update
        if round_params.present? && round.update(round_params)
          render json: round, status: 200
        else
          render json: round.errors, status: 403
        end
      end

      def destroy
        round.destroy
        render nothing: true, status: :no_content
      end

      private
      def round
        Round.find(params[:id])
      end

      def round_params
        params.permit(:name, :category)
      end
    end
  end
end
