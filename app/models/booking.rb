class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :hairdresser
  belongs_to :calendar
  belongs_to :slot
end
