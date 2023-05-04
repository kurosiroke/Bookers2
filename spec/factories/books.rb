FactoryBot.define do
  factory :book do
    title { Faker::Lorem.characters(number: 5) }
    body { Faker::Lorem.characters(number: 200) }
    user
  end
end
