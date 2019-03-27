# frozen_string_literal: true

require "rails_helper"

RSpec.describe LawProposalsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/law_proposals").to route_to("law_proposals#index")
    end

    it "routes to #new" do
      expect(get: "/law_proposals/new").to route_to("law_proposals#new")
    end

    it "routes to #show" do
      expect(get: "/law_proposals/1").to route_to("law_proposals#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/law_proposals/1/edit").to route_to("law_proposals#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/law_proposals").to route_to("law_proposals#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/law_proposals/1").to route_to("law_proposals#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/law_proposals/1").to route_to("law_proposals#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/law_proposals/1").to route_to("law_proposals#destroy", id: "1")
    end
  end
end
