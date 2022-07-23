class AddAdminIdToChoirs < ActiveRecord::Migration[6.0]
  def change
    add_column :choirs, :admin_id, :integer
  end
end
