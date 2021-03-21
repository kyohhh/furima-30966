require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    sleep(0.1)
    @user_order = FactoryBot.build(:user_order, user_id: @user.id, item_id: @item.id)
  end
  describe '商品購入機能' do
    context '商品購入できる場合' do
      it 'post_codeとprefecture_idとcityとaddressとphone_numberとtokenがあれば登録できる' do
        expect(@user_order).to be_valid
      end
      it 'building_nameは空でも登録できる' do
        @user_order.building_name = nil
        expect(@user_order).to be_valid
      end
    end

    context '商品購入できない場合' do
      it 'post_codeが空だと登録できない' do
        @user_order.post_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include '郵便番号を入力してください'
      end
      it 'post_codeはハイフン(半角)がないと登録できない' do
        @user_order.post_code = '1234567'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include '郵便番号は半角数字(ハイフン含む)で入力してください'
      end
      it 'post_codeは半角数字でないと登録できない' do
        @user_order.post_code = '１２３-４５６７'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include '郵便番号は半角数字(ハイフン含む)で入力してください'
      end
      it 'prefecture_idが1だと登録できない' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include '都道府県を選択してください'
      end
      it 'cityが空だと登録できない' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include '市区町村を入力してください'
      end
      it 'addressが空だと登録できない' do
        @user_order.address = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include '番地を入力してください'
      end
      it 'phone_numberが空だと登録できない' do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include '電話番号を入力してください'
      end
      it 'phone_numberは12桁以上だと登録できない' do
        @user_order.phone_number = '090123456789'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include '電話番号は半角数字(10,11桁)で入力してください'
      end
      it 'phone_numberは半角数字でないと登録できない' do
        @user_order.phone_number = '０９０１２３４５６７８'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include '電話番号は半角数字(10,11桁)で入力してください'
      end
      it 'tokenが空では登録できない' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include 'クレジットカード情報を入力してください'
      end
      it 'user_idが空では購入できない' do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include 'Userを入力してください'
      end
      it 'item_idが空では購入できない' do
        @user_order.item_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include 'Itemを入力してください'
      end
    end
  end
end
