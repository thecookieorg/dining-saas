class Location < ActiveRecord::Base
	validates :restaurant_id, presence: true # validates presence of restaurant_id
	belongs_to :restaurant
end
