class CreateTaskCompletes < ActiveRecord::Migration[6.0]
  def change
    create_table :task_completes do |t|
      t.integer :task_id # the task that has been completed
      t.integer :user_id # the user that completed it
      t.timestamps
    end
    add_index :task_completes, :task_id
    add_index :task_completes, :user_id
  end
end
