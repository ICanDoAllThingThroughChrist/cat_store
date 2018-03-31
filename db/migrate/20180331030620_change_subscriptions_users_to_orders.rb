class ChangeSubscriptionsUsersToOrders < ActiveRecord::Migration[5.1]
  def change
    rename_table :subscriptions_users, :orders
  end
end
