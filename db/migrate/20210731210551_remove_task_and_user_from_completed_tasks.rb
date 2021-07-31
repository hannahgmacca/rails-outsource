class RemoveTaskAndUserFromCompletedTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :completed_tasks, :task_id, :bigint
    remove_column :completed_tasks, :user_id, :bigint
  end
end
