class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chats
  has_one :fridge
  has_many :ingredients, through: :fridge
  has_many :recipes
  has_many :ustensils, through: :fridge
end
