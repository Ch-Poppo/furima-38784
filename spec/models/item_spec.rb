require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品機能" do

    before do
      @item = FactoryBot.build(:item)
    end
  context '新規登録できないとき' do
    it "titleが空では保存できない" do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Nickname can't be blank")
    end
    end
  end
end