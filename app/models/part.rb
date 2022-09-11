class Part < ApplicationRecord
  belongs_to :song, counter_cache: true
  before destroy :delete_uploaded_recording
  validates :song, presence: true
  validates :initial, :recording_url, :name, :pitch_order, :public_id, presence: true

  def delete_uploaded_recording(alt_public_id)
    public_id = alt_public_id || self.public_id
    Cloudinary::Uploader.destroy(public_id, resource_type: :video)
  end
end
