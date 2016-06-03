class AddRestaurantsIdToLocation < ActiveRecord::Migration
  def change
    add_reference :locations, :restaurant, index: true, foreign_key: true
  end
end
