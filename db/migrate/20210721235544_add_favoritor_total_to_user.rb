class AddFavoritorTotalToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :favoritor_total, :text
  end
end
