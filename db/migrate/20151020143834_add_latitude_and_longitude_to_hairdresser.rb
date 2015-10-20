class AddLatitudeAndLongitudeToHairdresser < ActiveRecord::Migration
  def change
    add_column :hairdressers, :lat, :float
    add_column :hairdressers, :lng, :float
  end
end
