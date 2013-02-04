class ChangeIntToFloatForPurchases < ActiveRecord::Migration
  def up
    change_column :purchases, :balance, :decimal, precision: 20, scale: 2
    change_column :purchases, :contract_amount, :decimal, precision: 20, scale: 2
    change_column :purchases, :down_payment, :decimal, precision: 20, scale: 2
    change_column :purchases, :monthly_amortization, :decimal, precision: 20, scale: 2
    change_column :purchases, :price, :decimal, precision: 20, scale: 2
  end

  def down
    change_column :purchases, :balance, :integer
    change_column :purchases, :contract_amount, :integer
    change_column :purchases, :down_payment, :integer
    change_column :purchases, :monthly_amortization, :integer
    change_column :purchases, :price, :integer
  end
end
