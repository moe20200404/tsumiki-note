FactoryBot.define do
  factory :letter do
    title                  { Faker::Name.initials(number: 2) }
    genre_id               { Faker::Number.between(from: 2, to: 4) }
    association :user 

    after(:build) do |letter|
      letter.pdf_file.attach(
        io: File.open('public/ex_letter.pdf'),
        filename: 'pdf_file.pdf'
      )
    end
    
  end
end
