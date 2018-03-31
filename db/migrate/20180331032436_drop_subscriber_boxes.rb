class DropSubscriberBoxes < ActiveRecord::Migration[5.1]
  def change
    drop_table :subscriber_boxes
  end
end
