# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

User.create(email: "jojo@jojomail.com", password: "jojojo")
Fridge.create(user: User.first)

p "creating ingredients"
Ingredient.create(name: "carrot", quantity: "2", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "potatoes", quantity: "3", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "milk", quantity: "1", unit: "L", fridge: Fridge.first)
Ingredient.create(name: "beefsteak", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "tomatoes", quantity: "4", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "chicken", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "salmon", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "salad", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "butter", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "pumpkin", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "olive oil", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "onion", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "pear", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "lime", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "ketchup", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "avocado", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "pasta", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "bread", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "houmous", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "pepper", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "salt", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "coco milk", quantity: "1", unit: "kg", fridge: Fridge.first)
Ingredient.create(name: "eggplant", quantity: "1", unit: "kg", fridge: Fridge.first)
p"created"
