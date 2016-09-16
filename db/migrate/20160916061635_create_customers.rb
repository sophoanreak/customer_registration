class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :kanji_first_name
      t.string :kanji_last_name
      t.string :sex
      t.string :tel_japan
      t.string :email_japan
      t.string :address
      t.string :remark

      t.timestamps null: false
    end
  end
end
