require 'csv'

options = { col_sep: "\t", headers: true }

namespace :seed do

  task all: [:users, :items, :categories, :category_items, :item_users]

  task users: :environment do
    file = Rails.root.join('seed-data', 'mini_proj-users.csv')
    puts "Start seeding data from #{file} to users table"

    CSV.foreach(file, options) do |row|
      User.create!(id: row['user_id'], name: row['name'])
    end
  end

  task items: :environment do
    file = Rails.root.join('seed-data', 'mini_proj-items.csv')
    puts "Start seeding data from #{file} to items table"

    CSV.foreach(file, options) do |row|
      Item.create!(id: row['item_id'], name: row['name'])
    end
  end

  task categories: :environment do
    file = Rails.root.join('seed-data', 'mini_proj-categories.csv')
    puts "Start seeding data from #{file} to categories table"

    CSV.foreach(file, options) do |row|
      Category.create!(id: row['category_id'], name: row['name'])
    end
  end

  task category_items: :environment do
    file = Rails.root.join('seed-data', 'mini_proj-categories_items.csv')
    puts "Start seeding data from #{file} to category_items table"

    CSV.foreach(file, options) do |row|
      CategoryItem.create!(category_id: row['category_id'], item_id: row['item_id'])
    end
  end

  task item_users: :environment do
    file = Rails.root.join('seed-data', 'mini_proj-items_users.csv')
    puts "Start seeding data from #{file} to item_users table"

    CSV.foreach(file, options) do |row|
      ItemUser.create!(user_id: row['user_id'], item_id: row['item_id'])
    end
  end

end
