FactoryGirl.define do
  factory :charge do
    customer
    created   { Time.new.to_i }
    amount    { rand(1..500) }
    currency  "usd"
    paid      false
    refunded  false

    trait :successful do
      paid true
      refunded false
    end

    trait :failed do
      paid false
      refunded false
    end

    trait :disputed do
      paid true
      refunded true
    end
  end
end
