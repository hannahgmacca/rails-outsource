class AddApprovedToTaskApplication < ActiveRecord::Migration[6.0]
  def change
    add_column :task_applications, :approved, :boolean, default: false
  end
end
