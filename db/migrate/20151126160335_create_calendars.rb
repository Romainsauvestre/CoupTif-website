class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.date :day
      t.boolean :available
      t.time :start_time
      t.time :end_time

      t.timestamps null: false
    end
  end
end
