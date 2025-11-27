class RemoveChatFromRecipes < ActiveRecord::Migration[7.1]
  def change
    remove_reference :recipes, :chat, null: false, foreign_key: true
  end
end
