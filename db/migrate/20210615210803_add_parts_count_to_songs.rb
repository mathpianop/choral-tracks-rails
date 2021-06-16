class AddPartsCountToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :parts_count, :integer
  end
end
