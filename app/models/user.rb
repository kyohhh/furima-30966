class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, presence: { message: 'を入力してください' }
    validates :email
    validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/,
                                   message: 'は半角英数字で入力してください' }
    with_options format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角で入力してください' } do
      validates :family_name
      validates :first_name
    end
    with_options format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カナで入力してください' } do
      validates :family_name_kana
      validates :first_name_kana
    end
    validates :birthday, presence: { message: 'を選択してください' }
  end

  has_many :items
  has_many :order
  has_many :comments
end
