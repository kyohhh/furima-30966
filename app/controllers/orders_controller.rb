class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new   #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end

  def create
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      @user_order.save
      redirect_to :root
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchase)
  end

end