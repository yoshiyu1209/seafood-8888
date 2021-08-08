class Storage < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '冷凍' },
    { id: 3, name: '冷蔵' },
    { id: 4, name: '真空パック保管' },
    { id: 5, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :items
end
