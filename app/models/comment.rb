# frozen_string_literal: true

class Comment < ApplicationRecord
  include Votable

  validates :body, presence: true
  belongs_to :commentable, polymorphic: true
  belongs_to :user
end
