class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless @item.user_id == current_user.id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      @item.valid?
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item_name, :description, :category_id, :state_id, :shipping_charge_id,
                                 :prefecture_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end
end
