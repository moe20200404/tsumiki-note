class UsersChild < ApplicationRecord
  belongs_to :child_class
  belongs_to :user


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender

  with_options presence: true do
    validates :name
    validates :birth_date
    validates :gender_id
    validates :start_month
    validates :child_class
    validates :user
  end
end
