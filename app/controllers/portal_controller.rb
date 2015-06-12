class PortalController < ApplicationController
  def show
    @item_users = ItemUser.joins(:item, :user).paginate(page: params[:page], per_page: 10)
  end
end
