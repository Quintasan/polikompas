# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LawProposal, type: :model do
  subject { described_class.new }

  context "validations" do
    it "has a name" do
      expect(subject).not_to be_valid
    end

    it "has an url" do
      should validate_url_of(:url)
    end
  end
end
