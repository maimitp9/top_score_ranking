# frozen_string_literal: true

module Api
  class ScoresController < ApplicationController
    def create
      service = ScoreCreator.new(create_params)
      score = service.call

      if score
        render json: score, include: [:player]
      else
        render ModelInvalidError.to_response(service)
      end
    end

    private

    def create_params
      params.require(:score).permit(:name, :score_point, :score_at)
    end
  end
end
