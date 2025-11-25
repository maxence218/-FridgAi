class Recipe < ApplicationRecord
  belongs_to :chat
  has_many :messages, through: :chat
  belongs_to :fridge
  belongs_to :user
end
