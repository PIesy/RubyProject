class AddColumnToEvent3 < ActiveRecord::Migration
  def change
    add_column :events, :end_date, :datetime
    remove_column :events, :duration
  end
end
