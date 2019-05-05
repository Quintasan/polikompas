# frozen_string_literal: true

class LawProposalsController < ApplicationController
  expose(:law_proposals) { LawProposal.all }
  def index; end
end
