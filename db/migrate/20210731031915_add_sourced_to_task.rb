class AddSourcedToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :sourced, :boolean
  end
end
