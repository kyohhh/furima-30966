require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品機能" do
    context "商品出品できる場合" do
      it "imageとitem_nameとdescriptionとcategory_idとstate_idとshipping_charges_idとprefecture_idとdays_to_ship_idとpriceがあれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context "商品出品できない場合" do
      it "item_nameが空だと登録できない" do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item name can't be blank"
      end
      it "descriptionが空だと登録できない" do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end
      it "category_idが空だと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank", "Category is not a number"
      end
      it "state_idが空だと登録できない" do
        @item.state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "State can't be blank", "State is not a number"
      end
      it "shipping_charges_idが空だと登録できない" do
        @item.shipping_charges_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping charges can't be blank", "Shipping charges is not a number"
      end
      it "prefecture_idが空だと登録できない" do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Prefecture can't be blank", "Prefecture is not a number"
      end
      it "days_to_ship_idが空だと登録できない" do
        @item.days_to_ship_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Days to ship can't be blank", "Days to ship is not a number"
      end
      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank", "Price is not included in the list", "Price is invalid"
      end
      it "priceの範囲が¥0~¥299の間であると登録できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it "priceの範囲が¥10,000,000以上であると登録できない" do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it "priceは全角数字であると登録できない" do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Price is not included in the list"
      end
      it "user_idが紐付いていなければ登録できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end