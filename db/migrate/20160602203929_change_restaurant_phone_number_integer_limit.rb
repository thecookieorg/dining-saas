class ChangeRestaurantPhoneNumberIntegerLimit < ActiveRecord::Migration
  def change
  	change_column :locations, :restaurant_phone_number, :integer, limit: 8
  end
end
