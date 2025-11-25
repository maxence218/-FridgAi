class Ingredient < ApplicationRecord
  belongs_to :fridges
  validates :name, :quantity, presence: true
  validates :quantity, :numericality => { :greater_than => 0, message: "must be positive" }
end
