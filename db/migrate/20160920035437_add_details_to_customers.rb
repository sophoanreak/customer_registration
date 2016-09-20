class AddDetailsToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :customer_type, :string
    add_column :customers, :arrival_date, :date
  end
end
