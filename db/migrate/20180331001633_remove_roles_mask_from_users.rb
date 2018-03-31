class RemoveRolesMaskFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users,:roles_mask 
  end
end
