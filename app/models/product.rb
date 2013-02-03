class Product < ActiveRecord::Base
  attr_accessible :category_id, :cylinders, :engine, :facebook_link, :model, :name, :power, :facebook_album_link, :reserved

  belongs_to :category

  def self.active
    self.where(:reserved => false)
  end
end
