class Reservation < ActiveRecord::Base
  attr_accessible :product_id, :user_id, :photo, :info_sheet, :deposit_slip, :ids, :proof_income, :dti, :approved

  has_attached_file :photo,
                    :storage => :dropbox,
                    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
                    :dropbox_options => {
                      :path => proc { |style| "#{style}/#{id}/#{photo.original_filename}" }
                    }

  has_attached_file :info_sheet,
                    :storage => :dropbox,
                    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
                    :dropbox_options => {
                      :path => proc { |style| "#{style}/#{id}/#{info_sheet.original_filename}" }
                    }

  has_attached_file :deposit_slip,
                    :storage => :dropbox,
                    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
                    :dropbox_options => {
                      :path => proc { |style| "#{style}/#{id}/#{deposit_slip.original_filename}" }
                    }

  has_attached_file :ids,
                    :storage => :dropbox,
                    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
                    :dropbox_options => {
                      :path => proc { |style| "#{style}/#{id}/#{ids.original_filename}" }
                    }

  has_attached_file :proof_income,
                    :storage => :dropbox,
                    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
                    :dropbox_options => {
                      :path => proc { |style| "#{style}/#{id}/#{proof_income.original_filename}" }
                    }

  has_attached_file :dti,
                    :storage => :dropbox,
                    :dropbox_credentials => "#{Rails.root}/config/dropbox.yml",
                    :dropbox_options => {
                      :path => proc { |style| "#{style}/#{id}/#{dti.original_filename}" }
                    }

  belongs_to :user
  belongs_to :product

  def name
    "#{self.user.name} - #{self.product.name}"
  end

  def status
    approved ? "Approved" : "Pending"
  end
end
