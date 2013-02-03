class AddReservedToProduct < ActiveRecord::Migration
  def change
    add_column :products, :reserved, :boolean
  end
end
