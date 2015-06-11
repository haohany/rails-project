class Category < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :category_items, dependent: :destroy
  has_many :items, through: :category_items
end
