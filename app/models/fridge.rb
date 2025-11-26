class Fridge < ApplicationRecord
  belongs_to :user
  has_many :ingredients
  has_many :ustensils
end
