class Song < ApplicationRecord
  has_many :parts, dependent: :destroy
end
