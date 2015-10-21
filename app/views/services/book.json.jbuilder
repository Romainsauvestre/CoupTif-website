json.extract! @booking, :id
json.extract! @booking.service, :name, :price, :hairdresser_id
json.extract! @booking, :start_time, :end_time, :created_at, :updated_at
