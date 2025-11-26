class Ustensil < ApplicationRecord
  belongs_to :users
  validates :name, presence: true
  USTENSIL = ["Oven", "Beater", "Blender", "Pan", "Stove", "Pot"]
  validates :name, inclusion: { in: USTENSIL }
end
