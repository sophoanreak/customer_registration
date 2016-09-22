class AddCustomerIdToReferences < ActiveRecord::Migration
  def change
    add_column :references, :customer_id, :integer
  end
end
