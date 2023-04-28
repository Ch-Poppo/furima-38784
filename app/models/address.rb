class Address < ApplicationRecord
  belongs_to :purchase

  # validates :prefecture_id, :telephone_number, :post_code, :house_number, presence: true消去予定
  # validates :purchase, presence: true, format: {with: /\A[0-9]+\z/i, message: "半角数字のみ入力してください"}消去予定
  # validates :prefecture_id, numericality: { other_than: 1 , message: "いずれかを選択してください"} 消去予定
  # validates :municipality, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }消去予定
  # validates :building, allow_blank: true　何故かエラーが起きるため
  # validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: '半角数字かつ-を入れてください' }消去予定
  # validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: '半角数字かつ10又は11桁で入力して下さい' }消去予定
  # validates :house_number, format: { with: /\A[ぁ-んァ-ヶ一-龥々ーa-zA-Z0-9]+\z/ }これは必要ないかも。メンターさんへ聞く
end

