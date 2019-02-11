json.extract! vehicle, :id, :year, :make, :model, :plate, :oil_type, :oil_quantity, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
