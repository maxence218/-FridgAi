class Chat < ApplicationRecord
  has_many :messages, :recipes
  belongs_to :user
end
