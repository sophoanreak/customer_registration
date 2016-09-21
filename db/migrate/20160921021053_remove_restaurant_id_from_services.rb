class RemoveRestaurantIdFromServices < ActiveRecord::Migration
  def change
    remove_column :services, :restaurant_id, :integer
  end
end
