# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new }

  context "validations" do
    context "email" do
      it "is present" do
        expect(subject).not_to be_valid
      end

      it "is unique" do
        described_class.create(email: "test@test.com", password: "qweasdzxc")
        subject.email = "test@test.com"
        expect(subject).not_to be_valid
      end
    end

    context "password" do
      it "is present" do
        expect(subject).not_to be_valid
      end
    end
  end
end
