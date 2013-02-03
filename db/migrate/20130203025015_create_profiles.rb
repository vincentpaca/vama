class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.string :address
      t.string :contact_number
      t.integer :user_id

      t.timestamps
    end
  end
end
