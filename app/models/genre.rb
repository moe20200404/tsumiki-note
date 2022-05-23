class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'おたより' },
    { id: 3, name: '献立表' },
    { id: 4, name: '大切なおしらせ' }
  ]

  include ActiveHash::Associations
  has_many :letters
end
