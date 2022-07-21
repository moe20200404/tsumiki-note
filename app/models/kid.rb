class Kid < ApplicationRecord
  belongs_to :grade
  belongs_to :user
  has_many :growths

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender

  with_options presence: true do
    validates :name
    validates :birth_date
    validates :gender_id, numericality: { other_than: 1, message: "can't be blank" }, allow_blank: true
    validates :start_month, format: { with: /\A\d{4}年\d{2}月\z/, message: 'input correctly' }
  end

  validates :end_month, format: { with: /\A\d{4}年\d{2}月\z/, message: 'input correctly' }, allow_blank: true
end
