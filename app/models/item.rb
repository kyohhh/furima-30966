class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :state
  belongs_to :shipping_charge
  belongs_to :prefecture
  belongs_to :days_to_ship

  # 商品画像を1枚つけることが必須であること
  # 商品名が必須であること
  # 商品の説明が必須であること
  # カテゴリーの情報が必須であること
  # 商品の状態についての情報が必須であること
  # 配送料の負担についての情報が必須であること
  # 発送元の地域についての情報が必須であること
  # 発送までの日数についての情報が必須であること
  # 価格についての情報が必須であること
  with_options presence: true do
    validates :image, presence: { message: 'を選択してください' }
    validates :item_name
    validates :description
    validates :category_id
    validates :state_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
    # 価格の範囲が、¥300~¥9,999,999の間であること
    # 販売価格は半角数字のみ保存可能であること
    validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end

  # ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :shipping_charge_id
    validates :prefecture_id
    validates :days_to_ship_id
  end
end
