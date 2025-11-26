class Ingredient < ApplicationRecord
  belongs_to :fridge
  validates :name, :quantity, presence: true
  validates :quantity, :numericality => { :greater_than => 0, message: "must be positive" }
end
