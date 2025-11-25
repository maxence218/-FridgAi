class AddUserIdToChat < ActiveRecord::Migration[7.1]
  def change
    add_reference :chats, :users, foreign_key: true
  end
end
