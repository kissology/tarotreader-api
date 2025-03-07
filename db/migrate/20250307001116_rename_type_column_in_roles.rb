class RenameTypeColumnInRoles < ActiveRecord::Migration[7.1]
  def change
    rename_column :roles, :type, :name
  end
end
