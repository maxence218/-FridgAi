class AddFridgeReferencesToUstensil < ActiveRecord::Migration[7.1]
  def change
    add_reference :ustensils, :fridge, null: false, foreign_key: true
  end
end
