class AddFridgeReferencesToIngredients < ActiveRecord::Migration[7.1]
  def change
    add_reference :ingredients, :fridge, null: false, foreign_key: true
  end
end
