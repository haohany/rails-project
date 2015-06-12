class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @purchased_items = @user.items.includes(:categories)

    purchased_categories = @purchased_items.map { |item| item.categories } .flatten

    @recommended_items = Item.joins(:categories).where(categories: { id: purchased_categories.map(&:id) }).distinct.includes(:categories)

    @recommended_items -= @purchased_items

    @recommended_items.sort! do |a, b|
      (purchased_categories - a.categories).length <=> (purchased_categories - b.categories).length
    end

  end
end
