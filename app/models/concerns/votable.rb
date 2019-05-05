# frozen_string_literal: true

module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable, dependent: :destroy
  end

  def score
    votes.where(type: "upvote").count - votes.where(type: "downvote").count
  end

  def upvote!
    votes.create(type: "upvote")
  end

  def downvote!
    votes.create(type: "downvote")
  end
end
