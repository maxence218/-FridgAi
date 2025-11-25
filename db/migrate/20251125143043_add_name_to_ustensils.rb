class AddNameToUstensils < ActiveRecord::Migration[7.1]
  def change
    add_column :ustensils, :name, :string
  end
end
