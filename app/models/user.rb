class User < ActiveRecord::Base
  validates :name, presence: true
  
  has_many :item_users, dependent: :destroy
  has_many :items, through: :item_users
end
