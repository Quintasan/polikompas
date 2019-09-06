# frozen_string_literal: true

class ProcessVote
  attr_accessor :votable, :action, :user

  def initialize(votable:, action:, user:)
    @votable = votable
    @action = action
    @user = user
  end

  def call
    existing_vote = @votable.votes.find_by(user: @user)
    case existing_vote&.type
    when "upvote"
      existing_vote.destroy
      votable.downvote!(user: @user) if @action.eql?("downvote")
    when "downvote"
      existing_vote.destroy
      votable.upvote!(user: @user) if @action.eql?("upvote")
    else
      case @action
      when "upvote"
        votable.upvote!(user: @user)
      when "downvote"
        votable.downvote!(user: @user)
      end
    end
  end
end
