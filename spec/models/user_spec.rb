require 'rails_helper'

RSpec.describe User, type: :model do
  describe "ユーザーの新規登録" do
    it "ニックネームが空では登録できない" do
      user = User.new(nickname: "", email: "test@test.com", password: "111111", password_confirmation: "111111", family_name: "山田", first_name: "太朗", family_name_yomi: "ヤマダ", first_name_yomi: "タロウ", date_of_birth: "2000")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(nickname: "太朗", email: "", password: "111111", password_confirmation: "111111", family_name: "山田", first_name: "太朗", family_name_yomi: "ヤマダ", first_name_yomi: "タロウ", date_of_birth: "2000")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "パスワードが空では登録できない" do
      user = User.new(nickname: "太朗", email: "test@test.com", password: "", password_confirmation: "111111", family_name: "山田", first_name: "太朗", family_name_yomi: "ヤマダ", first_name_yomi: "タロウ", date_of_birth: "2000")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "emailに@がないと登録できない" do
      user = User.new(nickname: "太朗", email: "test_test.com", password: "111111", password_confirmation: "111111", family_name: "山田", first_name: "太朗", family_name_yomi: "ヤマダ", first_name_yomi: "タロウ", date_of_birth: "2000")
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
    it "苗字(漢字)が空では登録できない" do
      user = User.new(nickname: "太朗", email: "test@test.com", password: "111111", password_confirmation: "111111", family_name: "", first_name: "太朗", family_name_yomi: "ヤマダ", first_name_yomi: "タロウ", date_of_birth: "2000")
      user.valid?
      expect(user.errors.full_messages).to include("Family name can't be blank")
    end
    it "名前(漢字)が空では登録できない" do
      user = User.new(nickname: "太朗", email: "test@test.com", password: "111111", password_confirmation: "111111", family_name: "山田", first_name: "", family_name_yomi: "ヤマダ", first_name_yomi: "タロウ", date_of_birth: "2000")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "苗字(フリガナ)が空では登録できない" do
      user = User.new(nickname: "太朗", email: "test@test.com", password: "111111", password_confirmation: "111111", family_name: "山田", first_name: "太朗", family_name_yomi: "", first_name_yomi: "タロウ", date_of_birth: "2000")
      user.valid?
      expect(user.errors.full_messages).to include("Family name yomi can't be blank")
    end
    it "名前(フリガナ)が空では登録できない" do
      user = User.new(nickname: "太朗", email: "test@test.com", password: "111111", password_confirmation: "111111", family_name: "山田", first_name: "太朗", family_name_yomi: "", first_name_yomi: "タロウ", date_of_birth: "2000")
      user.valid?
      expect(user.errors.full_messages).to include("Family name yomi can't be blank")
    end
    it "生年月日が空では登録できない" do
      user = User.new(nickname: "太朗", email: "test@test.com", password: "111111", password_confirmation: "111111", family_name: "山田", first_name: "太朗", family_name_yomi: "ヤマダ", first_name_yomi: "タロウ", date_of_birth: "")
      user.valid?
        expect(user.errors.full_messages).to include("Date of birth can't be blank")
    end
  end
end