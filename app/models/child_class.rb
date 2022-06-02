class ChildClass < ApplicationRecord
  has_many :children

  with_options presence: true do
    validates :class_age, uniqueness: true,
                          format: { with: /\A\d{1}\z/, message: 'input only 1 digit'}
    validates :class_name, uniqueness: { case_sensitive: false }
  end
end
