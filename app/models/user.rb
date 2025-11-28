class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  ALLERGIES = %w[None Peanut Treenuts Milk Eggs Fish Shelfish Wheat Soy Lupine Sesame]
  DIETS = %w[None Vegetarian Vegan Pescatarian Gluten-free Lactose-free]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :chats
  has_one :fridge
  has_many :ingredients, through: :fridge
  has_many :recipes
  has_many :ustensils, through: :fridge
  validates :allergies, inclusion: { in: ALLERGIES }
  validates :diet, inclusion: { in: DIETS }
end
