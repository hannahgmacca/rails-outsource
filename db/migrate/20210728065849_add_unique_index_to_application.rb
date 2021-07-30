class AddUniqueIndexToTaskApplication < ActiveRecord::Migration[6.0]
  def change
    add_index :task_applications, [:task_id, :user_id], unique: true
  end
end
