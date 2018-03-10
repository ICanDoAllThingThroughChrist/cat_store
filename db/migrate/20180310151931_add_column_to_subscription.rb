class AddColumnToSubscription < ActiveRecord::Migration[5.1]
  def change
    add_column :subscriptions, :rate, :string
  end
end
