# frozen_string_literal: true

class VotesController < ApplicationController
  protect_from_forgery with: :null_session

  def vote
    votable = params[:type].to_s.constantize.find(params[:id])
    action = params[:user_action]
    user = User.first
    ProcessVote.new(votable: votable, action: action, user: user).call
    render json: { id: votable.id, score: votable.score }
  end
end
