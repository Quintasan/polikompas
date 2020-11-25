# frozen_string_literal: true

class VotesController < ApplicationController
  def vote
    result, votable = ProcessVote.new(
      votable_type: params[:type],
      id: params[:id],
      action: params[:user_action],
      user: current_user
    ).call

    case result
    when :success
      render json: { id: votable.id, score: votable.score }
    when :failure
      render json: { message: votable }, status: :unprocessable_entity
    end
  end
end
