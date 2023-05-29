class Choir < ApplicationRecord
  has_many :songs, dependent: :destroy
  belongs_to :admin
  validates :name, uniqueness: {scope: :admin_id}
end
