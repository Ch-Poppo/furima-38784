class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         has_many :purchases

         validates :password, presence: true, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
         validates :nickname, presence: true
         validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
         validates :family_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' }
         validates :first_name_yomi, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' }
         validates :family_name_yomi, presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: '全角カタカナを使用してください' }
         validates :date_of_birth, presence: true
end
