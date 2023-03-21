class Choir < ApplicationRecord
  has_many :songs, dependent: :destroy
  belongs_to :admin
end
