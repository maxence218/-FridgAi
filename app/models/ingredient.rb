class Ingredient < ApplicationRecord
  belongs_to :fridge
  validates :name, :quantity, presence: true
end
