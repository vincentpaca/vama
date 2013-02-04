class Purchase < ActiveRecord::Base
  attr_accessible :balance, :contract_amount, :down_payment, :monthly_amortization, :price, :product_id, :reservation_id, :term_in_months, :user_id

  belongs_to :user
  belongs_to :product
  belongs_to :reservation

  validates_presence_of :down_payment, :price, :product_id, :user_id, :term_in_months

  after_create :compute_fees
  after_create :reserve_product
  after_create :update_reservation

  has_many :payments

  def name
    "#{self.user.name} - #{self.product.name}"
  end

  private

  def compute_fees
    fa = self.price - self.down_payment
    ma = ((1+(0.025*self.term_in_months))*fa)/self.term_in_months
    ca = self.down_payment + (ma*self.term_in_months)
    bal = ma * self.term_in_months
    self.update_attributes(:monthly_amortization => ma, :contract_amount => ca, :balance => bal)
  end

  def reserve_product
    self.product.update_attribute(:reserved, true)
  end

  def update_reservation
    if self.reservation_id.present?
      self.reservation.update_attribute(:approved, true)
    end
  end
end
