# frozen_string_literal: true

module Admin
  class LawProposalsController < ApplicationController
    expose(:law_proposals) { LawProposal.all }
    expose(:law_proposal)

    def index; end

    def show; end

    def new; end

    def create
      if law_proposal.save
        redirect_to admin_law_proposals_path
      else
        render :new
      end
    end

    def edit; end

    def update
      if law_proposal.update(law_proposal_params)
        redirect_to admin_law_proposals_path
      else
        render :edit
      end
    end

    def delete
      law_proposal.destroy
      redirect_to :index, status: :ok
    end

    private

    def law_proposal_params
      params.require(:law_proposal).permit(:name, :description, :url, :tags)
    end
  end
end
