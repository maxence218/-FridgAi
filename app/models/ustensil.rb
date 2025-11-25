class Ustensil < ApplicationRecord
  belongs_to :users
  validates :name, presence: true
  Name = ["plaque chauffantes"]
  validates :name, inclusion: { in: [...] }
end
