FactoryBot.define do
  factory :child_class do
    class_age              { Faker::Number.between(from: 0, to: 9) } 
    class_name             { Faker::Lorem.word }
  end
end
