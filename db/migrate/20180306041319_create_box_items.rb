class CreateBoxItems < ActiveRecord::Migration[5.1]
  def change
    create_table :box_items do |t|
      t.integer :box_id 
      t.integer :item_id 
      t.integer :quantity
      t.string :integer
      t.timestamps
    end
  end
end
