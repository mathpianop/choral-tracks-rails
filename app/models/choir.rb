class Choir < ApplicationRecord
  has_many :songs
  has_one :admin
end
