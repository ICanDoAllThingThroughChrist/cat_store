class AddQuantityToBoxItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :box_items, :quantity, :integer
    add_column :box_items, :quantity, :integer, default: 1
  end
end
