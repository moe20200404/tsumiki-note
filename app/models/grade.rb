class Grade < ApplicationRecord
  has_many :kids

  with_options presence: true do
    validates :age,  format: { with: /\A\d{1}\z/, message: 'input only 1 digit'}
    validates :name, uniqueness: { case_sensitive: false }
  end

end
