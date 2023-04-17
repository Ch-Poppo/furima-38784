class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         has_many :items
         has_many :purchases

         validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
         validates :password, presence: true, length: { minimum: 6 }, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }
         validates :nickname, presence: true
         validates :first_name, presence: true
         validates :family_name, presence: true
         validates :first_name_yomi, presence: true
         validates :family_name_yomi, presence: true
         validates :date_of_birth, presence: true
end
