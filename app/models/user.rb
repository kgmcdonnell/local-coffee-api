class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  geocoded_by :address
  after_validation :geocode

  has_many :posts
end
