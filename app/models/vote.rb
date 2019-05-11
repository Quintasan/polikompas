# frozen_string_literal: true

class Vote < ApplicationRecord
  self.inheritance_column = nil

  enum type: {
    "upvote": "upvote",
    "downvote": "downvote"
  }

  validates :type, presence: true

  belongs_to :votable, polymorphic: true
  belongs_to :user
end
