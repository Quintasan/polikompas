# frozen_string_literal: true

if Rails.env.development?
  User.find_or_create_by(email: "admin@example.com") do |user|
    user.password = "qweasdzxc"
    user.admin = true
  end

  DUMMY_LAW_PROPOSALS = (1..10).map do |i|
    { name: "Test #{i}", url: "https://test#{i}.pl" }
  end.freeze

  DUMMY_LAW_PROPOSALS.each do |params|
    LawProposal.new(params).save!
  end
end
