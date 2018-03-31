class AddSubscriberBoxIdToBox < ActiveRecord::Migration[5.1]
  def change
    add_column :boxes, :subscriber_box_id, :integer
  end
end
