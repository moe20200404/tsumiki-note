class Kid < ApplicationRecord
  belongs_to :grade
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender

  with_options presence: true do
    validates :name
    validates :birth_date
    validates :gender_id
    validates :start_month
    validates :grade
    validates :user
  end
end
