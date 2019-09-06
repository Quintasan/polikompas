# frozen_string_literal: true

class LawProposalsController < ApplicationController
  expose(:law_proposals) { LawProposal.all }
  expose(:law_proposal)

  def index; end

  def show; end
end
