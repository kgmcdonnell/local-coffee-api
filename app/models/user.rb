class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_many :posts

  # get user coordinates based on provided city and state input
  geocoded_by :address
  after_validation :geocode

  def address
    [city, state].compact.join(", ")
  end
end
