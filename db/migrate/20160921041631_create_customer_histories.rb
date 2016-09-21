class CreateCustomerHistories < ActiveRecord::Migration
  def change
    create_table :customer_histories do |t|
      t.date :date_create
      t.string :problem
      t.string :solution
      t.string :remark

      t.timestamps null: false
    end
  end
end
