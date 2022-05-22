class Authority < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '保護者' },
    { id: 3, name: '保育士' },
    { id: 4, name: '卒園児保護者' }
  ]

  include ActiveHash::Associations
  has_many :users
end
