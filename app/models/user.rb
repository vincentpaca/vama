class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_one :profile
  has_many :reservations
  has_many :purchases
  has_many :payments, :through => :purchases

  after_create :build_profile

  def name
    if self.profile
      if self.profile.full_name.present?
        self.profile.full_name
      else
        self.email.split("@").first
      end
    else
      self.email.split("@").first
    end
  end

  def payments_csv
    column_names = Payment.column_names
    all = self.payments
    CSV.generate do |csv|
      csv << column_names
      all.each do |payment|
        csv << payment.attributes.values_at(*column_names)
      end
    end
  end

  private

  def build_profile
    Profile.create!(:user => self)
  end
end
