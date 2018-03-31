class ChangeColumnUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :access_level
    add_column :users, :access_level, :string
  end
end
