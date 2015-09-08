module API
  module V1
    class RoundEndsController < ApplicationController
      def index
        round_ends = RoundEnd.all
        round_ends = round_ends.where(round_id: params['round_id']) if params['round_id'].present?
        round_ends = round_ends.where(distance: params['distance']) if params['distance'].present?
        round_ends = round_ends.where(uom: params['uom']) if params['uom'].present?
        render json: round_ends, status: 200
      end

      def create
        round_end = RoundEnd.new(round_end_params)
        if round_end.valid?
          round_end.save!
          render json: round_end, status: 200
        else
          render json: round_end.errors, status: 403
        end
      end

      def show
        render json: round_end, status: 200
      end

      def update
        if round_end_params.present? && round_end.update(round_end_params)
          render json: round_end, status: 200
        else
          render json: round_end.errors, status: 403
        end
      end

      def destroy
        round_end.destroy
        render nothing: true, status: :no_content
      end

      private
      def round_end
        RoundEnd.find(params[:id])
      end

      def round_end_params
        params.permit(:shots, :distance, :uom, :max_shots_count, :mulligan)
      end
    end
  end
end
