class CreateVisitorsubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :visitorsubscriptions do |t|
      t.integer :level_id
      t.timestamps
    end
  end
end
