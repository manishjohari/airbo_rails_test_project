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

  describe "Scopes" do
    describe ".successful" do
      it "returns only paid charges, that were not refunded" do
        where_values = Charge.successful.where_values_hash
        expect(where_values).to eq( {"paid" => true, "refunded" => false} )
      end
    end

    describe ".failed" do
      it "returns only unpaid charges, that were not refunded" do
        where_values = Charge.failed.where_values_hash
        expect(where_values).to eq( {"paid" => false, "refunded" => false} )
      end
    end

    describe ".disputed" do
      it "returns only paid charges, that were refunded" do
        where_values = Charge.disputed.where_values_hash
        expect(where_values).to eq( {"paid" => true, "refunded" => true} )
      end
    end
  end

end
