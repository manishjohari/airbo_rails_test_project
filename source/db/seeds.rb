johny  = Customer.create!(first_name: "Johny",  last_name: "Flow")
raj    = Customer.create!(first_name: "Raj",    last_name: "Jamnis")
andrew = Customer.create!(first_name: "Andrew", last_name: "Chung")
mike   = Customer.create!(first_name: "Mike",   last_name: "Smith")


# Successful charges
5.times do |i|
  johny.charges.successful.create!(created: Time.now.to_i - i, amount: 100 + i, currency: "usd")
end

3.times do |i|
  raj.charges.successful.create!(created: Time.now.to_i - rand(10), amount: 200 + i, currency: "usd")
end

andrew.charges.successful.create!(created: Time.now.to_i - rand(10), amount: 300, currency: "usd")
mike.charges.successful.create!(created: Time.now.to_i - rand(10), amount: 400, currency: "usd")

# Failed charges
3.times do |i|
  andrew.charges.failed.create!(created: Time.now.to_i - rand(20), amount: 5000 + i, currency: "usd")
end

2.times do |i|
  mike.charges.failed.create!(created: Time.now.to_i - rand(20), amount: 6000 + i, currency: "usd")
end

# Disputed charges
3.times do |i|
  johny.charges.disputed.create!(created: Time.now.to_i - rand(20), amount: 7000 + i, currency: "usd")
end

2.times do |i|
  raj.charges.disputed.create!(created: Time.now.to_i - rand(20), amount: 8000 + i, currency: "usd")
end
