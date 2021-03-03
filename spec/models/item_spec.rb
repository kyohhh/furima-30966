require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品出品できる場合' do
      it 'imageとitem_nameとdescriptionとcategory_idとstate_idとshipping_charges_idとprefecture_idとdays_to_ship_idとpriceがあれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できない場合' do
      it 'imageが空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "画像を選択してください"
      end
      #it 'item_nameが空だと登録できない' do
        #@item.item_name = ''
        #@item.valid?
        #expect(@item.errors.full_messages).to include "商品名を入力してください"
      #end
      #it 'descriptionが空だと登録できない' do
        #@item.description = ''
        #@item.valid?
        #expect(@item.errors.full_messages).to include "商品の説明を入力してください"
      #end
      #it 'category_idが空だと登録できない' do
        #@item.category_id = ''
        #@item.valid?
        #expect(@item.errors.full_messages).to include "カテゴリーを入力してください"
      #end
      #it 'state_idが空だと登録できない' do
        #@item.state_id = ''
        #@item.valid?
        #expect(@item.errors.full_messages).to include "商品の状態は1以外の値にしてください"
      #end
      #it 'shipping_charges_idが空だと登録できない' do
        #@item.shipping_charges_id = ''
        #@item.valid?
        #expect(@item.errors.full_messages).to include "配送料の負担は1以外の値にしてください"
      #end
      #it 'prefecture_idが空だと登録できない' do
        #@item.prefecture_id = ''
        #@item.valid?
        #expect(@item.errors.full_messages).to include "発送元の地域は1以外の値にしてください"
      #end
      #it 'days_to_ship_idが空だと登録できない' do
        #@item.days_to_ship_id = ''
        #@item.valid?
        #expect(@item.errors.full_messages).to include "発送までの日数は1以外の値にしてください"
      #end
      it 'priceが空だと登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "価格を入力してください"
      end
      it 'priceの範囲が¥0~¥299の間であると登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は一覧にありません'
      end
      it 'priceの範囲が¥10,000,000以上であると登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は一覧にありません'
      end
      it 'priceは全角数字であると登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include '価格は一覧にありません'
      end
      it 'user_idが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include 'Userを入力してください'
      end
      it 'category_idが1だと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'カテゴリーは1以外の値にしてください'
      end
      it 'state_idが1だと登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '商品の状態は1以外の値にしてください'
      end
      it 'shipping_charge_idが1だと登録できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '配送料の負担は1以外の値にしてください'
      end
      it 'prefecture_idが1だと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '発送元の地域は1以外の値にしてください'
      end
      it 'days_to_ship_idが1だと登録できない' do
        @item.days_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include '発送までの日数は1以外の値にしてください'
      end
    end
  end
end
