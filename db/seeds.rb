# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Ingredient.destroy_all    
Fridge.create(user_id: 1)
p "creating ingredients"
Ingredient.create(name: "carrot", quantity: "2", fridge_id: 1)
Ingredient.create(name: "potatoes", quantity: "3", fridge_id: 1)
Ingredient.create(name: "milk", quantity: "1", fridge_id: 1)
Ingredient.create(name: "beefsteak", quantity: "1", fridge_id: 1)
Ingredient.create(name: "tomatoes", quantity: "4", fridge_id: 1)
Ingredient.create(name: "chicken", quantity: "1", fridge_id: 1)
p"created"
