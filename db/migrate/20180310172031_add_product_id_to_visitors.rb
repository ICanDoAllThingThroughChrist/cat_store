class AddProductIdToVisitors < ActiveRecord::Migration[5.1]
  def change
    add_column :visitors, :product_id, :integer
  end
end
