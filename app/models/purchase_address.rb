class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality, :house_number, :building, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :telephone_number, :post_code, :house_number
    validates :municipality, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: '半角数字かつ-を入れてください' }
    validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: '半角数字かつ10又は11桁で入力して下さい' }
  end
    validates :prefecture_id, numericality: { other_than: 1 , message: "いずれかを選択してください"} 
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, house_number: house_number, building: building, telephone_number: telephone_number, municipality: municipality, purchase_id: purchase.id)
  end
end