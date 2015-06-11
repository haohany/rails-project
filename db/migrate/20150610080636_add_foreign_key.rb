class AddForeignKey < ActiveRecord::Migration
  def change
    remove_foreign_key :category_items, :categories
    remove_foreign_key :category_items, :items
    remove_foreign_key :item_users, :items
    remove_foreign_key :item_users, :users

    add_foreign_key :category_items, :categories, on_delete: :cascade
    add_foreign_key :category_items, :items, on_delete: :cascade
    add_foreign_key :item_users, :items, on_delete: :cascade
    add_foreign_key :item_users, :users, on_delete: :cascade
  end
end
