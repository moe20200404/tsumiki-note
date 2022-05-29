class ChildClass < ApplicationRecord
  with_options presence: true do
    validates :class_age
    validates :class_name
  end
end
