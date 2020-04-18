# frozen_string_literal: true

module Admin
  class LawProposalsController < ::AdminController
    expose(:law_proposals) { LawProposal.all }
    expose(:law_proposal)

    def index
      policy_scope(LawProposal)
    end

    def show
      authorize law_proposal
    end

    def new
      authorize law_proposal
    end

    def create
      authorize law_proposal

      if law_proposal.save
        redirect_to admin_law_proposals_path
      else
        render :new
      end
    end

    def edit
      authorize law_proposal
    end

    def update
      authorize law_proposal

      if law_proposal.update(law_proposal_params)
        redirect_to admin_law_proposals_path
      else
        render :edit
      end
    end

    def delete
      authorize law_proposal

      law_proposal.destroy
      redirect_to :index, status: :ok
    end

    private

    def law_proposal_params
      params.require(:law_proposal).permit(:name, :description, :url, :tags, :important_points)
    end
  end
end
