class AddPublishToSongs < ActiveRecord::Migration[6.0]
  def change
    add_column :songs, :publish, :boolean, default: false
  end
end
