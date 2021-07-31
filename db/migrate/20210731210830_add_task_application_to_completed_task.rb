class AddTaskApplicationToCompletedTask < ActiveRecord::Migration[6.0]
  def change
    add_reference :completed_tasks, :task_application, null: false, foreign_key: true
  end
end
