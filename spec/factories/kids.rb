FactoryBot.define do
  factory :kid do
    name             { Faker::Lorem.word }
    birth_date       { Date.jd(rand(2458211..2459671))}
    gender_id        { rand(2..3) }
    start_month      { "202004"}
    end_month        { "202306" }

    association :grade
    association :user

  end
end
