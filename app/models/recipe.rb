class Recipe < ApplicationRecord
  belongs_to :chat
  belongs_to :user
  has_many :messages, through: :chat
  belongs_to :fridge
end
