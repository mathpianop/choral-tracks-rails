class Song < ApplicationRecord
  has_many :parts, dependent: :destroy
  validates :title, :parts_promised, presence: true
end
