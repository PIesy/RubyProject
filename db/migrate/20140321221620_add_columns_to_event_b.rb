class AddColumnsToEventB < ActiveRecord::Migration
  def change
    add_column :events, :latitude, :float
    add_column :events, :longtitude, :float
  end
end
