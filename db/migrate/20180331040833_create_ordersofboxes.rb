class CreateOrdersofboxes < ActiveRecord::Migration[5.1]
  def change
    create_table :ordersofboxes do |t|
      t.integer :order_id
      t.integer :box_id
    end
  end
end
