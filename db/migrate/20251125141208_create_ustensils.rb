class CreateUstensils < ActiveRecord::Migration[7.1]
  def change
    create_table :ustensils do |t|

      t.timestamps
    end
  end
end
