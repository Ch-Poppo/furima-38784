require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入の為のDB保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
    end
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end

      it '建物名は空でも保存できること' do
        @purchase_address.building = nil
        expect(@purchase_address).to be_valid
      end

      it '電話番号が10桁また11桁なら保存できること' do
        @purchase_address.telephone_number = '1111111111'
        expect(@purchase_address).to be_valid
      end

      it '郵便番号が3桁-4桁なら保存できる' do
        @purchase_address.post_code = '000-0000'
        expect(@purchase_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '電話番号は半角数字のみで10桁または11桁であること' do
        @purchase_address.telephone_number = '111111111'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number 半角数字かつ10又は11桁で入力して下さい")
      end

      it '郵便番号が半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.post_code = '1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Post code 半角数字かつ-を入れてください')
      end

      it '番地が空では保存できないこと' do
        @purchase_address.house_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("House number can't be blank")
      end

      it '市町村は全角文字で出ないと保存できない' do
        @purchase_address.municipality = "abc"
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality 全角文字を使用してください")
      end

      it '市町村はからでは保存できないこと' do
        @purchase_address.municipality = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Municipality can't be blank")
      end

      it '郵便番号が空だと保存できないこと' do
        @purchase_address.post_code = ''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Post code can't be blank")
      end

      it '都道県が空では保存できないこと' do
        @purchase_address.prefecture_id = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Prefecture いずれかを選択してください")
      end

      it '電話番号が空では保存できないこと' do
        @purchase_address.telephone_number = ""
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone number can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end