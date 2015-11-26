class Calendar < ActiveRecord::Base
  belongs_to :hairdresser
  has_many :slots
end
