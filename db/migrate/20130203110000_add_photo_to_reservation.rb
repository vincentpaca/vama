class AddPhotoToReservation < ActiveRecord::Migration
  def up
    add_attachment :reservations, :photo
  end

  def down
    remove_attachment :reservations, :photo
  end
end
