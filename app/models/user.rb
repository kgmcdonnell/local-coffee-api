class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  # get users latitude and longitude coordinates
  geocoded_by :ip_address, :latitude => :lat, :longitude => :lon
  after_validation :geocode

  has_many :posts
end
