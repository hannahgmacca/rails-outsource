class AddUniqueIndexToApplication < ActiveRecord::Migration[6.0]
  def change
    add_index :applications, [:task_id, :user_id], unique: true
  end
end
