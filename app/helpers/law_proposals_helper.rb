module LawProposalsHelper
  def show_tags(law_proposal:)
    binding.pry
    if law_proposal.tags.empty?
      I18n.t("helpers.law_proposals.no_tags")
    else
      law_proposal.tags.join(", ")
    end
  end
end
