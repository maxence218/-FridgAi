class Chat < ApplicationRecord
  has_many :messages
  has_many :recipes
  belongs_to :user
end
