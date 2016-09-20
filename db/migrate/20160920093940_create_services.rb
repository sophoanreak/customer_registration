class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :bank_name
      t.string :acct_name
      t.string :acct_num
      t.string :tel_bank_acct
      t.string :email_bank_acct
      t.string :support
      t.string :sevice
      t.date :date_create

      t.timestamps null: false
    end
  end
end
