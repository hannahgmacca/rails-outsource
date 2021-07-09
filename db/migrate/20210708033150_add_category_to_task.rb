class AddCategoryToTask < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :category, null: false, foreign_key: true
  end
end
