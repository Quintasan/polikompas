# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "LawProposals", type: :request do
  describe "GET /law_proposals" do
    it "works! (now write some real specs)" do
      get law_proposals_path
      expect(response).to have_http_status(200)
    end
  end
end
