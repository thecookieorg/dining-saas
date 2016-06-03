json.array!(@locations) do |location|
  json.extract! location, :id, :restaurant_name, :restaurant_phone_number, :restaurant_address, :about, :contact_email, :website, :facebook, :instagram, :accept_takeout
  json.url location_url(location, format: :json)
end
