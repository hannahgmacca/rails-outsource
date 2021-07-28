class AddIfRemoteWorkToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :remote_work, :boolean
  end
end
