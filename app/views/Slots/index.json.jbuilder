json.array!(@slots) do |slot|
  json.extract! slot, :id, :start_time, :end_time
  json.url hairdresser_calendar_slot_url(@hairdresser, @calendar, slot, format: :json)
end
