# frozen_string_literal: true

class VotesController < ApplicationController
  protect_from_forgery with: :null_session

  def upvote
    votable = params[:type].to_s.constantize.find(params[:id])
    votable.upvote!
    render json: { id: votable.id, score: votable.score }
  end

  def downvote
    votable = params[:type].to_s.constantize.find(params[:id])
    votable.downvote!
    render json: { id: votable.id, score: votable.score }
  end
end
