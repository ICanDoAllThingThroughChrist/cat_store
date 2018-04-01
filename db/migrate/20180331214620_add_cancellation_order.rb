class AddCancellationOrder < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :cancellation, :boolean
  end
end
