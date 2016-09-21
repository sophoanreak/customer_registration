class AddRestaurantIdToServices < ActiveRecord::Migration
  def change
    add_column :services, :restaurant_id, :integer
  end
end
