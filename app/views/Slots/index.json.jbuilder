json.array!(@calendars) do |calendar|
  json.extract! calendar, :id, :day, :available, :start_time, :end_time
  json.url hairdresser_calendar_url(@hairdresser, calendar, format: :json)
end
