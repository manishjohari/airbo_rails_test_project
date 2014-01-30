class ChargesController < ApplicationController
  def index
    @successful_charges_per_customer = Charge.successful.group_by(&:customer)
    @failed_charges_per_customer     = Charge.failed.group_by(&:customer)
    @disputed_charges_per_customer   = Charge.disputed.group_by(&:customer)
  end
end
