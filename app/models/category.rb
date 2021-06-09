class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'レジャー' },
    { id: 3, name: 'ブライダル' },
    { id: 4, name: '近隣施設' },
    { id: 5, name: '海' },
    { id: 6, name: '和風' },
    { id: 7, name: 'グルメ' },
    { id: 8, name: 'イベント' },
    { id: 9, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :hotels
end
