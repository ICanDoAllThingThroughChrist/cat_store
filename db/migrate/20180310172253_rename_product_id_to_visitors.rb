class RenameProductIdToVisitors < ActiveRecord::Migration[5.1]
  def change
    rename_column :visitors, :product_id, :subscription_id
  end
end
