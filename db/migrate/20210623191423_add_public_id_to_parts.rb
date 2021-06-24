class AddPublicIdToParts < ActiveRecord::Migration[6.0]
  def change
    add_column :parts, :public_id, :string
  end
end
