class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :first_name
      t.string :last_name
      t.string :sex
      t.string :tel
      t.string :email
      t.string :company_address

      t.timestamps null: false
    end
  end
end
