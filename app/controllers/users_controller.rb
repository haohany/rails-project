class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @purchased_items = @user.items

    purchased_categories = []

    @purchased_items.each do |item|
      purchased_categories.concat(item.categories)
    end

    @recommended_items = []

    purchased_categories.uniq.each do |category|
      @recommended_items.concat(category.items)
    end

    @recommended_items.uniq!
    @recommended_items -= @purchased_items

    @recommended_items.sort! do |a, b|
      (purchased_categories - a.categories).length <=> (purchased_categories - b.categories).length
    end

  end
end
