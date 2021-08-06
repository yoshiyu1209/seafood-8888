FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'test8888' }
    password_confirmation { 'test8888' }
    last_name             { '名前' }
    first_name            { '名前' }
    last_name_kana        { 'ナマエ' }
    first_name_kana       { 'ナマエ' }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
