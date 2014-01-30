require 'spec_helper'

describe Customer do
  describe "Factories" do
    it "has a bunch of factories that return valid objects" do
      expect( build(:customer) ).to be_valid
    end
  end

  describe "Validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

end
