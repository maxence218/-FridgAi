class User < ApplicationRecord
  belongs_to :fridge
  has_many :chats
  has_many :ustensils
  has_many :ingredients, through: :fridges
  has_many :messages, through: :chats
end
