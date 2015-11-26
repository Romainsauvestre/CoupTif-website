class Hairdresser < ActiveRecord::Base
  has_one :user
  has_many :services
  has_many :calendars
  acts_as_mappable :default_units => :kms,
                       :default_formula => :sphere,
                       :lat_column_name => :lat,
                       :lng_column_name => :lng
  # dependent: :destroy
end
