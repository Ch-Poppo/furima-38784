class Item < ApplicationRecord
  has_one_attached :image
  # has_one :purchase
  belongs_to :user


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :delivery
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :quality

  validates :image, :goods_detail, presence: true
  validates :title, presence: true
  validates :category_id, :quality_id, :postage_id, :prefecture_id, :delivery_id, presence: true

  validates :category_id, :quality_id, :postage_id, :prefecture_id, :delivery_id, numericality: { other_than: 1 , message: "いずれかを選択してください"} 
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }

  def was_attached?
    self.image.attached?
  end
end
