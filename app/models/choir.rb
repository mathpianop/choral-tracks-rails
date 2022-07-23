class Choir < ApplicationRecord
  has_many :songs
  belonds_to :admin
end
