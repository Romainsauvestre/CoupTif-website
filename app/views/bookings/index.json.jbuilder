json.array!(@services) do |service|
  json.extract! service, :id, :name, :description, :price, :photo
  json.url hairdresser_service_url(@hairdresser, service, format: :json)
end
