class RenameNumOfPartsToPartsPromised < ActiveRecord::Migration[6.0]
  def change
    rename_column :songs, :num_of_parts, :parts_promised
  end
end
