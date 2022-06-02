class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :letters
  has_many :children

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :authority

  with_options presence: true do
    validates :name
    validates :authority_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :postal_code, format: { with: /\A\d{7}\z/, allow_blank: true }
    validates :pref
    validates :city
    validates :town
    validates :phone_number, length: { within: 10..11 },
                             format: { with: /\A\d{10,11}\z/, message: 'input only number' }
  end
end
