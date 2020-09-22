# frozen_string_literal: true

module Commentable
  extend ActiveSupport::Concern

  included do
    has_many :comments, as: :commentable, dependent: :destroy
    has_many :users, through: :comments, source: :user
  end

  def add_comment(body: nil, user: nil)
    comments.create(body: body, user: user)
  end
end
