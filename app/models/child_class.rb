class ChildClass < ApplicationRecord
  with_options presence: true do
    validates :class_age, uniqueness: true,
                          format: { with: /\A\d{1}\z/, message: 'input only 1 digit'}
    validates :class_name, uniqueness: true
  end
end
