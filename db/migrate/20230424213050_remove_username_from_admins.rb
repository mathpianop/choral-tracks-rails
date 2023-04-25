class RemoveUsernameFromAdmins < ActiveRecord::Migration[6.0]
  def change
    remove_column :admins, :username
  end
end
