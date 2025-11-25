class CreateUstensils < ActiveRecord::Migration[7.1]
  def change
    create_table :ustensils do |t|
      t.string :name
      t.references :users, null: false, foreign_key: true

      t.timestamps
    end
  end
end
