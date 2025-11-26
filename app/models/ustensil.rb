class Ustensil < ApplicationRecord
  has_many :fridge
  validates :name, presence: true
  USTENSIL = ["Oven", "Beater", "Blender", "Pan", "Stove", "Pot"]
  validates :name, inclusion: { in: USTENSIL }
end
