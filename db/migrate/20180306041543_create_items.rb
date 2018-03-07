class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.string :image
      t.integer :size
      t.string :URL
      t.timestamps
    end
  end
end
