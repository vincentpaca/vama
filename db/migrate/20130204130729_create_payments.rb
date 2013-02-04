class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :purchase_id
      t.decimal :amount, precision: 20, scale: 2

      t.timestamps
    end
  end
end
