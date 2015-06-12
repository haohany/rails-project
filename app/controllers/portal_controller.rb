class PortalController < ApplicationController
  def show
    if logged_in?
      @item_users = ItemUser.joins(:item, :user).includes(:user, item: :categories).paginate(page: params[:page], per_page: 10, total_entries: ItemUser.joins(:item, :user).count)
    else
      render 'show_login'
    end
  end
end
