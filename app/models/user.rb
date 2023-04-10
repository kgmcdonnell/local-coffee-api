class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  geocoded_by :ip_address, :latitude => :lat, :longitude => :lon
  after_validation :geocode
end
