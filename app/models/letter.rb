class Letter < ApplicationRecord
  belongs_to :user

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  with_options presence: true do
    validates :title
    validates :genre_id ,numericality: { other_than: 1, message: "can't be blank" }
  end
end