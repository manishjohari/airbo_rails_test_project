class Customer < ActiveRecord::Base
  validates :first_name, :last_name, presence: true
  has_many :charges, dependent: :destroy

  def full_name
    [first_name, last_name].join(" ")
  end
end
