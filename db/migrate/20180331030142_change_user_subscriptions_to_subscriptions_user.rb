class ChangeUserSubscriptionsToSubscriptionsUser < ActiveRecord::Migration[5.1]
  def change
    rename_table :user_subscriptions, :subscriptions_users
  end
end
