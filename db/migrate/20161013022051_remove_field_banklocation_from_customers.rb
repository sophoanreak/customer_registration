class RemoveFieldBanklocationFromCustomers < ActiveRecord::Migration
  def change
    remove_column :customers, :bank_location, :string
  end
end
