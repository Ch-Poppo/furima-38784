require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "商品出品機能" do

    before do
      @item = FactoryBot.build(:item)
    end

  #   context '新規登録できるとき' do
  #     it "必要項目が全て入っていれば登録できる" do
  #     expect(@item).to be_valid
  #   end
  # end
  end


  before do
    @item = FactoryBot.build(:item)
  end
  context '新規登録できないとき' do

    it "商品の写真が空では保存できない" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it "商品名が空では保存できない" do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it "商品の詳細が空では保存できない" do
      @item.goods_detail = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Goods detail can't be blank")
    end

    it "カテゴリーが空では保存できない" do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it "送料についてが空では保存できない" do
      @item.postage_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Postage can't be blank")
    end

    it "出品地（都道府県）が空では保存できない" do
      @item.prefectures_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefectures can't be blank")
    end

    it "商品の状態が空では保存できない" do
      @item.price = ""
      @item.valid?
      expect(@item.errors.full_messages).to include("Quality can't be blank")
    end

    it "価格が空では保存できない" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefectures can't be blank")
    end

    it "半角数字以外ではでは保存できない" do
      @item.price = "数字"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it "300円以下では保存できない" do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it "9999999円以上では保存できない" do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  end
end