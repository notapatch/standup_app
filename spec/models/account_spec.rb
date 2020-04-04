require "rails_helper"

RSpec.describe Account, type: :model do
  context "valid Factory" do
    it "has a valid factory" do
      expect(build(:account)).to be_valid
    end
  end

  context "valid validations" do
    it "will not save without a name" do
      expect(build(:account, name: nil).save).to be_falsy
    end
  end
end
