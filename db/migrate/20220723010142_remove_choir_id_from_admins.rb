class RemoveChoirIdFromAdmins < ActiveRecord::Migration[6.0]
  def change
    remove_column :admins, :choir_id
  end
end
