FactoryBot.define do
  factory :kid do
    name             { Faker::Lorem.word }
    birth_date       { Date.jd(rand(2_458_211..2_459_671)) }
    gender_id        { rand(2..3) }
    start_month      { '202004' }
    end_month        { '202306' }

    association :grade
    association :user
  end
end
