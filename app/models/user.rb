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

  after_create :build_profile

  def name
    if self.profile
      if self.profile.full_name.present?
        self.profile.full_name.split(" ").first
      else
        self.email.split("@").first
      end
    else
      self.email.split("@").first
    end
  end

  private

  def build_profile
    Profile.create!(:user => self)
  end
end
