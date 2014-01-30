require 'spec_helper'

describe Charge do
  describe "Factories" do
    it "has a bunch of factories that return valid objects" do
      expect( build(:charge) ).to be_valid
    end
  end

  describe "Validations" do
    it { should validate_presence_of(:customer_id) }
    it { should validate_presence_of(:created) }
    it { should validate_presence_of(:amount) }
    it { should validate_presence_of(:currency) }
    it { should ensure_inclusion_of(:currency).in_array(%w{usd eur}) }
  end
end
