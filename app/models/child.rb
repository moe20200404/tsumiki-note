class Child < ApplicationRecord
  belongs_to :class
  belongs_to :user

  with_options presence: true do
    validates :name
    validates :birth_date
    validates :gender_id
    validates :start_month
    validates :class_id
    validates :user_id
  end
end
