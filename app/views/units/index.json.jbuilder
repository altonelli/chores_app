json.array!(@units) do |unit|
  json.extract! unit, :id, :name, :address, :landlord_name, :landlord_phone, :landlord_email
  json.url unit_url(unit, format: :json)
end
