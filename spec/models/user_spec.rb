require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe "ユーザー新規登録" do
    context '新規登録できるとき' do
      it "nicknameとemailとpasswordとpassword_confirmationとfamily_nameとfirst_nameとfamily_name_kanaとfirst_name_kanaとbirthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordとpassword_confirmationが6文字以上の半角英数字混合だと登録できる" do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa111"
        expect(@user).to be_valid
      end
      it "family_nameは全角（漢字・ひらがな・カタカナ）だと登録できる" do
        @user.family_name = "亜あア"
        expect(@user).to be_valid
      end
      it "first_nameは全角（漢字・ひらがな・カタカナ）だと登録できる" do
        @user.first_name = "亜あア"
        expect(@user).to be_valid
      end
      it "family_name_kanaは全角(カタカナ)だと登録できる" do
        @user.family_name_kana = "ア"
        expect(@user).to be_valid
      end
      it "first_name_kanaは全角(カタカナ)だと登録できる" do
        @user.first_name_kana = "ア"
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Nickname can't be blank"
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank", "Password is invalid", "Password confirmation doesn't match Password"
      end
      it "family_nameが空だと登録できない" do
        @user.family_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name can't be blank", "Family name is invalid"
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name can't be blank", "First name is invalid"
      end
      it "family_name_kanaが空だと登録できない" do
        @user.family_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana can't be blank", "Family name kana is invalid"
      end
      it "first_name_kanaが空だと登録できない" do
        @user.first_name_kana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana can't be blank", "First name kana is invalid"
      end
      it "birthdayが空だと登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Birthday can't be blank"
      end
      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailは＠を含まないと登録できない" do
        @user.email = "aaa.aaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Email is invalid"
      end
      it "passwordは5文字以下だと登録できない" do
        @user.password = "aaa11"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
      end
      it "passwordは半角数字のみだと登録できない" do
        @user.password = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "passwordは半角英字のみだと登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password is invalid"
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation is invalid"
      end
      it "passwordとpassword_confirmationの値が違うと登録できない" do
        @user.password = "aaa111"
        @user.password_confirmation = "aaa222"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
      it "family_nameは全角(漢字・ひらがな・カタカナ)でないと登録できない" do
        @user.family_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name is invalid"
      end
      it "first_nameは全角(漢字・ひらがな・カタカナ)でないと登録できない" do
        @user.first_name = "a"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name is invalid"
      end
      it "family_name_kanaは全角(カタカナ)でないと登録できない" do
        @user.family_name_kana = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include "Family name kana is invalid"
      end
      it "first_name_kanaは全角(カタカナ)でないと登録できない" do
        @user.first_name_kana = "あ"
        @user.valid?
        expect(@user.errors.full_messages).to include "First name kana is invalid"
      end
    end
  end
end
