class ItemsController < ApplicationController
  def index
  end

  #def new
    #@item = Item.new
  #end

  #def create
    #Item.create(item_params)
  #end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :state_id, :shipping_charges_id, :prefecture_id, :days_to_ship_id, :price, :user).merge(user_id: current_user.id)
  end
end
