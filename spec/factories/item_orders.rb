FactoryBot.define do
  factory :item_order do
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
    postal_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    shipping_area_id { Faker::Number.between(from: 1, to: 47) }
    municipality { Faker::Address.city }
    address { Faker::Address.street_address }
    building_name { Faker::Address.street_address }
    phone_number { Faker::Number.decimal_part(digits: 11) }
  end
end
