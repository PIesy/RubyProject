class DropColumnInEvents < ActiveRecord::Migration
  def change
    remove_column :events, :longtitude
    add_column :events, :longitude, :float
  end
end
