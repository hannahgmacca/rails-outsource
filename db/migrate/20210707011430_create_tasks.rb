class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.float :price
      t.datetime :time

      t.timestamps
    end
  end
end
