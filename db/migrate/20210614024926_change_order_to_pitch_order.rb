class ChangeOrderToPitchOrder < ActiveRecord::Migration[6.0]
  def change
    rename_column :parts, :order, :pitch_order
  end
end
