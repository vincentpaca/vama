class Product < ActiveRecord::Base
  attr_accessible :category_id, :cylinders, :engine, :facebook_link, :model, :name, :power

  belongs_to :category
end
