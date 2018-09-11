class AddSessionIdToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :session_id, :integer
  end
end
