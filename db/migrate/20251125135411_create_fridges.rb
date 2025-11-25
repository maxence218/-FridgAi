class CreateFridges < ActiveRecord::Migration[7.1]
  def change
    create_table :fridges do |t|
      t.references :users, null: false, foreign_key: true
      t.references :ingredients, null: false, foreign_key: true

      t.timestamps
    end
  end
end
