class ReferenceNotNull < ActiveRecord::Migration
  def change
    change_column_null :category_items, :category_id, false
    change_column_null :category_items, :item_id, false
    change_column_null :item_users, :item_id, false
    change_column_null :item_users, :user_id, false
  end
end
