class CreateFavourites < ActiveRecord::Migration[6.0]
  def change
    create_table :favourites do |t|
      t.integer :user_id
      t.integer :task_id

      t.timestamps
    end
    add_index :favourites, :user_id
    add_index :favourites, :task_id
  end
end
