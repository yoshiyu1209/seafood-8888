FactoryBot.define do
  factory :item do
    title               { 'テストだよ' }
    text                { 'テストです' }
    weight              { '1000g' }
    area_id             { 2 }
    catch_day           { '2021-08-09' }
    classone_id         { 2 }
    tighten             { 'テストです' }
    process             { 'テストです' }
    process_timing      { 'テストです' }
    storage_id          { 2 }
    shipping_charges_id { 2 }
    days_to_ship_id     { 2 }
    delivery_id         { 2 }
    shipping_area_id    { 2 }
    price               { 1000 }

    user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
