FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    authority_id          { Faker::Number.between(from: 2, to: 4) }
    # permissionはお手紙機能の実装後に実装する
    postal_code           { Faker::Number.leading_zero_number(digits: 7) }
    pref                  { Faker::Lorem.word }
    city                  { Faker::Lorem.word }
    town                  { Faker::Lorem.word }
    building              { Faker::Lorem.word }
    phone_number          { Faker::Number.leading_zero_number(digits: 10) }
  end
end
