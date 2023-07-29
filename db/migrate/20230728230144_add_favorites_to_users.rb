class AddFavoritesToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :favorites, :text
  end
end
