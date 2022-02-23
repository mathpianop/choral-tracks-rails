class AddChoirIdToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :choir_id, :integer
  end
end
