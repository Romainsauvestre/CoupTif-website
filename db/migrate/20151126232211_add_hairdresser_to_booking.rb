class AddHairdresserToBooking < ActiveRecord::Migration
  def change
    add_reference :bookings, :hairdresser, index: true, foreign_key: true
  end
end
