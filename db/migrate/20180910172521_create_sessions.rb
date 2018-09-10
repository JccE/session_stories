class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.string :title
      t.string :description
      t.boolean :is_favorite

      t.timestamps
    end
  end
end
