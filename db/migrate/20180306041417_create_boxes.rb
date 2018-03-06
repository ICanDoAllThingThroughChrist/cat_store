class CreateBoxes < ActiveRecord::Migration[5.1]
  def change
    create_table :boxes do |t|
      t.string :subscription_level
      t.string :month
      t.string :year
      t.string :title
      t.boolean :shipped

      t.timestamps
    end
  end
end
