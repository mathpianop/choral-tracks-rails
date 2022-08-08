class Admin < ApplicationRecord
  has_secure_password
  has_many :choirs
  has_many :songs, through: :choirs
  has_many :parts, through: :songs
end
