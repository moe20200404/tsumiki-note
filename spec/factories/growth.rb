FactoryBot.define do
  factory :growth do
    month              { Date.today.strftime('%Y%m').to_s }
    inspection_date            { Date.today }
    weight              { rand(3.0..30.0) }
    height              { rand(40.0..200.0) }
    
    association :kid
  end
end
