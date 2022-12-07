class Song < ApplicationRecord
  has_many :parts, dependent: :destroy
  belongs_to :choir
  validates :title, presence: true
end
