FactoryGirl.define do
  factory :charge do
    customer
    created   { Time.new.to_i }
    amount    { rand(1..500) }
    currency  "usd"
    paid      false
    refunded  false

    trait :paid do
      paid true
    end

    trait :refunded do
      refunded true
    end
  end
end
