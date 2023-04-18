require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザーの新規登録" do

    before do
      @user = FactoryBot.build(:user)
    end

    it "必要項目が全て入っていれば登録できる" do
    expect(@user).to be_valid
  end

    it "ニックネームが空では登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "パスワードが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "苗字(漢字)が空では登録できない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it "苗字にアルファベットがあると登録できない" do
      @user.family_name = "Test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
    end
    
    it "名前(漢字)が空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "名前にアルファベットがあると登録できない" do
      @user.first_name = "Tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
    end

    it "苗字(フリガナ)が空では登録できない" do
      @user.family_name_yomi = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name yomi can't be blank")
    end

    it "苗字(フリガナ)漢字があると登録できない" do
      @user.family_name_yomi = "山川"
      @user.valid?
      expect(@user.errors.full_messages).to include( "Family name yomi 全角カタカナを使用してください")
    end

    it "名前(フリガナ漢字があると登録できない" do
      @user.first_name_yomi = "太朗"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name yomi 全角カタカナを使用してください")
    end

    it "苗字(フリガナ)ひらがながあると登録できない" do
      @user.family_name_yomi = "やまだ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name yomi 全角カタカナを使用してください")
    end

    it "名前(フリガナ)ひらがながあると登録できない" do
      @user.first_name_yomi = "たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name yomi 全角カタカナを使用してください")
    end

    it "名前(フリガナ)が空では登録できない" do
      @user.first_name_yomi = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name yomi can't be blank")
    end

    it "生年月日が空では登録できない" do
      @user.date_of_birth = ""
      @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
    end
  end
end