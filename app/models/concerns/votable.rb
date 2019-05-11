# frozen_string_literal: true

module Votable
  extend ActiveSupport::Concern

  included do
    has_many :votes, as: :votable, dependent: :destroy
    has_many :users, through: :votes, dependent: :destroy
  end

  def score
    votes.where(type: "upvote").count - votes.where(type: "downvote").count
  end

  def upvote!(user: nil)
    votes.create(type: "upvote", user: user)
  end

  def downvote!(user: nil)
    votes.create(type: "downvote", user: user)
  end
end
