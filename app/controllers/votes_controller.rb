# frozen_string_literal: true

class VotesController < ApplicationController
  def vote
    votable = params[:type].to_s.constantize.find(params[:id])
    action = params[:user_action]
    ProcessVote.new(votable: votable, action: action, user: current_user).call
    render json: { id: votable.id, score: votable.score }
  end
end
