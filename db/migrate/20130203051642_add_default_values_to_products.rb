class AddDefaultValuesToProducts < ActiveRecord::Migration
  def up
    change_column :products, :reserved, :boolean, :default => false
  end

  def down
    change_column :products, :reserved, :boolean, :default => nil
  end
end
