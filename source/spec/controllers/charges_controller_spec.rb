require 'spec_helper'

describe ChargesController do

  describe "GET #index" do
    before do
      Charge.stub_chain(:successful, :group_by).and_return([:successful_charge])
      Charge.stub_chain(:failed, :group_by).and_return([:failed_charge])
      Charge.stub_chain(:disputed, :group_by).and_return([:disputed_charge])

      get :index
    end

    it { should render_template(:index) }
    it { should respond_with(:success) }

    it "loads successful, failed and disputed charges" do
      expect(assigns[:successful_charges_per_customer]).to eq([:successful_charge])
      expect(assigns[:failed_charges_per_customer]).to eq([:failed_charge])
      expect(assigns[:disputed_charges_per_customer]).to eq([:disputed_charge])
    end
  end

end
