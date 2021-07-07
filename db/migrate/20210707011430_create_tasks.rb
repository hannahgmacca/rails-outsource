class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.float :price
      t.datetime :time
      t.integer :category_id # the category it belongs to
      t.integer :user_id # the user who made it

      t.timestamps
    end
    add_index :tasks, :user_id
    add_index :tasks, :category_id
  end
end
