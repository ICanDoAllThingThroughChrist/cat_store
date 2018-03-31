class AddColumToRoles < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :access_level, :string
  end
end
