# frozen_string_literal: true

class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  has_secure_password
  has_many :votes, dependent: :destroy

  scope :registered_users, -> { where.not(confirmed_at: nil).count }
end
