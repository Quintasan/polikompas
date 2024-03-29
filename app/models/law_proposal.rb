# frozen_string_literal: true

class LawProposal < ApplicationRecord
  include Votable
  include Commentable

  validates :name, presence: true
  validates :url, presence: true, url: { allow_nil: true }
end
