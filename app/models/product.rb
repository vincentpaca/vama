class Product < ActiveRecord::Base
  attr_accessible :category_id, :cylinders, :engine, :facebook_link, :model, :name, :power, :facebook_album_link

  belongs_to :category
end
