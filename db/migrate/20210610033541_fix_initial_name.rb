class FixInitialName < ActiveRecord::Migration[6.0]
  def change
    rename_column :parts, :inital, :initial
  end
end
