class Recipe < ApplicationRecord
  belongs_to :chats
  belongs_to :users
  has_many :messages, through: :chats
  belongs_to :fridge, through: :users
end
