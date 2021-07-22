class AddFavoritorScoreToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :favoritor_score, :text
  end
end
