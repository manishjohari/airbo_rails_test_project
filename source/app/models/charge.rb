class Charge < ActiveRecord::Base
  belongs_to :customer

  validates :customer_id, presence: true
  validates :created, presence: true
  validates :amount, presence: true
  validates :currency, presence: true, inclusion: { in: %w(usd eur) }
end
