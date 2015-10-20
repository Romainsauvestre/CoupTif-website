class Hairdresser < ActiveRecord::Base
  has_many :services, dependent: :destroy
  has_one :user, dependent: :destroy
end
