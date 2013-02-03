class Reservation < ActiveRecord::Base
  attr_accessible :product_id, :user_id, :photo

  has_attached_file :photo,
                    :storage => :dropbox,
                    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :dropbox_options => {
                      :path => proc { |style| "#{style}/#{id}/#{photo.original_filename}" }
                    }

  belongs_to :user
  belongs_to :product
end
