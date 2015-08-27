class AddViewCountToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurants, :view_count, :integer
  end
end
