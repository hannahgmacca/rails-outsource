class AddFavoritableScoreToTask < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :favoritable_score, :text
  end
end
