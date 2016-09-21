class AddCustomerIdToCustomerHistories < ActiveRecord::Migration
  def change
    add_column :customer_histories, :customer_id, :integer
  end
end
