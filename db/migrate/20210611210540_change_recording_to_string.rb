class ChangeRecordingToString < ActiveRecord::Migration[6.0]
  def change
    change_column :parts, :recording, :string
  end
end
