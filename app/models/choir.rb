class Choir < ApplicationRecord
  has_many :songs
  belongs_to :admin
end
