class AddSubscriptionIdVisitorsubscription < ActiveRecord::Migration[5.1]
  def change
    add_column :visitorsubscriptions, :subscription_id, :integer 
  end
end
