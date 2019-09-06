# frozen_string_literal: true

module LawProposalsHelper
  def show_tags(law_proposal:)
    if law_proposal.tags.empty?
      I18n.t("helpers.law_proposals.no_tags")
    else
      law_proposal.tags.join(", ")
    end
  end
end
