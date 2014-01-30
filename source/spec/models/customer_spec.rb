require 'spec_helper'

describe Customer do
  describe "Factories" do
    it "has a bunch of factories that return valid objects" do
      expect( build(:customer) ).to be_valid
    end
  end

  describe "Associations" do
    it { should have_many(:charges).dependent(:destroy) }
  end

  describe "Validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe "#full_name" do
    let(:customer) { Customer.new(first_name: "Luke", last_name: "Skywalker") }

    it "returns customer first and last names, joined by space" do
      expect( customer.full_name ).to eq("Luke Skywalker")
    end
  end

end
