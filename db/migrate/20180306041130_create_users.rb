class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.boolean :admin
      t.boolean :visitor
      t.boolean :subscriber
      t.integer :current_box_id

      t.timestamps
    end
  end
end
