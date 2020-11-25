# frozen_string_literal: true

class ProcessVote
  ACCEPATBLE_CLASSES = {
    "LawProposal" => LawProposal
  }.freeze

  ACCEPTABLE_ACTIONS = %w[upvote downvote remove-vote].freeze

  def initialize(votable_type:, id:, action:, user:)
    @votable_type = votable_type
    @id = id
    @action = action
    @user = user
  end

  def call
    return [:failure, "Wrong voteable type: #{votable_type}"] unless ACCEPATBLE_CLASSES.keys.include?(votable_type)
    return [:failure, "Missing id"] unless id
    return [:failure, "Wrong action type: #{action}"] unless ACCEPTABLE_ACTIONS.include?(action)
    return [:failure, "No user logged in"] unless user

    @votable = ACCEPATBLE_CLASSES[votable_type].find(id)

    vote
  end

  private

  attr_reader :votable, :votable_type, :id, :action, :user

  def vote
    existing_vote = votable.votes.find_by(user: user)

    case action
    when "upvote"
      existing_vote.destroy! if existing_vote&.downvote?
      votable.upvote!(user: user) unless existing_vote&.upvote?
    when "downvote"
      existing_vote.destroy! if existing_vote&.upvote?
      votable.downvote!(user: user) unless existing_vote&.downvote?
    when "remove-vote"
      destroy_existing_votes(votable)
    end

    [:success, votable]
  end

  def destroy_existing_votes(votable)
    votable.votes.where(user: user).destroy_all
  end
end
