FactoryBot.define do
  factory :coin do
    name { Faker::Number.between(from: 1, to: 10) }
    value { Faker::Commerce.price }
    quantity { Faker::Number.between(from: 1, to: 10) }

    trait :no_change do
      quantity { 0 }
    end

    trait :negative do
      quantity { -1 }
    end

    trait :just_one do
      quantity { 1 }
    end

    trait :pound do
      value { 1.0 }
      quantity { 1 }
    end
  end
end