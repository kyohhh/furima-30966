require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end
  describe '商品購入機能' do
    context '商品購入できる場合' do
      it 'post_codeとprefecture_idとcityとaddressとphone_numberとtokenがあれば登録できる' do
        expect(@user_order).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'post_codeが空だと登録できない' do
        @user_order.post_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeはハイフン(半角)がないと登録できない' do
        @user_order.post_code = "1234567"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'post_codeは半角数字でないと登録できない' do
        @user_order.post_code = "１２３-４５６７"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'prefecture_idが1だと登録できない' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Prefecture can't be blank"
      end
      it 'cityが空だと登録できない' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "City can't be blank"
      end
      it 'addressが空だと登録できない' do
        @user_order.address = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Address can't be blank"
      end
      it 'phone_numberが空だと登録できない' do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Phone number can't be blank"
      end
      it 'phone_numberは12桁以上だと登録できない' do
        @user_order.phone_number = "090123456789"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Phone number is invalid."
      end
      it 'phone_numberは半角数字でないと登録できない' do
        @user_order.phone_number = "０９０１２３４５６７８"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Phone number is invalid."
      end
      it 'tokenが空では登録できない' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include "Token can't be blank"
      end
    end
  end
end
