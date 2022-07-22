class AddChoirIdToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :choir_id, :integer
  end
end
