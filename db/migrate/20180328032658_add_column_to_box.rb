class AddColumnToBox < ActiveRecord::Migration[5.1]
  def change
    add_column :boxes, :received, :boolean
  end
end
