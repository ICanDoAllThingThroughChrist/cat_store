class AddSubscriberToVisitors < ActiveRecord::Migration[5.1]
  def change
    add_reference :visitors, :subscriber, index: true
    add_foreign_key :visitors, :users, column: :subscriber_id
  end
end
