class Part < ApplicationRecord
  belongs_to :song, counter_cache: true
  validates :song, presence: true
  validates :initial, :recording, :name, :pitch_order, :public_id, presence: true
end
