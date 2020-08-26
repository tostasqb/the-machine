FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    price { Faker::Commerce.price }
    quantity { Faker::Number.between(from: 1, to: 10) }
    quantity_sold { Faker::Number.between(from: 1, to: 10) }

    trait :no_stock do
      quantity { 0 }
    end

    trait :negative do
      quantity { -1 }
    end

    trait :quantity_one do
      quantity { 1 }
    end

    trait :product_one_pound do
      quantity { 1 }
      price { 1.0 }
    end
  end
end