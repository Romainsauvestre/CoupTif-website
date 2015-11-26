class AddHairdresserToCalendar < ActiveRecord::Migration
  def change
    add_reference :calendars, :hairdresser, index: true, foreign_key: true
  end
end
