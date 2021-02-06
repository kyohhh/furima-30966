class OrdersController < ApplicationController
  def index
    @user_order = UserOrder.new   #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
  end

  def create
    binding.pry
  end
end
