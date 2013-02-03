class AddFilesToReservations < ActiveRecord::Migration
  def self.up
    add_attachment :reservations, :info_sheet
    add_attachment :reservations, :deposit_slip
    add_attachment :reservations, :ids
    add_attachment :reservations, :proof_income
    add_attachment :reservations, :dti
  end

  def self.down
    remove_attachment :reservations, :info_sheet
    remove_attachment :reservations, :deposit_slip
    remove_attachment :reservations, :ids
    remove_attachment :reservations, :proof_income
    remove_attachment :reservations, :dti
  end
end
