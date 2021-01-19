class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  
  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :state_id, :shipping_charges_id, :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end