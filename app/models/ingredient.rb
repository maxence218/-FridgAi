class Ingredient < ApplicationRecord
  UNITS = %w[kg L Unit Cup tbsp lb]
  belongs_to :fridge
  validates :name, :quantity, presence: true
  validates :quantity, :numericality => { :greater_than => 0, message: "must be positive" }
  validates :unit, inclusion: { in: UNITS }
end
