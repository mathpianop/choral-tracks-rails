class AddNumOfPartsToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :num_of_parts, :integer
  end
end
