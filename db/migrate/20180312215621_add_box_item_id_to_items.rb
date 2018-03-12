class AddBoxItemIdToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :box_item_id, :integer
  end
end
