FactoryBot.define do
  factory :grade do
    age              { Faker::Number.between(from: 0, to: 9) } 
    name             { Faker::Lorem.word }
  end
end
