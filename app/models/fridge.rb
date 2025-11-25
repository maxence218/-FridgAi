class Fridge < ApplicationRecord
  belongs_to :users
  has_many :ingredients
end
