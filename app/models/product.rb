class Product < ActiveRecord::Base
  attr_accessible :category_id, :cylinders, :engine, :facebook_link, :model, :power, :facebook_album_link, :reserved

  belongs_to :category

  def name
    "#{self.category.name} #{self.model}"
  end

  def self.active
    self.where(:reserved => false)
  end
end
