class AddUserIdToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :user_id, :integer
    add_index :sessions, :user_id
  end
end
