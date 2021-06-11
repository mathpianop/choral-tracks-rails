class RemoveTextFromParts < ActiveRecord::Migration[6.0]
  def change
    remove_column :parts, :text
  end
end
