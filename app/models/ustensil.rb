class Ustensil < ApplicationRecord
  belongs_to :fridge
  validates :name, presence: true
  USTENSIL = ["Oven", "Beater", "Blender", "Pan", "Stove", "Pot"]
  validates :name, inclusion: { in: USTENSIL }
end
