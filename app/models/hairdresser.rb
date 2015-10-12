class Hairdresser < ActiveRecord::Base
  has_many :services, dependent: :destroy
end
