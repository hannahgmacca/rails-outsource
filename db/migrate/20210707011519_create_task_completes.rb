class CreateCompletedTask < ActiveRecord::Migration[6.0]
  def change
    create_table :completed_tasks do |t|
      
      t.timestamps
    end

  end
end
