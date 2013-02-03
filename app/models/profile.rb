class Profile < ActiveRecord::Base
  attr_accessible :address, :contact_number, :full_name, :user

  belongs_to :user
end
