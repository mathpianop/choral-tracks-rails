class RenameRecordingToRecordingUrl < ActiveRecord::Migration[6.0]
  def change
    rename_column :parts, :recording, :recording_url
  end
end
