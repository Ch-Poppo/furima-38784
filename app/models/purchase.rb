class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :item
  has_one :address

  # validates :user_id, presence: true消去予定
  # validates :item_id, presence: true消去予定

end
