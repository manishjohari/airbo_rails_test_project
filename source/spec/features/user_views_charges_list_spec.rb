require 'spec_helper'

feature "As a user, I can see the charges list" do
  given!(:johny)  { create(:customer, first_name: "Johny",  last_name: "Flow") }
  given!(:raj)    { create(:customer, first_name: "Raj",    last_name: "Jamnis") }
  given!(:andrew) { create(:customer, first_name: "Andrew", last_name: "Chung") }
  given!(:mike)   { create(:customer, first_name: "Mike",   last_name: "Smith") }

  before do
    # Successful charges
    create_list(:charge, 5, :successful, customer: johny)
    create_list(:charge, 3, :successful, customer: raj)
    create(:charge, :successful, customer: andrew)
    create(:charge, :successful, customer: mike)

    # Failed charges
    create_list(:charge, 3, :failed, customer: andrew)
    create_list(:charge, 2, :failed, customer: mike)

    # Disputed charges
    create_list(:charge, 3, :disputed, customer: johny)
    create_list(:charge, 2, :disputed, customer: raj)

    visit charges_path
  end

  scenario "There are exactly 3 lists on the page" do
    page.should have_css("div.charges", count: 3)
  end

  scenario "There are 10 elements on the 'Successful Charges' list" do
    within ".charges.successful" do
      page.should have_content "Successful Charges"
      page.should have_css("ol > li", count: 10)
    end
  end

  scenario "There are 5 elements on the 'Failed Charges' list" do
    within ".charges.failed" do
      page.should have_content "Failed Charges"
      page.should have_css("ol > li", count: 5)
    end
  end

  scenario "There are 5 elements on the 'Disputed Charges' list" do
    within ".charges.disputed" do
      page.should have_content "Disputed Charges"
      page.should have_css("ol > li", count: 5)
    end
  end
end
