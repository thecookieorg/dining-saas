class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :restaurant_name
      t.integer :restaurant_phone_number
      t.string :restaurant_address
      t.text :about
      t.string :contact_email
      t.string :website
      t.string :facebook
      t.string :instagram
      t.boolean :accept_takeout

      t.timestamps null: false
    end
  end
end
