class Purchase < ActiveRecord::Base
  attr_accessible :balance, :contract_amount, :down_payment, :monthly_amortization, :price, :product_id, :reservation_id, :term_in_months, :user_id

  belongs_to :user
  belongs_to :product
end
