class Recipe < ApplicationRecord
  belongs_to :chat
  has_many :messages, through: :chat
  belongs_to :fridge, through: :user
  belongs_to :user
end
