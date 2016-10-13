class AddBanklocationToServices < ActiveRecord::Migration
  def change
    add_column :services, :bank_location, :string
  end
end
