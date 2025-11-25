class AddDietAndAllergiesToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :diet, :string
    add_column :users, :allergies, :string
  end
end
