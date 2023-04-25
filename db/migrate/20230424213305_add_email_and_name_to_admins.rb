class AddEmailAndNameToAdmins < ActiveRecord::Migration[6.0]
  def change
    add_column :admins, :email, :string
    add_column :admins, :name, :string
  end
end
