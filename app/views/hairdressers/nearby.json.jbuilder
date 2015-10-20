json.array!(@hairdressers) do |hairdresser|
  json.extract! hairdresser, :id, :first_name, :last_name, :description, :photo
  json.url hairdresser_url(hairdresser, format: :json)
end