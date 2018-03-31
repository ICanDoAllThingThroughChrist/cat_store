class CreateSubscriberBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriber_boxes do |t|
      t.integer :box_id
      t.timestamps
    end
  end
end
