class RemoveColumnBoxItems < ActiveRecord::Migration[5.1]
  def change
    remove_column :box_items, :quantity
    add_column :box_items, :quantity, :integer,:default => 0
  end
end
