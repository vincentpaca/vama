class Payment < ActiveRecord::Base
  attr_accessible :amount, :purchase_id

  belongs_to :purchase

  validates_presence_of :purchase_id

  after_create :use_monthly_amortization
  after_create :update_purchase

  private

  def use_monthly_amortization
    if self.amount.nil?
      self.update_attribute(:amount, self.purchase.monthly_amortization)
    end
  end

  def update_purchase
    bal = self.purchase.balance - self.amount
    self.purchase.update_attribute(:balance, bal)
  end
end
