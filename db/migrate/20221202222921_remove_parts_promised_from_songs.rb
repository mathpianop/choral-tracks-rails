class RemovePartsPromisedFromSongs < ActiveRecord::Migration[6.0]
  def change
    remove_column :songs, :parts_promised
  end
end
