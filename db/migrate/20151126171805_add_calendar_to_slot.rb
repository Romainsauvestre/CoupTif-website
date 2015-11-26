class AddCalendarToSlot < ActiveRecord::Migration
  def change
    add_reference :slots, :calendar, index: true, foreign_key: true
  end
end
