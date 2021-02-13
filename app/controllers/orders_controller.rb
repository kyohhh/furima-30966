class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]


  def index
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id || @item.order.present?
      redirect_to :root
    else
      @item
      @user_order = UserOrder.new   #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      redirect_to :root
    else
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:post_code, :prefecture_id, :city, :address, :building_name, :phone_number,
                                       :purchase).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵..環境変数
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

end