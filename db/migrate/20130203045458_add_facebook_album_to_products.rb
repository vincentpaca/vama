class AddFacebookAlbumToProducts < ActiveRecord::Migration
  def change
    add_column :products, :facebook_album_link, :string
  end
end
