class ItemUser < ActiveRecord::Base
  validates :item_id, :user_id, presence: true
  
  belongs_to :item
  belongs_to :user
end
