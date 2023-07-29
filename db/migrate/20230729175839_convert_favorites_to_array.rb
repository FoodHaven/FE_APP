class ConvertFavoritesToArray < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :new_favorites, :integer, array: true, default: []

    User.find_each do |user|
      if user.favorites.present?
        user.update(new_favorites: user.favorites.split(',').map(&:to_i))
      else
        user.update(new_favorites: [])
      end
    end

    remove_column :users, :favorites
    rename_column :users, :new_favorites, :favorites
  end

  def down

    add_column :users, :new_favorites, :text, array: true, default: []

    User.find_each do |user|
      user.update(new_favorites: user.favorites.join(','))
    end

    remove_column :users, :favorites
    rename_column :users, :new_favorites, :favorites
  end
end