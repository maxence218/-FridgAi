class Ingredient < ApplicationRecord
  belongs_to :fridges
  validates :name, :quantity, presence: true
end
