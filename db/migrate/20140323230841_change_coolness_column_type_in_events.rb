class ChangeCoolnessColumnTypeInEvents < ActiveRecord::Migration
  def change
    remove_column :events, :coolness
    add_column :events, :coolness, :float
  end
end
