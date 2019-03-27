# frozen_string_literal: true

class LawProposalsController < ApplicationController
  before_action :set_law_proposal, only: %i[show edit update destroy]

  # GET /law_proposals
  def index
    @law_proposals = LawProposal.all
  end

  # GET /law_proposals/1
  def show; end

  # GET /law_proposals/new
  def new
    @law_proposal = LawProposal.new
  end

  # GET /law_proposals/1/edit
  def edit; end

  # POST /law_proposals
  def create
    @law_proposal = LawProposal.new(law_proposal_params)

    if @law_proposal.save
      redirect_to @law_proposal, notice: 'Law proposal was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /law_proposals/1
  def update
    if @law_proposal.update(law_proposal_params)
      redirect_to @law_proposal, notice: 'Law proposal was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /law_proposals/1
  def destroy
    @law_proposal.destroy
    redirect_to law_proposals_url, notice: 'Law proposal was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_law_proposal
    @law_proposal = LawProposal.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def law_proposal_params
    params.require(:law_proposal).permit(:name, :description, :url)
  end
end
