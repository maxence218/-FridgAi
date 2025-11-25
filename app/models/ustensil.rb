class Ustensil < ApplicationRecord
  belongs_to :user
  has_many :fridge, through: :user
  validates :name, presence: true
  USTENSIL = ["plaque chauffantes", "four"]
  validates :name, inclusion: { in: USTENSIL }
end
