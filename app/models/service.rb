class Service < ActiveRecord::Base
  belongs_to :hairdresser
  has_many :bookings
end
