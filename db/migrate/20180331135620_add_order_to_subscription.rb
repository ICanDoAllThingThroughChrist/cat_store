class AddOrderToSubscription < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :order_id, :integer
  end
end
