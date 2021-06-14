class AddOrderToParts < ActiveRecord::Migration[6.0]
  def change
    add_column :parts, :order, :integer
  end
end
