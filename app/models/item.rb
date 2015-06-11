class Item < ActiveRecord::Base
  validates :name, presence: true

  has_many :item_users, dependent: :destroy
  has_many :users, through: :item_users
  
  has_many :category_items, dependent: :destroy
  has_many :categories, through: :category_items
end
