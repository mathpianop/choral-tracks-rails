class Song < ApplicationRecord
  has_many :parts, dependent: :destroy
  belongs_to :choir
  validates :title, :parts_promised, presence: true
end
