class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.integer :user_id
      t.integer :product_id
      t.integer :reservation_id
      t.integer :contract_amount
      t.integer :price
      t.integer :down_payment
      t.integer :term_in_months
      t.integer :monthly_amortization
      t.integer :balance

      t.timestamps
    end
  end
end
