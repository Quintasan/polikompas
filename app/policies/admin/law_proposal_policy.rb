module Admin
  class LawProposalPolicy < ::ApplicationPolicy
    def index?
      user.admin?
    end
  end
end
