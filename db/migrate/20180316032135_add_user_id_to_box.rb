class AddUserIdToBox < ActiveRecord::Migration[5.1]
  def change
    add_column :boxes, :user_id, :integer
  end
end
