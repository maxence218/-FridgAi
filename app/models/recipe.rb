class Recipe < ApplicationRecord
  belongs_to :chat
  has_one :fridge, through: :user
  has_many :messages, through: :chat
  belongs_to :fridge
  belongs_to :user
end
