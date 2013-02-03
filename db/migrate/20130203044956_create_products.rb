class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :category_id
      t.string :name
      t.string :model
      t.string :power
      t.string :engine
      t.string :cylinders
      t.string :facebook_link

      t.timestamps
    end
  end
end
