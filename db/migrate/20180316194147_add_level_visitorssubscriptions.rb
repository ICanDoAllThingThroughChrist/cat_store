class AddLevelVisitorssubscriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :visitorsubscriptions, :level, :text
  end
end
